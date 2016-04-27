class StaticsController < ApplicationController

  def logged_in?
    current_user != nil
  end

  def home
      @q = User.search(params[:q])
      @posts = @q.result(distinct: true)
  end
end
