require_relative '../test_config'

class VersionTest < MiniTest::Test
  def test_has_version
    assert Thyng::VERSION
  end
end