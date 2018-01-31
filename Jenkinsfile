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
          export -p
          rbenv version
          gem env
        '''
        sh '''
          bundle check || bundle install --path=vendor/bundle --jobs=4
          bundle exec rspec spec/reatures/*.feature
        '''
      }
    }
  }
}

/* vim:set ft=groovy: */
