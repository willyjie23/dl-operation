class Admin::BlogsController < Admin::BaseController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = current_user.blogs
  end

  def show
    @articles = @blog.articles
  end

  def new
    @blog = current_user.blogs.build
  end

  def create
    if current_user.blogs.create(blog_params)
      redirect_to admin_blogs_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @blog.update(article_params)
      redirect_to admin_blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:name)
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end
end
