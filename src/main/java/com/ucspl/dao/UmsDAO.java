package com.ucspl.dao;

import com.ucspl.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Data access for the University Management System.
 *
 * <p>All SQL lives here. Every statement is parameterised (no string
 * concatenation) and every JDBC resource is released through
 * try-with-resources. Query results are materialised into {@code String[]}
 * rows so the connection can be closed before the JSP renders them.</p>
 */
public class UmsDAO {

    // ------------------------------------------------------------------
    // Announcements
    // ------------------------------------------------------------------

    public void insertAnnouncement(String message) throws SQLException {
        String sql = "INSERT INTO announcement (message) VALUES (?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, message);
            ps.executeUpdate();
        }
    }

    public List<String[]> listAnnouncements() throws SQLException {
        String sql = "SELECT message FROM announcement";
        List<String[]> rows = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                rows.add(new String[] {rs.getString(1)});
            }
        }
        return rows;
    }

    // ------------------------------------------------------------------
    // Assignments & tutorials (table: tuto)
    // ------------------------------------------------------------------

    public void insertTuto(String year, String subcode, String subject,
                           String time, String date, String aort) throws SQLException {
        String sql = "INSERT INTO tuto (year, subcode, subject, time, date, aort) VALUES (?,?,?,?,?,?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, year);
            ps.setString(2, subcode);
            ps.setString(3, subject);
            ps.setString(4, time);
            ps.setString(5, date);
            ps.setString(6, aort);
            ps.executeUpdate();
        }
    }

    public List<String[]> listTutos() throws SQLException {
        String sql = "SELECT year, subcode, subject, time, date, aort FROM tuto";
        return queryTutos(sql, null);
    }

    public List<String[]> findTutoBySubcode(String subcode) throws SQLException {
        String sql = "SELECT year, subcode, subject, time, date, aort FROM tuto WHERE subcode = ?";
        return queryTutos(sql, subcode);
    }

    private List<String[]> queryTutos(String sql, String param) throws SQLException {
        List<String[]> rows = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            if (param != null) {
                ps.setString(1, param);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    rows.add(new String[] {
                            rs.getString(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6)
                    });
                }
            }
        }
        return rows;
    }

    public void updateTuto(String year, String subcode, String subject, String time,
                           String date, String aort, String originalSubcode) throws SQLException {
        String sql = "UPDATE tuto SET year=?, subcode=?, subject=?, time=?, date=?, aort=? WHERE subcode=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, year);
            ps.setString(2, subcode);
            ps.setString(3, subject);
            ps.setString(4, time);
            ps.setString(5, date);
            ps.setString(6, aort);
            ps.setString(7, originalSubcode);
            ps.executeUpdate();
        }
    }

    public void deleteTutoBySubcode(String subcode) throws SQLException {
        String sql = "DELETE FROM tuto WHERE subcode = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, subcode);
            ps.executeUpdate();
        }
    }

    // ------------------------------------------------------------------
    // Students (table: newstureg)
    // ------------------------------------------------------------------

    public void insertStudent(String year, String name, String fname, String nrc, String dob,
                              String nationality, String religion, String rno, String major,
                              String acyear, String address, String ph) throws SQLException {
        String sql = "INSERT INTO newstureg "
                + "(year, name, fname, nrc, dob, nationality, religion, rno, major, acyear, address, ph) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, year);
            ps.setString(2, name);
            ps.setString(3, fname);
            ps.setString(4, nrc);
            ps.setString(5, dob);
            ps.setString(6, nationality);
            ps.setString(7, religion);
            ps.setString(8, rno);
            ps.setString(9, major);
            ps.setString(10, acyear);
            ps.setString(11, address);
            ps.setString(12, ph);
            ps.executeUpdate();
        }
    }

    /** Returns rows of {rno, name, acyear, major} ordered by roll number. */
    public List<String[]> listStudentsByYear(String acyear) throws SQLException {
        String sql = "SELECT rno, name, acyear, major FROM newstureg WHERE acyear = ? "
                + "ORDER BY CAST(SUBSTRING_INDEX(rno, '-', -1) AS UNSIGNED) ASC";
        List<String[]> rows = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, acyear);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    rows.add(new String[] {
                            rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)
                    });
                }
            }
        }
        return rows;
    }

    /** Returns the full student row, or an empty list when no roll number matches. */
    public List<String[]> findStudentByRno(String rno) throws SQLException {
        String sql = "SELECT year, name, fname, nrc, dob, nationality, religion, rno, major, acyear, address, ph "
                + "FROM newstureg WHERE rno = ?";
        List<String[]> rows = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, rno);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String[] row = new String[12];
                    for (int i = 0; i < row.length; i++) {
                        row[i] = rs.getString(i + 1);
                    }
                    rows.add(row);
                }
            }
        }
        return rows;
    }

    public void updateStudent(String year, String name, String fname, String nrc, String dob,
                              String nationality, String religion, String major, String acyear,
                              String address, String ph, String originalRno) throws SQLException {
        String sql = "UPDATE newstureg SET year=?, name=?, fname=?, nrc=?, dob=?, nationality=?, "
                + "religion=?, major=?, acyear=?, address=?, ph=? WHERE rno = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, year);
            ps.setString(2, name);
            ps.setString(3, fname);
            ps.setString(4, nrc);
            ps.setString(5, dob);
            ps.setString(6, nationality);
            ps.setString(7, religion);
            ps.setString(8, major);
            ps.setString(9, acyear);
            ps.setString(10, address);
            ps.setString(11, ph);
            ps.setString(12, originalRno);
            ps.executeUpdate();
        }
    }

    public void deleteStudentByRno(String rno) throws SQLException {
        String sql = "DELETE FROM newstureg WHERE rno = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, rno);
            ps.executeUpdate();
        }
    }

    // ------------------------------------------------------------------
    // Student accounts (table: acc)
    // ------------------------------------------------------------------

    public boolean accountExists(String mail) throws SQLException {
        String sql = "SELECT 1 FROM acc WHERE mail = ? LIMIT 1";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, mail);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public void insertAccount(String username, String mail, String password) throws SQLException {
        String sql = "INSERT INTO acc (username, mail, password) VALUES (?,?,?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, mail);
            ps.setString(3, password);
            ps.executeUpdate();
        }
    }

    /** Returns rows of {username, mail, password}. */
    public List<String[]> listAccounts() throws SQLException {
        String sql = "SELECT username, mail, password FROM acc";
        List<String[]> rows = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                rows.add(new String[] {rs.getString(1), rs.getString(2), rs.getString(3)});
            }
        }
        return rows;
    }

    public boolean authenticateStudent(String username, String mail, String password) throws SQLException {
        String sql = "SELECT 1 FROM acc WHERE username = ? AND mail = ? AND password = ? LIMIT 1";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, mail);
            ps.setString(3, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
}
