require_relative '../test_config'

class WriterTest < MiniTest::Test
  def gomez
    'Gomez'
  end

  def writer_example
    Class.new Thyng do
      aspect_writer :name
    end
  end

  def test_can_set_aspect
    example = writer_example.new
    example.name = gomez
    assert_equal gomez, example[:name]
  end

  def test_responds_to_writer_method
    example = writer_example.new
    assert example.respond_to?('name='), 'Thyng should report response to writers'
  end
end