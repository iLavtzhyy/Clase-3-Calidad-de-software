package com.empresa.dao;

import com.empresa.dto.UsuarioDTO;
import java.util.Arrays;
import java.util.List;

public class UsuarioDAO {
    public List<UsuarioDTO> obtenerTodos() {
        return Arrays.asList(
            new UsuarioDTO("Ana", "Administrador"),
            new UsuarioDTO("Carlos", "Usuario Final")
        );
    }
}
