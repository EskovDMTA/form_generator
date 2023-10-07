# frozen_string_literal: true

module HexletCode
  class FormBodyBuilder
    attr_reader :user

    def initialize(user)
      @user = user
      @result = ""
    end

    def input(name, attributes = {})
      @value = user.public_send(name)
      attributes[:value] = @value if @value

      if attributes[:as] == :text
        build_text_input(name, attributes)
      else
        build_default_input(name, attributes)
      end
    end

    def build_text_input(name, attributes)
      text_attributes = { name: name, cols: 20, rows: 40 }.merge(attributes).reject do |k, _v|
        %i[as value].include?(k)
      end

      @result += build_label(name)
      @result += Tag.build("textarea", text_attributes, attributes[:value])
      @result
    end

    def build_default_input(name, attributes)
      input_attributes = { name: name, type: "text", value: @value }.merge(attributes)

      @result += build_label(name)
      @result += Tag.build("input", input_attributes)
      @result
    end

    def build_label(name)
      Tag.build("label", { for: name }, name.to_s)
    end

    def submit(value = "Save")
      @result += Tag.build("input", { type: "submit", value: value })
    end
  end
end
