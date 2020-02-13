class PostsController < ApplicationController

  layout 'for_post'
  before_action :confirm_logged_in
  before_action :set_user, only: [:show , :new, :create, :index]

  def index
    @post= Post.sorted
  end


  def show
    @post= Post.find(params[:id])
    @messages = @post.messege_contents
    puts @messages
   
  end


  def new
    @post=Post.new
  end


  def create
    @post=Post.new(post_params)
    if @post.save
      #if save succeeds, redirect to index actions
      flash[:notice] = "post created successfully"
      redirect_to(posts_path)
    else
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      #if save succeeds, redirect to index actions
      flash[:notice] = "Post updated successfully"
      redirect_to(posts_path)
    else
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end
  def destroy

    @post = Post.find(params[:id])
    @post.destroy

    flash[:notice] = "Page deleated successfully"
    redirect_to(posts_path)
  end

  private

    def set_user
      @user1 =User.find(session[:user_id])

    end

    def post_params
    
        params.require(:post).permit(:user_id, :post_title, :post_content,:attachment)

    end

end
