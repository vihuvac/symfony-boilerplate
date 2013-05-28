puppet-git
==========

Puppet module to handle Git repositories

Example
-----


    class{'git':
      username =>  'MYNAME',
      usermail =>  'MYMAIL'
    }

    git::clone {'repo_name':
      source    => 'URL',
      localtree => 'DIRECTORY',
    }
