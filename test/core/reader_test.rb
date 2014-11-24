require_relative '../test_config'

class ReaderTest < MiniTest::Test
  def gomez
    'Gomez'
  end

  def reader_example
    @reader_example ||= Class.new Thyng do
      aspect_reader :name
    end
  end

  def test_can_set_aspect
    example = reader_example.new
    example[:name] = gomez
    assert_equal gomez, example.name
  end

  def test_responds_to_reader_method
    example = reader_example.new
    assert example.respond_to?('name'), 'Thyng should report response to readers'
  end
end