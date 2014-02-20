#测试域名正则表达式

def common_url(link)
  puts /^http\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/ === link
end

def custom_domain_url(link)
  domain = 'suixin365.com'
  puts /^http\:\/\/[a-zA-Z0-9\-\.]*#{domain}(\/\S*)?$/ === link
end

puts "test common_url"
common_url 'http://www.suixin365.com/'
common_url 'http://www.ximalaya.com/'
common_url 'http://www.ximalaya.com.cn/'

puts "test custom_domain_url"
custom_domain_url 'http://www.suixin365.com/'
custom_domain_url 'http://suixin365.com/'
custom_domain_url 'http://hahaha.suixin365.com/'
custom_domain_url 'http://hahaha.suixin365.com/werfgwefwefgrf131_!@#$%^&*()fewfwefwe'

custom_domain_url 'http://www.ximalaya.com/'
custom_domain_url 'http://ximalaya.com/'
custom_domain_url 'http://suixin364.com/'
custom_domain_url 'http://suixin364.com/gwfwe fwef qdw'






