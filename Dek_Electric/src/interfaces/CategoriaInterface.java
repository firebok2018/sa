package interfaces;

import java.util.ArrayList;

import model.Categoria;

public interface CategoriaInterface {
	// Insertar registro de Categor�a
	public int insertar(Categoria c);
	
	// Actualizar registro de Categor�a
	public int actualizar(Categoria c);
	
	// Eliminar registro de Categor�a
	public int eliminar(int cod);
	
	// Listar registros de Categor�a
	ArrayList<Categoria> listar();
}
