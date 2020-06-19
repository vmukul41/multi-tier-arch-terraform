provider "kubernetes" {
    config_context_cluster   = "minikube"
}
resource "kubernetes_replication_controller" "example1" {
  metadata {
    name = "terraform-db-rs"
    
  }

  spec {
    replicas = 1
    selector = {
      app = "db"
    }
    template {
      metadata {
        labels = {
          app = "db"
        }
        
      }

      spec {
        container {
          image = "mysql:5.7"
          name  = "mydb-con"
          env {
            name = "MYSQL_ROOT_PASSWORD"
            value = "redhat"
            
             }
             env {
            name= "MYSQL_USER"
            value = "mukul"
            
             }
             env {
           name =  "MYSQL_PASSWORD"
            value = "redhat"
             }
             env {
           name = "MYSQL_DATABASE"
            value = "terraform"
            
             }
         }   
        }
    }   
  }
}
    
            
            