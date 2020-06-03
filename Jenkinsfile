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
            docker.image('demo').push("${env.BUILD_NUMBER}")
            docker.image('demo').push("latest")
        }
    }
    stage('Cleaning up') {
        sh 'docker rmi demo:latest'
        }

    stage('SSH into deployment server'){
        sshagent(credentials : ['ssh-creds']) {
        sh 'ssh -t -t root@100.26.178.221 -o StrictHostKeyChecking=no "/bin/bash < /var/lib/jenkins/workspace/ecr-pipeline/package.sh"'
        }       
    }
}
