class Ability
  include CanCan::Ability

	# 1 = Registered
	# 2 = Banned
	# 3 = Moderator
	# 4 = Administrator

  def initialize(user)

		user ||= User.new # guest user (not logged in)

		if user.role_id == 4
			can :manage, :all # user can perform any action on any object
		else
			can :read, :all # user can read any object
			can :upvote, :all
			can :downvote, :all
			can :accept_toggle, Answer
			can :create, Question # can create Question

			# Can Update Question if owner
			can :update, Question do |question|
				question.try(:user) == user || user.role_id == 3
			end

			# Can destroy Question if owner
			can :destroy, Question do |question|
				question.try(:user) == user || user.role_id == 3
			end
		end



    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
