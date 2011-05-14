class Peep < ActiveRecord::Base
  default_scope order: 'lower(last_name), first_name'
  scope :form_returned, where(form_returned: true)
  scope :form_outstanding, where(form_returned: false)
  scope :twitterless, where("twitter IS NULL OR twitter = ''")
  
  include Gravtastic
  gravtastic
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def dietary_requirements?
    !dietary_requirements.blank?
  end
  
  def twitter?
    !twitter.blank?
  end
  
  def self.emails_str(scope = :all)
    Peep.send(scope).map { |p| p.email }.join(', ')
  end
  
end
