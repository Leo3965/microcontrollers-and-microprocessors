package main.br.com.usjt.cromoapi.repository;

import com.mysql.jdbc.Driver;

public  class MySqlDriverFactory {
    public static MySqlDriver get() throws ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return new MySqlDriver("127.0.0.1", "3306", "a3redes", "root", "root");
    }
}
