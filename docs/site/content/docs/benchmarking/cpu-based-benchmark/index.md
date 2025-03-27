---
linkTitle: "CPU based benchmark"
title: "CPU based benchmark"
description: "This guide outlines the process of benchmarking a 65,000-node Google Kubernetes Engine (GKE) cluster using CPU-only machines to simulate AI workloads and evaluate the Kubernetes control plane's performance. It details how to deploy the cluster with Terraform, run diverse simulated AI workloads (including training and inference) using ClusterLoader2, and collect performance metrics to assess scalability and stability. The benchmark results, stored in the perf-tests repository, provide insights into pod state transitions, scheduling throughput, and API server latency under extreme load, allowing for a comprehensive evaluation of the control plane's capabilities."
weight: 30
type: docs
tags: 
    - GKE AI Labs
---
{{% include "benchmarks/65k-cpu-nodes-simulated-ai-benchmark.md" %}}