Facter.add(:fqdndns_ipaddress4) do
  setcode do
    begin
      # Use the system configured nameservers to run a query
      addrs = []
      begin
        require 'resolv'
        Resolv::DNS.open do |dns|
          ress = dns.getresources(Facter.value('fqdn'), Resolv::DNS::Resource::IN::A)
          addrs = ress.map { |r| r.address }
        end
      rescue
        nil
      end
      if addrs.length == 1
        addrs[0].to_s.downcase
      else
        # multiple addresses is considered inconclusive, so we return nothing
        nil
      end
    end
  end
end
#fqdndns_ipaddress6.rb
#Facter.add(:fqdndns_ipaddress6) do
#  setcode do
#    begin
      # Use the system configured nameservers to run a query
#      addrs = []
#      begin
#        require 'resolv'
#        Resolv::DNS.open do |dns|
#          ress = dns.getresources(Facter.value('fqdn'), Resolv::DNS::Resource::IN::AAAA)
#          addrs = ress.map { |r| r.address }
#        end
#      rescue
#        nil
#      end
#      if addrs.length == 1
#        addrs[0].to_s.downcase
#      else
        # multiple addresses is considered inconclusive, so we return nothing
#        nil
#      end
#    end
#  end
#end
