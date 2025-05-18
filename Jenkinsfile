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
    stage('Docker Push') { // Etapa para subir (push) la imagen Docker a Docker Hub
      agent any // Puede ejecutarse en cualquier agente disponible, ya que solo ejecuta comandos CLI de Docker.
      steps {
        // 'withCredentials' es un paso proporcionado por el plugin "Credentials Binding".
        // Permite usar credenciales almacenadas de forma segura en Jenkins.
        withCredentials([usernamePassword(
                            credentialsId: 'dockerhub-credentials', // Este es el ID que le diste a tus credenciales de Docker Hub en Jenkins.
                            passwordVariable: 'Kilometraje301007*', // La contraseña se almacenará en esta variable de entorno.
                            usernameVariable: 'kevinudem' // El nombre de usuario se almacenará en esta variable de entorno.
                         )]) {
          // Iniciar sesión en Docker Hub usando las credenciales inyectadas.
          // Se usa "sh" para ejecutar comandos de shell.
          // Las variables de entorno se acceden con la sintaxis `${env.VARIABLE_NAME}` o simplemente `${VARIABLE_NAME}` dentro de comillas dobles.
          sh "docker login -u ${dockerHubUser} -p ${dockerHubPassword}"

          // Subir la imagen a Docker Hub.
          // Asegúrate de que 'shanem/spring-petclinic:latest' coincida con la etiqueta usada en la etapa 'Docker Build'
          // y que el repositorio exista en tu cuenta de Docker Hub o que tengas permisos para crearlo.
          sh 'docker push shanem/spring-petclinic:latest'
        }
      }
    }
  }
}    
