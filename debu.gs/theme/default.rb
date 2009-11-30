Module.new do

  %w( header page banner sidebar block main ).each { |c|
    eval <<-CODE
      def #{c}
        div( :class => :#{c} ) { yield }
      end
    CODE
  }
  
  def story( key )
    raw( view.show_without_layout( model(:story ).find( key ) ) )
  end
  
  def blog
    block { view(:story).list_without_layout( model(:blog).find('debugs').stories )  }
  end

  # you must use an explicit block to use it with capture below
  def layout( content = nil )
    content ||= site
    doctype
    html {
      head {
        meta :name => 'description', :content => site['description']
        stylesheet content.stylesheet
        title content.title
      }
      body {
        page { 
          banner { story( :banner ) }
          main { yield }
          sidebar { blog }
        }
      }
    }
  end

end
