package ui;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.Console;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

import ConexionDatabase.ConexionMesa;
import model.Mesa;
import utils.Conexion;

import javax.swing.JComboBox;
import javax.swing.JButton;

public class FrmElegirMesa extends JInternalFrame implements ActionListener {
	private JLabel label;
	private JTextField txtSilla;
	private JComboBox cboEstado;
	private JComboBox cboMesa;
	private JButton button;
	private JButton button_1;
	
	ConexionMesa con= new ConexionMesa();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrmElegirMesa frame = new FrmElegirMesa();
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
	public FrmElegirMesa() {
		setBounds(100, 100, 450, 300);
		getContentPane().setLayout(null);
		
		label = new JLabel("Mesa");
		label.setBounds(26, 15, 46, 14);
		getContentPane().add(label);
		
		txtSilla = new JTextField();
		
		txtSilla.setColumns(10);
		txtSilla.setBounds(75, 50, 54, 20);
		getContentPane().add(txtSilla);
		
		cboEstado = new JComboBox();
		cboEstado.setBounds(193, 12, 91, 20);
		getContentPane().add(cboEstado);
		
		
		cboMesa = new JComboBox();
		cboMesa.setBounds(75, 12, 69, 20);
		getContentPane().add(cboMesa);
		cboMesa.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				//con.numero_de_Mesa(txtSilla, cboMesa.getSelectedIndex());
				Connection con= null;
				Statement st= null;
				 CallableStatement cst= null;
				 ResultSet rs= null;
				 
				try {
					
					String s= cboMesa.getSelectedItem().toString().trim();
					int c= Integer.parseInt(s);
					con= new Conexion().getConexion();
					st= con.createStatement();
					rs=st.executeQuery("select (numSillas) from NumMesa where numMesa="+c);
					while (rs.next()) {
						System.out.println(new Mesa(rs.getInt(1))+s);
						txtSilla.setText(new Mesa(rs.getInt(1)).toString());
						
					}
				} catch (SQLException e2) {
					// TODO: handle exception
					System.out.println("Error de mostrar sillas");
				}catch (Exception e2) {
					// TODO: handle exception
					System.out.println("Error");
				}finally{
					try {
						con.close();
						st.close();
						rs.close();
						//rs.close();
					} catch (SQLException e4) {
						// TODO Auto-generated catch block
						e4.printStackTrace();
					}
				}
				
				 
			}
		});
		
		button = new JButton("Actualizar");
		button.setBounds(321, 11, 89, 23);
		getContentPane().add(button);
		
		button_1 = new JButton("Cerrar");
		button_1.addActionListener(this);
		button_1.setBounds(321, 49, 89, 23);
		getContentPane().add(button_1);
		
		
		
		con.numeroMesa(cboMesa);
		con.EstadoMesa(cboEstado);
		

	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == button_1) {
			actionPerformedButton_1(e);
		}
	}
	protected void actionPerformedButton_1(ActionEvent e) {
		dispose();
	}
}
