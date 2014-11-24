require_relative '../test_config'

class InitializerTest < MiniTest::Test
  def gomez
    'Gomez'
  end

  def accessor_example
    @accessor_example ||= Class.new Thyng do
      aspect_accessor :name
    end
  end

  def test_sets_value_on_initialize
    person = accessor_example.new name: gomez
    assert_equal gomez, person.name
  end
end