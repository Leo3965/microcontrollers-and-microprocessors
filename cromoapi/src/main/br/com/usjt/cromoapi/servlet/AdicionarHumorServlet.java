package main.br.com.usjt.cromoapi.servlet;

import main.br.com.usjt.cromoapi.entity.Humor;
import main.br.com.usjt.cromoapi.enumerator.Color;
import main.br.com.usjt.cromoapi.repository.MySqlDriverFactory;
import main.br.com.usjt.cromoapi.repository.impl.HumorRepositoryImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;

@WebServlet("/adicionar")
public class AdicionarHumorServlet extends HttpServlet {

    private static final long serialVersionUID = 1l;
    private HumorRepositoryImpl  repository;


    public AdicionarHumorServlet() throws ClassNotFoundException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            repository = new HumorRepositoryImpl(MySqlDriverFactory.get());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        var humor = req.getParameter("humor");
        Color color;

        switch (humor) {
            case "Feliz":
                color = Color.GREEN;
                break;
            case "Triste":
                color = Color.BLUE;
                break;
            default:
                color = Color.RED;
        }

        var humorr = new Humor();
        humorr.setHumor(humor);
        humorr.setColor(color);
        humorr.setId(1l);
        humorr.setData(Calendar.getInstance().getTime().toString());

        repository.create(humorr);

        req.setAttribute("humores", repository.getAll());

        RequestDispatcher rd = req.getRequestDispatcher("/humor.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("humores", repository.getAll());
        RequestDispatcher rd = req.getRequestDispatcher("/humor.jsp");
        rd.forward(req, resp);
    }
}
