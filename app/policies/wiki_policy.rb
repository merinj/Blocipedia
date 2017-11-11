class WikiPolicy < ApplicationPolicy

	attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    true
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
     user.present?
  end

  def edit?
    user.present? && (user.admin? || wiki.user_id = user_id)
  end

  def destroy?
     user.admin? || wiki.user == user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.admin? || @user.premium?
        return @scope.all
      elsif @user.standard?
       return @scope.where(private:false)
      else
        return @scope.none
      end      
    end
  end
end 