pipeline {
	agent any

	environment {
        DOCKER_REGISTRY = "https://hub.docker.com/repositories/nidhikashyap18"
        DOCKER_CREDENTIAL_ID = 'dockerhub_id'
        DOCKER_IMAGE_NAME = 'nidhikashyap18/pipeline-image2'
    }
	
	stages {
	    stage('Checkout') {
	        steps {
			checkout scm			       
		      }}
		stage('Build') {
	           steps {
			  sh '/home/nidhi/Documents/Devops_Software/apache-maven-3.9.3/bin/mvn install'
	                 }}
		stage('Deployment'){
		    steps {
			sh 'cp target/project3.war /home/nidhi/Documents/Devops_Software/apache-tomcat-9.0.76/webapps'

			}}
			stage('Docker build'){
		    steps {
			sh 'docker build -t nidhikashyap18/pipeline-image2 .'
			}}
			stage('Container creation'){
		    steps {
			sh 'docker run -it -d --name=con-pipeline2 nidhikashyap18/pipeline-image2 /bin/bash'
			}}
			stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIAL_ID) {
                        def customImage = docker.build(DOCKER_IMAGE_NAME)
                        customImage.push()
                    }
                }
            }
        }	

}}
