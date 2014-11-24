class Thyng < Hash
  module CryptedAspect
    def crypted_accessor(aspect)
      aspect_accessor "crypted_#{aspect}"

      define_method "#{aspect}=", ->(value) {
        send "crypted_#{aspect}=", BCrypt::Password.create(value).to_s
      }
    end
  end
end