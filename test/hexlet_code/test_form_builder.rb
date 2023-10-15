# frozen_string_literal: true

require 'test_helper'

# frozen_string_literal: true

class TestFormBuilder < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  @user = User.new name: 'rob', job: 'developer', gender: 'Male'
  Form_Builder = HexletCode::FormBuilder.new(@user, class: 'hexlet-form')

  def setup
    Form_Builder.form_body = []
  end

  def test_submit
    Form_Builder.submit 'TestSubmit'
    assert_equal Form_Builder.form_body, [{ tag: 'input', type: 'submit', value: 'TestSubmit' }]
  end

  def test_build_input_attributes
    Form_Builder.submit 'TestSubmit'
  end

  def test_build_textarea_attr
    Form_Builder.input(:job, as: :text)
    assert_equal Form_Builder.form_body[1], { tag: 'textarea', name: :job, content: 'developer', cols: 20, rows: 40 }
  end

  def test_build_text_attr
    Form_Builder.input(:job)
    assert_equal Form_Builder.form_body[1], { tag: 'input', name: :job, type: 'text', value: 'developer' }
  end
end
