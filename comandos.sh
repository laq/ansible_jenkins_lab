#! /bin/bash

# vagrant
cd vagrant
vagrant up
vagrant status
vagrant ssh server
exit
cd ..

cd ansible
ansible all -i inventory -m ping
ansible-playbook -i inventory ngnix_install.yaml
xdg-open http://10.0.0.5

ansible-playbook -i inventory jenkins_install.yml
xdg-open http://10.0.0.4:8080
# configuración de jenkins manual (secret, plugins, admin pass)

ansible-playbook -i inventory jenkins_job_create.yml
ansible-playbook -i inventory jenkins_job_invoke.yml

xdg-open http://10.0.0.5
