#
# Datapath capture card facts
#

output = system('modinfo rgb133')

if output then
  Facter.add(:datapath_version) do
    setcode do
        Facter::Util::Resolution.exec('modinfo rgb133 -F version')
    end
  end
end