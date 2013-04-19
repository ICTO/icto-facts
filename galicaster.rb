#
# galicaster.rb Custom facts about galicaster capture agent
#
 
if File.exists?("/home/icto/Galicaster/galicaster/__init__.py") then
  Facter.add(:galicaster_version) do
    setcode do
      Facter::Util::Resolution.exec('awk \'/__version__/ {print $3}\' /home/icto/Galicaster/galicaster/__init__.py | sed "s/\'//g"')
    end
  end 
end