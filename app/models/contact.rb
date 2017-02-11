class Contact < ActiveRecord::Base
  belongs_to :user

  def to_s
    "#{self.name},#{self.number}, #{self.email}\n"
  end
end
