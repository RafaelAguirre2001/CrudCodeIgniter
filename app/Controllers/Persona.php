<?php 
namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\m_persona;
class Persona extends Controller{

    public function index()
    {

        $per = new m_persona();
        $datos['personas']=$per->findAll();
        return view('welcome_message',$datos);
    }

    public function agregar()
    {

        
        return view('agregar');
    }
    public function insertar()
    {
       
        $per = new m_persona();

        $data=[
            'dni' => $_POST['dni'],
            'nombre' => $_POST['nombre'],
            'apellidos' => $_POST['apellidos'],
            'telefono' => $_POST['telefono'],
            'correo' => $_POST['correo'],
            'direccion' => $_POST['direccion'],
            'fecha' => $_POST['fecha'],
            'estado' => $_POST['estado'],
        ];

        $per->insert($data);
        return redirect()->to(base_url());
       
        

        
    }
    public function eliminar($id=null)
    {
        
      

       $per = new m_persona();
        $per->delete($id);

        
        return redirect()->to(base_url());
    }
    public function editar($id = null)
    {

        $per = new m_persona();
        $registro['persona']= $per->find($id);

      return view('actualizando',$registro);
     


       // return redirect()->to(base_url());
    }
    public function factualizar()
    {

        $per = new m_persona();
        $id= $_POST['id'];

        $data = [
            'dni' => $_POST['dni'],
            'nombre' => $_POST['nombre'],
            'apellidos' => $_POST['apellido'],
            'telefono' => $_POST['telefono'],
            'correo' => $_POST['correo'],
            'direccion' => $_POST['direccion'],
            'fecha' => $_POST['fecha'],
            'estado' => $_POST['estado']
        ];
        $per->update($id,$data);

        



       return redirect()->to(base_url());
    }





}