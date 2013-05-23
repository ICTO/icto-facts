#
# Facts for the vga2usb driver
#

output = system('modinfo vga2usb')

if output then
  Facter.add(:vga2usb_version) do
    setcode do
        Facter::Util::Resolution.exec('dkms status vga2usb -k `uname -r`')
    end
  end
end