package main.br.com.usjt.cromoapi.repository;

import java.util.List;

public interface BaseRepository<T> {
    void create(T data);
    void update(T data);
    void remove(int id);
    List<T> getByKey(String key, String value);
    List<T> getAll();
}
