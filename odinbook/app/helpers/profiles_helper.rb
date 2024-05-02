module ProfilesHelper
  require 'digest/md5'

  #For use with Gravatar, it hashes the email of the user.
  def get_hash(user)
    Digest::MD5.hexdigest(user.email.strip.downcase)
  end

  def gravatar_for(user)
    params = {
      :default => "https://storage.googleapis.com/odinbook-test-bucket/profile_default.png",
      :s => 150
    }

    url = "https://gravatar.com/avatar/#{get_hash(user)}?#{params.to_query}"
  end
end
