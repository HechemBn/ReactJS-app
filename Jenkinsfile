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
                        docker.build("${DOCKER_IMAGE}", "./react-app")
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
