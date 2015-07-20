  class Message < ActiveRecord::Base
    before_create :send_message


    private

    def send_message
       response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/AC31bd5c2cf85efc0161cd818da44de611/Messages.json',
        :user =>'AC31bd5c2cf85efc0161cd818da44de611',
        :password => '16ffc078351bee3c5dbd4d513ed0220e',
        :payload => {:Body => body,
                     :To => to,
                     :From => from}
       ).execute


    end
  end
