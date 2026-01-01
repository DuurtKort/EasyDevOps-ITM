pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Build EasyDevOps project'
                dir ('frontend') {
                    bat 'dotnet build frontend.sln --configuration Release'
                }
            }
        }
        stage('Test') {
            steps {
                dir ('frontend') {
                    bat 'dotnet test'
                }
            }
        }
    }
}
