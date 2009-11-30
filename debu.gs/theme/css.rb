Module.new do

  def colors
    @colors ||= {
      :foreground => '#339',
      :background => :white
    }
  end

  def default
    page_styles
    heading_styles
    body_styles
    sidebar_styles
    link_styles
    image_styles
    content_styles
  end

  def page_styles
    body {
      width '100%'
      padding 0 ; margin 0
    	background colors[:background]
    	label_attributes
    }
    selector('div.page') {
      margin '10px auto'
      width '1000px'

      div.banner { 
        
        background_color '#9cf'
        margin_bottom '1em'
        height '100px'
        width '100%'
        padding '10px'
        color 'white'
        p { 
          float :right 
          margin_right '50px'
          padding_top '30px'
          font_family 'courier'
          font_weight 'bold'
          color '#339'
        }
      }

      selector('div.main') {
        float :left
        width '60%'
        margin_top '15px'
        margin_right '5%'
        padding_left '15px'
      }
    }
  end

  def heading_styles
    h1 { heading_attributes ; font_size '24pt' }
    h2 { heading_attributes ; font_size '18pt' }
    h3 { heading_attributes ; font_size '14pt' }
    h4 { heading_attributes ; font_size '11pt'}
  end

  def body_styles
    p { padding 0 ; margin 0 }
    selector( 'p, li' ) {
      body_attributes
      font_size '11pt'
      margin_bottom '20px'
      line_height '1.5em'
      text_align 'justify'
    }
    li {
      font_size '10pt'
      margin_bottom '10px'
      line_height '1.25em'
    }
  end

  def sidebar_styles
    div.sidebar {
      float :left
      width '30%'
      p {
        label_font
        font_size '9pt'
        margin_bottom '10px'
        text_align :left
      }
      div.block {
        padding '0 15px'
        border '1px solid silver'
        rounded_corner_attributes
      }
    }
  end

  def link_styles
    selector('a, a:hover, a:visited') { color colors[:foreground] ; text_decoration :none }
  end

  def image_styles
    img {
      border :none
      margin 0 ; padding 0
    }
    inset_styles
  end

  def content_styles
    story_styles
    code_styles
  end

  def inset_styles
    div.inset {
      float :right
      margin '10px 0 10px 20px'
      padding '5px'
      border '1px solid silver'
      selector('p.caption') {
        margin_bottom '10px'
        label_attributes
        color :black
        font_weight :bold
        font_size '10pt'
      }
    }
  end

  def label_attributes
    color colors[:foreground]
    label_font
  end

  def label_font
    font_family 'verdana, arial, sans-serif'
  end

  def body_attributes
    color '#232'
    body_font
  end

  def body_font
    font_family 'georgia, serif'
  end

  def heading_attributes
    label_attributes
    letter_spacing '-1px'
  end

  def code_styles
    pre {
      background '#eee'
      padding '20px'
      line_height '20px'
    }
  end

  def story_styles
    ul.stories {
      display :block
      margin 0
      padding 0
      li {
        display :block
        margin 0
        padding 0
        border_bottom '1px solid silver'
      }
    }
    selector('.story') {
      p.byline {
        margin_top '-1.5em'
        label_attributes
        font_size '0.75em'

        selector( 'span.author, span.published') { font_weight :bold }
      }
    }
  end

  def rounded_corner_attributes
    %w( moz webkit ).each { |browser|
      property("-#{browser}-border-radius", '10px')
    }
  end

end
  
  
#  def default 
#    <<-CSS
#      body { font-family: verdana, sans-serif; margin-left: 15%; width: 800px; }
#      h1, h2, h3, h4, p, ul, ol { margin-bottom: 20px; color: #333; }
#      p, ul, ol { font-family: georgia, serif; }
#      a, a:visited { color: #339; text-decoration: none; }
#      a:hover { color: #69f; }
#      h1 { font-size: 36px; }
#      h2 { font-size: 24px; }
#      h3 { font-size: 18px; }
#      div.sidebar h3 { font-size: 17px; margin-bottom: 10px; }
#      div.sidebar p, div.sidebar ul, div.sidebar ol { font-size: 12px; margin-bottom: 10px; }
#      p.subtitle { font-style: italic; }
#
#      div.banner { padding: 10px; color: white; width: 800px; height: 100px;
#      	background: url(http://studio.zeraweb.com/s/rectangle?w=800&h=100&r=12&c=9cf) no-repeat; background-color: #9cf; margin-bottom: 1em; }
#      div.banner h1 { color: #339; }
#      div.banner a, div.banner a:visited { color: #339; text-decoration: none; }
#      div.banner p { float: right; margin-right: 50px; padding-top: 30px; 
#      	font-family: courier; font-weight: bold; color: #339; }
#
#      div.main { float: right; width: 500px; padding: 0 20px;  }
#      div.sidebar { float: right; width: 200px; padding: 0 30px; }
#      div.footer { float: right; clear: both; width: 800px;
#      	font-size: 11px; padding-top: 2em;  margin-top: 2em;
#      	text-align: center; background-color: #9cf; }
#	
#      div.blog h2 { padding-top: 20px; border-top: 1px solid #339; }
#      div.byline { margin-top: -18px; font-size: 12px; }
#      div.byline span.author { font-weight: bold; }
#      div.byline span.date { font-weight: bold; }
#      div.sidebar div.byline { font-size: 10px;}
#
#      span.quote { font-style: italic; }
#
#      .feed img { border: none; }
#    CSS
#  end
