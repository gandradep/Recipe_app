class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present?

    # rubocop:disable Style/HashSyntax
    can :read, Recipe, user: user

    can :test, Recipe, user: user
  end
end
