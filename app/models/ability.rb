class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      if namespace == "admin"
        cannot :manage, :all
      end   
    end
  end
end
