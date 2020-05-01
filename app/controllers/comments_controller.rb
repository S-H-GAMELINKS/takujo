class CommentsController < ApplicationController
    before_action :set_room

    def create
        if @room.comments.create comment_params
            redirect_to @room
        else
            redirect_to @room, flash: { error: @comment.errors.full_messages }
        end
    end

    def new
    end

    private

        def set_room
            @room = Room.find(params[:room_id])
        end

        def comment_params
            params.require(:comment).permit(:content, :room_id)
        end
end
