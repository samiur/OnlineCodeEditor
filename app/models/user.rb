class User
  include Dynamoid::Document
  include ActiveModel::SecurePassword

  field :email, :string
  field :password_digest, :string

  has_secure_password

  validates_format_of :email, :with => /@/

  attr_accessible :email, :password

  def self.authenticate(login, pass)
    user = self.where(:email => login).first
    user.try(:authenticate, pass)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
