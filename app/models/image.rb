class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :img, styles: { medium: "600x450", thumb: "400x300"}
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

end
