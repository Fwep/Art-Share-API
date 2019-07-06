class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    if params.has_key?(:author_id)
      auth_id = params[:author_id]
    elsif params.has_key?(:artwork_id)
      art_id = params[:author_id]
    end

    if auth_id || art_id
      comments = auth_id ? Comment.where(author_id: auth_id) : Comment.where(artwork_id: art_id)
      render json: comments
    else
      render json: Comment.all
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author_id, :artwork_id, :body)
  end
end