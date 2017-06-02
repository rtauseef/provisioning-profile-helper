require 'fileutils'

pp_dir = "#{ENV['HOME']}/Library/MobileDevice/Provisioning Profiles"

profiles = [
	{
		name: 'HP Pilot WildCard Develop Provision',
		file: 'hp.wildcard.dev.mobileprovision'
	},
	{
		name: 'HP Sprocket Development Provision',
		file: 'hp.sprocket.app.dev.mobileprovision'
	},
	{
		name: 'HP Sprocket Action Develop Provision',
		file: 'hp.sprocket.action.dev.mobileprovision'
	},
	{
		name: 'HP Sprocket Push Notification Develop Provision',
		file: 'hp.sprocket.push.notification.dev.mobileprovision'
	},
	{
		name: 'HP Sprocket AdHoc Distrib Provision',
		file: 'hp.sprocket.app.ad.hoc.mobileprovision'
	},
	{
		name: 'HP Sprocket Action AdHoc Distribution Provision',
		file: 'hp.sprocket.action.ad.hoc.mobileprovision'
	},
	{
		name: 'HP Sprocket Push Notification AdHoc Provision',
		file: 'hp.sprocket.push.notification.ad.hoc.mobileprovision'
	}
]

puts "\n*******************"

profiles.each_with_index do |info, idx|

	puts "\n~~~~~\n" if idx > 0

	uuid = `egrep -a -A2 UUID #{info[:file]}`.match(/<string>(.+)<\/string>/).captures.first rescue nil
	filename = "#{pp_dir}/#{uuid}.mobileprovision"

	found = false
	Dir.glob("#{pp_dir}/*.mobileprovision").each do |file|
		next if file == filename
		if `egrep -a -A 2 "<key>Name</key>" "#{file}"`.include?(info[:name])
			print "\nMoving #{File.basename(file)} to desktop... "
			FileUtils.mv file, "#{ENV['HOME']}/Desktop"
			found = true
			puts 'OK'
		end
	end

	puts "\nNo old wildcard provisioning profiles were found" unless found

	if File.exists?(filename)
		puts "\n'#{info[:name]}' already installed:  #{File.basename(filename)}"
	else
		print "\n'#{info[:name]}' NOT already installed:  #{File.basename(filename)}"
		print "\nCopying #{File.basename(filename)}  ⇒  #{pp_dir}... "
		FileUtils.cp info[:file], "#{filename}"
		puts 'OK'
	end

end

puts "\nDone!\n\n*******************\n\n"
