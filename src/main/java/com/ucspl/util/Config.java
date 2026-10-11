package com.ucspl.util;

import java.io.InputStream;
import java.util.Properties;

/**
 * Lightweight configuration accessor.
 *
 * <p>Resolution order for every key (first non-blank wins):</p>
 * <ol>
 *   <li>Environment variable, e.g. {@code db.url} -&gt; {@code DB_URL}</li>
 *   <li>JVM system property</li>
 *   <li>{@code application.properties} on the classpath</li>
 *   <li>the supplied default value</li>
 * </ol>
 */
public final class Config {

    private static final String CONFIG_FILE = "/application.properties";
    private static final Properties PROPS = new Properties();

    static {
        try (InputStream in = Config.class.getResourceAsStream(CONFIG_FILE)) {
            if (in != null) {
                PROPS.load(in);
            }
        } catch (Exception e) {
            System.err.println("Config: could not load " + CONFIG_FILE + ": " + e.getMessage());
        }
    }

    private Config() {
    }

    public static String get(String key, String defaultValue) {
        String value = System.getenv(toEnvKey(key));
        if (isBlank(value)) {
            value = System.getProperty(key);
        }
        if (isBlank(value)) {
            value = PROPS.getProperty(key);
        }
        return isBlank(value) ? defaultValue : value.trim();
    }

    public static String get(String key) {
        return get(key, null);
    }

    private static String toEnvKey(String key) {
        return key.toUpperCase().replace('.', '_').replace('-', '_');
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
