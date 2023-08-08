pipeline {
    agent {
        docker {
            image 'node:18-alpine3.17'
            args '-u root'
        }
    }
    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'echo Testing Step'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    app = docker.build('devops-practise-fe-source')
                }
            }
        }
    }
}

