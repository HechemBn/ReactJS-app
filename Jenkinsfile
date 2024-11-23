pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'hechem220/react-img'  
        KUBECONFIG = '/etc/rancher/k3s/k3s.yaml' 
        SONARQUBE_SERVER = 'sq'  
        SCANNER_HOME = tool 'sonar-scanner'
        NODE_VERSION = '16' // Spécifiez la version de Node.js requise
    }

    stages {
     stage('Install Node.js') {
    steps {
        script {
            sh '''
            # Télécharger et installer nvm
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \\. "$NVM_DIR/nvm.sh"
            
            # Installer la version souhaitée de Node.js
            nvm install 16
            nvm use 16
            
            # Vérification
            node -v
            npm -v
            '''
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

        stage("Sonarqube Analysis") {
            steps {
                withSonarQubeEnv('sq') {
                    sh '''
                    $SCANNER_HOME/bin/sonar-scanner \
                    -Dsonar.projectKey=jenkins \
                    -Dsonar.sources=src \
                    -Dsonar.projectKey=jenkins
                    '''
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
