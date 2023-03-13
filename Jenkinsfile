node {
    stage ('Git Checkout') {
        git 'https://github.com/ajith798/helloworld.git'
    }
    
    stage ('Maven Build') {
        def mvnHome =  tool name: 'maven3', type: 'maven'   
        sh "${mvnHome}/bin/mvn clean package"
	    sh 'mv target/helloworld*.jar target/app.jar'
    }
    
    stage('Build Docker Imager'){
        sh 'docker build -t ajith798/app .'
    }
    
    stage('Docker Image Push'){
        withCredentials([string(credentialsId: 'pass', variable: 'dockerPassword')]) {
        sh "docker login -u ajith798 -p ${dockerPassword}"
    }
        sh 'docker push ajith798/app'
    }
    
    stage('Deploy') {
        sh 'kubectl apply -f /var/lib/jenkins/workspace/Project/pod.yaml'
    }
}
