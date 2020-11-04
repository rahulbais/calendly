class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end



  def new
    @user.has_role?:admin
  end 

  def create?
    @user.has_role?:admin
  end 

  
  def destroy?
    @user.has_role?:admin
  end 
end
