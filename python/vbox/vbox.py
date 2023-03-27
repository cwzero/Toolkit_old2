import subprocess

class VirtualBox(object):
  _instance = None
  def __new__(cls):
    if (cls._instance is None):
      cls._instance = super(VirtualBox, cls).__new__(cls)
    return cls._instance
  def vboxmanage(self, args):
    return subprocess.check_output(['vboxmanage'] + args)
  def list(self, args):
    return self.vboxmanage(['list'] + args)
  def showvminfo(self, vmname, args):
    return self.vboxmanage(['showvminfo', vmname] + args)
  def registervm(self, vmname, args):
    return self.vboxmanage(['registervm', vmname] + args)
  def startvm(self, vmname, args):
    return self.vboxmanage(['startvm', vmname] + args)
  def createvm(self, args):
    return self.vboxmanage(['createvm'] + args)
  def modifyvm(self, vmname, args):
    return self.vboxmanage(['modifyvm', vmname] + args)
  def vm_defaults(self, vmname):
    return self.modifyvm(vmname, ['--vram', '9', '--graphicscontroller', 'vmsvga', '--acpi', 'on', '--ioapic', 'on', '--nestedpaging', 'on', '--largepages', 'on', '--hwvirtex', 'on', '--pae', 'on', '--longmode', 'on', '--cpus', '4', '--memory', '4096'])
  def snapshot(self, vmname, args):
    return self.vboxmanage(['snapshot', vmname] + args)
  def clonevm(self, vmname, args):
    return self.vboxmanage(['clonevm', vmname] + args)
  def movevm(self, vmname, args):
    return self.vboxmanage(['movevm', vmname] + args)
  def encryptvm(self, vmname, args):
    return self.vboxmanage(['encryptvm', vmname] + args)
  def startvm(self, vmname, args):
    return self.vboxmanage(['startvm', vmname] + args)
  def controlvm(self, vmname, args):
    return self.vboxmanage(['controlvm', vmname] + args)
  def importvm(self, args):
    return self.vboxmanage(['import'] + args)
  def exportvm(self, vmname, args):
    return self.vboxmanage(['export', vmname] + args)
  def mediumio(self, args):
    return self.vboxmanage(['mediumio'] + args)
  def sharedfolder(self, vmname, args):
    return self.vboxmanage(['sharedfolder', vmname] + args)
  def dhcpserver(self, args):
    return self.vboxmanage(['dhcpserver'] + args)
  def debugvm(self, vmname, args):
    return self.vboxmanage(['debugvm', vmname] + args)
  def extpack(self, args):
    return self.vboxmanage(['extpack'] + args)
  def unattended(self, args):
    return self.vboxmanage(['unattended'] + args)
  def cloud(self, args):
    return self.vboxmanage(['cloud'] + args)
  def cloudprofile(self, args):
    return self.vboxmanage(['cloudprofile'] + args)
  def signova(self, args):
    return self.vboxmanage(['signova'] + args)
  def modifynvram(self, vmname, args):
    return self.vboxmanage(['modifynvram', vmname] + args)
  def updatecheck(self, args):
    return self.vboxmanage(['updatecheck'] + args)
  def discardstate(self, vmname, args):
    return self.vboxmanage(['discardstate', vmname] + args)
  def adoptstate(self, vmname, args):
    return self.vboxmanage(['adoptstate', vmname] + args)
  def closemedium(self, medium, args):
    return self.vboxmanage(['closemedium', medium] + args)
  def storageattach(self, vmname, args):
    return self.vboxmanage(['storageattach', vmname] + args)
  def storagectl(self, vmname, args):
    return self.vboxmanage(['storagectl', vmname] + args)
  def bandwidthctl(self, vmname, args):
    return self.vboxmanage(['bandwidthctl', vmname] + args)
  def showmediuminfo(self, medium, args):
    return self.vboxmanage(['showmediuminfo', medium] + args)
  def createmedium(self, args):
    return self.vboxmanage(['createmedium'] + args)
  def modifymedium(self, medium, args):
    return self.vboxmanage(['modifymedium', medium] + args)
  def clonemedium(self, medium, args):
    return self.vboxmanage(['clonemedium', medium] + args)
  def mediumproperty(self, medium, args):
    return self.vboxmanage(['mediumproperty', medium] + args)
  def encryptmedium(self, medium, args):
    return self.vboxmanage(['encryptmedium', medium] + args)
  def checkmediumpwd(self, medium, args):
    return self.vboxmanage(['checkmediumpwd', medium] + args)
  def convertfromraw(self, medium, args):
    return self.vboxmanage(['convertfromraw', medium] + args)
  def setextradata(self, vmname, args):
    return self.vboxmanage(['setextradata', vmname] + args)
  def getextradata(self, vmname, args):
    return self.vboxmanage(['getextradata', vmname] + args)
  def setproperty(self, args):
    return self.vboxmanage(['setproperty'] + args)
  def usbfilter(self, args):
    return self.vboxmanage(['usbfilter'] + args)
  def guestproperty(self, vmname, args):
    return self.vboxmanage(['guestproperty', vmname] + args)
  def guestcontrol(self, vmname, args):
    return self.vboxmanage(['guestcontrol', vmname] + args)
  def metrics(self, vmname, args):
    return self.vboxmanage(['metrics', vmname] + args)
  def natnetwork(self, args):
    return self.vboxmanage(['natnetwork'] + args)
  def hostonlyif(self, args):
    return self.vboxmanage(['hostonlyif'] + args)
  def usbdevsource(self, args):
    return self.vboxmanage(['usbdevsource'] + args)

vbox = VirtualBox()