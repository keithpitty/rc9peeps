class LanyardInserts < Prawn::Document

  def initialize(options = {}, &block)
    super page_size: 'A5', page_layout: :landscape, margin: 10
  end  

  def to_pdf
    Peep.all.each_with_index do |peep, index|
      @peep = peep
      # Print on 2 pages double-sided for folding
      define_grid(columns: 2, rows: 1, column_gutter: 20)
      page_four
      page_one
      start_new_page
      define_grid(columns: 2, rows: 1, column_gutter: 20)
      page_two
      page_three
      start_new_page unless index == Peep.count - 1
    end
    render
  end
  
  private
    def page_one
      page_1 = grid(0, 1)
      bounding_box page_1.top_left, width: page_1.width, height: page_1.height do
 #       stroke_bounds
        font "#{Rails.root}/public/images/KOMIKAX_.ttf"
        font_size 60
        text " "
        font_size 44
 #       fill_color "%06x" % (rand * 0xffffff)
        text @peep.first_name, indent_paragraphs: 10
        font_size 16
        text @peep.last_name, indent_paragraphs: 10
 #       fill_color "#000000"
        font_size 90
        text " "
        font_size 24
        unless @peep.twitter_handle.empty?
          text @peep.twitter_handle, indent_paragraphs: 10
        end
        logo = "#{Rails.root}/public/images/logo.png"
        image logo, at: [120, 115], width: 150 
        
      end
    end
    
    def page_two
      page_2 = grid(0, 0)
      bounding_box page_2.top_left, width: page_2.width, height: page_2.height do
 #       stroke_bounds
        font "Helvetica"
        font_size 32
        text "http://sup"
        text " "
        font_size 14
        text "Meal Times:"
        font "Courier"
        font_size 12
        text "Breakfast: 7:30 - 8:00 am"
        text "Lunch:    12:00 - 1:00 pm"
        text "Dinner:    6:30 - 7:30 pm"
        text " "
        font_size 14
        font "Helvetica"
        text "Organising group contacts:"
        font "Courier"
        font_size 12
        text "Jason Crane: #{CONFIG['snapperwolf_mobile']}"
        text "Keith Pitty: #{CONFIG['beardedkeith_mobile']}"
      end
    end
    
    def page_three
      page_3 = grid(0, 1)
      bounding_box page_3.top_left, width: page_3.width, height: page_3.height do
#        stroke_bounds
        font "Helvetica"
        font_size 32
        text "Notes"
        line_count = 10
        line_step = ((page_3.height-50)/line_count).to_i
        (0..page_3.height-50.to_i).step(line_step) {|i| line [0,i],[page_3.width,i];stroke}
      end
    end
    
    def page_four
      page_4 = grid(0, 0)
      bounding_box page_4.top_left, width: page_4.width, height: page_4.height do
 #       stroke_bounds
        map = "#{Rails.root}/public/images/map.png"
        image map, at: [1, 398], width: 275, height: 397
      end
    end
  
end
