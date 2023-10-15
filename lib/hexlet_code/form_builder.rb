# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :user
    attr_accessor :form_body

    EXCLUDED_KEYS = [:as].freeze

    def initialize(user, url: '#', method: 'post', **attributes)
      @user = user
      @form_body = []
      form_body.push({ tag: 'form', action: url, method: }.merge(attributes))
    end

    def input(name, attributes = {})
      build_input_attributes(name, attributes)
    end

    def submit(value = 'Save')
      @form_body.push({ tag: 'input', type: 'submit', value: })
    end

    def build_input_attributes(name, attributes = {})
      @value = user.public_send(name)
      tag_attributes = attributes.reject { |key| EXCLUDED_KEYS.include?(key) }
      @form_body.push(build_label_attr(name))
      if attributes[:as] == :text
        @form_body.push(build_textarea_attr(name, tag_attributes))
      else
        @form_body.push(build_text_attr(name, tag_attributes))
      end
    end

    def build_textarea_attr(name, field_attributes)
      { tag: 'textarea', name:, content: @value, cols: 20, rows: 40 }.merge(field_attributes)
    end

    def build_text_attr(name, field_attributes)
      { tag: 'input', name:, type: 'text', value: @value }.merge(field_attributes)
    end

    def build_label_attr(name)
      { tag: 'label', for: name, content: name.capitalize }
    end
  end
end
