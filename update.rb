require 'fileutils'

pp_dir = "#{ENV['HOME']}/Library/MobileDevice/Provisioning Profiles"

wildcard_profile = 'hp.wildcard.mobileprovision'
wildcard_uuid = uuid = `egrep -a -A2 UUID #{wildcard_profile}`.match(/<string>(.+)<\/string>/).captures.first rescue nil
wildcard_filename = "#{pp_dir}/#{wildcard_uuid}.mobileprovision"

sprocket_profile = 'Sprocket_Dev_Push_Notification_Profile.mobileprovision'
sprocket_uuid = uuid = `egrep -a -A2 UUID #{sprocket_profile}`.match(/<string>(.+)<\/string>/).captures.first rescue nil
sprocket_filename = "#{pp_dir}/#{sprocket_uuid}.mobileprovision"

puts "\n*******************"

# standard development provisioning profile
found = false
Dir.glob("#{pp_dir}/*.mobileprovision").each do |file|
	next if file == wildcard_filename
	if `egrep -a -A 2 "<key>Name</key>" "#{file}"`.include?('HP Wildcard Development Provision')
		print "\nMoving #{File.basename(file)} to desktop... "
		FileUtils.mv file, "#{ENV['HOME']}/Desktop"
		found = true
		puts 'OK'
	end
end

puts "\nNo old wildcard provisioning profiles were found" unless found

if File.exists?(wildcard_filename)
	puts "\nWildcard provisioning profile already installed:  #{File.basename(wildcard_filename)}"
else
	print "\nWildcard provisioning profile NOT already installed:  #{File.basename(wildcard_filename)}"
	print "\nCopying #{File.basename(wildcard_filename)}  ⇒  #{pp_dir}... "
	FileUtils.cp wildcard_profile, "#{wildcard_filename}" 
	puts 'OK'
end

 #  sprocket provisioning profile
found = false
 Dir.glob("#{pp_dir}/*.mobileprovision").each do |file|
 	next if file == sprocket_filename
 	if `egrep -a -A 2 "<key>Name</key>" "#{file}"`.include?('Sprocket Dev Push Notification Profile')
 		print "\nMoving #{File.basename(file)} to desktop... "
 		FileUtils.mv file, "#{ENV['HOME']}/Desktop"
 		found = true
 		puts 'OK'
 	end
 end
 
puts "\nNo old sprocket provisioning profiles were found" unless found

if File.exists?(sprocket_filename)
	puts "\nSprocket provisioning profile already installed:  #{File.basename(sprocket_filename)}"
else
	print "\nSprocket provisioning profile NOT already installed:  #{File.basename(sprocket_filename)}"
	print "\nCopying #{File.basename(sprocket_filename)}  ⇒  #{pp_dir}... "
	FileUtils.cp sprocket_profile, "#{sprocket_filename}" 
	puts 'OK'
end

puts "\nDone!\n\n*******************\n\n"