class User < ActiveRecord::Base
  attr_accessible :email, :about, :password, :password_confirmation
  has_secure_password

  has_many :listings
  has_many :messages
  has_many :images, :as => :imageable

  has_many :conversations
  has_many :host_conversations, :class_name => "Conversation", :foreign_key => :host_id
  has_many :renter_conversations, :class_name => "Conversation", :foreign_key => :renter_id


  validates_confirmation_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end