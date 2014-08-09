require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, length: 1..20
  property :username, String, :unique => true, :message => "That username is already taken", length: 1..20
  property :email, String, :unique => true, :message => "This email is already taken", length: 1..20
  property :password_digest, Text

  has n, :peeps, :through => Resource
  has n, :replies, :through => :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"

end