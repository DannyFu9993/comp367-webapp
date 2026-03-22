pipeline {
    agent any
    
    tools {
        maven 'Maven'
    }
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('CredentialID_DockerHubPWD')
        DOCKER_IMAGE = 'dannyfu9993/comp367-webapp'
    }
    
    stages {
        stage('Check out') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'main',
                    url: 'https://github.com/DannyFu9993/comp367-webapp.git'
            }
        }
        
        stage('Build maven project') {
            steps {
                echo 'Building with Maven...'
                bat 'mvn clean install'
            }
        }
        
        stage('Docker login') {
            steps {
                echo 'Logging into Docker Hub...'
                bat 'docker login -u %DOCKERHUB_CREDENTIALS_USR% -p %DOCKERHUB_CREDENTIALS_PSW%'
            }
        }
        
        stage('Docker build') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %DOCKER_IMAGE%:1.0 .'
            }
        }
        
        stage('Docker push') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                bat 'docker push %DOCKER_IMAGE%:1.0'
            }
        }
    }
    
    post {
        always {
            bat 'docker logout'
        }
        success {
            echo 'Pipeline successful!'
            archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
        failure {
            echo 'Pipeline failed. Check console output.'
        }
    }
}
