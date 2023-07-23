package com.poly.constrant;

public class SessionAttr {
	public static final String Current_user = "currentUser" ;
	

public enum EmailType {
    WELCOME,
    FORGET,
    OTHER;
    
    public static EmailType getType(String emailContent) {
        if (emailContent.toLowerCase().contains("welcome")) {
            return WELCOME;
        } else if (emailContent.toLowerCase().contains("forget")) {
            return FORGET;
        } else {
            return OTHER;
        }
    }
}

}