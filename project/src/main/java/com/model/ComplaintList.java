package com.model;

import java.sql.Timestamp;

public class ComplaintList {

    private int id;
    private String studentName;
    private String studentID;
    private String studentEmail;
    private String phoneNo;
    private String lokasiBlok;
    private String lokasiAras;
    private String lokasiBilik;
    private String lokasiLain;
    private String jenisAduan;
    private String detailAduan;
    private String keteranganAduan;
    private String status;
    private Timestamp tarikhAduan;
    private String actionNotes;
    private String actionStaff;

    // Default constructor
    public ComplaintList() {
    }

    // Parameterized constructor
    public ComplaintList(int id, String studentName, String studentID, String studentEmail, String phoneNo, String lokasiBlok,
                         String lokasiAras, String lokasiBilik, String lokasiLain, String jenisAduan, String detailAduan,
                         String keteranganAduan, String status, Timestamp tarikhAduan, String actionNotes, String actionStaff) {
        this.id = id;
        this.studentName = studentName;
        this.studentID = studentID;
        this.studentEmail = studentEmail;
        this.phoneNo = phoneNo;
        this.lokasiBlok = lokasiBlok;
        this.lokasiAras = lokasiAras;
        this.lokasiBilik = lokasiBilik;
        this.lokasiLain = lokasiLain;
        this.jenisAduan = jenisAduan;
        this.detailAduan = detailAduan;
        this.keteranganAduan = keteranganAduan;
        this.status = status;
        this.tarikhAduan = tarikhAduan;
        this.actionNotes = actionNotes;
        this.actionStaff = actionStaff;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getLokasiBlok() {
        return lokasiBlok;
    }

    public void setLokasiBlok(String lokasiBlok) {
        this.lokasiBlok = lokasiBlok;
    }

    public String getLokasiAras() {
        return lokasiAras;
    }

    public void setLokasiAras(String lokasiAras) {
        this.lokasiAras = lokasiAras;
    }

    public String getLokasiBilik() {
        return lokasiBilik;
    }

    public void setLokasiBilik(String lokasiBilik) {
        this.lokasiBilik = lokasiBilik;
    }

    public String getLokasiLain() {
        return lokasiLain;
    }

    public void setLokasiLain(String lokasiLain) {
        this.lokasiLain = lokasiLain;
    }

    public String getJenisAduan() {
        return jenisAduan;
    }

    public void setJenisAduan(String jenisAduan) {
        this.jenisAduan = jenisAduan;
    }

    public String getDetailAduan() {
        return detailAduan;
    }

    public void setDetailAduan(String detailAduan) {
        this.detailAduan = detailAduan;
    }

    public String getKeteranganAduan() {
        return keteranganAduan;
    }

    public void setKeteranganAduan(String keteranganAduan) {
        this.keteranganAduan = keteranganAduan;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTarikhAduan() {
        return tarikhAduan;
    }

    public void setTarikhAduan(Timestamp tarikhAduan) {
        this.tarikhAduan = tarikhAduan;
    }

    public String getActionNotes() {
        return actionNotes;
    }

    public void setActionNotes(String actionNotes) {
        this.actionNotes = actionNotes;
    }

    public String getActionStaff() {
        return actionStaff;
    }

    public void setActionStaff(String actionStaff) {
        this.actionStaff = actionStaff;
    }
}