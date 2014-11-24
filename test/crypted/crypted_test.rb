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

  def test_aspect_is_saved_encrypted
    example = crypted_example.new password: password
    assert_equal BCrypt::Password, example.password.class
  end

  def test_can_check_against_encrypted_value
    example = crypted_example.new password: password
    assert_equal true, example.check_password?(password)
  end
end