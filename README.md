Symfony Boilerplate
===================

What's inside?
--------------

### Symfony Standard Edition

* FrameworkBundle
* TwigBundle
* AsseticBundle
* SwiftmailerBundle
* MonologBundle
* SensioDistributionBundle
* SensioFrameworkExtraBundle
* SensioGeneratorBundle
* ParameterHandler

### Braincrafted Bundles

* BcBootstrapBundle

### Craue Bundles

* CraueFormFlowBundle

### Doctrine Bundles

* DoctrineBundle
* DoctrineMigrationsBundle

### FOS Bundles

* FOSUserBundle

### Ircmaxell Bundles

* password_compat

### JMS Bundles

* JMSSecurityExtraBundle

### KnpLabs Bundles

* KnpPaginatorBundle

### Raulfraile Bundles

* LadybugBundle

### Simplethings Bundles

* EntityAudit

### Sonata Bundles

* SonataAdminBundle
* SonataBlockBundle
* SonataCoreBundle
* SonataDoctrineORMAdminBundle
* SonataCacheBundle
* SonataEasyExtendsBundle
* SonataIntlBundle
* SonataUserBundle
* ApplicationSonataUserBundle

### Twitter & Jquery Bundles

* Bootstrap (~3.1)
* Jquery (1.10.2)

Setup :
-------

* Clone this repo

* Rename the main directory ```symfony-boilerplate``` if you want to set your own project name.

* Set the new host and ip in the file ```VagrantFile```.

* Create the file ```git_config.pp``` in the ```puppet/manifests/``` directory. You can use ```puppet/manifests/git_config.pp.dist``` as reference.

* Change the origin repo to the new repository in order to push your new project

    ```git remote remove origin```

    ```git remote add origin [NEW-GIT-REMOTE]```

* Change the ```README.md``` file with instructions on how to setup that project.

* Add the host to your computer (_**use the configured IP in the Vagrantfile**_).

* Start vagrant ```vagrant up``` from the root of this repo.

* Login to the virtual machine ```vagrant ssh``` from the root of this repo.

* Go to ```/vagrant/project``` directory.

* Configure your ```parameters.yml``` file. You can use ```app/config/parameters.yml.dist``` as reference.

* Run ```composer install``` to install the vendors. You can install more vendors if you want, if you do it! You should run ```composer update``` in order to update them.

* Run the required ```app/console``` commands:

    ```app/console assets:install --symlink web```

    ```app/console assetic:dump```

#### You're done!
