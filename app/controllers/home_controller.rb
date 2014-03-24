#coding:utf-8
require 'gmail'
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
  def list_searched
    keyword = params[:keyword].strip.squeeze(" ").gsub(" ","%")
    keyword = "%" + keyword + "%"
    post_live = Post.where(:delete_flag => false)
    @post = post_live.where("name like ? or feature like ? or location like ? or detail_category like ?", keyword, keyword, keyword, keyword).all
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
  def send_email
    name = params[:name]
    from = params[:email]
    contents = params[:contents]
    gmail = Gmail.connect("asanapp.master@gmail.com","proteen2014")
       gmail.deliver do
        to  "juhogi0082@daum.net"
        subject " [#{from}] : #{name}님으로부터 의견입니다"
        text_part do
          body  contents
        end
      end
      gmail.logout
    redirect_to root_url, notice: "asdf"

  end
  def admin2
  end
  def admin_process
    if params[:id] == "admin@asanapp.com" and params[:password] == "proteen2014"
      session[:token] = "adminproteen"
      redirect_to :action => "after_admin"
    elsif 
      render :text => "wrong"
    end
  end

  def after_admin
    if session[:token] == "adminproteen"
      @posts = Post.where(:delete_flag => false).all
    elsif
      render :text => "wrong"
    end
  end
  def modify
    if session[:token] == "adminproteen"
      @posts = Post.where(:id => params[:id]).last
    elsif
      render :text => "wrong"
    end
  end
  def modify_process
    if session[:token] == "adminproteen"
      p = Post.where(:id => params[:id]).last
      p.name = params[:name]
      p.category = params[:category]
      p.detail_category = params[:detail_category]
      p.location = params[:location]
      p.address = params[:address]
      p.phone = params[:phone]
      p.feature = params[:feature]
      p.img_url = params[:img_url]
      p.lng = params[:lng]
      p.lat = params[:lat]
      p.save
      redirect_to :action => "modify", :id => params[:id]
    elsif
      render :text => "wrong"
    end

  end
  def modify_menu
    if session[:token] == "adminproteen"
      @menu = Menu.where(:id => params[:id]).last
    elsif
      render :text => "wrong"
    end
  end
  def modify_menu_process
    if session[:token] == "adminproteen"
      m = Menu.where(:id => params[:id]).last
      m.menu = params[:menu]
      m.price = params[:price]
      m.img_url = params[:img_url]
      m.save
      redirect_to :action => "modify", :id =>  m.post.id
    elsif
      render :text => "wrong"
    end
  end
  def delete
    if session[:token] == "adminproteen"
      p = Post.where(:id => params[:id]).last
      p.destroy
      redirect_to :action => "after_admin"
    elsif
      render :text => "wrong"
    end
    
  end
  def delete_menu
    if session[:token] == "adminproteen"
      m = Menu.where(:id => params[:id]).last
      m.destroy
      redirect_to :action => "modify", :id =>  m.post.id
    elsif
      render :text => "wrong"
    end
  end
  def create_post
    if session[:token] == "adminproteen"
    elsif
      render :text => "wrong"
    end
  end
  def create_post_process
    if session[:token] == "adminproteen"
      p = Post.new
      p.name = params[:name]
      p.category = params[:category]
      p.detail_category = params[:detail_category]
      p.location = params[:location]
      p.address = params[:address]
      p.phone = params[:phone]
      p.feature = params[:feature]
      p.img_url = params[:img_url]
      p.lng = params[:lng]
      p.lat = params[:lat]
      p.save
      redirect_to :action => "after_admin"
    elsif
      render :text => "wrong"
    end
  end
  def create_menu
    if session[:token] == "adminproteen"
      @post = Post.where(:id => params[:id]).last
    elsif
      render :text => "wrong"
    end
  end
  def create_menu_process
    if session[:token] == "adminproteen"
      m = Post.where(:id => params[:id]).last.menus.create
      m.menu = params[:menu]
      m.price = params[:price]
      m.img_url = params[:img_url]
      m.save
      redirect_to :action => "modify", :id =>  m.post.id
    elsif
      render :text => "wrong"
    end
  end


end
