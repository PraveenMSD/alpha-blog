class LikesController < ApplicationController
    before_action :find_article
    skip_before_action :verify_authenticity_token

    def like
        like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
        if like.present?
            Like.where(user_id: current_user.id, article_id: @article.id).update(like: params[:like])      
        else
            Like.create(user_id: current_user.id, article_id: @article.id, like: params[:like])        
        end
    end

    def un_like
        @article.likes.where(user: current_user).destroy_all
        redirect_to article_path(@article)
    end

    def find_likes
        @likes = Like.where(user_id: current_user.id)
    end

    def toggle
        @task = Like.where(user_id: current_user.id)
      
        if @task.update_attributes(:completed => params[:completed])
            Like.create(user_id: current_user.id, article_id: @article.id)
    
        else
            @article.likes.where(user: current_user).destroy_all
        end

    end

    private

    def find_article
        @article = Article.find(params[:id])
    end
    
end
