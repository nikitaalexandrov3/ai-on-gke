---
linkTitle: "Models as OCI"
title: "Models as OCI"
description: "This project allows you to download a Hugging Face model and package it as a Docker image. The Docker image can then be pushed to Google Artifact Registry for deployment or distribution. Build time can be significant for large models, it is recommended to not exceed models above 10 billion parameters. For reference 8b model roughly takes 35 minutes to build and push with this cloudbuild config."
weight: 30
type: docs
---
{{% include "tutorials-and-examples/models-as-oci/README.md" %}}
