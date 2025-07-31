# 📦 E-Commerce System

## Project Overview
This project implements a **relational database** for an **E-Commerce System** using **Supabase (PostgreSQL)** as the backend and a **Python CLI** as the frontend interface.

The system manages:
- Customers  
- Products  
- Purchases  
- Payment methods  
- Shipments  
- (Optional) Returns  

It supports **order tracking, inventory control**, and basic data analytics principles. Bonus features are added where time and functionality allow.

---

## Use Cases
- **Register/Login**  
- **Browse Products**  
- **Add Products to Cart**  
- **Make Purchases**  
- **Save Multiple Credit Cards**  
- **Track Shipments**  
- **Returns (Optional)**  

---

## Functional Requirements
- Maintain **referential integrity** across all foreign keys.  
- Ensure a **purchase can contain multiple products**.  
- Automatically **update stock** after purchases.  

---

## Non-Functional Requirements
- **Scalability** to support large numbers of users and products.  
- **Secure payment** methods.  
- **Minimal downtime**, high availability.  
- **Data backup and recovery** plans.  

---

## Tech Stack
- **Database**: Supabase (PostgreSQL)  
- **Frontend**: Python CLI  
- **ORM/API**: Supabase Python Client  

---

## Setup & Installation

### **1️⃣ Install Python CLI**
Make sure you have Python 3.9+ installed.

**MacOS**:
```bash
# Install Python dependencies
pip3 install psycopg2-binary tabulate


# If it still fails — install PostgreSQL client libraries (macOS)
brew install postgresql


# Try again after installing PostgreSQL
pip3 install psycopg2-binary tabulate
```

**Verify Installation:**
```bash
python3 -m pip show psycopg2-binary
python3 -m pip show tabulate
```

**2️⃣ Clone Repository**
```bash
git clone https://github.com/Nick-Rigg/Database-Final-Project.git
cd Database-Final-Project
```

**3️⃣ Set Up Supabase Project**
1. Go to Supabase and create a new project.
2. Open the SQL Editor in your Supabase dashboard.
3. Run the provided SQL files:
    - CreateTables.sql (creates all required tables)
    - insert.sql (inserts sample data)

**4️⃣ Configure API Keys in app.py**
Inside your project, open app.py and replace:
```python
url: str = "YOUR_SUPABASE_URL"
key: str = "YOUR_SUPABASE_KEY"
```
with your project’s credentials, found in:
Supabase Dashboard → Project Settings → API → Project URL & Anon Key

**5️⃣ Install Dependencies**
```bash
pip install supabase
pip install tabulate
```

**6️⃣ Run the Application**
```bash
python3 app.py
```
