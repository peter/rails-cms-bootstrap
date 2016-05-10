module ApplicationHelper
  BOOTSTRAP_ALERT_CLASSES = {
    notice: 'alert alert-success',
    alert: 'alert alert-danger',
    error: 'alert alert-danger',
    warning: 'alert alert-warning'
  }

  def bootstrap_alert_class(flash_name)
    BOOTSTRAP_ALERT_CLASSES[flash_name.to_sym]
  end
end
