package com.mvc.model;
 
public class Customer {
 
 private String name;
 private String userName;
 private String password;
 private String phone_no;
 private String id;
 
 public String getUserName() {
 return userName;
 }
 public void setUserName(String userName) {
 this.userName = userName;
 }
 public String getPassword() {
 return password;
 }
 public void setPassword(String password) {
 this.password = password;
 }
 public void setName(String Name) {
 this.name = Name;
 }
 public String getName() {
 return name;
 }

 public String getPhone_no() {
 return phone_no;
 }
 public void setPhone_no(String Phone_no) {
 this.phone_no = Phone_no;
 }
 
 public void setID(String id) {
 this.id = id;
 }
 public String getID() {
 return id;
 }
}