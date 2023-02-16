/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configPkg;

import javax.servlet.RequestDispatcher;

public class ConfigInfo {
    private static String ctxRealPath="";

    public static String getCtxRealPath() {
        return ctxRealPath;
    }

    public static void setCtxRealPath(String ctxRealPath) {
        ConfigInfo.ctxRealPath = ctxRealPath;
    }
    
}
