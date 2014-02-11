class HomeController < ApplicationController
  def intro
  end
  def list
      category = params[:category]
    if category == "" or category.nil?
      @post = Post.all
    else
      @post = Post.where(:category => category).all
    end
  end
  def detail
    @post = Post.where(:id => params[:id]).last
  end
end
