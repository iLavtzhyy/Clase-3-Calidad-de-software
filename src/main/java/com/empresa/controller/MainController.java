package com.empresa.controller;

import com.empresa.dto.UsuarioDTO;
import com.empresa.ejb.UsuarioServiceEJB;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/app")
public class MainController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private UsuarioServiceEJB usuarioService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<UsuarioDTO> lista = usuarioService.procesarUsuarios();
        request.setAttribute("usuarios", lista);
        request.getRequestDispatcher("/vista.jsp").forward(request, response);
    }
}
