package main.br.com.usjt.cromoapi.repository;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlDriver {
    private String host;
    private String port;
    private String db;
    private String user;
    private  String pass;

    public MySqlDriver(String host, String port, String db, String user, String pass) {
        this.host = host;
        this.port = port;
        this.db = db;
        this.user = user;
        this.pass = pass;
    }

    public Connection getConnection() throws Exception {
        String url = String.format("jdbc:mysql://%s:%s/%s?useTimezone=true&serverTimezone=UTC", host,
                port, db);
        return DriverManager.getConnection(url, user, pass);
    }
}