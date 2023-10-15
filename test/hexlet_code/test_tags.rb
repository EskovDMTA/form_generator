# frozen_string_literal: true

require 'test_helper'

class TestTag < Minitest::Test
  def test_form_for
    expected_form = File.read('./test/hexlet_code/fixtures/form.html')
    struct_user = Struct.new(:name, :job, :gender, keyword_init: true)
    user = struct_user.new name: 'rob', job: 'developer', gender: 'Male'
    form = HexletCode.form_for user do |f|
      f.input :name, class: 'hexlet'
      f.input :job, as: :text
      f.submit 'Wow'
    end
    assert_equal expected_form.chomp, form.chomp
  end

  def test_single_quotes_tag
    assert_equal '', HexletCode::Tag.paired_tag('br')
  end

  def test_double_quotes_tag
    assert_equal '</div>', HexletCode::Tag.paired_tag('div')
  end

  def test_tag_with_text
    assert_equal '<div>Tag with text</div>', HexletCode::Tag.build('div') { 'Tag with text' }.strip
  end

  def test_tag_with_attributes
    assert_equal '<div data="id-123-qwe" class="hexlet_code-tag"></div>',
                 HexletCode::Tag.build('div', data: 'id-123-qwe',
                                              class: 'hexlet_code-tag').strip
  end

  def test_tag_with_attributes_and_text
    assert_equal '<div data="id-123-qwe" class="hexlet_code-tag">With text</div>',
                 HexletCode::Tag.build('div', data: 'id-123-qwe',
                                              class: 'hexlet_code-tag') { 'With text' }.strip
  end
end
