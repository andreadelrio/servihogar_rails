module ApplicationHelper
  def alert_type flash_type
    case flash_type
      when :success
        "alert-type-success"
      when :error
        "alert-type-danger"
      when :alert
        "alert-type-warning"
      when :notice
        "alert-type-info"
      else
        flash_type.to_s
    end
  end
end
