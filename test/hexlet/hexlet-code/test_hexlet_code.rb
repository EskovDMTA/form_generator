# frozen_string_literal: true

require "test_helper"
require_relative "../../../lib/hexlet/hexlet-code/tags"

class TestTag < Minitest::Test
  def test_single_quotes_tag
    assert_equal "<br>", HexletCode::Tag.build("br")
  end

  def test_double_quotes_tag
    assert_equal "<div></div>", HexletCode::Tag.build("div")
  end

  def test_tag_with_tezt
    assert_equal "<div>Tag with text</div>", HexletCode::Tag.build("div") { "Tag with text" }
  end

  def test_tag_with_attributes
    assert_equal "<div data=\"id-123-qwe\" class=\"hexlet-tag\"></div>",
                 HexletCode::Tag.build("div", data: "id-123-qwe",
                                              class: "hexlet-tag")
  end

  def test_tag_with_attributes_and_text
    assert_equal "<div data=\"id-123-qwe\" class=\"hexlet-tag\">With text</div>",
                 HexletCode::Tag.build("div", data: "id-123-qwe",
                                              class: "hexlet-tag") { "With text" }
  end
end
