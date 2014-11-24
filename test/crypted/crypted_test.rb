require_relative '../test_config'

class CryptedTest < MiniTest::Test
  def password
    'password'
  end

  def crypted_example
    Class.new Thyng do
      extend Thyng::CryptedAspect
      crypted_accessor :password
    end
  end

  def test_creates_writer_to_crypted_value
    example = crypted_example.new
    assert example.respond_to?('crypted_password='), 'Should be able to write crypted value'
  end

  def test_creates_reader_to_crypted_value
    example = crypted_example.new
    assert example.respond_to?('crypted_password'), 'Should be able to read crypted value'
  end

end