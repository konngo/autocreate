package cn.konngo.utils;

import freemarker.template.Configuration;

import java.util.ResourceBundle;
/**
 *  peng@konngo.cn
 *  2019-12-19
 */
public class Config {
    //文件生成位置
    public static String FILE_PATH;
    //使用模板
    public static String TEMPLATE;

    public static String BASEPACKAGE;
    public static String TABLENAME;


    public static void init() {
        ResourceBundle properteis=ResourceBundle.getBundle("config/template");
        FILE_PATH=properteis.getString("FILE_PATH");
        TEMPLATE=properteis.getString("TEMPLATE");
        BASEPACKAGE=properteis.getString("basepackage");
        TABLENAME=properteis.getString("tablename");

    }

}
