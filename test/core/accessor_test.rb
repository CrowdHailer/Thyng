require_relative '../test_config'

class ReaderTest < MiniTest::Test
  def gomez
    'Gomez'
  end

  def accessor_example
    @accessor_example ||= Class.new Thyng do
      aspect_accessor :name
    end
  end

  def test_accessor_sets_writer
    example = accessor_example.new
    assert example.respond_to?('name='), 'Should create writer method'
  end

  def test_responds_to_reader_method
    example = accessor_example.new
    assert example.respond_to?('name'), 'Should create reader method'
  end
end