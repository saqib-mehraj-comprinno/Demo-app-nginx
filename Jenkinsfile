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
      sh 'kubectl apply -f k8nginx.yaml -n test' 
  }
}
