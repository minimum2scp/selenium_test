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
          bash -lc 'rbenv version'
          bash -lc 'gem env'
        '''
        sh '''
          bash -lc 'bundle check || bundle install --path=vendor/bundle --jobs=4'
          bash -lc 'bundle exec rspec spec/reatures/*.feature'
        '''
      }
    }
  }
}

/* vim:set ft=groovy: */
