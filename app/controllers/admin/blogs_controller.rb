class Admin::BlogsController < Admin::BaseController
  def index
    @blogs = current_user.blogs
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

  private

  def blog_params
    params.require(:blog).permit(:name)
  end
end
