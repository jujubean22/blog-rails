class CommentsController < ApplicationController
    before_action :set_article

    def create
        @comment = @article.comments.build(comment_params) 
        
        if @comment.save
            flash[:notice] = "A comment has been successfully created"
            redirect_to article_path(@article)
        else
            flash[:error] = 'Error encountered'
            @comments = @article.comments
            render "articles/show"
        end
    end

    private

    def set_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end