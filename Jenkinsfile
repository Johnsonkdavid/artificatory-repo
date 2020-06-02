node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
        sh 'echo "checkout passed"'
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("demo:${env.BUILD_NUMBER}")
    }

    stage('Push image') {
        docker.withRegistry('https://260450533524.dkr.ecr.us-east-1.amazonaws.com/demo', 'ecr:us-east-1:ecr-id') {
            docker.image('demo').push("${env.BUILD_NUMBER}")
            docker.image('demo').push("latest")
        }
    }
    stage('Cleaning up') {
    	sh 'docker rmi demo:latest'
    	}	
}
