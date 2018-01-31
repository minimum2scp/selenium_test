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
        sh '''
          #! /bin/bash -l
          export -p
          rbenv version
          gem env
        '''
        sh '''
          #!/bin/bash -l
          bundle check || bundle install --path=vendor/bundle --jobs=4
          bundle exec rspec spec/reatures/*.feature
        '''
      }
    }
  }
}

/* vim:set ft=groovy: */
