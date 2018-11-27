class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
  end

  def profile
    @user = User.find(params[:id])
    @review = Review.new
  end
end
