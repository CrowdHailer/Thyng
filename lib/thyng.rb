require "thyng/version"

class Thyng < Hash
  def self.aspect_writer aspect
    define_method "#{aspect}=", ->(value) {
      self[aspect] = value
    }
  end

  def self.aspect_reader aspect
    define_method aspect, -> {
      fetch(aspect)
    }
  end

  def self.aspect_accessor aspect
    aspect_reader aspect
    aspect_writer aspect
  end
end
