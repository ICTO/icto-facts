if FileTest.exists?("/usr/sbin/dmidecode")

  # Add remove things to query here
  query = { 'BIOS Information' => ['Vendor:', 'Version:'], 'System Information' =>  [ 'Manufacturer:', 'Product Name:' , 'Serial Number:', 'Version:' ], 'Chassis Information' => 'Type:', 'Processor Information' => ['Version:', 'Max Speed:'], 'Memory Controller Information' => [ 'Maximum Memory Module Size:', 'Maximum Total Memory Size:' ] }

  # Run dmidecode only once
  output=%x{/usr/sbin/dmidecode 2>/dev/null}

  query.each_pair do |key,v|
    v.each do |value|
      output.split("Handle").each do |line|
        if line =~ /#{key}/  and line =~ /#{value} (\w.*)\n*./
          result = $1
          Facter.add(value.chomp(':')) do
            confine :kernel => :linux
            setcode do
              result
            end
          end
        end
      end
    end
  end
end
