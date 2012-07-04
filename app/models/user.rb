class User < ActiveRecord::Base  
  include GDS::SSO::User

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :uid, :version
  attr_accessible :uid, :email, :name, :permissions, as: :oauth

  serialize :permissions, Hash

  def to_s
    email
  end

  def is_admin?
    has_permission?(GDS::SSO::Config.default_scope, "admin")
  end

  def is_admin
    is_admin?
  end
end
