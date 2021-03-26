class PortfoliosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit]


  def index
    @q = Portfolio.ransack(params[:q])
    @portfolios = @q.result.includes(:user).page(params[:page]) 
  end

  def bookmarks
    @q = portfolios.ransack(params[:q]) # 検索オブジェクト作成
    @portfolios = @q.result.includes(:user).page(params[:page]) # 検索結果(検索しなければ全件取得
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to root_path
    elsif 
      render :new
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @comment = Comment.new
    @comments = @portfolio.comments.includes(:user)
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    portfolio = Portfolio.find(params[:id])
    if
      portfolio.update(portfolio_params)
      redirect_to portfolio_path(portfolio_params)
    elsif
      @portfolio = Portfolio.find(params[:id])      
      render :edit
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to root_path
  end


  
  def move_to_index
    portfolio = Portfolio.find(params[:id])
    unless user_signed_in? && current_user.id == portfolio.user_id
      redirect_to action: :index
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title, :catch_copy, :concept, :image, :youtube_link, :soundcloud, :genre_id).merge(user_id: current_user.id)
  end

end
