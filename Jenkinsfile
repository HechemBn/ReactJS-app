pipeline {
    agent any
    tools {
        sonarQubeScanner 'SonarQube Scanner'  // Nom de l'installation du scanner
    }
    environment {
        DOCKER_IMAGE = 'hechem220/react-img'  
        KUBECONFIG = '/etc/rancher/k3s/k3s.yaml' 
        SONARQUBE_SERVER = 'sq'  // Nom de ton serveur SonarQube configuré dans Jenkins
    }

    stages {
        stage('SonarQube Analysis') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONARQUBE_TOKEN')]) {
                        sh """
                        sonar-scanner \
                            -Dsonar.projectKey=my-react-project \
                            -Dsonar.sources=src \
                            -Dsonar.host.url=http://localhost:9000 \
                            -Dsonar.login=${SONARQUBE_TOKEN}
                        """
                    }
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
        stage('Deploy to K3s Cluster') {
            steps {
                script {
                    sh """
                    kubectl --kubeconfig=${KUBECONFIG} apply -f deployment.yml
                    kubectl --kubeconfig=${KUBECONFIG} apply -f service.yml
                    """
                }
            }
        }
    }
}
