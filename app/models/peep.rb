class Peep < ActiveRecord::Base
  scope :form_returned, where(form_returned: true)
  scope :form_outstanding, where(form_returned: false)
end
