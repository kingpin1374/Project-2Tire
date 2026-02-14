/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        stage('clone repo') {
            steps {
                git branch: 'master', url: 'https://github.com/kingpin1374/Project-2Tire.git', credentialsId: 'github'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t flask-app:latest .'
            }
        }
        stage('Deploy with docker-compose') {
            steps {
                 sh '''
                    # Install docker-compose if not exists
                    if ! command -v docker-compose &> /dev/null; then
                        curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        chmod +x /usr/local/bin/docker-compose
                    fi
                    docker-compose down || true
                    docker-compose up -d --build
                '''
            }
        }
    }
}
