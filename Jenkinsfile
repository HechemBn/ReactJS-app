<<<<<<< HEAD
    pipeline {
        agent any

        environment {
            DOCKERHUB_CREDENTIALS = credentials('dockerhub') 
            DOCKER_IMAGE = 'hechem220/react-img'
           
        }
        
        stages {

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

            stage('Deploy with Ansible') {
               steps {
                script {
                    sh "ansible-playbook -i inventory ansible-playbook.yml"
                }
               }
        }
        

        }  
    }
=======
    pipeline {
        agent any

        environment {
            DOCKERHUB_CREDENTIALS = credentials('dockerhub') 
            DOCKER_IMAGE = 'hechem220/react-img'
           
        }
        
        stages {

        
        
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
>>>>>>> 610e1e4c7e1ad2ddea2f0debeb63f4c38b4f78c0
