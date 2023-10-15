# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def test_form_for
    expected_form = File.read('./test/hexlet_code/fixtures/form.html')
    @user = User.new name: 'rob', job: 'developer', gender: 'Male'
    form = HexletCode.form_for(@user, class: 'hexlet-form') do |f|
      f.input :name, class: 'hexlet'
      f.input :job, as: :text
      f.submit 'Wow'
    end
    assert_equal expected_form.chomp, form.chomp
  end
end
