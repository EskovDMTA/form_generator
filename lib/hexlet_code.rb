# frozen_string_literal: true

module HexletCode
  autoload(:FormBodyBuilder, 'hexlet_code/form_body_builder')
  autoload(:FormRender, 'hexlet_code/form_render')
  autoload(:Tag, 'hexlet_code/tag')

  def self.form_for(user, attributes = {})
    builded_form = FormBodyBuilder.new(user, **attributes)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form.form_attr, builded_form.form_body)
  end
end

struct_user = Struct.new(:name, :job, :gender, keyword_init: true)
user = struct_user.new name: 'rob', job: 'developer', gender: 'Male'
HexletCode.form_for user do |f|
  f.input :name, class: 'hexlet'
  f.input :job, as: :text
  f.submit 'Wow'
end
