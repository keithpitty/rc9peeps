class PrintController < ApplicationController
  before_filter :require_user
  
  def show
    
  end
  
  def attendees
    respond_to do |format|
      format.pdf do
        send_data AttendeeList.new.to_pdf, filename: 'attendees.pdf', type: 'application/pdf'
      end
    end
  end
  
  def lanyards
    respond_to do |format|
      format.pdf do
        send_data LanyardInserts.new.to_pdf, filename: 'lanyards.pdf', type: 'application/pdf'
      end
    end
  end
  
end
