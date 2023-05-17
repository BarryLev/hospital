module ProfileHelper
  def customize_button_if_avatar_attached(user)
    class_btn = "btn btn-primary mt-2 mx-auto"

    class_btn.concat(" w-50") if user.avatar.attached?

    class_btn
  end
end
