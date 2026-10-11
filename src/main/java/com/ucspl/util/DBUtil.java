package com.ucspl.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Central JDBC connection factory.
 *
 * <p>Connection settings are read from {@code application.properties}, JVM
 * system properties or environment variables (see {@link Config}). Credentials
 * are therefore never hard-coded in the source tree.</p>
 */
public final class DBUtil {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = Config.get("db.url", "jdbc:mysql://localhost:3306/ums");
    private static final String USER = Config.get("db.user", "root");
    private static final String PASSWORD = Config.get("db.password", "");

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(
                    "MySQL JDBC driver not found on the classpath: " + DRIVER);
        }
    }

    private DBUtil() {
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
