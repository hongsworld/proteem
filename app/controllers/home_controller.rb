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
