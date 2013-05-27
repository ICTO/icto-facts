#
# Facts for the vga2usb driver
#

Facter.add(:vga2usb_version) do
  setcode do
      Facter::Util::Resolution.exec('dkms status vga2usb -k `uname -r` | cut -d "," -f 2')
  end
end