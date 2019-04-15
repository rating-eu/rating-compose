#!/usr/bin/env groovy

/*
 * Copyright 2019 HERMENEUT Consortium
 *  
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *  
 *     http://www.apache.org/licenses/LICENSE-2.0
 *  
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

node {
    environment {
        PATH = '/usr/local/bin:$PATH'
    }

    stage('checkout') {
        checkout scm
    }

    gitlabCommitStatus(name: 'deploy') {
        stage('docker-compose stop') {
            docker.withRegistry('https://dev-hermeneut.eng.it', 'docker-registry-login') {
                withEnv(["PATH+LOCAL=/usr/local/bin"]) {
                    sh "docker-compose stop"
                }
            }
        }

        stage('docker-compose pull') {
            docker.withRegistry('https://dev-hermeneut.eng.it', 'docker-registry-login') {
                withEnv(["PATH+LOCAL=/usr/local/bin"]) {
                    sh "docker-compose pull"
                }
            }
        }

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
