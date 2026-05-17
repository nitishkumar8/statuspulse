docker compose up -d

---

# 5. Production Deployment

````markdown id="q9w4xn"
## Production Deployment

````bash
./scripts/deploy.sh



---

# 6. CI/CD

```markdown id="j6m2pk"
## CI/CD Pipeline

- GitHub Actions used
- CI checks run automatically
- Deploy pipeline deploys to EC2 server


## Monitoring & Alerting

- Uptime Kuma monitoring
- Telegram alerts
- ntfy alerts
- Health monitoring cron job

## Backup & Restore

### Backup

```bash
./scripts/backup.sh
````
````
