#
# video_devices.rb Custom facts to retrieve all video devices installed
#

Dir.chdir('/dev')
devices = Dir.glob('video[0-9]')
devices.each_with_index do |dev, i|
  
  Facter.add("#{dev}driver") do
    setcode do
      Facter::Util::Resolution.exec("v4l-info /dev/#{dev} | awk 'driver' | awk -F '\"' '{print $2}'")
    end
  end

  output = `v4l-info /dev/#{dev} | awk 'version' | awk -F ':' '{print $2}'`

  Facter.add("#{dev}driverversion") do
    setcode do
      output
    end
  end
end

count = Dir.glob('video*').count()

Facter.add("videodevicescount") do
  setcode do
    count
  end
end