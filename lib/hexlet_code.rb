# frozen_string_literal: true

module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:FormRender, 'hexlet_code/form_render')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Inputs, 'hexlet_code/inputs')

  def self.form_for(user, attributes = {})
    builded_form = FormBuilder.new(user, **attributes)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form.form_body)
  end
end
