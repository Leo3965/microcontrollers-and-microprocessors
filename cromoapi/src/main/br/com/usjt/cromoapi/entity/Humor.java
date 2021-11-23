package main.br.com.usjt.cromoapi.entity;

import main.br.com.usjt.cromoapi.enumerator.Color;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Humor {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    private String humor;

    private String data;

    private Color color;

    public Humor() {

    }
    public Humor(Long id, String humor, String data, Color color) {
        this.id = id;
        this.humor = humor;
        this.data = data;
        this.color = color;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHumor() {
        return humor;
    }

    public void setHumor(String humor) {
        this.humor = humor;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
