pipeline {
  agent any
  tools {
    // Must match the name you set under Manage Jenkins → Global Tool Configuration
    maven 'Maven 3.8.7'
  }
  stages {
    stage('Compile') {
      steps {
        // Pull the code from GitHub
        checkout scm
        // Run Maven compile
        sh 'mvn clean compile'
      }
    }
    stage('Test') {
      steps {
        // Run your unit tests
        sh 'mvn test'
      }
    }
    stage('Package') {
      steps {
        // Build the WAR
        sh 'mvn package'
        // Tell Jenkins to keep the artifact for later retrieval
        archiveArtifacts artifacts: 'target/*.war', fingerprint: true
      }
    }
  }
  post {
    success {
      echo 'All stages passed!'
    }
    failure {
      echo 'One or more stages failed.'
    }
  }
}
