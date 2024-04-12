/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;
//----- importamos las librerias a utilizar

import Entidad.clsEAlumno;
// luego de haber creado el archivo de conexion a lña BD debemos importar los siguientes de abajo.
import Config.Conexion;
import java.sql.*;

public class clsNAlumno {
  //Aca en esta capa se define los metodos o acciones de una clase.
   // gaaaa
    Connection con; //para llamar a la cadena de conexion
    Conexion cn=new Conexion(); // para establecer la conexion   
    PreparedStatement ps; //la clase preparedstatement permite ejecutar consultas en la BD para posteriormente ser guardado en RS
    
    ResultSet rs;//almacena datos de la consulta que hacer preparedstatement 
    Statement st;
    clsEAlumno A=new clsEAlumno();//objeto alumno
    
  
    public void MtdModificar(clsEAlumno objAl)//lo que va dentro del parentesis esta recibiendo una clase dentro de un objeto , puede ir los atributos codigo,nombre,dni, digitar todos o reducir, con clsEALumno y llamara todos los atributos de esa clase
    {
        /*for (int i =0;i<FrmAlumno.con;i++){
            
        }*/
    }

    public boolean MtdGuardarAlumnito(clsEAlumno objAl) {
     
        String SQL = "INSERT INTO tbalumno(codigo,nombre,apellido,direccion,telefono) " + "VALUES('" + objAl.getCodigo() + "','" + objAl.getNombre() + "','" +
            objAl.getApellido() + "','" + objAl.getDireccion() + "','" + objAl.getTelefono() + "')";      
               
        System.out.println("sentencia " + SQL); //verificamos que este bien echa LA CONSULTA , OSEA IMPRIME LA CONSULTA 
        
         try{
            con=(Connection) cn.getConnection();
            st=con.createStatement();
            st.executeUpdate(SQL);
            return true;
        }catch(SQLException e){
            System.out.println("Error"+e.toString());
            return false;
        } 
        
    }

    public boolean MtdActualizarAlumno(clsEAlumno objAl) {
        String SQL = "UPDATE tbalumno SET "
            + "nombre = '"+objAl.getNombre()+"',"
            + "apellido = '"+objAl.getApellido()+"',"
            + "direccion = '"+objAl.getDireccion()+"',"
            + "telefono = '"+objAl.getTelefono()+"' "
            + "WHERE codigo = '" + objAl.getCodigo()+"'";
                                          
                System.out.println("sentencia " + SQL); //verificamos que este bien echa LA CONSULTA , OSEA IMPRIME LA CONSULTA 
        
         try{
            con=(Connection) cn.getConnection();
            st=con.createStatement();
            st.executeUpdate(SQL);
            return true;
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta sql"+e.toString());
            return false;
        } 
        // estas acciones solo funcionan en guardar para agregar,modificar y Eliminar
    }

    public boolean MtdEliminarAlumnocodigo(clsEAlumno objAl) {
        String SQL = "DELETE FROM tbalumno "
                + " where codigo= '"+objAl.getCodigo()+"'";
                                          
                System.out.println("sentencia " + SQL); //verificamos que este bien echa LA CONSULTA , OSEA IMPRIME LA CONSULTA 
        
         try{
            con=(Connection) cn.getConnection();
            st=con.createStatement();
            st.executeUpdate(SQL);
            return true;
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta sql"+e.toString());
            return false;
        } 
        
    }

    public ResultSet MtdListarAlumno() 
    {
     ResultSet rs=null;
     String sql="select codigo,nombre,apellido,direccion,telefono from tbalumno";
      try{
            con=(Connection) cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            return rs;
        }catch(SQLException e){
            System.out.println(" error "+e.toString());          
        }         
        return rs;   
    }

    public ResultSet MtdBuscarAlumnoCodigo(clsEAlumno objEA) {
      ResultSet rs=null; //variable local
        String sql=" select * from tbalumno where codigo='"+objEA.getCodigo()+"'";
        System.out.println("Sentencia"+sql);
                
        try{
            con=(Connection) cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            return rs; // si retorna un resultset
        } catch(SQLException e){
            System.out.println("Error"+e.toString());
        }
        return rs; // retorna un resultset nulo
    }
  
}
