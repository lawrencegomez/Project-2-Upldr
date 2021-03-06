class User < ActiveRecord::Base
  has_secure_password
  has_many :images
  has_many :comments

  validates_uniqueness_of :email
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }

  has_attached_file :avatar,
                    :storage => :s3,
                    styles: { medium: "300x300>", thumb: "80x80"},
                    default_url: "assets/images/ninja.png",
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # NEVER EVER EVER hard code login credentials as is, always use a private type method so people can't see it
  # Use an environment variable to store the access key and the secret access code
  # in terminal, "atom ~/.bashrc", and then paste in the access key ID, secret access key, and bucket name
  # install the dotenv gem, and the create a .gitignore file and put '.env' in it
  # then create a '.env' file and put the credentials in there

  def s3_credentials
    {:bucket => ENV['IMAGE_APP'], :access_key_id => ENV['S3_ACCESS_KEY_ID'], :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']}
  end

end
