#
# galicaster.rb Custom facts about galicaster capture agent
#

if File.exists?("/usr/share/galicaster/galicaster/__init__.py") then
  Facter.add(:galicaster_version) do
    setcode do
      Facter::Util::Resolution.exec('awk \'/__version__/ {print $3}\' /usr/share/galicaster/galicaster/__init__.py | sed "s/\'//g"')
    end
  end

  if File.exists?("/dev/screen") then
    Facter.add(:screendriver) do
      setcode do
        Facter::Util::Resolution.exec("v4l-info /dev/screen | awk '/driver/' | awk -F '\"' '{print $2}'")
      end
    end

    Facter.add(:screenversion) do
      setcode do
        Facter::Util::Resolution.exec("v4l-info /dev/screen | awk '/version/' | awk -F '\"' '{print $2}'")
      end
    end
  end

  if File.exists?("/dev/camera") then
    Facter.add(:cameradriver) do
      setcode do
        Facter::Util::Resolution.exec("v4l-info /dev/camera | awk '/driver/' | awk -F '\"' '{print $2}'")
      end
    end

    Facter.add(:cameraversion) do
      setcode do
        Facter::Util::Resolution.exec("v4l-info /dev/camera | awk '/version/' | awk -F '\"' '{print $2}'")
      end
    end
  end
end
