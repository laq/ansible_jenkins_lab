#! /bin/bash

################ Requirements ########################
xdg-open https://www.vagrantup.com/downloads.html

xdg-open https://www.virtualbox.org/wiki/Linux_Downloads
# apt-get install virtualbox

xdg-open http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html


################ Commands ########################
# vagrant
cd vagrant
vagrant up
vagrant status
vagrant ssh server
exit
cd ..

cd ansible
ansible all -i inventory -m ping
ansible-playbook -i inventory ngnix_install.yml
xdg-open http://10.0.0.5

ansible-playbook -i inventory jenkins_install.yml
xdg-open http://10.0.0.4:8080
# configuración de jenkins manual (secret, plugins, admin pass)
# vagrant ssh cicd
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Manual plugins, none




ansible-playbook -i inventory jenkins_job_create.yml
xdg-open http://10.0.0.4:8080


ansible-playbook -i inventory jenkins_job_invoke.yml
xdg-open http://10.0.0.5/master/demo.html

curl http://10.0.0.4:8080/job/deploy/build?token=q7v0j9sp2a9z756c
