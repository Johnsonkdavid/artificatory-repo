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

        app = docker.build("demo")
    }

    stage('Push image') {
        docker.withRegistry('https://260450533524.dkr.ecr.us-east-1.amazonaws.com/demo', 'ecr:us-east-1:ecr-id') {
            app.push("latest")
        }
    }
    stage('Cleaning up') {
    	sh 'docker rmi demo'
    	}	
}
