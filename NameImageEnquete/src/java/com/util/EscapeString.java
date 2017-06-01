/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Naro
 */
public class EscapeString {

    public static String UNDER_BAR = "_";
    public static String PERSENT = "%";

    public static String escapeForLike(String str) {
        String str1 = escapeDot(str);
        String str2 = escapePercent(str1);
        return str2;
    }

    public static String escapeDot(String str) {
        Pattern p = Pattern.compile(UNDER_BAR);
        Matcher m = p.matcher(str);
        String result = m.replaceAll("\\\\" + UNDER_BAR);
        return result;
    }

    public static String escapePercent(String str) {
        Pattern p = Pattern.compile(PERSENT);
        Matcher m = p.matcher(str);
        String result = m.replaceAll("\\\\" + PERSENT);
        return result;
    }

}
