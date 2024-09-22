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
        
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
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
