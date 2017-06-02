Deface::Override.new(virtual_path: "spree/admin/products/_form",
                     name: "use_original_price_instead_price",
                     replace_contents: "[data-hook='admin_product_form_price']",
                     text: "
                     <%= f.field_container :price, class: ['form-group'] do %>
                       <%= f.label :price, raw(Spree.t(:master_price) + content_tag(:span, ' *', class: 'required')) %>
                       <%= f.text_field :price, value: number_to_currency(@product.original_price, unit: ''), class: 'form-control', disabled: (cannot? :update, @product.price) %>
                       <%= f.error_message_on :price %>
                     <% end %>
                          ")
