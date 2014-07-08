require 'fileutils'

puts "Name of output recording: "
name = gets.chomp

while (File.exists?("Output/" + name + ".mp4") == true)
	puts "That name is already taken. Try again: "
	name = gets.chomp
end

i = 1
record = 0
system("mkdir Output")
system("mkdir tmp")

begin
	system('adb shell "mkdir /sdcard/Recordings"')
	puts "New recording started"
	record = system("adb shell screenrecord /sdcard/Recordings/recording0.mp4 --bit-rate 6000000 --rotate --time-limit 1")
	spawn("adb pull /sdcard/Recordings/recording0.mp4 tmp/")
	record = system("adb shell screenrecord /sdcard/Recordings/recording1.mp4 --bit-rate 6000000 --rotate --time-limit 1")
	spawn("adb pull /sdcard/Recordings/recording1.mp4 tmp/")

	while true
		i += 1
		if (i > 1)
			spawn("adb pull /sdcard/Recordings/recording" + (i - 1).to_s + ".mp4 tmp/")
		end
		puts "New recording started"
		record = IO.popen("adb shell screenrecord /sdcard/Recordings/recording" + i.to_s + ".mp4 --bit-rate 6000000 --rotate --time-limit 180")
		Process.wait(record.pid)
	end
rescue Interrupt
	system("kill -2 " + record.pid.to_s)
	if (i >= 1)
		system("adb pull /sdcard/Recordings/recording" + (i - 1).to_s + ".mp4 tmp/")
	end
	system("adb pull /sdcard/Recordings/recording" + i.to_s + ".mp4 tmp/")
	j = 0
	FileUtils.cd("tmp/")

	while (j <= i)
		puts "Joining media file..."
		if (j == 0)
			system("mp4box -new -cat recording" + j.to_s + ".mp4 ../Output/" + name + ".mp4")
		else
			system("mp4box -cat recording" + j.to_s + ".mp4 ../Output/" + name + ".mp4")
		end
		FileUtils.remove_file("recording" + j.to_s + ".mp4")
		j += 1
	end

	puts "Cleaning up..."
	system('adb shell "rm -rf /sdcard/Recordings"')
	system("rmdir ../tmp")

	puts "Media files have been joined!"
	puts "Success! Your media  file is in the Output folder!"
	exit
rescue Exception => e
  puts e
end