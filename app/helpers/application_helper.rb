module ApplicationHelper
   def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

   def form_group_tagoefen(errors)
    if errors.any?
      content_tag(:p, "Hello")
    else
      content_tag(:div, content_tag(:p, "Hello world!"), class: "well")
  end
 end
 end