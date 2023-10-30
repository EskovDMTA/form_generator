# frozen_string_literal: true

require 'test_helper'

class TestFormBuilder < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  @user = User.new name: 'rob', job: 'developer', gender: 'Male'
  Form_Builder = HexletCode::FormBuilder.new(@user, class: 'hexlet-form')

  def setup
    Form_Builder.form_body = {
      inputs: [],
      submit: { options: nil },
      form_options: { action: '#', method: 'post' }
    }
  end

  def test_submit
    Form_Builder.submit 'TestSubmit'
    assert_equal Form_Builder.form_body[:submit], { options:
                  {
                    tag: 'input',
                    type: 'submit',
                    value: 'TestSubmit'
                  } }
  end

  def test_input
    Form_Builder.input :name, class: 'hexlet'
    assert_equal Form_Builder.form_body[:inputs],
                 [{ type: 'string', value: 'rob', name: :name, label: { tag: 'label', for: :name, content: :Name }, class: 'hexlet' }]
  end

  def test_input_textarea
    Form_Builder.input(:job, as: :text)
    assert_equal Form_Builder.form_body[:inputs],
                 [{ type: :text, value: 'developer', name: :job, label: { tag: 'label', for: :job, content: :Job } }]
  end
end
