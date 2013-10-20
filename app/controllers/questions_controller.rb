class QuestionsController < ApplicationController
	# Views Counter
	impressionist :actions => [:show]

  before_action :set_question, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, :except => [:index]

	# Cancan
	load_and_authorize_resource except: [:create]

	# GET /questions
  # GET /questions.json
  def index
		# Tags
		if params[:tag]
			@questions = Question.tagged_with(params[:tag])
		else
			@questions = Question.order("created_at desc")
		end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = current_user.questions.new
  end

  # GET /questions/1/edit
	def edit
		if current_user.role_id == 4
			@question = Question.friendly.find(params[:id])
		else
			@question = current_user.questions.friendly.find(params[:id])
		end
	end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)

    respond_to do |format|
      if @question.save
      	# add tags
        @question.tag_with(params[:question][:tag_list])
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
      	# update tags
      	@question.tag_with(params[:question][:tag_list])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
	end

	def upvote
		@question = Question.friendly.find(params[:id])
    if @question.owner?(current_user)
      message = "You can't vote for your own question."
    else
  		if current_user.liked? @question
        message = "You have voted for this question."
      else
        if current_user.disliked? @question # will remove downvote, not upvote
          @question.find_votes(voter_id: current_user.id).first.destroy  # remove downvote.
          @question.user.add_points(2) # add 2 points previously removed on downvoting
          increment_votes_count
          message = "Downvote removed!"
        else
          current_user.up_votes @question
  			  @question.user.add_points(5)
          increment_votes_count
          message = "Vote added!" # test time !:)
  		  end
      end
    end
		redirect_to :back, notice: message
	end

	def downvote
		@question = Question.friendly.find(params[:id])
    if @question.owner?(current_user)
      message = "You can't vote for your own question"
    else
      if current_user.disliked? @question
        message = "You can downvote only once."
      else
    		if current_user.liked? @question # it will remove the upvote, not downvoting
    			@question.find_votes(voter_id: current_user.id).first.destroy #remove upvote
          @question.user.substract_points(5)
          decrement_votes_count # adds back +1 vote
          message = "Vote removed"
    		else
    			current_user.down_votes @question
    			@question.user.substract_points(2)
          decrement_votes_count
          message = "You downvoted this Question."
    		end
      end
		end
    redirect_to :back, notice: message
	end 

  def decrement_votes_count
    @question.decrement!(:votes_count)
    @question.save
  end

  def increment_votes_count
    @question.increment!(:votes_count)
    @question.save
  end
  # Selfvote for current_user so he can't upvote himself
  # selfvote method is useless oh, you can check this directly in the upvote/downvote method
  # That was my initial idea, but the 2 methods was getting so big that i thought i make it that way
  # bad practice ?
  # look, that should do it for the question owner. Cool, can i pass the message ?


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :body, :answer, :tag_list, :slug)
    end
end
