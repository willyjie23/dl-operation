class Admin::BlogsController < Admin::BaseController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]
  before_action :enable_access?, only: [:show, :edit, :update, :destroy]

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
    if @blog.update(blog_params)
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
    params.require(:blog).permit(:name, user_ids: [])
  end

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def enable_access?
    render404 unless current_user.blog_ids.include?(@blog.id)
  end
end
