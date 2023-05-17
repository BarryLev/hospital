ActiveAdmin.register Doctor do

  config.sort_order = "id_asc"

  permit_params :name, :category_id, :phone, :password

  index do
    selectable_column
    column :id
    column :name
    column :phone
    column :role
    column :category
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :phone
      f.input :password if f.object.new_record?
      f.input :category, as: :select, collection: Category.all
    end
    f.actions
  end
  
end
