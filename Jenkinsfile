pipeline {
  agent none
  stages {
    stage('build') {
      agent { label 'ci-slave' }
      steps {
        sh '''#!/bin/bash -l
          set -xe
          export -p
          rbenv version
          gem env
        '''
        sh '''#!/bin/bash -l
          set -xe
          bundle check || bundle install --jobs=4 --path=vendor/bundle --deployment
        '''
        wrap([$class: 'Xvfb', autoDisplayName: true]) {
          sh '''#!/bin/bash -l
            set -xe
            bundle exec rspec spec/features/*.feature
          '''
        }
      }
    }
  }
}

/* vim:set ft=groovy: */
