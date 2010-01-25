Module.new do

  # you must use an explicit block to use it with capture below
  def layout( content = nil )
    content ||= site
    doctype
    html {
      head {

        meta :name => 'description', :content => site['description']
        meta :name => 'verify-v1', :content => '8YjQ5TZmk2IlbU1CptGPIIIz2EJotQuTHDF6t5pWjOM='
        # link :rel => 'alternate', :type => 'application/rss+xml', :href => 'http://feeds.feedburner.com/MouseTrap20'

        stylesheet content.stylesheet

        javascript 'http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js',
          'http://use.typekit.com/gzv3wnx.js',
          :site
        
        title content.title

      }
      body {
        page {
          banner {
            logo {
             a "Cooking JJ's Way", :href => '/home' 
            }
          }
          sidebar { 
            block { story( :menu ) } 
            block { story( :blog ) }
          }
          yield
          footer { story( :footer ) }
        }
      }
    }
    CGI.pretty( render )
  end
  
  def story( name )
    view(:story).show_without_layout( model(:story).find( name ) )
  end

  %w( page banner sidebar block logo footer ).each { |c|
    eval <<-CODE
      def #{c}( text = nil )
        div( :class => :#{c} ) { raw( text ) if text ; yield if block_given? }
      end
    CODE
  }

end
