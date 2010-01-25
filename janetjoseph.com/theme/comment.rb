Module.new do
end
#   div.comments
#     comments.sort_by { |c| c['created_on'] }.each do 
#       div.comment
#         p.byline do
#           text 'By '
#           span.author do
#             if comment.email
#               a comment.author, :href => "mailto: #{comment.email}"
#             else
#               text ( comment.author ? comment.author : 'Anonymous' )
#             end
#           end
#           if comment.url
#             text ' at '
#             span.url do
#               a comment.url, :href => comment.url 
#             end
#           end
#           text ' on '
#           span.date do
#             text comment.created_of.strftime('%a, %b %d') + '.'
#           end
#         end
#         p.content sanitize( comment.content )
#       end
#       form.comment :method => 'post', :action => '/comments/post', 
#         :enctype => 'multipart/form-data'
#         h1 'Add A Comment'
#         .properties
#           .string.property
#             %label Name
#             %input.value{ :name => 'comment[name]', :type => 'text', :value => '' }/
#           .string.property
#             %label Email
#             %input.value{ :name => 'comment[email]', :type => 'text', :value => '' }/
#           .string.property
#             %label URL
#             %input.value{ :name => 'comment[url]', :type => 'text', :value => '' }/
#           %h2 Comment
#           %p Most HTML tags allowed. No JavaScript.
#           .text.property
#             <textarea class='value' name='comment[content]'></textarea>
#           %h2 Are You A Spambot?
#           %p Please prove you're a human. :-)
#           .string.property
#             - x, y = rand(9)+1, rand(9)+1
#             %label= "#{x} + #{y} ="
#             %input.value{ :name => 'z1', :type => 'text', :value => '' }/          
#             %input{ :name => 'z2', :type => 'hidden', :value => x + y }/          
#         .buttons
#           %input.submit{:type => 'submit', :value => 'Save' }
# 
