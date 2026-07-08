# IntelliNotify - Website Monitoring System

Automated website monitoring with ML-based change detection.

## 🚀 Quick Start

### Start Everything with Docker

```bash
docker-compose up -d
```

**Access:**
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- API Docs: http://localhost:8000/docs

### Manual Start (Development)

**Terminal 1 - Backend:**
```bash
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
python -c "import nltk; nltk.download('punkt'); nltk.download('stopwords')"
uvicorn src.main:app --reload
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm install
npm run dev
```

**Terminal 3 - Database:**
```bash
# Make sure PostgreSQL is running
# Create database: intellinotify
psql intellinotify < backend/config/schema.sql
```

## ✅ What Works

- ✅ Add/edit/delete websites
- ✅ Automatic monitoring on schedule
- ✅ Sentence-level change detection
- ✅ ML classification (Random Forest)
- ✅ Priority assignment (HIGH/MEDIUM/LOW)
- ✅ Notifications
- ✅ Dashboard with statistics
- ✅ Full REST API

## 🧪 Test It

```powershell
# Check backend health
Invoke-WebRequest http://localhost:8000/health

# Add a website
$body = @{url="https://example.com"; monitoring_interval=3600} | ConvertTo-Json
Invoke-WebRequest -Uri http://localhost:8000/api/websites -Method POST -Body $body -ContentType "application/json"

# Open frontend
start http://localhost:3000
```

## 📁 Project Structure

```
intellinotify/
├── backend/              # Python FastAPI backend
│   ├── src/
│   │   ├── api/         # REST endpoints
│   │   ├── core/        # Monitoring pipeline
│   │   ├── models/      # Database models
│   │   └── main.py      # App entry point
│   └── requirements.txt
├── frontend/            # React TypeScript frontend
│   ├── src/
│   │   ├── pages/       # Dashboard, Websites, Changes, Notifications
│   │   ├── services/    # API client
│   │   └── components/  # UI components
│   └── package.json
└── docker-compose.yml   # Full stack setup
```

## 🔧 Configuration

**Backend:** `backend/.env`
```
DATABASE_URL=postgresql://intellinotify:password@localhost:5432/intellinotify
```

**Frontend:** Automatically proxies to backend via Vite

## 📚 Spec Files

Your complete specification is in `.kiro/specs/intellinotify-system/`:
- `requirements.md` - What the system should do
- `design.md` - How it's built
- `tasks.md` - Implementation checklist

## 🐛 Troubleshooting

**Backend won't start:**
```bash
docker logs intellinotify-backend
```

**Frontend won't start:**
```bash
cd frontend
rm -rf node_modules
npm install
```

**Database issues:**
```bash
docker-compose down -v
docker-compose up -d
```

## 🎯 Next Steps

1. Add authentication (JWT)
2. Implement WebSocket for real-time updates
3. Write property-based tests
4. Add Redis caching

That's it! Your system is ready to use.
