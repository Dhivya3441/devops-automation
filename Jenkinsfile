pipeline {
    agent any
    tools{
         mvnHome = tool 'Maven_Home'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Dhivya3441/devops-automation']]])
                sh 'clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t hai/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u dhivya26 -p ${dockerhubpwd}'

}
                   sh 'docker push dhivya26/devops-integration'
                }
            }
        }
       
    }
}
