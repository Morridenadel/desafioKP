class CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    @comment = Comment.new(
      user_id: current_user.id,
      picture_id: params[:comment][:picture_id],
      content: params[:comment][:content]
    )
    respond_to do |format|
      if @comment.save!
        format.html { redirect_to picture_path(@comment.picture.id) }
      end
    end
  end
end
