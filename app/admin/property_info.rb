ActiveAdmin.register PropertyInfo do

 permit_params :landowner_id, :property_address, :property_zip_code, :property_city, :property_state, :property_acreage, :property_description, :property_pictures

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
