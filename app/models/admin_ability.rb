class ClientAbility < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all if user.role == "admin"
    end
  end
end