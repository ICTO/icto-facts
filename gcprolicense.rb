#
# Datapath capture card facts
#

Facter.add(:galicasterpro_license) do
  setcode do
      Facter::Util::Resolution.exec('lsusb -v -d 096e:0007 | grep iSerial | awk {\'print $3\'}')
  end
end
