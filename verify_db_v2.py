
import os
import sys
from sqlalchemy import select, desc, text
from sqlalchemy.orm import Session

# Add project root to path
sys.path.append(os.getcwd())
from backend.database.db_manager import DatabaseManager, Incident, HealingAction

db = DatabaseManager()
with Session(db.engine) as session:
    print("--- RECENT INCIDENTS ---")
    incidents = session.query(Incident).order_by(desc(Incident.detected_at)).limit(10).all()
    if not incidents:
        print("No incidents found.")
    for inc in incidents:
        print(f"ID: {inc.incident_id}, Type: {inc.type}, Status: {inc.status}, Detected: {inc.detected_at}")
    
    print("\n--- ALL HEALING ACTIONS ---")
    actions = session.query(HealingAction).order_by(desc(HealingAction.created_at)).limit(10).all()
    if not actions:
        print("No healing actions found.")
    for act in actions:
        print(f"ID: {act.action_id}, Incident: {act.incident_id}, Decision: {act.agl_decision}, Created: {act.created_at}")

with db.engine.connect() as conn:
    print("\n--- RAW TABLE COUNTS ---")
    for table in ["incidents", "healing_actions", "agent_health", "performance_metrics"]:
        res = conn.execute(text(f"SELECT COUNT(*) FROM {table}"))
        print(f"{table}: {res.scalar()}")
