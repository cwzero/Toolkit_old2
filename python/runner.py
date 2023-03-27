from toolkit.networking import networking
from toolkit.vms.router import router
from toolkit.vms.dev import dev
from toolkit.vms.controller import controllers
from toolkit.vms.worker import workers

#networking.configure_networking()

#router.import_router()
#router.configure_router()

#dev.import_dev()
#dev.configure_dev()

#for i in range(1, 4):
#    print("Importing controller-0%d" % i)
#    controllers[i].import_controller()

for i in range(1, 4):
    print("Importing worker-0%d" % i)
    workers[i].import_worker()

for i in range(1, 4):
    print("Configuring controller-0%d" % i)
    controllers[i].configure_controller()

for i in range(1, 4):
    print("Configuring worker-0%d" % i)
    workers[i].configure_worker()