Module.new do

  def colors
    @colors ||= {
      :foreground => '#390',
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
      border_top '20px solid #390'
    	background colors[:background]
    	label_attributes
    }
    selector('div.page') {
      width '50%'
      margin '10px auto'
    }
  end

  def heading_styles
    h1 { heading_attributes ; font_size '28pt' }
    h2 { heading_attributes ; font_size '20pt' }
    h3 { heading_attributes ; font_size '16pt' }
    h4 { heading_attributes ; font_size '12pt'}
  end

  def body_styles
    p { padding 0 ; margin 0 }
    selector( 'p, li' ) {
      body_attributes
      font_size '13pt'
      margin_bottom '20px'
      line_height '1.5em'
      text_align 'justify'
    }
    li {
      font_size '12pt'
      margin_bottom '10px'
      line_height '1.25em'
    }
  end

  def sidebar_styles
    div.sidebar {
      float :left
      width '20%'
      margin '20px 20px'
      p {
        label_font
        font_size '10pt'
        margin_bottom '10px'
        text_align :left
      }
      div.block {
        margin '15px'
        padding '0 10px'
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
      padding_left '20px'
      padding_bottom '20px'
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
