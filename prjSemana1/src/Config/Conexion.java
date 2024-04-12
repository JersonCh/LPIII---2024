/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;

/**
 *
 * @author HP
 */
import java.sql.*; // cambiamos este import para que no haya errores con Drivermanager
// en internet hay muchas formas de conectarnos a Base de datos , esta solo es una.
//import com.sun.jdi.connect.spi.Connection;
public class Conexion {
    Connection con=null;
    public Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            //driver de conexion a mysql
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dbpractica","root",""); // en dbpractica ahi va el nombre de la base de datos.
         //conexion a la base de datos con los parametros de conexion
         System.out.println("Se conecto a BD "+ con);
        }catch(ClassNotFoundException|SQLException e){
            System.out.println("Error conexion"+e.getMessage());
        }
    }
    public Connection getConnection(){
     return con;   
    }
}
