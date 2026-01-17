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
                snykTokenId: 'snyk-token',
                monitorProjectOnBuild: true,
                failOnIssues: true
            )
        }
    }
        }
        stage('Package (Publish + ZIP)') {
            steps {
                dir('frontend') {
                    powershell '''
                    if (Test-Path out) { Remove-Item out -Recurse -Force }
                    if (Test-Path artifact.zip) { Remove-Item artifact.zip -Force }
                    & "C:\\Program Files\\dotnet\\dotnet.exe" publish frontend.csproj -c Release -o out
                    Compress-Archive -Path out\\* -DestinationPath artifact.zip -Force
                    '''
                }
            }
        }
    }
        post {
            success {
                archiveArtifacts artifacts: 'frontend/artifact.zip', fingerprint: true
            }
        }
}
