#!groovy
pipeline {
    agent none
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.8.6'
                }
            }
            steps {
                sh 'mvn clean install -U'
            }
        }
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker build -t kevinudem/spring-petclinic:latest .'
            }
        }
    }
}