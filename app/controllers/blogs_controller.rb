class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end
  def new
    @blog = current_user.blogs.build
  end
  def confirm
    @blog = current_user.blogs.build(blog_params)
  end
  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿しました!"
      else
        render :new
      end
    end
  end

  def show
  end
  def edit
  end
  def update

    if @blog.update(blog_params)
      redirect_to blog_path(@blog.id), notice: "blog編集しました!"
    else
      render :edit
    end
  end
  def destroy
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = current_user.blogs.find(params[:id])
  end
end
