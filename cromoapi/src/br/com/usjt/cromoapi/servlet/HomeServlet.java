package br.com.usjt.cromoapi.servlet;

import br.com.usjt.cromoapi.entity.Humor;
import br.com.usjt.cromoapi.enumerator.Color;
import br.com.usjt.cromoapi.service.HumorService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class HomeServlet extends  HttpServlet {
    private static final long serialVersionUID = 1l;

    private HumorService service = new HumorService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var humores = service.obterHumores();

        request.setAttribute("humores", humores);

        RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
        rd.forward(request, response);
    }


}