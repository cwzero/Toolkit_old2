from vbox.vbox import vbox

class vm(object):
  _instance = None
  vmname = None
  def __init__(self, vmname):
    self.vmname = vmname
  def info(self, args):
    return vbox.showvminfo(self.vmname, args)
  def register(self, args):
    return vbox.registervm(self.vmname, args)
  def start(self, args):
    return vbox.startvm(self.vmname, args)
  def create(self, args):
    return vbox.createvm(args)
  def modify(self, args):
    return vbox.modifyvm(self.vmname, args)
  def defaults(self):
    return vbox.vm_defaults(self.vmname)
  def snapshot(self, args):
    return vbox.snapshot(self.vmname, args)
  def clone(self, args):
    return vbox.clonevm(self.vmname, args)
  def move(self, args):
    return vbox.movevm(self.vmname, args)
  def encrypt(self, args):
    return vbox.encryptvm(self.vmname, args)
  def start(self, args):
    return vbox.startvm(self.vmname, args)
  def control(self, args):
    return vbox.controlvm(self.vmname, args)
  def importvm(self, ovaname, args):
    return vbox.importvm([ovaname] + args)
  def export(self, args):
    return vbox.exportvm(self.vmname, args)
  def debug(self, args):
    return vbox.debugvm(self.vmname, args)
  def sharedfolder(self, args):
    return vbox.sharedfolder(self.vmname, args)
  def modifynvram(self, args):
    return vbox.modifynvram(self.vmname, args)
  def discardstate(self, args):
    return vbox.discardstate(self.vmname, args)
  def adoptstate(self, args):
    return vbox.adoptstate(self.vmname, args)
  def storageattach(self, args):
    return vbox.storageattach(self.vmname, args)
  def storagectl(self, args):
    return vbox.storagectl(self.vmname, args)
  def bandwidthctl(self, args):
    return vbox.bandwidthctl(self.vmname, args)
  def setextradata(self, args):
    return vbox.setextradata(self.vmname, args)
  def getextradata(self, args):
    return vbox.getextradata(self.vmname, args)
  def guestproperty(self, args):
    return vbox.guestproperty(self.vmname, args)
  def guestcontrol(self, args):
    return vbox.guestcontrol(self.vmname, args)
  def metrics(self, args):
    return vbox.metrics(self.vmname, args)