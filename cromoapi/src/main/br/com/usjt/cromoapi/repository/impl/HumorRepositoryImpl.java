package main.br.com.usjt.cromoapi.repository.impl;

import main.br.com.usjt.cromoapi.repository.HumorRepository;
import main.br.com.usjt.cromoapi.service.ColorService;
import main.br.com.usjt.cromoapi.entity.Humor;
import main.br.com.usjt.cromoapi.repository.MySqlDriver;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class HumorRepositoryImpl implements HumorRepository {

    private MySqlDriver driver;

    public HumorRepositoryImpl(MySqlDriver driver) {
        this.driver = driver;
    }

    @Override
    public void create(Humor data) {
        String sql = "INSERT INTO humor (humor, data, color) values (?, current_date, ?)";
        try (Connection conn = this.driver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, data.getHumor());
            //ps.setString(2, ("current_date"));
            ps.setString(2, data.getColor().toString());
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Humor data) {
        String sql = "UPDATE humor SET humor = ?, data = ?, color = ? WHERE id = ?";
        try (Connection conn = this.driver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, data.getHumor());
            ps.setDate(2, Date.valueOf(data.getData().toString()));
            ps.setString(3, data.getColor().toString());
            ps.setInt(4, (Math.toIntExact(data.getId())));
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        var sql = "DELETE FROM humor WHERE id = (?)";
        try (Connection conn = this.driver.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, (Math.toIntExact(id)));
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Humor> getByKey(String key, String value) {
        var service = new ColorService();
        var sql = String.format("SELECT * FROM humor where %s = (?)", key);

        try (Connection conn = this.driver.getConnection(); PreparedStatement psQueryUser = conn.prepareStatement(sql);) {
            psQueryUser.setString(1, value);
            ResultSet rs = psQueryUser.executeQuery();
           var list = new ArrayList<Humor>();

            while (rs.next()) {
                int id = rs.getInt("id");
                var humor = rs.getString("humor");
                var format = new SimpleDateFormat("dd/MM/yyyy");
                var data = rs.getString("data");
                var color = service.getColorByString(rs.getString("color"));
                var fetched = new Humor((long )id, humor, data, color);

                list.add(fetched);
            }
            return list;
        } catch (Exception e) {
            return new ArrayList<Humor>();
        }
    }

    @Override
    public List<Humor> getAll() {
        var service = new ColorService();
        var sql = String.format("SELECT * FROM humor");

        try (Connection conn = this.driver.getConnection(); PreparedStatement psQueryUser = conn.prepareStatement(sql);) {
            ResultSet rs = psQueryUser.executeQuery();
            var list = new ArrayList<Humor>();

            while (rs.next()) {
                int id = rs.getInt("id");
                var humor = rs.getString("humor");
                var format = new SimpleDateFormat("dd/MM/yyyy");
                var data = rs.getString("data");
                var color = service.getColorByString(rs.getString("color"));
                var fetched = new Humor((long )id, humor, data, color);

                list.add(fetched);
            }
            return list;
        } catch (Exception e) {
            return new ArrayList<Humor>();
        }
    }
}
