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
                dir('frontend') {
                    bat '"C:\\Program Files\\dotnet\\dotnet.exe" build frontend.csproj --configuration Release'
                }
            }
        }
        stage('Test') {
            steps {
                dir('frontend') {
                    bat '"C:\\Program Files\\dotnet\\dotnet.exe" test'
                }
            }
        }
        stage('Security') {
    steps {
        dir('frontend') {
            snykSecurity(
                snykInstallation: 'snyk',
                monitorProjectOnBuild: true,
                failOnIssues: true
            )
        }
    }
}
