package guis;

import libreria.Lib;
import clases.Incidencia;
import clases.Usuario;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.UIManager;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Font;

public class DlgIncidenciasPorArea extends JDialog implements ActionListener {

	private static final long serialVersionUID = 1L;
	
	private JLabel lblArea;
	private JComboBox <String> cboArea;
	private JButton btnVolver;
	private JScrollPane scrollPane;
	private JTextArea txtS;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		} catch (Throwable e) {
			e.printStackTrace();
		}
		try {
			DlgIncidenciasPorArea dialog = new DlgIncidenciasPorArea();
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public DlgIncidenciasPorArea() {
		getContentPane().setLayout(null);
		setResizable(false);
		setTitle("Reporte | Incidencias por �rea");
		setBounds(100, 100, 595, 520);
		
		lblArea = new JLabel("AREA DE:");
		lblArea.setBounds(10, 23, 100, 23);
		getContentPane().add(lblArea);
		
		cboArea = new JComboBox <String> ();
		cboArea.addActionListener(this);
		cboArea.setModel(new DefaultComboBoxModel <String> (Lib.tiposDeArea));
		cboArea.setBounds(70, 23, 150, 23);
		getContentPane().add(cboArea);
		
		btnVolver = new JButton("volver");
		btnVolver.addActionListener(this);
		btnVolver.setBounds(470, 11, 109, 45);
		btnVolver.setIcon(new ImageIcon("imagenes/volver.png"));
		getContentPane().add(btnVolver);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 65, 569, 407);
		getContentPane().add(scrollPane);
		
		txtS = new JTextArea();
		txtS.setFont(new Font("Monospaced", Font.PLAIN, 11));
		scrollPane.setViewportView(txtS);
		
		listarIncidencia();
	}
	public void actionPerformed(ActionEvent arg0) {
		if (arg0.getSource() == btnVolver) {
			actionPerformedBtnVolver(arg0);
		}
		if (arg0.getSource() == cboArea) {
			actionPerformedCboArea(arg0);
		}
	}
	protected void actionPerformedCboArea(ActionEvent arg0) {
		listarIncidencia();
	}
	protected void actionPerformedBtnVolver(ActionEvent arg0) {
		dispose();
	}
	//  M�todos tipo void (sin par�metros)
	void listarIncidencia() {
		txtS.setText("");
		Usuario x;
		Incidencia y;
		for (int i=0; i<ProyectoDemo_AED.au.tama�o(); i++) {							
			x = ProyectoDemo_AED.au.obtener(i);				
			if (leerPosArea() == x.getArea())
				for (int j=0; j<ProyectoDemo_AED.ai.tama�o(); j++) {
					y = ProyectoDemo_AED.ai.obtener(j);
					if (x.getCodigo() == y.getCodigoUsuario()) {
						imprimir("C�digo de usuario                    :  " + y.getCodigoUsuario());
						imprimir("C�digo del tipo de incidencia        :  " + y.getCodigoTipoIncidencia());
						imprimir("C�digo de especialista               :  " + y.getCodigoEspecialista());
						imprimir("C�digo de incidencia                 :  " + y.getCodigo());
						imprimir("Descripci�n                          :  " + y.getDescripcion());
						imprimir("Comentario                           :  " + y.getComentario());
						imprimir("Tiempo estimado de soluci�n en horas :  " + y.getTiempoEstimadoSolucion());
						imprimir("Tiempo real de soluci�n en horas     :  " + y.getTiempoRealSolucion());
						imprimir("Fecha de registro                    :  " + Lib.formatoFecha(y.getFechaRegistro()));
						imprimir("Fecha de inicio de atenci�n          :  " + Lib.formatoFecha(y.getFechaInicioAtencion()));
						imprimir("Fecha de fin de atenci�n             :  " + Lib.formatoFecha(y.getFechaFinAtencion()));
						imprimir("Estado                               :  " + Lib.tiposDeIncidencia[y.getEstado()]); 
						imprimir("------------------------------------------------------------------------------");
					}
				}
		}
	}
	//  M�todos tipo void (con par�metros)
	void imprimir(String s) {
		txtS.append(s + "\n"); 
	}
	//  M�todos que retornan valor (sin par�metros)
	int leerPosArea() {
		return cboArea.getSelectedIndex();		
	}
	
}