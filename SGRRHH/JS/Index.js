// index.js

document.getElementById('loginForm').addEventListener('submit', async (event) => {
    event.preventDefault(); // Evita el comportamiento por defecto del formulario

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    try {
        const response = await fetch('http://localhost:3000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        const result = await response.json();
        
        if (response.ok) {
            // Redirige al usuario a la página principal o muestra un mensaje de éxito
            window.location.href = '/dashboard.html'; // Cambia esto según tu estructura de rutas
        } else {
            // Muestra el mensaje de error
            document.getElementById('message').textContent = result.error;
        }
    } catch (error) {
        console.error('Error:', error);
        document.getElementById('message').textContent = 'Error en la conexión con el servidor';
    }
});
