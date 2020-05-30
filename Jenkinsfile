node {
  stage 'Checkout'
  git 'ssh://git@github.com:Johnsonkdavid/artificatory-repo.git'
 
  stage 'Docker build'
  docker.build('demo')
 
  stage 'Docker push'
  docker.withRegistry('https://974834890433.dkr.ecr.us-east-1.amazonaws.com/php-registery', 'ecr:us-east-1:ECR-credentials') {
    docker.image('demo').push('latest')
  }
}
