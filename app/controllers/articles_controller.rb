class ArticlesController < ApplicationController
  before_action :set_articles, only:[:show, :destroy, :edit, :update]
  before_action :require_user, except:[:index, :show]
  before_action :require_same_user, only:[:edit, :update]
  def index
   @articles = Article.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @article=Article.new
  end
  
  def create
    debugger
    @article=Article.new(article_params)
    @article.user=User.first
    if @article.save
      flash[:success]="article successfully created"
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  
  def show
    
  end
  
  def destroy
  
    @article.destroy
    flash[:danger] = "successfully deleted"
    redirect_to articles_path
  end
  
  def edit
   
  end
  
  def update
   
     if @article.update(article_params)
      flash[:success]="article successfully updated"
      redirect_to article_path(@article)
     else
      render :edit
     end
  end
    
  private
    def set_articles
      @article =Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def require_same_user
      if current_user != @article.user
        flash[:danger] = "u can only edit or delete ur own article"
        redirect_to root_path
      end
    end
end