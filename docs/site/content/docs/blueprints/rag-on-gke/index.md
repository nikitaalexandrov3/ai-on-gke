---
linkTitle: "RAG on GKE"
title: "RAG on GKE"
description: "This tutorial demonstrates how to deploy a Retrieval Augmented Generation (RAG) application on Google Kubernetes Engine (GKE), integrating a Hugging Face TGI inference server, a Cloud SQL pgvector database, and a Ray cluster for generating vector embeddings. It walks you through setting up the infrastructure with Terraform, populating the vector database with embeddings from a sample dataset using a Jupyter notebook, and launching a frontend chat interface. The guide also covers optional configurations like using your own cluster or VPC, enabling authenticated access via IAP, and troubleshooting common issues."
weight: 30
type: docs
tags: 
    - RAG on GKE
    - GKE AI Labs
---
{{% include "applications/rag/README.md" %}}

