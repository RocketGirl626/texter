class MessagesController < ApplicationController

  def index

    @messages = Message.all
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @message = Message.find(params[:id])
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @message = @contact.messages.new(message_params)
    @message.to = @contact.phone
    if @message.save
      flash[:notice] = "your msg was sent"
      redirect_to contact_messages_path(@contact)
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:from, :to, :body)
  end
end
