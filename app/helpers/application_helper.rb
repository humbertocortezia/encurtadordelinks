module ApplicationHelper

    def flash_message
        notification = ''
        %i[success info warning error].each do |type|
          next unless flash[type]
    
          notification += "<script>
          Swal.fire({
            icon: '#{type}',
            text: '#{flash[type]}',
          })
            </script>"
        end
        notification.html_safe
      end
    
end
