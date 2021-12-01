package main;

import javax.servlet.ServletException;
import java.io.IOException;
import javax.servlet.http.*;

public class ControllerServlet extends HttpServlet {

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getServletContext().getRequestDispatcher("/oindex.jsp").forward(req, resp);
//    }
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        if (req.getParameter("x") == null || req.getParameter("y") == null || req.getParameter("r") == null ||
//                req.getParameter("islimit") == null) req.getServletContext().getNamedDispatcher("Controller").forward(req, resp);
//        else getServletContext().getNamedDispatcher("AreaChecker").forward(req, resp);
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("mode").equals("2")) {
            getServletContext().getNamedDispatcher("Clear").forward(req,resp);
        } else if (!(req.getParameter("x") == null || req.getParameter("y") == null || req.getParameter("r") == null || req.getParameter("mode") == null))
        getServletContext().getNamedDispatcher("AreaChecker").forward(req, resp);
    }
}