class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length:{in: 5..80}
  validates :email, confirmation: true, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email_confirmation, presence: true

  has_many :invitations, :class_name => 'Invite', :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => 'Invite', :foreign_key => 'sender_id'
  has_many :memberships, :class_name => 'Membership', :foreign_key => 'member_id'

  validates :password, length:{in: 6..80}, presence: true, on: :create
  has_many :books, dependent: :destroy
  has_many :tasks


end
