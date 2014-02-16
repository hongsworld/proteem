class HomeController < ApplicationController
  def intro
  end
  def about
  end
  def list
      category = params[:id]
    if category == "" or category.nil?
      if params[:location] =="" or params[:location].nil?
        @post = Post.all
      else
        @post = Post.where(:location => params[:location]).all
      end
    else
      @post = Post.where(:category => category).all
    end
  end
  def detail
    @post = Post.where(:id => params[:id]).last
  end
  def reply
    p = Post.find(params[:post_id])
    r = p.replies.new
    r.name = params[:name]
    r.content = params[:content]
    r.save
    redirect_to :controller => "home", :action => "detail", :id => params[:post_id]

  end
  def delete_reply
    r = Reply.find(params[:reply_id])
    post_id = r.post.id
    r.destroy
    redirect_to :controller => "home", :action => "detail", :id => post_id
  end
end
