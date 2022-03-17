node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'sonarQube';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
  stage("Quality Gate"){
    timeout(time: 1, unit: 'MINUTES') {
        def qg = waitForQualityGate()
        if (qg.status != 'OK') {
            abortPipeline: true
            error "Pipeline aborted due to quality gate failure: ${qg.status}"
        }
    }
  }
  stage('build') {
    echo 'Deploying'
     sh 'apt-get update'
      sh 'apt install curl'
      sh '--version'
      sh 'apt-get install zip -y'
      sh 'echo $PATH'
      sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" '
      sh 'unzip -o awscliv2.zip'
      sh './aws/install'
       sh '/usr/local/bin/aws --version'
       sh '/aws eks --region ap-south-1  update-kubeconfig --name klub-dev-mb-eks-cluster '     
       sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" '
       sh 'ls -ltr'
       sh 'pwd'
       sh'chmod +x kubectl' 
      sh '/home/jenkins/agent/workspace/sonarqube/kubectl --help'
    }
}
