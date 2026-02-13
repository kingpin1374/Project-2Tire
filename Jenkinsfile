/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    triggers {
        githubPush()
    }
    stages {
        stage('clone repo') {
            steps {
                git branch: 'main', url: 'https://github.com/kingpin1374/Project-2Tire.git', credentialsId: 'github'
            }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t flask-app:latest .'
            }
        }
        stage('Deploy with docker-compose') {
            steps {
                sh 'docker-compose down || true '
                sh 'docker-compose up -d --build'
            }
        }
    }
}
