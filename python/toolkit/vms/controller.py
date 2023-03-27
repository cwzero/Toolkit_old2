from vbox.vm import vm
from vbox.vbox import vbox
from vbox.network import hostonlyif

class ControllerVM(vm):
  def __init__(self, num):
    vm.__init__(self, 'toolkit-controller-0%d' % num)
  def import_controller(self):
    vbox.importvm(['packer/ubuntu/ubuntu.ova', '--vsys', '0', '--vmname', self.vmname])
  def configure_controller(self):
    self.defaults()
    self.modify(['--groups', '/toolkit/controller', '--ostype', 'Ubuntu22_LTS_64'])
    self.modify(['--nic1', 'hostonly', '--hostonlyadapter1', hostonlyif(4).name])

controllers = {}
for i in range(1, 4):
  controllers[i] = ControllerVM(i)