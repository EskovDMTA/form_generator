# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.render_html(form_body)
      form = "<form#{HexletCode::Tag.parsing_attributes(form_body[:form_options])}>\n"
      form_body[:inputs].each do |attributes|
        label_attributes = attributes[:label]
        input_type = "HexletCode::Inputs::Input#{attributes[:type].capitalize}"
        input_attributes = Object.const_get(input_type).create(attributes).attributes
        form += HexletCode::Tag.build(label_attributes[:tag], label_attributes.except(:tag))
        form += HexletCode::Tag.build(input_attributes[:tag], input_attributes.except(:tag, :label))
      end
      form += HexletCode::Tag.build(form_body[:submit][:options][:tag], form_body[:submit][:options].except(:tag))
      form += '</form>'
    end
  end
end
