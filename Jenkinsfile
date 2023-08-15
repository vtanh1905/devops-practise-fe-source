pipeline {
    environment {
        PROJECT_NAME = "frontend"
    } 
    agent none

    stages {
        stage('Main') {
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

                stage ('Test') {
                    steps {
                        sh 'echo Testing Step'
                    }
                }
            }
        }

        stage('Docker') {
            agent any
            stages {
                stage('Docker Build') {
                    steps {
                        script {
                            dockerImage = docker.build("$PROJECT_NAME:$GIT_COMMIT")
                        }
                    }
                }

                stage('Docker Push') {
                    steps {
                        script {
                            docker.withRegistry("https://$ECR_URL/$PROJECT_NAME", ECR_CREDENTIALS) {
                                dockerImage.push("$GIT_COMMIT")
                            }
                        }
                    }
                }

                stage('Docker Cleanup') {
                    steps {
                        sh "docker rmi $dockerImage.id $ECR_URL/$PROJECT_NAME:$GIT_COMMIT"
                    }
                }
            }
        }
    }
}
