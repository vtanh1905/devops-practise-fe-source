pipeline {
    environment {
        PROJECT_NAME = "frontend"
        ECR_URL = "https://533048508039.dkr.ecr.ap-southeast-1.amazonaws.com"
        ECR_CREDENTIALS = "ecr:ap-southeast-1:499f3c66-724a-437b-a12a-d5e832de6631"
    } 
    agent none

    stages {
        // stage('Main') {
        //     agent {
        //         docker {
        //             image 'node:18-alpine3.17'
        //             args '-u root'
        //         }
        //     }
            
        //     stages {
        //         stage('Install') {
        //             steps {
        //                 sh 'npm install'
        //             }
        //         }

        //         stage('Build') {
        //             steps {
        //                 sh 'npm run build'
        //             }
        //         }

        //         stage ('Test') {
        //             steps {
        //                 sh 'echo Testing Step'
        //             }
        //         }
        //     }
        // }

        stage('Docker Build') {
            agent any
            steps {
                script {
                    dockerImage = docker.build("$PROJECT_NAME:$GIT_COMMIT")
                }
            }
        }

        stage('Docker push') {
            agent any
            steps {
                script {
                    docker.withRegistry(ECR_URL, ECR_CREDENTIALS) {
                        dockerImage.push("$GIT_COMMIT")
                    }
                }
            }
        }

        stage('Docker cleanup') {
            agent any
            steps {
                sh '''docker rmi \$(docker images -q --filter before=$PROJECT_NAME:$GIT_COMMIT $PROJECT_NAME)'''
            }
        }
    }
}
