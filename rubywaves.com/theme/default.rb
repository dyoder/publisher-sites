Module.new do

  %w( page banner sidebar block main ).each { |c|
    eval <<-CODE
      def #{c}
        div( :class => :#{c} ) { yield }
      end
    CODE
  }


  # you must use an explicit block to use it with capture below
  def layout( content = nil )
    content ||= site
    doctype
    html {
      head {

        meta :name => 'description', :content => site['description']
        meta :name => 'verify-v1', :content => 'SJp07enRMbdu2hJ8AhT08Wc6OyTAGjtvxVzo7X1k83g='
        link :rel => 'alternate', :type => 'application/rss+xml', :href => 'http://feeds.feedburner.com/MouseTrap20'

        stylesheet content.stylesheet
        javascript 'http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js', :site
        title content.title

      }
      body {
        page { 
          banner { img( :src => paths(:image).get( 'banner.png' ) ) }
          main { yield }
          sidebar {
            block {
              welcome = model(:story).find(:sidebar)
              p { textile( welcome.content ) }
            }
          }
        }
      }
    }
  end

end
