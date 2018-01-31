pipeline {
  agent any
  stages {
    stage('build') {
      agent {
        node {
          label 'ci-slave'
        }
      }
      steps {
        sh '''\
        #!/bin/bash -l
        export -p
        rbenv version
        gem env
        '''
        wrap([$class: 'Xvfb', autoDisplayName: true]) {
          sh '''\
          #!/bin/bash -l
          bundle check || bundle install --path=vendor/bundle --jobs=4
          bundle exec rspec spec/features/*.feature
          '''
        }
      }
    }
  }
}

/* vim:set ft=groovy: */
