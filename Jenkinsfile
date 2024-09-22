pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') 
        DOCKER_IMAGE = 'hechem220/react-app:latest'
    }
    
    stages {

      
        stage('Build Docker Image') {
            steps {
                script {
                    sh "echo docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin" 
                    sh "echo docker push ${DOCKER_IMAGE}"
                }
            }
        }

    }  
}
