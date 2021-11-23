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

@WebServlet("/listar")
public class ListaHumorServlet extends HttpServlet {

    private static final long serialVersionUID = 1l;
    private HumorRepositoryImpl  repository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            repository = new HumorRepositoryImpl(MySqlDriverFactory.get());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        req.setAttribute("humores", repository.getAll());

        RequestDispatcher rd = req.getRequestDispatcher("/humor.jsp");
        rd.forward(req, resp);
    }

}
