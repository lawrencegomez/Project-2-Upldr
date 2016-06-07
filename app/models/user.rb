class User < ActiveRecord::Base
  has_secure_password
  has_many :images
  has_many :comments

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "80x80"}, default_url: "/images/ninja.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
