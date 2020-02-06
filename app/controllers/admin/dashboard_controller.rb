class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_KEY"], password: ENV["ADMIN_SECRET"]

  def show
    @products = Product.all
    @categories = Category.all

  end
end  

