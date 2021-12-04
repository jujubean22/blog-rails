class CommentsController < ApplicationController
    before_action :set_article

    def create
        @comment = @article.comments.build(comment_params) 
        
        if @comment.save
            flash[:notice] = "A comment has been successfully created"
            redirect_to article_path(@article)
        else
            flash[:error] = 'Error encountered'
            @comments = @article.comments.where.not(id: nil)
            render "articles/show"
        end
    end

    def edit
        @comment = @article.comments.find(params[:id])
    end
    
    def update
        @comment = @article.comments.find(params[:id])  

        if @comment.update(comment_params)
            redirect_to article_path(@article)
        else
            flash[:error] = 'Error encountered'
            render :edit
        end
    end

    def destroy
        @comment = @article.comments.find(params[:id])
    
        @comment.destroy
        redirect_to article_path(@article), notice: "A comment was successfully deleted"
    end
    
    private

    def set_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end