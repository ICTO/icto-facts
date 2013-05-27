#
# Facts for the vga2pci driver
#

Facter.add(:vga2pci_version) do
  setcode do
      Facter::Util::Resolution.exec('dkms status vga2pci -k `uname -r` | cut -d "," -f 2')
  end
end