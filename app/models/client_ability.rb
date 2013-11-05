class ClientAbility < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role?(:client)
      can :manage, Store, :user_id => user.id
      can :manage, Product, :user_id => user.id
    end
  end
end