class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def edit?
      record.user == user
    end

    def update?
      record.user == user
    end

    def new?
      true
    end

    def create?
      true
    end

    def destroy?
      record.user == user
    end
  end
end
