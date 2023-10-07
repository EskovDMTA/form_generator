# frozen_string_literal: true

module HexletCode
  autoload("FormBodyBuilder", "./lib/hexlet/hexlet-code/form_body_builder")
  autoload("Tag", "./lib/hexlet/hexlet-code/tag")

  def self.form_for(user, attributes = {})
    attributes[:action] = attributes.delete(:url) if attributes.key?(:url)
    form_attributes = { action: "#", method: "post" }.merge(attributes)
    form_body = block_given? ? yield(FormBodyBuilder.new(user)) : ""
    HexletCode::Tag.build("form", form_attributes, form_body)
  end
end
