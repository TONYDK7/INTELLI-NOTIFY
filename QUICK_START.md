# Quick Start Guide

## Start the System

**Option 1: Double-click `START.bat`** (Easiest)

**Option 2: Command line**
```bash
docker-compose up -d
```

## Access the Application

1. Open browser: **http://localhost:3000**
2. You'll see the Dashboard

## Use the System

### Add a Website
1. Click "Websites" in sidebar
2. Click "Add Website" button
3. Enter URL (e.g., https://example.com)
4. Choose monitoring interval
5. Click "Add Website"

### View Changes
1. Click "Changes" in sidebar
2. See all detected changes
3. Filter by type (Added/Modified/Removed)

### Check Notifications
1. Click "Notifications" in sidebar
2. See all alerts
3. Filter by priority (High/Medium/Low)

## Stop the System

```bash
docker-compose down
```

## Troubleshooting

**Can't access frontend?**
- Check: http://localhost:8000/health
- If backend is down, run: `docker-compose restart backend`

**Database errors?**
```bash
docker-compose down -v
docker-compose up -d
```

That's it! You're ready to monitor websites.
