Symfony Boilerplate
===================

## What is inside?

## Symfony Bundles

#### Symfony Standard Edition (2.7.* LTS)

#### Braincrafted Bundles

* BcBootstrapBundle

#### Craue Bundles

* CraueFormFlowBundle

#### Doctrine Bundles

* DoctrineBundle
* DoctrineMigrationsBundle

#### FOS Bundles

* FOSUserBundle (Installed by SonataUserBundle)

#### Ircmaxell Bundles

* password_compat

#### JMS Bundles

* JMSSecurityExtraBundle

#### KnpLabs Bundles

* KnpPaginatorBundle

#### Raulfraile Bundles

* LadybugBundle

#### Simplethings Bundles

* EntityAudit

#### Sonata Bundles

* SonataAdminBundle
* SonataBlockBundle
* SonataCacheBundle
* SonataCoreBundle
* SonataDatagridBundle
* SonataDoctrineORMAdminBundle
* SonataEasyExtendsBundle
* SonataIntlBundle
* SonataUserBundle

#### Twitter & Jquery Bundles

* Bootstrap (~3.3)
* Jquery (1.11.2)

### Vagrant & Puppet

#### Apache2
#### Augeas
#### Composer
#### Dotdeb
#### PHP 5.4.*
#### Drupal
#### Firewall
#### Fish
#### Git
#### Memcached
#### Mercurial
#### MySQL
#### NFSClient
#### Nodejs
#### Vim
#### Other Packages like:

- htop
- tmux
- multitail
- tzdata
- openjdk-6-jre

---

Setup :
-------

### Project Contributions

> **Note:**
>
> If you find any bug or anything that may cause any problem, please report it.
>
> If you are encouraged to fix it, please submit a pull request with the respective changes.

- Clone your fork in order to work over it, if you have not a fork of this repo, just fork it!

- If you are already using the IP address set in the project, you can change it in the file ```VagrantFile```, in same way you can do with the hostname, don't forget that you should not commit these updates.

- Create the file ```git_config.pp``` in the ```puppet/manifests/``` directory. You can use ```puppet/manifests/git_config.pp.dist``` as reference.

- Add the hostname to your computer _**(use the configured IP in the Vagrantfile)**_.

- Start vagrant ```vagrant up``` from the root of this repo.

- Login to the virtual machine ```vagrant ssh``` from the root of this repo.

- Go to ``` /vagrant/project``` directory.

- Configure your ```parameters.yml``` file. You can use ```app/config/parameters.yml.dist``` as reference.

- Run ```composer install``` to install the vendors. You can install more vendors if you want, if you do it! You should run ```composer update``` in order to update them.

- Run the required ```app/console``` commands:

    ```app/console assets:install --symlink web```

    ```app/console assetic:dump```

### Third Party Projects

* Just clone or download this repo.

* Rename the main directory ```symfony-boilerplate``` if you want to set your own project name.

* Set a **new Hostname**, **IP** and **Project Name** in the file ```VagrantFile```. These settings are just placeholders for the Project Development.

* Create the file ```git_config.pp``` in the ```puppet/manifests/``` directory. You can use ```puppet/manifests/git_config.pp.dist``` as reference.

* Change the origin repo to the new repository in order to push your new project ```git remote remove origin; git remote add origin [NEW-GIT-REMOTE]```.

* Change the ```README.md``` file with instructions on how to setup that project accordingly.

* Add the host to your computer _**(use the configured IP in the Vagrantfile)**_.

* Start vagrant ```vagrant up``` from the root of this repo.

* Login to the virtual machine ```vagrant ssh``` from the root of this repo.

* Go to ``` /vagrant/project``` directory.

* Configure your ```parameters.yml``` file. You can use ```app/config/parameters.yml.dist``` as reference.

* Run ```composer install``` to install the vendors. You can install more vendors if you want, if you do it! You should run ```composer update``` in order to update them.

* Run the required ```app/console``` commands:

    ```app/console assets:install --symlink web```

    ```app/console assetic:dump```

#### You're done!
