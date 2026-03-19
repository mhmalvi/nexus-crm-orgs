# Nexus CRM Orgs

The company and organization management microservice for the **Nexus CRM** platform. This Laravel-based API manages multi-tenant company profiles, sales team structures, subscription packages, document storage, and internal notice boards.

## Features

- **Company Management** — Full CRUD operations for company profiles with status control and token-based access
- **Multi-Tenant Architecture** — Isolated company contexts with per-organization data boundaries
- **Sales Team Management** — Add, update, suspend, and remove sales employees within a company
- **Package System** — Define and manage subscription packages with configurable limits
- **Package Subscriptions** — Assign packages to companies with subscription lifecycle management
- **Subscription Plans** — Create and manage tiered subscription offerings
- **Requisition System** — Submit, track, and approve internal requisition requests
- **Notice Board** — Company-wide announcements with CRUD operations
- **Document Storage** — Upload, retrieve, and manage company documents and logos
- **Automated Cron Jobs** — Scheduled tasks for subscription renewals and company status checks
- **Verification System** — Company verification code validation for renewal workflows
- **ABN Lookup** — Retrieve company identification by ABN (Australian Business Number)

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Laravel 10 |
| Language | PHP 8.1+ |
| Authentication | Laravel Sanctum |
| HTTP Client | Guzzle |
| Database | MySQL |
| Testing | PHPUnit 10 |
| Code Style | StyleCI |

## Prerequisites

- PHP >= 8.1
- Composer
- MySQL 5.7+ or MariaDB 10.3+

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/mhmalvi/nexus-crm-orgs.git
   cd nexus-crm-orgs
   ```

2. **Install dependencies**

   ```bash
   composer install
   ```

3. **Configure environment**

   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

   Update `.env` with database credentials and inter-service URLs.

4. **Run database migrations**

   ```bash
   php artisan migrate
   ```

   Alternatively, import the provided `crm_company.sql` schema file.

5. **Start the development server**

   ```bash
   php artisan serve
   ```

   The API will be available at `http://localhost:8000`.

## API Overview

| Endpoint Group | Description |
|---------------|-------------|
| `POST /api/company/create` | Register a new company |
| `GET /api/company/{id}/details` | Get company profile |
| `PUT /api/company/update` | Update company information |
| `POST /api/company/list` | List companies with filters |
| `POST /api/company/employee/create` | Add a sales team member |
| `GET /api/company/{id}/employee/list` | List company employees |
| `POST /api/store/requisition` | Submit a requisition |
| `GET /api/requisition/list` | List all requisitions |
| `POST /api/notice/create` | Create a notice |
| `POST /api/store/package` | Define a subscription package |
| `POST /api/documents` | Upload a document |
| `GET /api/get-company-logo/{id}` | Retrieve company logo |

## Microservices Integration

| Service | Interaction |
|---------|------------|
| nexus-crm-users | Syncs user accounts with company employee records |
| nexus-crm-leads | Provides company context for multi-tenant lead operations |
| nexus-crm-payments | Links subscriptions to payment billing cycles |
| nexus-crm-alerts | Triggers notifications for company events and requisition updates |

## License

This project is proprietary software. All rights reserved.
