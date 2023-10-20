# frozen_string_literal: true
require_relative 'inputs/input'
require_relative 'inputs/input_textarea'
require_relative 'inputs/input_sumbit'

module HexletCode
  class FormBuilder
    attr_reader :user
    attr_accessor :form_body

    EXCLUDED_KEYS = [:as].freeze

    def initialize(user, **attributes)
      @user = user
      action = attributes.fetch(:url, '#')
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action:, method: 'post' }.merge(attributes.except(:url))
      }
    end

    def input(name, attributes = {})
      tag_attributes = build_input_attributes(name, attributes)
      tag_type = attributes[:as] || ''
      input_type = "HexletCode::Inputs::Input#{tag_type.capitalize}"
      input = Object.const_get(input_type)
      @form_body[:inputs] << build_label_attr(name)
      @form_body[:inputs] << input.create(tag_attributes).attributes
    end

    def submit(value = 'Save')
      @form_body[:submit] = {tag: 'input', type: 'submit', value:}
    end

    def build_input_attributes(name, attributes = {})
      value = user.public_send(name)
      tag_attributes = attributes.reject { |key| EXCLUDED_KEYS.include?(key) }
      {name: , value:}.merge(tag_attributes)
    end

    # def build_textarea_attr(name, field_attributes)
    #   { tag: 'textarea', name:, content: @value, cols: 20, rows: 40 }.merge(field_attributes)
    # end
    #
    # def build_text_attr(name, field_attributes)
    #   { tag: 'input', name:, type: 'text', value: @value }.merge(field_attributes)
    # end

    def build_label_attr(name)
      { tag: 'label', for: name, content: name.capitalize }
    end
  end
end
