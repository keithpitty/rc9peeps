class AttendeeList < Prawn::Document
  
  def initialize(options = {}, &block)
    super page_size: 'A4'
  end
  
  def to_pdf
    data = [['Name', 'Ticket Type', 'Twitter', 'Sleeping Location', 'Checked In?']]
    Peep.all.each do |peep|
      peep_data = []
      peep_data << peep.full_name
      peep_data << peep.ticket_type
      peep_data << peep.twitter_handle
      peep_data << ''
      peep_data << ''
      data << peep_data
    end
    font_size 16
    text 'Rails Camp 9 Attendees'
    font_size 11
    table(data, header: true) do
      row(0).style(:font_style => :bold, :background_color => 'cccccc')
    end
    render
  end
  
end