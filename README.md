# Group-I UMS — University Management System

A small Java web application used by the **University of Computer Studies, Panglong
(UCSPL)** to manage student records, teaching schedules and announcements.

Built with **Jakarta Servlet / JSP**, **Apache Tomcat 10.1** and **MySQL 8**.

---

## Features

| Area | Description |
|------|-------------|
| Public site | Landing page (`home.html`) with vision/mission, faculties and contact info. |
| Admin login | Credential-protected dashboard (`loginServlet` → `admin-dashboard.jsp`). |
| Student registration | Create / list student records by academic year and major. |
| Student accounts | Create student login accounts and list them. |
| Timetable & tutorials | Add, edit, delete and search assignment/tutorial schedules. |
| Announcements | Publish announcements shown on the student dashboard. |
| Student login | Students sign in with username / email / password and view their dashboard. |

---

## Technology stack

- Java 21 (source/target)
- Jakarta Servlet API 6.0 (`jakarta.servlet.*`)
- JSP + Bootstrap 5 (bundled locally)
- Apache Tomcat 10.1
- MySQL 8 with `mysql-connector-j-8.4.0`

---

## Project structure

```
Group-I UMS/
├── database/
│   └── schema.sql                 # Database schema + sample data
├── src/
│   ├── main/
│   │   ├── java/com/ucspl/
│   │   │   ├── loginServlet.java  # Admin authentication servlet
│   │   │   ├── dao/UmsDAO.java    # All database access (PreparedStatements)
│   │   │   └── util/
│   │   │       ├── Config.java    # Reads application.properties / env vars
│   │   │       └── DBUtil.java    # JDBC connection factory
│   │   └── webapp/                # JSPs, HTML, CSS, JS, images
│   └── main/resources/
│       ├── application.properties.example
│       └── application.properties # local only, git-ignored
├── build/                         # compiled output (git-ignored)
├── .classpath / .project / .settings
├── LICENSE
└── README.md
```

---

## Setup

### 1. Database

Create the schema (adjust the database name if needed):

```bash
mysql -u root -p < database/schema.sql
```

### 2. Configuration

Copy the example file and fill in your credentials:

```bash
cp src/main/resources/application.properties.example src/main/resources/application.properties
```

```properties
db.url=jdbc:mysql://localhost:3306/ums
db.user=root
db.password=your-password

admin.username=admin@ucspl
admin.password=choose-a-strong-password
```

Every value can also be supplied through environment variables, which take
precedence over the file: `DB_URL`, `DB_USER`, `DB_PASSWORD`, `ADMIN_USERNAME`,
`ADMIN_PASSWORD`.

> `application.properties` is listed in `.gitignore` so real credentials are
> never committed. Only `application.properties.example` is tracked.

### 3. Run

1. Import the project into Eclipse as an **Existing Project (Dynamic Web Project)**.
2. Add an **Apache Tomcat 10.1** runtime and deploy.
3. Open `http://localhost:8080/Group-I_UMS/` (context root is `Group-I_UMS`).

---

## Security notes

The following issues from the original codebase were addressed:

- **Hard-coded credentials** (`root` / database password / admin password) were
  removed from the source and moved to external configuration.
- **SQL injection** in the search and login pages was fixed by replacing string
  concatenation with `PreparedStatement` parameters.
- **JDBC resource leaks** were eliminated — all `Connection`, `Statement` and
  `ResultSet` objects are now closed via try-with-resources inside `UmsDAO`.
- **Plain-text passwords** are no longer rendered in the admin dashboard.
- **Stack traces** are no longer exposed to end users on the error pages.

Remaining recommendation for a production deployment: store **password hashes**
(e.g. BCrypt) instead of plain text in the `acc` table, and move authentication
into the servlet layer. This was intentionally left out to keep the existing
student accounts working.
