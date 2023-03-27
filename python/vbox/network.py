from vbox.vbox import vbox

networks = {}

class hostonlyif(object):
  ifnum = None
  name = None
  def __new__(cls, ifnum):
    if (ifnum in networks):
      return networks[ifnum]
    return object.__new__(cls)
  def __init__(self, ifnum):
    self.ifnum = ifnum
    networks[ifnum] = self
    
    if (self.ifnum <= 1):
      self.name = "VirtualBox Host-Only Ethernet Adapter"
    elif (self.ifnum > 1):
      self.name = "VirtualBox Host-Only Ethernet Adapter #%d" % self.ifnum
    
  def ipconfig(self, args):
    return vbox.hostonlyif(['ipconfig', self.name] + args)
  def set_ip(self, ip, netmask):
    return self.ipconfig(['--ip=%s' % ip, '--netmask=%s' % netmask])
  def dhcp(self):
    return self.ipconfig(['--dhcp'])
  def create(self):
    return vbox.hostonlyif(['create'])
  def remove(self):
    return vbox.hostonlyif(['remove', self.name])