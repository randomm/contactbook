class User < ActiveRecord::Base
  has_secure_password
  has_many :contacts, dependent: :destroy
  validates :username, uniqueness: true,  length: {minimum: 3}
  validates :password, length: {minimum: 4}
  validates_format_of :password, :with => /(?=.*\d)(?=.*([A-Z]))/, message: "requires atleast one upper case and one lower case letter. Also include a number"

  def is_current_user(current)
    current == self
  end
end
