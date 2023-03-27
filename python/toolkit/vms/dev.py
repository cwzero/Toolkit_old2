from vbox.vm import vm
from vbox.vbox import vbox
from vbox.network import hostonlyif

class DevVM(vm):
  def __init__(self):
    vm.__init__(self, 'toolkit-dev')
  def import_dev(self):
    vbox.importvm(['packer/ubuntu/ubuntu.ova', '--vsys', '0', '--vmname', self.vmname])
  def configure_dev(self):
    self.defaults()
    self.modify(['--groups', '/toolkit/admin', '--ostype', 'Ubuntu22_LTS_64'])
    self.modify(['--nic1', 'hostonly', '--hostonlyadapter1', hostonlyif(3).name])

dev = DevVM()