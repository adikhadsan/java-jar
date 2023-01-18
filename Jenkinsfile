pipeline{
    agent any
     environment {
		DOCKERHUB_CREDENTIALS = credentials('DockerHub')
	}
    stages {
	  /*  stage('name'){
		    steps {
			    
			    sh'echo $JOB_NAME'
	                  //  sh'job=${JOB_NAME}'
	                 //   sh'echo $job'
		    }
	    }*/
    
    
        
      /*  stage('maven location') {
             steps {
            
                sh'''
                  pwd
                  cd /var/lib/jenkins/workspace/${JOB_NAME}/demo
                  ls
                  mvn clean
                  mvn install
              
              
                  '''
             }
         }*/
	
	stage('	Copy War file'){
	     steps{
		 sh'pwd'    
		 sh'cp /var/lib/jenkins/workspace/$JOB_NAME/demo/target/*.war .'
		 sh'ls'    
		// sh 'docker build -t spring-img --build-arg dokcerjob=$JOB_NAME .'
	     }
	 } 	    
	
	    
	
	
	 stage('docker build'){
	     steps{
		 sh'docker build -t 8485012281/spring-img .'
		// sh 'docker build -t spring-img --build-arg dokcerjob=$JOB_NAME .'
	     }
	 } 
	 stage('image check'){
	     steps{
		 sh'sleep 30'
		 sh'docker images'
	     }
	 }
	 stage('docker login'){
	     steps{

		sh 'echo $DOCKERHUB_CREDENTIALS_USR'
		sh 'echo $DOCKERHUB_CREDENTIALS_PSW'
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
	     }
	 } 
	 stage('docker push'){
	     steps{
		 sh 'docker push 8485012281/spring-img'
	     }
	 }
	 stage('docker run'){
	     steps{
		 sh 'docker run -d -p 9191:8080 --name spring-container 8485012281/spring-img'
		 sh 'sleep 30'
		 sh 'docker ps'
	     }
	 }
    }
}
	
