Vagrant.configure("2") do |config|
  config.vm.box = "mvbcoding/awslinux"
  config.vm.box_version = "2017.03.0.20170401"
  config.vm.network "forwarded_port", guest: 80, host: 2300

  # deploy codes
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    whoami      #=> vagrant
    echo $HOME  #=> /home/vagrant

    # install packages
    sudo yum -y update
    sudo yum -y install git openssl-devel readline-devel zlib-devel sqlite-devel httpd

    # prepare rbenv
    if hash rbenv 2>/dev/null; then
      echo "Already rbenv is installed"
    else
      curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
      # exec rbenv
      if [ `grep rbenv ~/.bashrc | wc -l` -eq 1 ]; then
        echo "hello";
      else
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(rbenv init -)"'               >> ~/.bashrc
      fi
    fi
    source ~/.bashrc

    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"

    rbenv install -s 2.4.0
    rbenv rehash
    rbenv global 2.4.0

    # checkout db_badmin
    gem install bundler

    CLONE_TO=/home/vagrant/db_badmin
    REPO_URL=https://github.com/Hiroyuki-Nagata/db_badmin.git
    BRANCH=master

    if [ -d "$CLONE_TO" ]; then
      cd $CLONE_TO
      git fetch -p
      git checkout -q $BRANCH
      latest_rev=$(git ls-remote origin HEAD | awk '{print $1}')
      current_rev=$(git rev-parse HEAD)
      if [ "$latest_rev" != "$current_rev" ]; then
        git reset --hard $(git log --pretty=format:%H | tail -1)
        git pull
      fi
    else
      git clone $REPO_URL $CLONE_TO
    fi

    # update db_badmin (hanami side)
    ruby --version
    cd $CLONE_TO && bundle install

    # prepare yarn
    if hash yarn 2>/dev/null; then
      echo "Already yarn is installed"
    else
      sudo yum -y install wget
      sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
      curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
      sudo yum -y install gcc-c++ make nodejs
      sudo yum -y install yarn
      yarn --version
    fi

    # deploy time !
    sudo npm install yarn -g
    sudo npm install webpack -g
    sudo npm install webpack-cli -g
    cd $CLONE_TO/apps/datasource && yarn && yarn run webpack
SHELL
end
