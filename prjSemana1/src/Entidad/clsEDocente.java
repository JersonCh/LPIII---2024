/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;


public class clsEDocente {
    private static String dni ;
    private static String nombre;
    private static String apellido;
    private static String direccion;              
    private static String telefono;      
    private static int clave;
    
    public clsEDocente() {
    }

    public static String getDni() {
        return dni;
    }

    public static void setDni(String dni) {
        clsEDocente.dni = dni;
    }

    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        clsEDocente.nombre = nombre;
    }

    public static String getApellido() {
        return apellido;
    }

    public static void setApellido(String apellido) {
        clsEDocente.apellido = apellido;
    }

    public static String getDireccion() {
        return direccion;
    }

    public static void setDireccion(String direccion) {
        clsEDocente.direccion = direccion;
    }

    public static String getTelefono() {
        return telefono;
    }

    public static void setTelefono(String telefono) {
        clsEDocente.telefono = telefono;
    }

    public static int getClave() {
        return clave;
    }

    public static void setClave(int clave) {
        clsEDocente.clave = clave;
    }
    

   
    
}
