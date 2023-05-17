ActiveAdmin.register Patient do

  config.sort_order = "id_asc"

  index do
    selectable_column
    column :id
    column :name
    column :phone
    column :role
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def new
      flash[:alert] = "Creating new patients is not allowed"
      redirect_to admin_patients_path
    end

    def create
      flash[:alert] = "Creating new patients is not allowed"
      redirect_to admin_patients_path
    end
  end
  
end
