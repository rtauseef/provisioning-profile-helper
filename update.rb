require 'fileutils'

pp_dir = "#{ENV['HOME']}/Library/MobileDevice/Provisioning Profiles"

current_profile = 'hp.wildcard.mobileprovision'
current_uuid = uuid = `egrep -a -A2 UUID #{current_profile}`.match(/<string>(.+)<\/string>/).captures.first rescue nil
current_filename = "#{pp_dir}/#{current_uuid}.mobileprovision"

puts "\n*******************"

found = false
Dir.glob("#{pp_dir}/*.mobileprovision").each do |file|
	next if file == current_filename
	if `egrep -a -A 2 "<key>Name</key>" "#{file}"`.include?('HP Wildcard Development Provision')
		print "\nMoving #{File.basename(file)} to desktop... "
		FileUtils.mv file, "#{ENV['HOME']}/Desktop"
		found = true
		puts 'OK'
	end
end

puts "\nNo old provisioning profiles were found" unless found

if File.exists?(current_filename)
	puts "\nCurrent provisioning profile already installed:  #{File.basename(current_filename)}"
else
	print "\nCopying #{File.basename(current_filename)}  ⇒  #{pp_dir}... "
	FileUtils.cp current_profile, "#{current_filename}" 
	puts 'OK'
end

puts "\nDone!\n\n*******************\n\n"