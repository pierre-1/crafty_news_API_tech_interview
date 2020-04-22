class Api::CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create]
    
    def create
        if user.role == 'commenter'
            comment = Comment.create(comment_params)
            render json: {message: "Your comment has been added"}
        else
            render json: {error: "Something went wrong"},
            status: 422
        end
    end


    private

    def comment_params
        params.require(:comment).permit(:title, :body)
    end
end
