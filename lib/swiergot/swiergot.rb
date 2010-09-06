class Swiergot < Struct.new(:user, :password)
  def tweet(msg)
    oauth = Twitter::OAuth.new('JjkyksybrQ1EjxnxuPT6Bg', 'qtmeMmsFzn3Nq3yHh2mZ6dKUcmtzHcz58AtkP9Ic')
    oauth.authorize_from_access("187459539-02goiIM8OkTNTqzEej77c5usxR9rddb6qZpoSRNB", "FFOl8NDmT4rQlN2FrIKlFYjCxyAjdO2x7wqmzllMao")
    client = Twitter::Base.new(oauth)
    client.update(msg)
  end
end
