    pipeline {
        agent any

        environment {
            DOCKERHUB_CREDENTIALS = credentials('dockerhub') 
            DOCKER_IMAGE = 'hechem220/react-img'
            CONTAINER_NAME = 'react-app-container'
            PORT = '3000' 
        }
        
        stages {

            stage('check') {
                steps {
                    script {
                        sh "echo ${whoami}"
                    }
                }
            }

        
            stage('Build Docker Image') {
                steps {
                    script {
                        sh "docker build -t ${DOCKER_IMAGE} ."
                    }
                }
            }

            stage('Push Docker Image') {
                steps {
                    script {
                        sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin" 
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        

        }  
    }
