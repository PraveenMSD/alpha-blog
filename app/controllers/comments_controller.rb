class CommentsController < ApplicationController

    def show
        @article = Article.find(params[:article_id])
        @comment = @article.comments.all
    end

    def index
        @article = Article.find(params[:article_id])
        @comment = @article.comments.all
    end

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.save

        respond_to do |format|
            if @comment.save
              format.js
            end
        end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy

        respond_to do |format|
            if @comment.destroy
              format.js
            end
        end

        # redirect_to article_path(@article)
    end

    private


    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

end
