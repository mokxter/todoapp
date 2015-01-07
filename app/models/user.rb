class User < ActiveRecord::Base
  has_many :todos, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.first_name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end

  def todolist
    Todo.where("user_id = ?", id)
  end

  def post_permission?
    user = FbGraph::User.me(self.oauth_token)
    user.permissions.include?(:publish_actions)
  end
end
