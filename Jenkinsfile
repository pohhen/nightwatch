#!groovy

node {
    properties([[$class: 'BuildDiscarderProperty'],
        pipelineTriggers([cron('H * * * *')])])
    timestamps {
        timeout(20) {  // Timeout build after 20 minuts, don't leave me hanging!
            stage('Git checkout') {
                checkout scm
            }
            stage('NPM') {
                sh 'npm install'
            }
            stage('Sonar') {
                sh 'npm run sonar'
            }
        }
    }
}