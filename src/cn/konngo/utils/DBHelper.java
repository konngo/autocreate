package cn.konngo.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 *  peng@konngo.cn
 *  2019-12-19
 */
public class DBHelper {
    //获取数据库连接
    public static Connection getConnection(){
        ResourceBundle properteis=ResourceBundle.getBundle("config/jdbc");
        Connection conn =null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection(properteis.getString("url"),properteis.getString("username"),properteis.getString("password"));
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("数据库连接失败！");
            e.printStackTrace();
        }
        return conn;
    }
}
