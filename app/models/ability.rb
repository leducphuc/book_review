class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      if namespace == "admin"
        cannot :manage, :all
      end   
      can :read, :all
      can :manage, Review do |review|
        review.user == user
      end  
      can :manage, Comment do |comment|
        comment.user == user
      end
    end
  end
end
