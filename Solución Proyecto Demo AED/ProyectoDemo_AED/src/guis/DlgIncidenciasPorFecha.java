package guis;

import libreria.*;
import clases.Incidencia;

import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JComboBox;
import javax.swing.JButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Font;

public class DlgIncidenciasPorFecha extends JDialog implements ActionListener {

	private static final long serialVersionUID = 1L;
	
	private JLabel lblFechaInicio;
	private JLabel lblFechaFin;
	private JComboBox <String> cboInicioDia;
	private JComboBox <String> cboInicioMes;
	private JComboBox <String> cboInicioA�o;
	private JComboBox <String> cboFinDia;
	private JComboBox <String> cboFinMes;
	private JComboBox <String> cboFinA�o;
	private JButton btnVolver;
	private JScrollPane scrollPane;
	private JTextArea txtS;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			DlgIncidenciasPorFecha dialog = new DlgIncidenciasPorFecha();
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
	public DlgIncidenciasPorFecha() {
		getContentPane().setLayout(null);
		setResizable(false);
		setTitle("Reporte | Incidencias por fecha");
		setBounds(100, 100, 595, 520);
		
		lblFechaInicio = new JLabel("INICIO DE ATENCI\u00D3N:");
		lblFechaInicio.setBounds(10, 10, 120, 23);
		getContentPane().add(lblFechaInicio);
		
		lblFechaFin = new JLabel("FIN DE ATENCI\u00D3N:");
		lblFechaFin.setBounds(10, 40, 120, 23);
		getContentPane().add(lblFechaFin);
		
		cboInicioDia = new JComboBox <String> ();
		Fecha.colocarItems(cboInicioDia, 1, 31);
		cboInicioDia.addActionListener(this);
		cboInicioDia.setBounds(135, 10, 40, 23);
		getContentPane().add(cboInicioDia);
		
		cboInicioMes = new JComboBox <String> ();
		Fecha.colocarMeses(cboInicioMes);
		cboInicioMes.addActionListener(this);
		cboInicioMes.setBounds(175, 10, 90, 23);
		getContentPane().add(cboInicioMes);
		
		cboInicioA�o = new JComboBox <String> ();
		Fecha.colocarItems(cboInicioA�o, Fecha.a�oActual(), 2000);
		cboInicioA�o.addActionListener(this);
		cboInicioA�o.setBounds(265, 10, 60, 23);
		getContentPane().add(cboInicioA�o);
		
		cboFinDia = new JComboBox <String> ();
		Fecha.colocarItems(cboFinDia, 1, 31);
		colocarDiaActual();
		cboFinDia.addActionListener(this);
		cboFinDia.setBounds(135, 40, 40, 23);
		getContentPane().add(cboFinDia);
		
		cboFinMes = new JComboBox <String> ();
		Fecha.colocarMeses(cboFinMes);
		colocarMesActual();
		cboFinMes.addActionListener(this);
		cboFinMes.setBounds(175, 40, 90, 23);
		getContentPane().add(cboFinMes);
		
		cboFinA�o = new JComboBox <String> ();
		Fecha.colocarItems(cboFinA�o, Fecha.a�oActual(), 2000);
		cboFinA�o.addActionListener(this);
		cboFinA�o.setBounds(265, 40, 60, 23);
		getContentPane().add(cboFinA�o);
		
		btnVolver = new JButton("volver", new ImageIcon("imagenes/volver.png"));
		btnVolver.addActionListener(this);
		btnVolver.setBounds(470, 11, 109, 45);
		getContentPane().add(btnVolver);
		
		scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 70, 569, 402);
		getContentPane().add(scrollPane);
		
		txtS = new JTextArea();
		txtS.setFont(new Font("Monospaced", Font.PLAIN, 11));
		scrollPane.setViewportView(txtS);
		
