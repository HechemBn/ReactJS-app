pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub') 
        DOCKER_IMAGE = 'hechem220/react-img'
        CONTAINER_NAME = 'react-app-container'
        PORT = '3000' 
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
         stage('Run Docker Container') {
            steps {
                script {
                    sh "echo docker run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${DOCKER_IMAGE}"
                }
            }
        }

    }  
}
