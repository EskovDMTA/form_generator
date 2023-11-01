# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new(name: 'rob', job: 'developer', gender: 'Male')
  end

  def test_full_form
    fixture = load_fixture('full_form.html')
    form = HexletCode.form_for(@user, class: 'hexlet-form') do |f|
      f.input :name, class: 'hexlet'
      f.input :job, as: :text
      f.submit 'Wow', class: 'btn_hexlet'
    end
    assert_equal fixture, form
  end

  def test_empty_form
    fixture = load_fixture('empty_form.html')
    form = HexletCode.form_for(@user)
    assert_equal fixture, form
  end

  def test_empty_form_with_url
    fixture = load_fixture('empty_form_with_url.html')
    form = HexletCode.form_for(@user, url: '/url')
    assert_equal fixture, form
  end

  def test_form_with_submit
    fixture = load_fixture('form_with_submit.html')
    form = HexletCode.form_for(@user) { |f| f.submit 'Wow' }
    assert_equal fixture, form
  end

  def test_form_with_text_input
    fixture = load_fixture('form_with_text_input.html')
    form = HexletCode.form_for(@user) { |f| f.input :name }
    assert_equal fixture, form
  end

  def test_form_with_textarea
    fixture = load_fixture('form_with_textarea.html')
    form = HexletCode.form_for(@user) { |f| f.input :job, as: :text }
    assert_equal fixture, form
  end

  def test_no_field_in_model
    assert_raises(NoMethodError) do
      HexletCode.form_for(@user, url: '/users') do |f|
        f.input :no_field
      end
    end
  end
end
