require 'bcrypt'

class Thyng < Hash
  module CryptedAspect
    def crypted_accessor(aspect)
      crypted_aspect = "crypted_#{aspect}"
      aspect_accessor crypted_aspect

      define_method "#{aspect}=", ->(value) {
        send "#{crypted_aspect}=", BCrypt::Password.create(value)
      }

      define_method aspect, -> () {
        BCrypt::Password.new send(crypted_aspect)
      }
    end
  end
end