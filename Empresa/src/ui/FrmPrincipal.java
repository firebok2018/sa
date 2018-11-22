package ui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JInternalFrame;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JDesktopPane;
import javax.swing.ImageIcon;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

public class FrmPrincipal extends JFrame implements ActionListener {

	
	private JPanel contentPane;
	private JMenuBar menuBar;
	private JMenu mnArchivo;
	private JMenu mnConfiguracn;
	private JMenu mnActualizacin;
	private JMenu mnRegistro;
	private JMenuItem mntmProductos;
	private JMenu mnVenta;
	private JMenuItem mntmProductos_1;
	private JMenu mnConsultas;
	private JMenuItem mntmClientes;
	private JMenuItem mntmNewMenuItem_1;
	private  JDesktopPane conte;
	private JMenuItem mntmCerrarSesion;
	private JMenuItem mntmCliente;
	private JMenuItem mntmSalir;
	private JMenuItem mntmMesa;
	private JMenuItem mntmConfigurarCuentas;
	private JMenu mnGenerarComprobante;
	private JMenuItem mntmBoleta;
	private JMenuItem mntmMesa_1;
	


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel("com.jtattoo.plaf.fast.FastLookAndFeel");
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException
				| UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrmPrincipal frame = new FrmPrincipal();
					frame.setLocationRelativeTo(frame);
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
	}

	/**
	 * Create the frame.
	 */
	public FrmPrincipal() {
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 870, 600);
		
		menuBar = new JMenuBar();
		setJMenuBar(menuBar);
		
		mnArchivo = new JMenu("Archivo");
		mnArchivo.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/folder.png")));
		menuBar.add(mnArchivo);
		
		mntmCerrarSesion = new JMenuItem("Cerrar Sesion");
		mntmCerrarSesion.addActionListener(this);
		mntmCerrarSesion.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/logout.png")));
		mnArchivo.add(mntmCerrarSesion);
		
		mntmSalir = new JMenuItem("Salir");
		mntmSalir.addActionListener(this);
		mntmSalir.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/cerrar.png")));
		mnArchivo.add(mntmSalir);
		
		mnActualizacin = new JMenu("Actualizaci\u00F3n");
		mnActualizacin.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/synchronize.png")));
		menuBar.add(mnActualizacin);
		
		mntmProductos = new JMenuItem("Productos");
		mntmProductos.addActionListener(this);
		
		mntmMesa = new JMenuItem("Mesa");
		mntmMesa.addActionListener(this);
		mnActualizacin.add(mntmMesa);
		mnActualizacin.add(mntmProductos);
		
		mnRegistro = new JMenu("Registro");
		mnRegistro.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/list.png")));
		mnRegistro.addActionListener(this);
		menuBar.add(mnRegistro);
		
		mntmCliente = new JMenuItem("Cliente");
		mntmCliente.addActionListener(this);
		
		mntmMesa_1 = new JMenuItem("Mesa");
		mntmMesa_1.addActionListener(this);
		mnRegistro.add(mntmMesa_1);
		mnRegistro.add(mntmCliente);
		
		mnVenta = new JMenu("Venta");
		mnVenta.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/shop.png")));
		menuBar.add(mnVenta);
		
		mntmProductos_1 = new JMenuItem("Productos");
		mntmProductos_1.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/engineering.png")));
		mntmProductos_1.addActionListener(this);
		mnVenta.add(mntmProductos_1);
		
		mnConfiguracn = new JMenu("Configurac\u00F3n");
		mnConfiguracn.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/settings.png")));
		menuBar.add(mnConfiguracn);
		
		mntmConfigurarCuentas = new JMenuItem("Configurar Cuentas");
		mntmConfigurarCuentas.addActionListener(this);
		mnConfiguracn.add(mntmConfigurarCuentas);
		
		mnConsultas = new JMenu("Consultas");
		mnConsultas.setHorizontalAlignment(SwingConstants.LEFT);
		mnConsultas.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/questions.png")));
		menuBar.add(mnConsultas);
		
		mntmClientes = new JMenuItem("Clientes");
		mntmClientes.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/manager.png")));
		mntmClientes.addActionListener(this);
		mnConsultas.add(mntmClientes);
		
		mntmNewMenuItem_1 = new JMenuItem("Facturas");
		mntmNewMenuItem_1.setIcon(new ImageIcon(FrmPrincipal.class.getResource("/imagen/boleta o factura.png")));
		mnConsultas.add(mntmNewMenuItem_1);
		
		mnGenerarComprobante = new JMenu("Generar Comprobante");
		menuBar.add(mnGenerarComprobante);
		
		mntmBoleta = new JMenuItem("Boleta");
		mnGenerarComprobante.add(mntmBoleta);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		conte = new JDesktopPane();
		conte.setEnabled(false);
		conte.setBounds(0, 0, 864, 548);
		contentPane.add(conte);
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == mntmMesa_1) {
			actionPerformedMntmMesa_1(e);
		}
		if (e.getSource() == mntmConfigurarCuentas) {
			actionPerformedMntmConfigurarCuentas(e);
		}
		if (e.getSource() == mntmMesa) {
			actionPerformedMntmMesa(e);
		}
		if (e.getSource() == mntmSalir) {
			actionPerformedMntmSalir(e);
		}
		if (e.getSource() == mntmCerrarSesion) {
			actionPerformedMntmCerrarSesion(e);
		}
		if (e.getSource() == mntmCliente) {
			actionPerformedMntmCliente(e);
		}
		if (e.getSource() == mntmClientes) {
			actionPerformedMntmClientes(e);
		}
		if (e.getSource() == mntmProductos_1) {
			actionPerformedMntmProductos_1(e);
		}
		
		if (e.getSource() == mntmProductos) {
			actionPerformedMntmProductos(e);
		}
	}
	
	protected void actionPerformedMntmProductos(ActionEvent e) {
		
		JIFProductos jdp =new JIFProductos();
		//conte.add(jdp);
		center(jdp);
	
	}
	
	protected void actionPerformedMntmProductos_1(ActionEvent e) {
		JIFVenta jdv= new JIFVenta();
		//conte.add(jdv);
		center(jdv);		
	}
	protected void actionPerformedMntmClientes(ActionEvent e) {
JIFClientes clientes= new JIFClientes();
		
		center(clientes);	
		
	}
	protected void actionPerformedMntmCliente(ActionEvent e) {
		
		
		JIFRegisCliente jrc= new JIFRegisCliente();
		center(jrc);
	}
	void center(JInternalFrame f){
		
		Dimension size = conte.getSize();
		Dimension fSize=f.getSize();
		f.setLocation((size.width-fSize.width)/2,(size.height-fSize.height)/2);
		f.show();
		
		boolean countView=true;
		String nombre = f.getTitle();
		
		
		for (int i = 0; i < conte.getComponentCount(); i++) {
			if (f.getClass().isInstance(conte.getComponent(i))) {
				JOptionPane.showMessageDialog(null,"Cierre la Ventana " +nombre +" e Intentente Nuevamente");
				f.toFront();
				conte.moveToFront(f);
				countView=false;
			}
	
		}
		if (countView && f != null) {
			conte.add(f);
		}
		f.show();
	}
	
	

	
	protected void actionPerformedMntmCerrarSesion(ActionEvent e) {
		this.dispose();
		JIFSign_In signin= new JIFSign_In();
		signin.setLocationRelativeTo(signin);
		signin.setVisible(true);
	}
	protected void actionPerformedMntmSalir(ActionEvent e) {
		System.exit(0);
	}
	protected void actionPerformedMntmMesa(ActionEvent e) {
		FrmAgregarMesa mesa= new FrmAgregarMesa();
		center(mesa);
	}
	protected void actionPerformedMntmConfigurarCuentas(ActionEvent e) {
		JDSign_up signup = new JDSign_up();
		center(signup);
	}
	protected void actionPerformedMntmMesa_1(ActionEvent e) {
		FrmElegirMesa re= new FrmElegirMesa();
		center(re);
	}
}
