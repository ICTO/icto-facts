#
# apache.rb - facter to show apache version
#
 
Facter.add(:apache_version) do
  setcode do
    Facter::Util::Resolution.exec('/usr/sbin/apache2 -v | sed \'s/[://]/ /g\' |awk \'/version/ {print $4}\'')
  end
end

output = `/usr/sbin/apache2ctl -S`

if output
  Facter.add(:apache_sites) do
    setcode do
      output
    end
  end 
end