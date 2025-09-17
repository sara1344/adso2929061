const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

canvas.width = 402; // Ancho del juego
canvas.height = 721; // Alto del juego

let gameState = 'start'; // 'start' o 'game' o 'gameOver'

// Variables del jugador (pollo)
let player = {
    x: canvas.width / 2, // Posición inicial X
    y: canvas.height - 100, // Posición inicial Y
    width: 50, // Ancho del pollo
    height: 50, // Alto del pollo
    speed: 5,
    lives: 3,
    energy: 100
};

// Arrays para los objetos en movimiento
let cars = [];
let corns = [];
let gameLoopInterval;
let energyDrainInterval;

// Carga de imágenes
const chickenImg = new Image();
const carImg = new Image();
const cornImg = new Image();
const heartImg = new Image();
const skullImg = new Image();
const gameOverImg = new Image();

// Asigna las fuentes de las imágenes que ya tienes en tu carpeta
chickenImg.src = 'images/28/pollo-amarillo.png';
carImg.src = 'images/28/carro-rojo.png';
cornImg.src = 'images/28/maiz.png';
heartImg.src = 'images/28/corazon.png';
skullImg.src = 'images/28/muerte.png';
gameOverImg.src = 'images/28/game-over.png';

function drawPlayer() {
    ctx.drawImage(chickenImg, player.x, player.y, player.width, player.height);
}

function drawCars() {
    for (const car of cars) {
        ctx.drawImage(carImg, car.x, car.y, car.width, car.height);
    }
}

function drawCorns() {
    for (const corn of corns) {
        ctx.drawImage(cornImg, corn.x, corn.y, corn.width, corn.height);
    }
}

function drawUI() {
    // Dibuja la barra de energía
    ctx.fillStyle = 'green';
    ctx.fillRect(10, 10, player.energy, 20);

    // Dibuja los corazones
    for (let i = 0; i < player.lives; i++) {
        // Ajusta las coordenadas y el tamaño de los corazones según el diseño de tu UI
        ctx.drawImage(heartImg, canvas.width - (30 * (i + 1)), 10, 20, 20);
    }
}

function update() {
    // Mover carros
    for (const car of cars) {
        car.y += car.speed;
    }

    // Mover maíces
    for (const corn of corns) {
        corn.y += corn.speed;
    }

    // Lógica de colisión
    // Pollo vs. Carro
    for (let i = cars.length - 1; i >= 0; i--) {
        const car = cars[i];
        if (checkCollision(player, car)) {
            player.lives--;
            cars.splice(i, 1); // Elimina el carro después de la colisión
            if (player.lives <= 0) {
                endGame();
            }
        }
    }

    // Pollo vs. Maíz
    for (let i = corns.length - 1; i >= 0; i--) {
        const corn = corns[i];
        if (checkCollision(player, corn)) {
            player.energy = Math.min(100, player.energy + 10); // Aumenta energía
            corns.splice(i, 1); // Elimina el maíz
        }
    }
}

function checkCollision(obj1, obj2) {
    return obj1.x < obj2.x + obj2.width &&
           obj1.x + obj1.width > obj2.x &&
           obj1.y < obj2.y + obj2.height &&
           obj1.y + obj1.height > obj2.y;
}

// Movimiento del pollo con las flechas del teclado
document.addEventListener('keydown', (e) => {
    if (gameState === 'game') {
        if (e.key === 'ArrowLeft') {
            player.x -= player.speed;
        } else if (e.key === 'ArrowRight') {
            player.x += player.speed;
        }
        // Asegurarse de que el pollo no salga de los límites de la carretera
        player.x = Math.max(0, Math.min(canvas.width - player.width, player.x));
    }
});

// Botón de "PLAY"
const playButton = document.querySelector('.btn-play');
playButton.addEventListener('click', () => {
    startGame();
});

function startGame() {
    gameState = 'game';
    // Reinicia las variables
    player.lives = 3;
    player.energy = 100;
    cars = [];
    corns = [];
    
    // Oculta la primera vista y muestra la segunda
    document.querySelector('.primeraVista').style.display = 'none';
    document.querySelector('.segundaVista').style.display = 'block';

    // Inicia el bucle de juego y el drenaje de energía
    gameLoopInterval = setInterval(gameLoop, 1000 / 60); // 60 FPS
    energyDrainInterval = setInterval(drainEnergy, 3000);
    
    // Inicia la generación de autos y maíz
    setInterval(spawnCar, 2000);
    setInterval(spawnCorn, 5000);
}

function endGame() {
    gameState = 'gameOver';
    clearInterval(gameLoopInterval);
    clearInterval(energyDrainInterval);
    
    // Muestra la imagen de "Game Over"
    ctx.drawImage(gameOverImg, canvas.width / 2 - 100, canvas.height / 2 - 50, 200, 100);

    // Redirige después de 3 segundos
    setTimeout(() => {
        gameState = 'start';
        document.querySelector('.primeraVista').style.display = 'block';
        document.querySelector('.segundaVista').style.display = 'none';
    }, 3000);
}

function drainEnergy() {
    player.energy -= 1;
    if (player.energy <= 0) {
        endGame();
    }
}

// Bucle principal del juego
function gameLoop() {
    if (gameState === 'game') {
        // Dibuja el fondo de la carretera (puedes usar un patrón)
        // Dibuja los elementos del juego
        drawUI();
        drawPlayer();
        drawCars();
        drawCorns();

        // Actualiza las posiciones y la lógica
        update();
    }
}

function spawnCar() {
    const car = {
        x: Math.random() * (canvas.width - 50),
        y: -50,
        width: 50,
        height: 100,
        speed: Math.random() * 2 + 1
    };
    cars.push(car);
}

function spawnCorn() {
    const corn = {
        x: Math.random() * (canvas.width - 50),
        y: -50,
        width: 30,
        height: 30,
        speed: Math.random() * 2 + 1
    };
    corns.push(corn);
}

// Llama a la función para cargar la pantalla de inicio al principio
window.onload = () => {
    document.querySelector('.primeraVista').style.display = 'block';
    document.querySelector('.segundaVista').style.display = 'none';
}; 