provider "kubernetes" {
    config_context_cluster   = "minikube"
}
resource "kubernetes_replication_controller" "example2" {
  metadata {
    name = "terraform-wordpress-rc"
    
  }

  spec {
    replicas = 1
    selector = {
      app = "wordpress"
    }
    template {
      metadata {
        labels = {
          app = "wordpress"
        }
        
      }

      spec {
        container {
          image = "wordpress:4.8-apache"
          name  = "mywordpress-con"
          
         }   
        }
    }   
  }
}
resource "kubernetes_service" "example3" {
  metadata {
    name = "terraform-service"
  }
  spec {
    selector = {
      app = "wordpress"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
    }

    type = "NodePort"
  }
}
    
            
            