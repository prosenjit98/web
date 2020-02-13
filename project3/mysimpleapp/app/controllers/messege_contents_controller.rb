class MessegeContentsController < ApplicationController
  layout 'application'
  before_action :confirm_logged_in
  def index
    @user=User.sorted
    @post=Post.find(session[:post_id])
    @messages=@post.messege_contents
    render('show')
  end

  def show
    @user=User.sorted
    @user1=User.find(session[:id])
    @post=Post.find(session[:post_id])
    @messages=@post.messege_contents
  end

  def new
    @messages = MessegeContent.new
    @post=Post.find(session[:post_id])
    @user1=User.find(session[:user_id])

  end

  def create
    @post=Post.find(session[:post_id])
    @user1=User.find(session[:user_id])
   # @article = Post.find(params[:article_id])
    @messages = @post.messege_contents.create(comment_params)

    if @messages.save
      #if save succeeds, redirect to index actions
      flash[:notice] = "Replied successfully"
      redirect_to(post_path(@post))
    else
      #if save fails, redirect to the form page to fix
    end
  end

  def edit
    @post=Post.find(params[:id])
    @messages=@post.messege_contents.find(params[:post_id])
  end

  def update  
    @post=Post.find(session[:post_id])
    @messages=@post.messege_contents.find(params[:id])
    if @messages.update_attributes(message_params)
      #if save succeeds, redirect to index actions
      flash[:notice] = "Replied successfully"
      redirect_to(post_path(@post))
    else
      #if save fails, redirect to the form page to fix
      render('edit')
    end
  end

  def delete
    @post=Post.find(params[:id])
    @messages=@post.messege_contents.find(params[:post_id])
  end

  def destroy
    @post=Post.find(session[:post_id])
    @messages=@post.messege_contents.find(params[:id])
    @messages.destroy

    flash[:notice] = "post deleated successfully"
    redirect_to(post_path(@post))
  end

  private

  def message_params
    params.require(:messege_content).permit(:content, :post_id, :user_id)
  end

  def comment_params
    params.require(:messege_content).permit(:user_id,:post_id, :content, :body)
  end  

end
