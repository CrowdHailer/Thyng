require_relative '../test_config'

class WriterExample < Thyng
  aspect_writer :name
end

class WriterTest < MiniTest::Test
  def gomez
    'Gomez'
  end

  def test_can_set_aspect
    example = WriterExample.new
    example.name = gomez
    assert_equal gomez, example[:name]
  end

  def test_responds_to_writer_method
    example = WriterExample.new
    assert example.respond_to?('name='), 'Thyng should report response to writers'
  end
end