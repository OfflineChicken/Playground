pipeline {
    agent any

	stages {
		stage ('Checkout') {
			steps {
				echo 'Checkout..'
				checkout scm
			}
		}
		stage ('Build') {
			steps {
				echo 'Build..'
				sh "docker build -t sampledockerapp:B${BUILD_NUMBER} -f Dockerfile ."
			}
		}
		stage ('Compose') {
			steps {
				echo 'Integration Test..'
				sh "docker-compose -f docker-compose.yml up --force-recreate --abort-on-container-exit"
				sh "docker-compose -f docker-compose.yml down -v"
			}		
		}
    }
}