Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_id'], ENV['facebook_secret'], :scope => 'user_about_me, email, publish_actions'
  # provider :facebook, Rails.application.secrets.facebook_id , Rails.application.secrets.facebook_secret, :scope => 'user_about_me, email, publish_actions'
end
