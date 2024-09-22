pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        DOCKER_IMAGE = 'react-app'
        DOCKER_REGISTRY = 'docker.io'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/HechemBn/ReactJS-app.git'
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}", "${DOCKERHUB_CREDENTIALS}") {
                        echo 'Logged into Docker Hub'
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }

          stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://${DOCKER_REGISTRY}", "${DOCKERHUB_CREDENTIALS}") {
                        sh "docker push ${DOCKER_IMAGE}:latest"
                    }
                }
            }
        }

        // stage('Build & push Dockerfile') {
        //     steps {
        //         sh "
        //         ansible-playbook ansible-playbook.yml
        //         "
        //     }
        // }
    } 
}
