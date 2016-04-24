class StaticsController < ApplicationController
  def home
      @q = User.search(params[:q])
      @posts = @q.result(distinct: true)
  end
end
