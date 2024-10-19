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
            stage('Login to DockerHub') {
                steps {
                    script {
                        sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin" 
                    }
                }
            }
            stage('Push Docker Image to DockerHub') {
                steps {
                    script {
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
            stage('Deploy with Ansible') {
               steps {
                script {
                    sh "ansible-playbook -i /etc/ansible/inventory ansible-playbook.yml"
                }
               }
        }
       
        }  
    }



+
