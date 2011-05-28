class Peep < ActiveRecord::Base
  default_scope order: 'lower(last_name), first_name'
  scope :form_returned, where(form_returned: true)
  scope :form_outstanding, where(form_returned: false)
  scope :twitterless, where("twitter IS NULL OR twitter = ''")
  
  after_create :subscribe
  before_destroy :unsubscribe
  
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
  
  def ticket_type
    vip? ? 'VIP' : 'Standard'
  end
  
  def self.emails_str(scope = :all)
    Peep.send(scope).map { |p| p.email }.join(', ')
  end
  
  def subscribe
    mailchimp.list_subscribe(rc9_list_id, email, { 'FNAME' => first_name, 'LNAME' => last_name }, 'text', false, true, false, false)
  end
  
  def unsubscribe
    mailchimp.list_unsubscribe(rc9_list_id, email)
  end

  # private
    def mailchimp
      Hominid::API.new(CONFIG['mailchimp_api_key'])
    end
    
    def rc9_list_id
      mailchimp.find_list_by_name(CONFIG['railscamp_9_list'])['id']
    end
  
end