		filtrar();
	}
	public void actionPerformed(ActionEvent arg0) {
		if (arg0.getSource() == cboFinA�o) {
			actionPerformedCboFinA�o(arg0);
		}
		if (arg0.getSource() == cboFinMes) {
			actionPerformedCboFinMes(arg0);
		}
		if (arg0.getSource() == cboFinDia) {
			actionPerformedCboFinDia(arg0);
		}
		if (arg0.getSource() == cboInicioA�o) {
			actionPerformedCboInicioA�o(arg0);
		}
		if (arg0.getSource() == cboInicioMes) {
			actionPerformedCboInicioMes(arg0);
		}
		if (arg0.getSource() == cboInicioDia) {
			actionPerformedCboInicioDia(arg0);
		}
		if (arg0.getSource() == btnVolver) {
			actionPerformedBtnVolver(arg0);
		}		
	}
	protected void actionPerformedCboInicioDia(ActionEvent arg0) {
		filtrar();
	}
	protected void actionPerformedCboInicioMes(ActionEvent arg0) {
		filtrar();
	}
	protected void actionPerformedCboInicioA�o(ActionEvent arg0) {
		filtrar();
	}
	protected void actionPerformedCboFinDia(ActionEvent arg0) {
		filtrar();
	}
	protected void actionPerformedCboFinMes(ActionEvent arg0) {
		filtrar();
	}
	protected void actionPerformedCboFinA�o(ActionEvent arg0) {
		filtrar();
	}
	protected void actionPerformedBtnVolver(ActionEvent arg0) {
		dispose();
	}
	//  M�todos tipo void (sin par�metros)
	void colocarDiaActual() {
		Calendar calendario = new GregorianCalendar();
		cboFinDia.setSelectedIndex(calendario.get(Calendar.DAY_OF_MONTH)-1);
	}
	void colocarMesActual() {
		Calendar calendario = new GregorianCalendar();
		cboFinMes.setSelectedIndex(calendario.get(Calendar.MONTH));
	}
	void filtrar() {
		int inicio = Fecha.getFecha(cboInicioDia, cboInicioMes, cboInicioA�o),
		    fin = Fecha.getFecha(cboFinDia, cboFinMes, cboFinA�o),
		    inicioAtencion, finAtencion;
		Incidencia x;
		txtS.setText("");
		for (int i=0; i<ProyectoDemo_AED.ai.tama�o(); i++) {
			x = ProyectoDemo_AED.ai.obtener(i);
			inicioAtencion = x.getFechaInicioAtencion();
			finAtencion = x.getFechaFinAtencion();
			if (inicio <= inicioAtencion  &&  fin >= finAtencion) {
				imprimir("Fecha de inicio de atenci�n          :  " + Lib.formatoFecha(inicioAtencion));
				imprimir("Fecha de fin de atenci�n             :  " + Lib.formatoFecha(finAtencion));
				imprimir("C�digo de usuario                    :  " + x.getCodigoUsuario());
				imprimir("C�digo del tipo de incidencia        :  " + x.getCodigoTipoIncidencia());
				imprimir("C�digo de especialista               :  " + x.getCodigoEspecialista());
				imprimir("C�digo de incidencia                 :  " + x.getCodigo());
				imprimir("Descripci�n                          :  " + x.getDescripcion());
				imprimir("Comentario                           :  " + x.getComentario());
				imprimir("Tiempo estimado de soluci�n en horas :  " + x.getTiempoEstimadoSolucion());
				imprimir("Tiempo real de soluci�n en horas     :  " + x.getTiempoRealSolucion());
				imprimir("Fecha de registro                    :  " + Lib.formatoFecha(x.getFechaRegistro()));
				imprimir("Estado                               :  " + Lib.tiposDeIncidencia[x.getEstado()]); 
				imprimir("------------------------------------------------------------------------------");
			}
		}
	}
	//  M�todos tipo void (con par�metros)
	void imprimir(String s) {
		txtS.append(s + "\n"); 
	}
	
}