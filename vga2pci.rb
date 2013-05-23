#
# Facts for the vga2pci driver
#

output = system('modinfo vga2pci')

if output then
  Facter.add(:vga2pci_version) do
    setcode do
        Facter::Util::Resolution.exec('dkms status vga2pci -k `uname -r` | cut -d "," -f 2')
    end
  end
end