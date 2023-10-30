# frozen_string_literal: true

require_relative 'inputs/input_string'
require_relative 'inputs/input_text'
require_relative 'inputs/input_sumbit'

module HexletCode
  class FormBuilder
    attr_reader :user
    attr_accessor :form_body

    EXCLUDED_KEYS = [:as].freeze

    def initialize(user, **attributes)
      @user = user
      action = attributes.fetch(:url, '#')
      method = attributes.fetch(:method, 'post')
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: { action:, method: }.merge(attributes.except(:url, :method))
      }
    end

    def input(name, attributes = {})
      @form_body[:inputs] << build_input_attributes(name, attributes)
    end

    def submit(value = 'Save', attributes = {})
      all_attributes = attributes.merge(tag: 'input', type: 'submit', value:)
      @form_body[:submit] = { options: all_attributes }
    end

    def build_input_attributes(name, attributes = {})
      tag_value = user.public_send(name)
      tag_type = attributes[:as] || 'string'
      attributes = attributes.reject { |key| EXCLUDED_KEYS.include? key }
      attributes.fetch(:label, name.to_s.capitalize)
      {
        name:, type: tag_type, value: tag_value,
        label: build_label_attr(name)
      }.merge(attributes)
    end

    def build_label_attr(name)
      { tag: 'label', for: name, content: name.capitalize }
    end
  end
end
