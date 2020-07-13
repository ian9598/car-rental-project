/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.model;

/**
 *
 * @author iyan
 */
public class Rental {
    
    private int rent_id;
    private String username;
    private String name;
    private String plate_num;
    private String start_Date;
    private String start_Time;
    private String return_Date;
    private String return_Time;

    public int getRent_id() {
        return rent_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlate_num() {
        return plate_num;
    }

    public void setPlate_num(String plate_num) {
        this.plate_num = plate_num;
    }

    public String getStart_Date() {
        return start_Date;
    }

    public void setStart_Date(String start_Date) {
        this.start_Date = start_Date;
    }

    public String getStart_Time() {
        return start_Time;
    }

    public void setStart_Time(String start_Time) {
        this.start_Time = start_Time;
    }

    public String getReturn_Date() {
        return return_Date;
    }

    public void setReturn_Date(String return_Date) {
        this.return_Date = return_Date;
    }

    public String getReturn_Time() {
        return return_Time;
    }

    public void setReturn_Time(String return_Time) {
        this.return_Time = return_Time;
    }
    
}
