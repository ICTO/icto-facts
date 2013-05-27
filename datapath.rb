#
# Datapath capture card facts
#

Facter.add(:datapath_version) do
  setcode do
      Facter::Util::Resolution.exec('modinfo rgb133 -F version')
  end
end