module UsersHelper
  def should_validate_password?
    updating_password || new_record?
  end
end