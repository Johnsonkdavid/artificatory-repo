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

        app = docker.build("php-registery")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry("https://974834890433.dkr.ecr.us-east-1.amazonaws.com/php-registery","ecr:us-east-1:ECR-credentials") {
            app.docker.image('php-registery').push('latest')
        }
    }
}
