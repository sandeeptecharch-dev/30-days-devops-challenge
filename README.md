# 🚀 30 Days of DevOps Challenge

**Learn → Build → Share | October 16 – November 14, 2026**

Welcome to my **30 Days of DevOps Challenge**! For 30 consecutive days, I will practice DevOps hands-on, push my work to GitHub, share a learning post on LinkedIn, and publish a short demo on YouTube.

## 🎯 Challenge Goal

Build **one continuous project**: take a simple application from source code to an **automated, monitored cloud deployment**.

**Application → GitHub → CI/CD → Docker → AWS → Kubernetes → GitOps → Monitoring & Logging**

By the end of the challenge, this repository will contain runnable examples, infrastructure code, pipeline configurations, Kubernetes manifests, monitoring setup, troubleshooting notes, and a final architecture diagram.

## 📅 Daily Routine

| Activity | Target time | Output |
|---|---:|---|
| Learn the concept | 20 min | Short notes |
| Build and test hands-on | 90 min | Working code + GitHub commit |
| Share on LinkedIn | 25 min | One simple educational post |
| Record YouTube demo | 35 min | One short practical video |
| Update tracker | 10 min | Daily status and links |
| **Total** | **3 hours** | **Build + Share** |

## 🗺️ Complete 30-Day Roadmap

Follow one continuous project: take a simple application from source code to an automated, monitored cloud deployment. This makes my GitHub and YouTube content tell one connected story.

### Week 1 — Linux, Git & Docker (Days 1–7)

| Day | Topic | Hands-on deliverable | Status |
|---|---|---|---|
| 01 | Linux commands and system information | System-health Bash script | ⬜ |
| 02 | Linux processes, users and permissions | Process and disk monitoring script | ⬜ |
| 03 | Git and GitHub workflow | Branches, commits, merges and documented repository | ⬜ |
| 04 | Networking fundamentals | DNS, HTTP, ports and connectivity test script | ⬜ |
| 05 | Docker fundamentals | Dockerize a simple Python Flask application | ⬜ |
| 06 | Docker volumes and networking | Run application with persistent storage | ⬜ |
| 07 | Docker Compose | Run application and database together | ⬜ |

### Week 2 — AWS, Terraform & CI/CD (Days 8–14)

| Day | Topic | Hands-on deliverable | Status |
|---|---|---|---|
| 08 | Dockerfile optimization | Optimized production container image | ⬜ |
| 09 | AWS VPC networking | Terraform VPC, subnets, route tables and security groups | ⬜ |
| 10 | AWS EC2 deployment | Deploy Dockerized app on EC2 | ⬜ |
| 11 | Terraform fundamentals | Provision EC2, IAM role and security group | ⬜ |
| 12 | Terraform modules | Refactor infrastructure into reusable modules | ⬜ |
| 13 | Jenkins installation | Jenkins setup with GitHub webhook | ⬜ |
| 14 | Jenkins pipeline | Automated build, test, image push and deployment | ⬜ |

### Week 3 — Kubernetes (Days 15–21)

| Day | Topic | Hands-on deliverable | Status |
|---|---|---|---|
| 15 | Kubernetes architecture | Create local cluster and inspect components | ⬜ |
| 16 | Pods and Deployments | Deploy and scale Flask application | ⬜ |
| 17 | Services and Ingress | Expose application through an Ingress controller | ⬜ |
| 18 | ConfigMaps and Secrets | Configure application without hardcoding secrets | ⬜ |
| 19 | PV, PVC and StorageClass | Run database with persistent storage | ⬜ |
| 20 | HPA and health probes | Configure autoscaling and readiness/liveness probes | ⬜ |
| 21 | RBAC and ServiceAccounts | Configure least-privilege access | ⬜ |

### Week 4 — Production DevOps (Days 22–30)

| Day | Topic | Hands-on deliverable | Status |
|---|---|---|---|
| 22 | Helm charts | Package application with Helm | ⬜ |
| 23 | GitHub Actions | Build and push Docker image using CI | ⬜ |
| 24 | Argo CD and GitOps | Sync cluster state from GitHub | ⬜ |
| 25 | Prometheus | Collect application and cluster metrics | ⬜ |
| 26 | Grafana | Build metrics dashboards | ⬜ |
| 27 | Centralized logging | Set up Fluent Bit + Loki or Filebeat + Elasticsearch | ⬜ |
| 28 | DevOps security | Add image scanning, secret checks and least-privilege controls | ⬜ |
| 29 | End-to-end integration | Test CI/CD, GitOps, monitoring and logging | ⬜ |
| 30 | Final project demonstration | Publish final architecture, documentation and demo | ⬜ |

> **Note:** The project starts locally. AWS deployment is introduced in Week 2, while Kubernetes can initially run on kind or minikube. A managed Kubernetes cloud deployment is optional and depends on budget.

## 📁 Repository Structure

```text
30-days-devops-challenge/
├── README.md
├── progress.md
├── application/              # Reusable Flask application
├── day-01-linux/
├── day-02-linux-monitoring/
├── day-03-git/
├── ...
├── day-30-final-project/
└── final-architecture/
    └── architecture.png
```

Each day’s directory will contain a `README.md`, scripts/configuration used, commands, test evidence, and any troubleshooting notes. Shared application source code stays in `application/` so improvements build on previous days.

## ✅ Daily Definition of Done

- [ ] Learn the day's core concept.
- [ ] Write or update working code/configuration.
- [ ] Test the changes and push a GitHub commit.
- [ ] Publish a LinkedIn explanation.
- [ ] Publish a short YouTube demonstration.
- [ ] Update `progress.md` with links and lessons learned.

On a very busy day, use a **30-minute minimum**: make one meaningful improvement, commit it, publish a short post/video update, and document the next step. Be transparent if a lab is incomplete.

## 📝 Daily Documentation Template

```markdown
# Day XX — Topic

## What I learned

## Why this matters in production

## Tools and commands used

## Hands-on implementation

## How to run and test

## Issues faced and fixes

## Links
- GitHub: 
- LinkedIn: 
- YouTube: 
```

## 🏁 Success Criteria

- **30 days** of consistent practical DevOps learning
- **30 GitHub contributions** with readable documentation
- **30 LinkedIn posts** explaining the concepts simply
- **30 YouTube demonstrations** showing practical work
- **1 integrated DevOps portfolio project** with CI/CD, Kubernetes, GitOps, logging and monitoring

## 🔐 Security & Cost Notes

Never commit `.env` files, credentials, tokens, private keys or Terraform state files. Use environment variables and appropriate secret management. Set AWS billing alerts and remove temporary resources after labs.

---

**My challenge rule:** Never finish a day with only learning. Finish with something built, committed and explained.

#DevOps #30DaysOfDevOps #LearningInPublic #Docker #Kubernetes #AWS #Terraform #CICD
