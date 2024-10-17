  pipeline {



        agent any



        stages {



                stage('Build') {



                        steps {



                        sh '''



                        cd "${JENKINS_HOME}/workspace/pipline.py"



                        docker build -t appx:v${BUILD_NUMBER} .



                        '''



              		}



                }



        	stage('Deploy-docker') {



                        steps {



                        sh '''



                        docker run -d --name testappx$BUILD_NUMBER appx:v${BUILD_NUMBER} 



                        '''



                        }



                }

                

                stage('remove container testappx') {



                        steps {



                        sh '''



                        docker remove -f appx:v${BUILD_NUMBER} 



                        '''





	         stage('Deploy App On kubernetes') {

        		steps {

        	        sh '''

		  	cd Kubernetes && kubectl apply -f .

    		        echo 'App Successfully Deployed'

       			'''

                        }



                }



	}

}
