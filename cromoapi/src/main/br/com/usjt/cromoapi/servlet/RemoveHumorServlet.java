package main.br.com.usjt.cromoapi.servlet;

import main.br.com.usjt.cromoapi.repository.MySqlDriverFactory;
import main.br.com.usjt.cromoapi.repository.impl.HumorRepositoryImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/remover")
public class RemoveHumorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private HumorRepositoryImpl repository;

    public RemoveHumorServlet() throws ClassNotFoundException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            repository  = new HumorRepositoryImpl(MySqlDriverFactory.get());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String paramId = request.getParameter("id");
        Integer id = Integer.valueOf(paramId);

        repository.remove(id);

        response.sendRedirect("/cromoapi/adicionar");

    }
}
