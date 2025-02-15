pipeline {
    agent any

    environment {
        IMAGE_NAME = "pravalika964/pjt"
        CONTAINER_NAME = "vigorous_kepler"
        PORT = "8085"
    }

    stages {
         stage('Clean Up') {
            steps {
                script {
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                    sh "docker rmi ${IMAGE_NAME} || true"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build --no-cache -t ${IMAGE_NAME} .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:80 ${IMAGE_NAME}"
                    
                    sleep 10  // Allow time for the container to start
                }
            }
        }


        stage('Push Image to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'DockeHub', url: '']) {  // Use your Docker Hub credentials ID
                    sh "docker tag ${IMAGE_NAME} ${IMAGE_NAME}:latest"
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }

       
    }

    
}
