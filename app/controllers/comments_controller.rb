class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to portfolio_path(@comment.portfolio)
    elsif
      @portfolio = @comment.portfolio
      @comments = @portfolio.comments
      render "portfolios/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, portfolio_id: params[:portfolio_id])
  end

end