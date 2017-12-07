Symfony Boilerplate
===================

### What is inside?

- A **boiler project** with the **packages** we most commonly use.
- An standardized environment (with **vagrant** & **ansible**) in order to make this project work and keep on the development process.

#### Symfony Bundles

* Symfony Standard Edition (**v3.3.14** LTS)
* BraincraftedBootstrapBundle
* CraueFormFlowBundle
* DoctrineBundle
* DoctrineMigrationsBundle
* FOSUserBundle (Installed by SonataUserBundle)
* JMSDiExtraBundle
* JMSSecurityExtraBundle
* JMSSerializerBundle
* KnpMenuBundle
* KnpPaginatorBundle
* EntityAuditBundle (Simplethings)
* SonataAdminBundle
* SonataBlockBundle
* SonataCacheBundle
* SonataCoreBundle
* SonataDatagridBundle
* SonataDoctrineORMAdminBundle
* SonataEasyExtendsBundle
* SonataIntlBundle
* SonataUserBundle
* Bootstrap
* Jquery

---

Setup :
-------

#### Project Contributions

> **Note:**
>
> If you find any bug or anything that may cause any problem, please report it.
> You are encouraged to collaborate! Just submit a pull request with the respective updates.

- Clone your fork in order to work over it, if you have not a fork of this repo, just fork it!

- If you are already using the IP address set in the project, you can change it in the file ```VagrantFile```, in same way you can do with the hostname, don't forget that you should not commit these updates.

- Add the **hostname** and **project domain name** to your **host machine** _**(use the configured IP in the Vagrantfile)**_.

- Build the virtual machine with all its dependencies running ```vagrant up``` from the root of this repo.

- Establish the connection with the virtual machine running ```vagrant ssh``` from the root of this repo.

- Go to project directory located in ```/vagrant/project```. You may use the command line shortcut ```project```.

- Configure your ```parameters.yml``` file. You can use ```app/config/parameters.yml.dist``` as reference.

- Run ```composer install``` in order to install the vendors. You can add more vendors if you want, if you do it! You should run ```composer update``` in order to update them.

- Install the project assets:

    ```
        php bin/console assets:install --relative web
        php bin/console assetic:dump
        php bin/console cache:clear --env=dev --no-warmup --no-debug
    ```

- Create the database tables, then add an **admin user** in order to test the **admin dashboard** and its **features**:

    ```
        php bin/console doctrine:schema:update --force
        php bin/console fos:user:create admin john.doe@symfony-boilerplate.com admin --super-admin
    ```

    You may use a real email address in order to test real user features!

- You can access the application in your browser as follows:

    - If you got already configure the project domain name in your host machine:

        ```http://site.symfony-boilerplate.dev/```

    - Otherwise you can create a local web server running:

        ```php bin/console server:run```

        Now you can access the application in your browser at ```http://localhost:8000```. You can stop the built-in web server by pressing ```Ctrl + C``` while you're in the terminal.

---

#### Third Party Projects

* Just clone or download this repo.

* Rename the main directory ```symfony-boilerplate``` if you want to set your own project name.

* Set a new **Hostname**, **Project Domain Name**, **IP** and **Project Name** in the file ```VagrantFile```. These settings are just placeholders for the Project Development.

* Change the origin repo to the new repository in order to push your new project ```git remote remove origin; git remote add origin [NEW-GIT-REMOTE]```.

* Change the ```README.md``` file with instructions on how to setup that project accordingly.

* Add the **hostname** and **project domain name** to your **host machine** _**(use the configured IP in the Vagrantfile)**_.

- Build the virtual machine with all its dependencies running ```vagrant up``` from the root of this repo.

- Establish the connection with the virtual machine running ```vagrant ssh``` from the root of this repo.

- Go to project directory located in ```/vagrant/project```. You may use the command line shortcut ```project```.

- Configure your ```parameters.yml``` file. You can use ```app/config/parameters.yml.dist``` as reference.

- Run ```composer install``` in order to install the vendors. You can add more vendors if you want, if you do it! You should run ```composer update``` in order to update them.

- Install the project assets:

    ```
        php bin/console assets:install --relative web
        php bin/console assetic:dump
        php bin/console cache:clear --env=dev --no-warmup --no-debug
    ```

- Create the database tables, then add an **admin user** in order to test the **admin dashboard** and its **features**:

    ```
        php bin/console doctrine:schema:update --force
        php bin/console fos:user:create admin john.doe@symfony-boilerplate.com admin --super-admin
    ```

    You may use a real email address in order to test real user features!

- You can access the application in your browser as follows:

    - If you got already configure the project domain name in your host machine:

        ```http://site.symfony-boilerplate.dev/```

    - Otherwise you can create a local web server running:

        ```php bin/console server:run```

        Now you can access the application in your browser at ```http://localhost:8000```. You can stop the built-in web server by pressing ```Ctrl + C``` while you're in the terminal.

> **Heads up!**
>
> There are a set of useful functions (**shortcuts**) that you may run via command line using the fish shell. You can find out more reading the file ```.ansible/files/fish/config.fish```.

#### You're done!
