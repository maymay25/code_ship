require "erb"
require 'rack'

@price = '12345'

template = <<EOT
<%= @price %>

<%=Rack::Utils.escape_html('<div>here</div>') if true -%>
<br/>
EOT

ERB.new(template, 0, "-").run