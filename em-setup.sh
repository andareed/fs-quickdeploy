# EM Setup and explanation
# Console Settings:
fstool set_property session.timeout.enabled false
fstool set_property session.timeout.unit 1
fstool set_property session.timeout 15

# Internal Networks Screen:
fstool set_property nac.ranges.reserved.ips.enabled.1 true
fstool set_property nac.ranges.reserved.ips.handle.host.with.ipv6.enabled true
fstool set_property nac.ranges.reserved.ips.retain false


# Advanced -> Overlapping IPs
fstool set_property overlapping.ips.support.ipv6 true
fstool set_property overlapping.ips.support.iac.outside.area.code false
fstool set_property overlapping.ips.enabled true

# NAC -> Time Settings
fstool set_property fs.np.action.display.ttl 86400 #Action Display to 1 week
fstool set_property fs.purge.host.ttl.sec 345600 # Purge host if no activity for 4 days
fstool set_property fs.exist.ttl.sec 345600 # Ignore Information Older than 4 days ?? TODO: Verify
fstool set_property np.new.ip.resolve.delay 60 #Network Admission Resolve Delay

#
#
