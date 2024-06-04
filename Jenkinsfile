pipeline {
    agent any

    environment {
             DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
            DOCKER_IMAGE = 'tanwi12docker/spring-app'
         }

    stages {

        stage('Set Permissions') {
                    steps {
                        sh 'chmod +x ./gradlew'
                    }
                }
        stage('Build') {
            steps {
                script {
                    sh './gradlew bootJar'
                    sh 'pwd'
                    sh 'ls'
                    sh 'ls build'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                   // def app = docker.build("demo:${env.BUILD_NUMBER}")
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push Docker Image') {
                    steps {
                        script {
                            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                            sh 'docker push $DOCKER_IMAGE'
                        }
                    }
                }

        stage('Run Docker Image') {
                    steps {
                        script {
                            sh 'docker run -d $DOCKER_IMAGE'
                        }
                    }
                }
//           stage('Run jar') {
//             steps {
//                 sh 'cd build/libs'
//                 sh 'ls build/libs'
//                 sh 'java -jar build/libs/demo.jar'
//             }
//         }


//         stage('Push Docker Image') {
//             steps {
//                 script {
//                     docker.withRegistry('https://index.docker.io/v1/', '') {
//                         sh "docker login -u ${env.DOCKERHUB_USERNAME} -p ${env.DOCKERHUB_PASSWORD}"
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