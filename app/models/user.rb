class User < ActiveRecord::Base
  has_secure_password
  has_many :images
  has_many :comments

  has_attached_file :avatar,
                    :storage => :s3,
                    styles: { medium: "300x300>", thumb: "80x80"},
                    default_url: "/images/ninja.png"
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # NEVER EVER EVER hard code login credentials as is, always use a private type method so people can't see it
  # Use an environment variable to store the access key and the secret access code
  # in terminal, "atom ~/.bashrc", and then paste in the access key ID, secret access key, and bucket name

  def s3_credentials
    {:bucket => "xxx", :access_key_id => "xxx", :secret_access_key => "xxx"}
  end

end
