class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "yourcontact was saved"
      redirect_to contacts_path
    else
      render :new
    end
  end

  def delete
    @contact =Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:contact).permit(:name)
  end
end
