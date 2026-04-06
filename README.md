#  AURA: Autonomous Resilient Architecture

AURA is a **Self-Healing AI Platform** designed for mission-critical agentic workflows. It leverages an event-driven micro-agent architecture to monitor, detect, and autonomously repair AI system failures (latency spikes, model drift, agent crashes) in real-time.

---

##  System Architecture

The project is structured as a **Polyglot Distributed System**, combining a high-performance Python backend with a real-time Next.js frontend, orchestrated via Apache Kafka.

###  Agentic AI Layer
A mesh of 6 autonomous agents:
*   **Ingestion Agent**: High-throughput Kafka producer.
*   **Feature Agent**: Real-time feature engineering.
*   **Model Agent**: Inference engine with **Safe Mode** fallback.
*   **Monitoring Agent**: Tracks Drift (PSI), Latency SLOs, and Heartbeats.
*   **Healing Agent**: Orchestrates remediation using **Healing Memory**.

###  Dashboard UI
*   **Live Metrics**: Real-time Accuracy, Latency, and Drift tracking.
*   **Architecture Flow**: Visualizes the event-driven agent mesh.
*   **Self-Healing Log**: Audit trail of autonomous incident recovery.

---

##  Key Features & Novelty

1.  **Event-Driven Orchestration**: Uses **Kafka as a State-Backbone**, enabling truly decoupled and scalable agentic AI.
2.  **Autonomous Remediation**: Implements a closed-loop MAPE-K pattern to repair failures without human intervention.
3.  **Healing Memory**: Optimizes recovery strategies based on historical success data stored in PostgreSQL.
4.  **MLOps Integration**: Real-time drift monitoring with **Evidently AI** concepts and **MLflow** registry integration.

---

##  Tech Stack
*   **Backend**: Python 3.12, Apache Kafka, PostgreSQL, Apache Hadoop, Prometheus.
*   **Frontend**: Next.js 15, Tailwind CSS, Typescript, Framer Motion, Recharts.

---

##  Getting Started

1.  **Start Infrastructure**:
    Ensure Docker Desktop is running, then start the core services:
    ```bash
    docker-compose -f infra/docker-compose.yml up -d
    ```

2.  **Start Frontend**:
    Install dependencies (if first time) and launch the dashboard:
    ```bash
    npm install
    npm run dev
    ```
    Access the UI at [http://localhost:3000](http://localhost:3000).

3.  **Run Autonomous Agents**:
    Launch the AI agent suite using the Windows batch script:
    ```bash
    .\run_all_agents.bat
    ```

4.  **Verify Database**:
    Check the status of incidents and healing actions:
    ```bash
    .\venv\Scripts\python verify_db_v2.py
    ```

