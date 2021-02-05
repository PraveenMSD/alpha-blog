class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy, :get_count]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show

    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 8)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article created succesfully."
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article updated succesfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy

        redirect_to articles_path
    end

    def get_count
        likes = @article.likes.active.where(user_id: current_user.id)
        if likes.present?
            likes.first.update(like: false)
        else
            @article.likes.create(user_id: current_user.id, like: true)
        end
        render json: { likes: (@article.likes.active.count.to_s + ' Claps') }, status: 200
    end

    private

    def set_article
        @article = Article.find(params[:id])
        if current_user.present?
            @like = Like.find_by(user_id: current_user.id, article_id: @article.id)
            
        else
            @article = Article.find(params[:id])
            @likes = @article.likes.all
        end

    end

    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own article"
          redirect_to @article
        end
    end

end