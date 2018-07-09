class ArticlesController < ApplicationController
  before_action :set_articles, only:[:show, :destroy, :edit, :update]
  
  def index
    @articles =Article.all
  end
  
  def new
    @article=Article.new
  end
  
  def create
    
    @article=Article.new(article_params)
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
end