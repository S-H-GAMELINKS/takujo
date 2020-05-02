class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    comment = Comment.create!(content: data['comment'], room_id: data['room_id'])
    ActionCable.server.broadcast 'room_channel', render: render_comment(comment)
  end

  private

    def render_comment(comment)
      ApplicationController.renderer.render partial: 'comments/comment', locals: {comment: comment}
    end
end
