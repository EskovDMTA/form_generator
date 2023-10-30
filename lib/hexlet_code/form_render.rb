# frozen_string_literal: true

module HexletCode
  class FormRender
    def self.render_html(form_body)
      form = build_form_tag(form_body[:form_options])
      form += build_input_tags(form_body[:inputs])
      form += build_submit_tag(form_body[:submit][:options])
      form += '</form>'
      form
    end

    def self.build_form_tag(form_options)
      "<form#{HexletCode::Tag.parsing_attributes(form_options)}>\n"
    end

    def self.build_input_tags(inputs)
      inputs.map do |attributes|
        label_attributes = attributes[:label]
        input_type = "HexletCode::Inputs::Input#{attributes[:type].capitalize}"
        input_attributes = Object.const_get(input_type).create(attributes).attributes
        HexletCode::Tag.build(label_attributes[:tag], label_attributes.except(:tag)) +
          HexletCode::Tag.build(input_attributes[:tag], input_attributes.except(:tag, :label))
      end.join
    end

    def self.build_submit_tag(submit_options)
      HexletCode::Tag.build(submit_options[:tag], submit_options.except(:tag))
    end
  end
end
