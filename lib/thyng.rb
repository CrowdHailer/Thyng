require "thyng/version"

class Thyng < Hash
  def self.aspect_writer aspect
    define_method "#{aspect}=", ->(value) {
      self[aspect] = value
    }
  end
end
