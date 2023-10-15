# frozen_string_literal: true

module HexletCode
  class FormRender
    class << self
      def render_html(form_attr, form_body)
        form = "<form action=\"#{form_attr[:action]}\" method=\"#{form_attr[:method]}\">\n"
        form_body.each do |tag|
          form += HexletCode::Tag.build(tag[:tag], tag.except(:tag))
        end
        form += '</form>'
        form
      end
    end
  end
end
