Setup:
======

* Clone this repo

* Set the new host and ip in ./VagrantFile

* Create the file ./puppet/manifests/git_config.pp (use /puppet/manifests/git_config.pp.dist as reference)

* Change the origin repo to the new repository (```git remote remove origin; git remote add origin [NEW-GIT-REMOTE]```)

* Change the readme file with instructions on how to setup that project

* Add the host to your computer (use the configured IP in the Vagrantfile)

* Start vagrant (```vagrant up``` from the root of this repo)

* Login to the computer (```vagrant ssh``` from the root of this repo)

* Go to /vagrant/project

* Configure your app/config.yml file

* Run ```composer update``` to get the vendors

* Run the required app/console commands: ```app/console assets:install web --symlink; app/console assetic:dump```
