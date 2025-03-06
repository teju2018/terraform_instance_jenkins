provider "google" {
    credentials = file("GCP_JSON_KEY")
    project = "paul2018"
    region = "us-central1"
    zone = "us-central1-a"

  
}
resource "google_compute_instance" "my_instance" {
    name = "paul-vm1"
    machine_type = "e2-micro"
    zone = "us-central1-a"
    boot_disk {
      initialize_params {
        image = "centos-stream-9"
      }
    
    }
    network_interface {
        network = "default"
      access_config {
        
      }
    }
}
