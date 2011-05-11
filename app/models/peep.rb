class Peep < ActiveRecord::Base
  scope :form_returned, where(form_returned: true)
  scope :form_outstanding, where(form_returned: false)
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
