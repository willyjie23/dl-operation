class Admin::ArticlesController < Admin::BaseController
  before_action :find_blog, only: [:new, :create, :edit, :destroy]
  before_action :find_article, only: [:edit, :update, :destroy]
  before_action :enable_access?, only: [:new, :edit]

  def new
    @article = @blog.articles.build
  end

  def create
    if @blog.articles.create(article_params)
      redirect_to admin_blog_path(@blog)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to admin_blog_path(@article.blog)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_blog_path(@blog)
  end

  private

  def article_params
    params.require(:article).permit(:title, :context, :is_private)
  end

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def enable_access?
    render404 unless current_user.blog_ids.include?(@blog.id)
  end
end
