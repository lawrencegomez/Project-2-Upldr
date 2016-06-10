class Image < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  has_many :comments , :dependent => :delete_all

  validates :img, presence: true
  validates :title, presence: true

  has_attached_file :img,
                    :storage => :s3,
                    styles: { medium: "600x450>", small: "400x300"},
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }


  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  # NEVER EVER EVER hard code login credentials as is, always use a private type method so people can't see it
  # Use an environment variable to store the access key and the secret access code
  # in terminal, "atom ~/.bashrc", and then paste in the access key ID, secret access key, and bucket name
  # install the dotenv gem, and the create a .gitignore file and put '.env' in it
  # then create a '.env' file and put the credentials in there

  def s3_credentials
    {:bucket => ENV['IMAGE_APP'], :access_key_id => ENV['S3_ACCESS_KEY_ID'], :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']}
  end

end
