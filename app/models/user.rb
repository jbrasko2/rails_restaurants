class User < ApplicationRecord
    has_secure_password
    validates :email, :username, presence: true
    validates :email, uniqueness: true

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            hash = {username: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex(16)}
            
            u.update(hash)
        #     u.username = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.password = SecureRandom.hex(16)
        end
    end
end
