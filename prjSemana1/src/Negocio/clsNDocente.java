/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

// luego de haber creado el archivo de conexion a lña BD debemos importar los siguientes de abajo.
import Config.Conexion;
import Entidad.clsEDocente;
import java.sql.*;

public class clsNDocente {
    Connection con; //para llamar a la cadena de conexion
    Conexion cn=new Conexion(); // para establecer la conexion   
    PreparedStatement ps; //la clase preparedstatement permite ejecutar consultas en la BD para posteriormente ser guardado en RS
    
    ResultSet rs;//almacena datos de la consulta que hacer preparedstatement 
    Statement st;
   // clsEDocente  D=new clsEDocente();
    
    
    public ResultSet Cargarcursos() {
        clsEDocente objEd = new clsEDocente(); 
        System.out.println("El dni del docente es: "+objEd.getDni());
        ResultSet rs=null;
                    String SQL = "select id_curso,nombre_curso from tbcurso where dni_doc='"+objEd.getDni()+"'";


                              System.out.println("sentencia " + SQL); //verificamos que este bien echa LA CONSULTA , OSEA IMPRIME LA CONSULTA 

                       try{
                          con=(Connection) cn.getConnection();
                          ps=con.prepareStatement(SQL);
                          rs=ps.executeQuery();
                             return rs;
                      }catch(SQLException e){
                          System.out.println("Error al realizar la consulta sql"+e.toString());
                          return rs;
                      } 
    }

   public ResultSet  MtdValidarLogin(clsEDocente objEd)
           {
                    ResultSet rs=null;
                    String SQL = "select * from tbdocente where dni='"+objEd.getDni()+"'"
                            + " and clave= '"+objEd.getClave()+"';";


                              System.out.println("sentencia " + SQL); //verificamos que este bien echa LA CONSULTA , OSEA IMPRIME LA CONSULTA 

                       try{
                          con=(Connection) cn.getConnection();
                          ps=con.prepareStatement(SQL);
                          rs=ps.executeQuery();
                             return rs;
                      }catch(SQLException e){
                          System.out.println("Error al realizar la consulta sql"+e.toString());
                          return rs;
                      } 
         }
            
}
