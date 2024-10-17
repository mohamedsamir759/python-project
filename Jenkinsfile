pipeline {

        agent any

        stages {

                stage('Clone') {

                        steps {

                        git branch: 'main'

                        url: 'https://github.com/mohamedsamir759/python-project.git'

                        }

                }

                stage('Build') {

                        steps {

                        sh '''

                        cd "${JENKINS_HOME}/workspace/myjob1"

                        docker build -t appx:v${BUILD_NUMBER} .

                        '''

                }

                }

                stage('Deploy-docker') {

                        steps {

                        sh '''

                        docker run -d --name testappx -p 80:8080 appx:v${BUILD_NUMBER} 

                        '''

                        }

                }

             
	        stage('Remove Container') {

                        steps{

             	        sh ''' 
	                docker rm -f testappx$BUILD_NUMBER
			docker run -d --name testappx%{BUILD_NUMBER} -p 80:8080 appx:v${BUILD_NUMBER}			
           	        echo 'Docker Container Successfully Removed'
			   '''
		 	}

 		}             
    

	        stage('Deploy App On KuberNetes') {

        	        steps{
	
        	        sh '''
		 	cd kubernetes && kubectl apply -f .

            }

            post {

                success {

                    echo 'App Successfully Deployed'

                }

            }

        }

    }

}

           
