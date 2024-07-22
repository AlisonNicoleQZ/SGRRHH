// server.js

const express = require('express');
const { PrismaClient } = require('@prisma/client');

const app = express();
const prisma = new PrismaClient();

// Middleware para parsear JSON
app.use(express.json());

// Ruta para obtener todos los departamentos
app.get('/departamentos', async (req, res) => {
  try {
    const departamentos = await prisma.departamento.findMany();
    res.json(departamentos);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener los departamentos' });
  }
});

// Ruta para crear un nuevo departamento
app.post('/departamentos', async (req, res) => {
  try {
    const { nombre } = req.body;
    const nuevoDepartamento = await prisma.departamento.create({
      data: { nombre },
    });
    res.status(201).json(nuevoDepartamento);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear el departamento' });
  }
});

// Ruta para obtener todos los empleados
app.get('/empleados', async (req, res) => {
  try {
    const empleados = await prisma.empleado.findMany();
    res.json(empleados);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener los empleados' });
  }
});

// Ruta para crear un nuevo empleado
app.post('/empleados', async (req, res) => {
  try {
    const { nombre, apellido, correo, telefono, fechaContratacion, departamentoID, rolID } = req.body;
    const nuevoEmpleado = await prisma.empleado.create({
      data: {
        nombre,
        apellido,
        correo,
        telefono,
        fechaContratacion,
        departamentoID,
        rolID,
      },
    });
    res.status(201).json(nuevoEmpleado);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear el empleado' });
  }
});

// Configurar el puerto y levantar el servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

// Ruta para manejar el inicio de sesión
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    
    // Aquí iría la lógica para autenticar al usuario.
    // Esto es solo un ejemplo simple.
    try {
        const user = await prisma.empleado.findUnique({
            where: { correo: email }
        });

        if (user && user.contraseña === password) { // Reemplaza esto con tu lógica de autenticación
            res.status(200).json({ message: 'Inicio de sesión exitoso' });
        } else {
            res.status(401).json({ error: 'Correo o contraseña incorrectos' });
        }
    } catch (error) {
        res.status(500).json({ error: 'Error en el servidor' });
    }
});