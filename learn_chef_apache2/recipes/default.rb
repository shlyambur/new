apt_update 'Update the apt cache daily' do
	frequency 86_400
	action :periodic
end

package 'apache2'

service 'apache2' do
	supports :status => true
	action [:enable, :start]
end

#node.set['apache']['dir'] = '/etc/apache2'
node.set['net']['hostname'] = 'torba'
#node['user']['name'] = 'vasya'

template 'var/www/html/index.html' do
	source 'index.html.erb'
end
