class Contact < ActiveRecord::Base
  has_many :messages
  validates :name, :presence => true
  validates :phone, :presence => true

end
