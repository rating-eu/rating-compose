#!/usr/bin/env groovy

node {
    stage('checkout') {
        checkout scm
    }

    gitlabCommitStatus(name: 'deploy') {
        stage('docker-compose up') {
            sh "docker-compose up -d"
        }
    }
}
