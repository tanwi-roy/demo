pipeline {
    agent any

    stages {

        stage('Set Permissions') {
                    steps {
                        sh 'chmod +x ./gradlew'
                    }
                }
        stage('Build') {
            steps {
                script {
                    sh './gradlew build'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("demo:${env.BUILD_NUMBER}")
                }
            }
        }
//         stage('Push Docker Image') {
//             steps {
//                 script {
//                     docker.withRegistry('https://index.docker.io/v1/', '') {
//                        // sh "docker login -u ${env.DOCKERHUB_USERNAME} -p ${env.DOCKERHUB_PASSWORD}"
//                         def app = docker.build("demo:${env.BUILD_NUMBER}")
//                         app.push()
//                     }
//                 }
//             }
//         }
//         stage('Terraform Init and Apply') {
//             steps {
//                 script {
//                     sh 'terraform init'
//                     sh 'terraform apply -auto-approve'
//                 }
//             }
//         }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Deployment successful.'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}