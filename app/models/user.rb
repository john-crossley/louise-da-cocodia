class User < ActiveRecord::Base

  attr_accessible :email, :fullname, :password, :password_confirmation, :username

  # Used for password digest
  has_secure_password

  # Ensure the user provides all the information required.
  validates :email, :username, presence: true,
  														 uniqueness: { case_sensitive: false }

  # Limit the username between 4 and 12 characters
  validates :username, length: { in: 4..12 }
  # Limit the length of chars in the password field.
  validates :password, :password_confirmation, length: { in: 4..8 }

  # Enure the user has entered a valid email address
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
end