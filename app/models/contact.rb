class Contact < ActiveRecord::Base
  validates_presence_of :email
  after_create :send_email

  def send_email
    ContactMailer.contact_email(self).deliver
  end
end

