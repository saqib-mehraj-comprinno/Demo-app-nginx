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
    script { 
apt-get update 
apt install curl
curl --version
apt-get install zip -y
echo $PATH
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
./aws/install
/usr/local/bin/aws --version
aws eks --region ap-south-1  update-kubeconfig --name klub-dev-mb-eks-cluster      
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
ls -ltr
pwd
chmod +x kubectl
ls
/home/jenkins/agent/workspace/check/kubectl --help
    }
   
  }
}
