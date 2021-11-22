package br.com.usjt.cromoapi.servlet;

import br.com.usjt.cromoapi.entity.Humor;
import br.com.usjt.cromoapi.enumerator.Color;
import br.com.usjt.cromoapi.service.HumorService;

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

    private HumorService service = new HumorService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var humor = req.getParameter("test");
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
        humorr.setData(Calendar.getInstance().getTime());

        service.adiciona(humorr);
        System.out.println(service.obterHumores());

        req.setAttribute("humores", service.obterHumores());

        RequestDispatcher rd = req.getRequestDispatcher("/home.jsp");
        rd.forward(req, resp);
    }

}
