Module.new do

  def page
    div(:class => :page) { yield }
  end

  # you must use an explicit block to use it with capture below
  def layout( content = nil )
    content ||= site
    doctype
    html {
      head {

        meta :name => 'description', :content => site['description']
        meta :name => 'verify-v1', :content => 'SJp07enRMbdu2hJ8AhT08Wc6OyTAGjtvxVzo7X1k83g='
        link :rel => 'alternate', :type => 'application/rss+xml', :href => 'http://feeds.feedburner.com/MouseTrap20'

        stylesheet content.stylesheet,
          'syntaxhighlighter_2/styles/shCore',
          'syntaxhighlighter_2/styles/shThemeDefault'

        javascript 'http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js',
          'syntaxhighlighter_2/scripts/shCore',
          'syntaxhighlighter_2/scripts/shBrushRuby',
          :site

        title content.title

      }
      body {
        banner {
          img( :src => paths(:image).get( 'banner.png' ) )
          sidebar {
            block {
              welcome = model(:story).find(:sidebar)
              h4 welcome.title
              p { textile( welcome.content ) }
            }
          }
        }
        page {
          yield
        }
      }
    }
  end

  %w( banner sidebar block ).each { |c|
    eval <<-CODE
      def #{c}
        div( :class => :#{c} ) { yield }
      end
    CODE
  }

end
