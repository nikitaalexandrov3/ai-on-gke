resource "google_app_engine_application" "app" {
  project     = var.project_id
  location_id = var.app_location
}

resource "google_service_account" "service_account" {
  project      = var.project_id
  account_id   = var.service_account_name
  display_name = "Service Account for AI on GKE docs app"
}

resource "google_project_iam_member" "gae_api" {
  project = google_service_account.service_account.project
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "storage_viewer" {
  project = google_service_account.service_account.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}


resource "google_storage_bucket" "bucket" {
  project                     = var.project_id
  name                        = var.bucket_name
  uniform_bucket_level_access = true
  force_destroy               = true
  location                    = "US"
}

data "archive_file" "source_archive" {
  type        = "zip"
  source_dir  = "${path.module}/../site/public/"
  output_path = "${path.module}/../source.zip"
}

resource "google_storage_bucket_object" "object" {
  name   = "source.zip"
  bucket = google_storage_bucket.bucket.name
  source = "${path.module}/../source.zip"
}

resource "google_app_engine_standard_app_version" "myapp_v1" {
  project    = var.project_id
  version_id = "v1"
  service    = "akamalov-test"
  runtime    = "python39"

  entrypoint {
    shell = ""
  }


  handlers {
    url_regex = "/$"
    static_files {
      path              = "index.html"
      upload_path_regex = "index.html"
    }
  }

  handlers {
    url_regex = "/(.*)/$"
    static_files {
      path              = "\\1/index.html"
      upload_path_regex = ".*/index.html"
    }
  }

  handlers {
    url_regex = "/"
    static_files {
      path              = "."
      upload_path_regex = "."
    }
    security_level = "SECURE_ALWAYS"
  }

  handlers {
    url_regex      = "/.*"
    security_level = "SECURE_ALWAYS"
    script {
      script_path = "auto"
    }
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }


  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 1
    max_idle_instances      = 3
    min_pending_latency     = "1s"
    max_pending_latency     = "5s"
    standard_scheduler_settings {
      target_cpu_utilization        = 0.5
      target_throughput_utilization = 0.75
      min_instances                 = 2
      max_instances                 = 10
    }
  }

  delete_service_on_destroy = true
  service_account           = google_service_account.service_account.email
}
