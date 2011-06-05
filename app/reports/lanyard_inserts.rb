class LanyardInserts < Prawn::Document

  def initialize(options = {}, &block)
    super page_size: 'A5', page_layout: :landscape
  end  

  def to_pdf
    Peep.all.each_with_index do |peep, index|
      # Print on 2 pages double-sided for folding
      define_grid(columns: 2, rows: 1)
      # Page 4 first: image of camp map
      page_4 = grid(0, 0)
      bounding_box page_4.top_left, width: page_4.width, height: page_4.height do
        font_size 12
        text "camp map goes here"
      end
      # Page 1 next: name and details
      page_1 = grid(0, 1)
      bounding_box page_1.top_left, width: page_1.width, height: page_1.height do
        font_size 60
        text " "
        font_size 50
        text peep.first_name
        font_size 14
        text peep.last_name
        font_size 36
        text " "
        font_size 24
        text peep.twitter_handle
      end
      start_new_page
      define_grid(columns: 2, rows: 1)
      # Page 2 next: camp info
      page_2 = grid(0, 0)
      bounding_box page_2.top_left, width: page_2.width, height: page_2.height do
        font_size 12
        text "camp info goes here"
      end
      # Page 3 last: blank for notes
      page_3 = grid(0, 1)
      bounding_box page_3.top_left, width: page_3.width, height: page_3.height do
        font_size 14
        text "Space for your notes."
      end
      start_new_page unless index == Peep.count - 1
    end
    render
  end
  
end