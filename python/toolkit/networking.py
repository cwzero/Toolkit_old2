from vbox.network import hostonlyif

class NetworkManager(object):
  _instance = None
  def __new__(cls):
    if (cls._instance == None):
      cls._instance = object.__new__(cls)
    return cls._instance
  def clear_networking(self, num):
    for i in range(0, num):
      self.remove(i + 1)
  def create_interfaces(self, num):
    for i in range(0, num):
      self.create(i + 1)
  def configure_networking(self):
    self.dhcp(1)
    self.set_ip(2, '10.0.0.254', '255.0.0.0')
    self.set_ip(3, '10.2.0.254', '255.255.0.0')
    self.set_ip(4, '10.10.0.254', '255.255.0.0')
    self.set_ip(5, '10.11.0.254', '255.255.0.0')

  def create(self, ifnum):
    hostonlyif(ifnum).create()
  def ipconfig(self, ifnum, args):
    hostonlyif(ifnum).ipconfig(args)
  def set_ip(self, ifnum, ip, netmask):
    hostonlyif(ifnum).set_ip(ip, netmask)
  def dhcp(self, ifnum):
    hostonlyif(ifnum).dhcp()
  def remove(self, ifnum):
    hostonlyif(ifnum).remove()
      
networking = NetworkManager()