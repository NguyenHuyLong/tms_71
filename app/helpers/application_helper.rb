module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title_page"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def link_to_add_tasks name, f, association, opts = {}
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
      child_index: "new_#{association}") do |builder|
        render association.to_s.singularize + "_fields", f: builder
      end

    link_to_function name, h("add_fields(this,
      \"#{association}\", \"#{escape_javascript(fields)}\");return false;"),
      class: "btn btn-info"
  end

  def link_to_function name, js, opts = {}
    link_to name, "#", opts.merge({onclick: js})
  end

  def link_to_remove_tasks name, f
    field = f.hidden_field :_destroy
    link = link_to name, "#", onclick: "remove_fields(this); return false;",
      remote: true, class: "btn btn-danger"
    field + link
  end
end
