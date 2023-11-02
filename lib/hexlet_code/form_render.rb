# frozen_string_literal: true

require_relative 'inputs/text_input'
require_relative 'inputs/string_input'

module HexletCode
  class FormRender
    def self.render_html(form_body)
      inputs = form_body[:inputs].map { |input| build_input_tag(input) }
      submit = build_submit_tag(form_body[:submit][:options]) unless form_body[:submit][:options].nil?

      HexletCode::Tag.build('form', form_body[:form_options]) do
        "\n#{inputs.join}#{submit}"
      end
    end

    def self.build_input_tag(input)
      klass_name = "HexletCode::Inputs::#{input[:type].capitalize}Input"
      klass = Object.const_get(klass_name)
      input_obj = klass.new(input)
      input_obj.render
    end

    def self.build_submit_tag(submit_options)
      HexletCode::Tag.build(submit_options[:tag], submit_options.except(:tag))
    end
  end
end
