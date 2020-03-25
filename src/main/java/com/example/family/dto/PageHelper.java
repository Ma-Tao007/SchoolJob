package com.example.family.dto;

import lombok.Data;

@Data
public class PageHelper {
    private int page;
    private int limit;
    private int start;

    public int getStart(){
        return (page-1)*limit;
    }
}

