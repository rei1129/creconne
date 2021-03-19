class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.includes(:user)
  end
end
