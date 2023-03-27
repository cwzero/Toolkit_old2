from vbox.vm import vm
from vbox.vbox import vbox
from vbox.network import hostonlyif

class RouterVM(vm):
  def __init__(self):
    vm.__init__(self, 'toolkit-router')
  def import_router(self):
    vbox.importvm(['packer/vyos/vyos.ova', '--vsys', '0', '--vmname', self.vmname])
  def configure_router(self):
    self.defaults()
    self.modify(['--groups', '/toolkit/network', '--ostype', 'Debian_64'])
    self.modify(['--nic1', 'nat', '--nictype1', '82540EM'])
    self.modify(['--nic2', 'hostonly', '--hostonlyadapter2', hostonlyif(2).name])
    self.modify(['--nic3', 'hostonly', '--hostonlyadapter3', hostonlyif(3).name])
    self.modify(['--nic4', 'hostonly', '--hostonlyadapter4', hostonlyif(4).name])
    self.modify(['--nic5', 'hostonly', '--hostonlyadapter5', hostonlyif(5).name])

router = RouterVM()