pipeline {
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
                    dockerImage = docker.build "frontend:lastest"
                }
            }
        }

        stage('Docker Push') {
            agent any
            steps {
                script {
                    docker.withRegistry('https://533048508039.dkr.ecr.ap-southeast-1.amazonaws.com', 'ecr:ap-southeast-1:499f3c66-724a-437b-a12a-d5e832de6631') {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}
