pipeline {
    environment {
        PROJECT_NAME = "frontend"
        ECR_URL = "533048508039.dkr.ecr.ap-southeast-1.amazonaws.com"
        ECR_CREDENTIALS = "ecr:ap-southeast-1:aws-credentitals"
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

        // stage('Docker') {
        //     agent any
            
        //     stages {
        //         stage('Docker Build') {
        //             agent any
        //             steps {
        //                 script {
        //                     dockerImage = docker.build("$PROJECT_NAME:$GIT_COMMIT")
        //                 }
        //             }
        //         }

        //         stage('Docker Push') {
        //             agent any
        //             steps {
        //                 script {
        //                     docker.withRegistry("https://$ECR_URL", ECR_CREDENTIALS) {
        //                         dockerImage.push("$GIT_COMMIT")
        //                     }
        //                 }
        //             }
        //         }

        //         stage('Docker Cleanup') {
        //             agent any
        //             steps {
        //                 sh "docker rmi $dockerImage.id $ECR_URL/$PROJECT_NAME:$GIT_COMMIT"
        //             }
        //         }
        //     }
        // }

        stage('Kubernetes') {
            agent any
            steps {
                script {
                    withKubeConfig([credentialsId: 'eks-token', serverUrl: 'https://F727499AF91B92E96CC734770141E1E6.sk1.ap-southeast-1.eks.amazonaws.com']) {
                        sh 'kubectl apply -f deployment.yaml'
                    }
                }
            }
        }
    }
}
