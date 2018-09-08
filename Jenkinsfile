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
            withEnv(["PATH+LOCAL=/usr/local/bin"]) {
                sh "docker-compose up -d"
            }
        }
    }
}
