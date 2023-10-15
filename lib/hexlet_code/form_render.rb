# frozen_string_literal: true

module HexletCode
  class FormRender
    class << self
      def render_html(form_body)
        form = ''
        form_body.each do |tag_with_attributes|
          form += HexletCode::Tag.build(tag_with_attributes[:tag], tag_with_attributes.except(:tag))
        end
        form += '</form>'
        form
      end
    end
  end
end
