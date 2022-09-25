class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'chatroom_channel',
                                   mod_message: render_massage(message)
                                   #this sending a key 'mod_message' 
                                   #with render_message value
                                   #to a js coffefile
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_massage(message)
    render(partial: 'message', locals: { message: message })
  end
  # rendering a partial , that I have not done, from a controller.
  # locals - adding an object 'message' to a partial
end
