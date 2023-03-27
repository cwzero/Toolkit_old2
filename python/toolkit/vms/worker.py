from vbox.vm import vm
from vbox.vbox import vbox
from vbox.network import hostonlyif

class WorkerVM(vm):
  def __init__(self, num):
    vm.__init__(self, 'toolkit-worker-0%d' % num)
  def import_worker(self):
    vbox.importvm(['packer/ubuntu/ubuntu.ova', '--vsys', '0', '--vmname', self.vmname])
  def configure_worker(self):
    self.defaults()
    self.modify(['--groups', '/toolkit/worker', '--ostype', 'Ubuntu22_LTS_64'])
    self.modify(['--nic1', 'hostonly', '--hostonlyadapter1', hostonlyif(5).name])

workers = {}
for i in range(1, 4):
  workers[i] = WorkerVM(i)