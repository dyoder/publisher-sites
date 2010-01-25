Module.new do

  def colors
    @colors ||= {
      :headings => '#cfe',
      :labels => '#bed',
      :background => '#0a9',
      :borders => '#9cb',
      :links => '#dfe',
      :body => '#bed'
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
      border_top "20px solid #{colors[:borders]}"
    	background colors[:background]
    	label_attributes
    }
    selector('div.page') {
      width '67%'
      margin '10px auto'
    }
    selector('div.logo') {
      a { text_decoration :none }
      margin_bottom '20px'
      padding_top '20px' 
      heading_attributes
      font_family 'chunk-1,chunk-2,sans-serif'
      color '#dfe' ; font_size '48pt'
    }
    
    selector('div.footer') {
      font_size '10pt'
    }
  end

  def heading_styles
    h1 { heading_attributes ; font_size '32pt' }
    h2 { heading_attributes ; font_size '24pt' }
    selector('h3, div.sidebar h1') { heading_attributes ; font_size '16pt' }
    h4 { heading_attributes ; font_size '14pt'}
  end

  def body_styles
    p { padding 0 ; margin 0 }
    selector( 'p, li' ) {
      body_attributes
      margin_bottom '20px'
      line_height '1.5em'
    }
    ul {
      list_style_position :inside
      li {
        font_size '14pt'
        margin_bottom '10px'
        line_height '1.25em'
      }
    }
  end

  def sidebar_styles
    div.sidebar {
      float :left
      width '20%'
      margin_right '20px'
      p {
        label_font
        font_size '12pt'
        margin_bottom '10px'
        text_align :left
      }
      a { text_decoration :none }
      div.block {
        margin_bottom '20px'
        padding '10px'
        border "1px solid #{colors[:borders]}"
        rounded_corner_attributes
      }
    }
  end

  def link_styles
    selector('a, a:hover, a:visited') { color colors[:links] ; text_decoration :none }
    selector('a:hover') { text_decoration :underline }
  end

  def image_styles
    img {
      border :none
      margin 0 ; padding 0
    }
    inset_styles
  end

  def content_styles
    menu_styles
    story_styles
    code_styles
  end

  def inset_styles
    div.inset {
      rounded_corner_attributes
      float :right
      margin '0 0 10px 20px'
      padding '10px'
      border "1px solid #{colors[:borders]}"
      selector('p.caption') {
        heading_attributes
        margin_bottom '10px'
        font_weight :bold
        font_size '14pt'
      }
      img {
        width '200px'
        rounded_corner_attributes
      }
    }
  end

  def label_attributes
    color colors[:labels]
    label_font
  end

  def label_font
    font_family 'verdana, sans-serif'
  end

  def body_attributes
    color colors[:body]
    body_font
  end

  def body_font
    font_family 'georgia, serif'
    font_size '14pt'
  end

  def heading_attributes
    label_attributes
    font_family '"daniel-1","daniel-2",cursive'
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
  
  def menu_styles
    div.menu {
      ul {
        margin 0
        padding 0
        li {
          label_attributes
          border "1px solid #{colors[:borders]}"
          padding '5px'
          text_align 'center'
          rounded_corner_attributes
          display :block
        }
        selector('li:hover') {
          background colors[:labels]
          selector('a') {
            color colors[:background]
          }
        }
      }
    }
    
  end

  def rounded_corner_attributes
    %w( moz webkit ).each { |browser|
      property("-#{browser}-border-radius", '10px')
    }
  end

end
