class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    def index
        @articles = Article.all

        @randomQuote = QuoteRandomizer::Client.today
    end

    def new
        @article = Article.new
    end

    def show
        @comments = @article.comments.where.not(id: nil)
        @comment = @article.comments.build
    end

    def create
        @article = Article.new(article_params) 
        
        if @article.save
            flash[:notice] = "An article has been successfully created"
            redirect_to articles_path
        else
            flash[:error] = 'Error encountered'
            render :new
        end
    end

    def edit
    end
    
    def update
        if @article.update(article_params)
            redirect_to articles_path
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path, notice: "An article was successfully deleted"
    end
    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :author, :content)
    end
end