# 🌐 Browser Diagnostic Steps

## Step 1: Open the Application

1. Open your browser (Chrome, Firefox, or Edge)
2. Navigate to: **http://localhost:3000**
3. Wait 5 seconds for the page to load

## Step 2: What Do You See?

### Option A: Blank White Page
→ Go to Step 3

### Option B: Some Content But Not Complete
→ Describe what you see

### Option C: Error Message
→ Copy the error message

### Option D: Loading Forever
→ Go to Step 4

---

## Step 3: Check Browser Console (For Blank Page)

1. Press **F12** on your keyboard (or right-click → Inspect)
2. Click the **Console** tab
3. Look for RED error messages

### Common Errors and Fixes:

**Error: "Failed to fetch"**
```
Fix: Backend not responding
Run: docker-compose restart backend
```

**Error: "Cannot find module"**
```
Fix: Missing dependency
Run: docker-compose restart frontend
```

**Error: "Unexpected token"**
```
Fix: JavaScript syntax error
Check the error details
```

**Error: "CORS policy"**
```
Fix: CORS configuration issue
Backend needs to allow frontend origin
```

---

## Step 4: Check Network Tab (For Loading Issues)

1. Press **F12**
2. Click **Network** tab
3. Refresh the page (**F5**)
4. Look for:
   - Red/failed requests
   - Requests taking too long
   - 404 or 500 errors

### What to Check:
- Is `/src/main.tsx` loading? (should be 200 OK)
- Is `/api/websites` loading? (should be 200 OK)
- Are there any red (failed) requests?

---

## Step 5: Try These Quick Fixes

### Fix 1: Hard Refresh
```
Press: Ctrl + Shift + R
(or Cmd + Shift + R on Mac)
```

### Fix 2: Clear Cache
```
1. Press F12
2. Right-click the refresh button
3. Select "Empty Cache and Hard Reload"
```

### Fix 3: Try Incognito/Private Mode
```
Ctrl + Shift + N (Chrome)
Ctrl + Shift + P (Firefox)
```

### Fix 4: Try Different Browser
```
If using Chrome, try Firefox or Edge
```

### Fix 5: Check URL
```
Make sure it's: http://localhost:3000
NOT: https://localhost:3000
NOT: http://localhost:3000/
```

---

## Step 6: Restart Everything

```bash
# Stop all containers
docker-compose down

# Start again
docker-compose up -d

# Wait 10 seconds
# Then try: http://localhost:3000
```

---

## Step 7: Check If It's Actually Working

### Test 1: Can you access the API docs?
Open: **http://localhost:8000/docs**

✅ If YES: Backend is working
❌ If NO: Backend issue

### Test 2: Can you see the HTML?
Open: **http://localhost:3000**
Right-click → View Page Source

✅ If you see HTML with `<div id="root"></div>`: Frontend serving HTML
❌ If you see error: Frontend not serving

### Test 3: Can you access directly?
Open: **http://localhost:3000/src/main.tsx**

✅ If you see JavaScript code: Vite is working
❌ If 404: Vite not serving files

---

## What to Report

Please tell me:

1. **What you see:**
   - [ ] Blank white page
   - [ ] Loading spinner forever
   - [ ] Error message (what does it say?)
   - [ ] Partial content (describe it)
   - [ ] Nothing happens

2. **Browser Console (F12 → Console):**
   - [ ] No errors (all clear)
   - [ ] Red errors (copy the first error message)
   - [ ] Yellow warnings only

3. **Network Tab (F12 → Network):**
   - [ ] All requests green (200 OK)
   - [ ] Some requests red (which ones?)
   - [ ] Requests pending forever

4. **Which browser:**
   - [ ] Chrome
   - [ ] Firefox
   - [ ] Edge
   - [ ] Safari
   - [ ] Other: ___________

5. **Docker status:**
```bash
docker ps
```
Copy the output

---

## Expected Behavior

When you open http://localhost:3000, you should see:

1. **Left Sidebar** (dark background):
   - IntelliNotify logo/title
   - Menu items: Dashboard, Websites, Changes, Notifications, Settings

2. **Main Content Area**:
   - Page title at top
   - Content cards/sections
   - Data from the backend

3. **Styling**:
   - Dark theme (dark blue/gray background)
   - Purple/blue gradient buttons
   - White text
   - Modern, clean design

---

## Still Not Working?

### Nuclear Option: Complete Reset

```bash
# Stop and remove everything
docker-compose down -v

# Rebuild from scratch
docker-compose build --no-cache

# Start fresh
docker-compose up -d

# Wait 30 seconds
# Try: http://localhost:3000
```

⚠️ **Warning:** This will delete all data (websites, changes, etc.)

---

## Alternative: Use the API Directly

If the frontend won't load, you can still use the API:

### View API Documentation:
http://localhost:8000/docs

### Get Websites:
```bash
curl http://localhost:8000/api/websites
```

### Add Website:
```bash
curl -X POST http://localhost:8000/api/websites \
  -H "Content-Type: application/json" \
  -d '{"url":"https://example.com","monitoring_interval":300}'
```

---

**Remember:** The system IS running. If you can't see it, it's a browser/network issue, not a code issue.
