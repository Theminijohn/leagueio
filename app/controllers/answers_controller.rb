class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!


	# GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
		@answer = current_user.answers.new  # User_id
  end

  # GET /answers/1/edit
  def edit
		@question = Question.find(params[:question_id])
    @answer = current_user.answers.find(params[:id])  # User_id 
  end

  # POST /answers
  # POST /answers.json
  def create
		@question = Question.find(params[:question_id])
    @answer = current_user.answers.new(answer_params)  # User_id
		@answer.question_id = @question.id

    respond_to do |format|
      if @answer.save
        format.html { redirect_to :back, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { redirect_to :back }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_path(@answer.question), notice: 'You edited your answer Successfully.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    if @answer.owner?(current_user)
      message = "You can't vote your own answer."
    else
      if current_user.liked? @answer
        message = "You have voted for this answer."
      else
        if current_user.disliked? @answer # will remove downvote, not upvote
          @answer.find_votes(voter_id: current_user.id).first.destroy  # remove downvote.
          @answer.user.add_points(2) # add 2 points previously removed on downvoting
					current_user.add_points(1) # add 1 point previously removed
          increment_votes_count
          message = "Downvote removed.."
        else
          current_user.up_votes @answer
          @answer.user.add_points(10)
          increment_votes_count
          message = "Vote added..." # test time !:)
        end
      end
    end
    redirect_to :back, notice: message
  end

  def downvote
    @answer = Answer.find(params[:id])
    if @answer.owner?(current_user)
      message = "You can't vote your own answer"
    else
      if current_user.disliked? @answer
        message = "You can downvote once..."
      else
        if current_user.liked? @answer # it will remove the upvote, not downvoting
          @answer.find_votes(voter_id: current_user.id).first.destroy #remove upvote
          @answer.user.substract_points(10)
          decrement_votes_count # adds back +1 vote
          message = "Vote removed"
        else
          current_user.down_votes @answer
          @answer.user.substract_points(2)
					current_user.substract_points(1)
          decrement_votes_count
          message = "You downvoted this answer."
        end
      end
    end
    redirect_to :back, notice: message
	end

  def decrement_votes_count
    @answer.decrement!(:votes_count)
    @answer.save
  end

  def increment_votes_count
    @answer.increment!(:votes_count)
    @answer.save
	end


	# Accept
	def accept_toggle
		@question = Question.find(params[:question_id])
		@answer = Answer.find(params[:id])

    if @question.owner?(current_user)
      if @answer.accepted
        reject_answer
        message = "Answer rejected"
      else
        if @question.has_accepted_answer?
    			accepted_answer = @question.answers.where(accepted: true).first
          accepted_answer.update_attributes(accepted: false)
          accept_answer
          message = "Accepted answer was changed!"
    		else
          accept_answer
          message = "Answer accepted!"
    		end
      end
    else
      message = "You are not owner of this question." # in case someone does a hack
    end

    redirect_to :back, notice: message
	end

  def accept_answer
    @answer.update_attributes(accepted: true)
    @answer.user.add_points(15) # Add 15 Points To Answer.User
    @question.user.add_points(2) # Add 2 Points for Accepting
  end

  def reject_answer
    @answer.update_attributes(accepted: false)
    @answer.user.substract_points(15) # Add 15 Points To Answer.User
    @question.user.substract_points(2) # Add 2 Points for Accepting
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :body)
    end
end
