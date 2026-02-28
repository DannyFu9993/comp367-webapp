pipeline {
    agent any
    
    tools {
        maven 'Maven'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'main',
                    url: 'https://github.com/DannyFu9993/comp367-webapp.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building with Maven...'
                bat 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                echo 'Packaging application...'
                bat 'mvn package'
            }
        }
    }
    
    post {
        success {
            echo 'Build successful!'
            archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
        failure {
            echo 'Build failed. Check console output.'
        }
    }
}