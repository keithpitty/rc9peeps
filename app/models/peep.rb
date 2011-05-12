class Peep < ActiveRecord::Base
  default_scope order: 'last_name, first_name'
  scope :form_returned, where(form_returned: true)
  scope :form_outstanding, where(form_returned: false)
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def dietary_requirements?
    !dietary_requirements.blank?
  end
end
