# frozen_string_literal: true

module HexletCode
  class FormRender
    class << self
      def render_html(form_body)
        form = "<form#{HexletCode::Tag.parsing_attributes(form_body[:form_options])}>"
        form_body[:inputs].each do |input|
          form += "\n"
          form += HexletCode::Tag.build(input[:tag], input.except(:tag))
        end
        puts form_body[:submit]
        form += HexletCode::Tag.build(form_body[:submit][:tag], form_body[:submit].except(:tag))
        form += '</form>'
        puts form
      end
    end
  end
end
