#!/usr/bin/env groovy

node {
    environment {
        PATH = '/usr/local/bin:$PATH'
    }

    stage('checkout') {
        checkout scm
    }

    gitlabCommitStatus(name: 'deploy') {
        stage('docker-compose up') {
            docker.withRegistry('https://dev-hermeneut.eng.it', 'docker-registry-login') {
                withEnv(["PATH+LOCAL=/usr/local/bin"]) {
                    sh "docker-compose up -d"
                }
            }
        }
    }

    stage('remove dangling images') {
        sh "docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi -f"
    }
}
