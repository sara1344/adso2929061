<?php
$pokemon = $data['pokemon'];
$trainers = $data['trainers'];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <nav>
        <a href="../index.php" class="btn bg-[#b241b48a] flex  w-[50px] h-[30px] my-4 border-b-1">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                <path fill="#ffffff" d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z" />
            </svg>
        </a>
    </nav>
    <title>MVC: Model | View | Controller</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="bg-[#8114838a] min-h-[100dvh] text-white p-10">

    <h1 class="textt-4xl text-center ">MVC</h1>
    <small class="block text-center">Model | View | Controller </small>


    <h2 class="my-10 text-center text-xl  ">Edit your pokemon</h2>

<body class="bg-[#8114838a] min-h-screen text-white p-10">


    <!-- FORMULARIO -->
    <div class="flex justify-center mt-10">

        <form 
            action="/edit/<?= htmlspecialchars($pokemon['id']) ?>" 
            method="POST"
            class="bg-[#e8c7e98a] text-black p-8 rounded-xl shadow-xl w-full max-w-xl space-y-4">

            <div>
                <label class="text-white">ID</label>
                <input type="text"
                    name="id"
                    value="<?= htmlspecialchars($pokemon['id']) ?>"
                    class="input input-bordered w-full text-[#2f03308a]"
                    readonly>
            </div>

            <!-- NAME -->
            <div>
                <label class="text-white">Name</label>
                <input type="text"
                    name="name"
                    value="<?= htmlspecialchars($pokemon['name']) ?>"
                    class="input input-bordered w-full text-[#2f03308a]"
                    required>
            </div>

            <!-- TYPE -->
            <div>
                <label class="text-white">Type</label>
                <input type="text"
                    name="type"
                    value="<?= htmlspecialchars($pokemon['type']) ?>"
                    class="input input-bordered w-full text-[#2f03308a]"
                    required>
            </div>

            <!-- STRENGHT -->
            <div>
                <label class="text-white">Strenght</label>
                <input type="number"
                    name="strenght"
                    value="<?= htmlspecialchars($pokemon['strenght']) ?>"
                    class="input input-bordered w-full text-[#2f03308a]"
                    required>
            </div>

            <!-- SPEED -->
            <div>
                <label class="text-white">Speed</label>
                <input type="number"
                    name="speed"
                    value="<?= htmlspecialchars($pokemon['speed']) ?>"
                    class="input input-bordered w-full text-[#2f03308a]"
                    required>
            </div>

            <!-- ACCURACY -->
            <div>
                <label class="text-white">Accuracy</label>
                <input type="number"
                    name="accuracy"
                    value="<?= htmlspecialchars($pokemon['accuracy']) ?>"
                    class="input input-bordered w-full text-[#2f03308a]"
                    required>
            </div>

            <!-- TRAINER -->
            <div>
                <label class="text-white">Trainer</label>
                <select name="trainer_id" class="select select-bordered w-full text-[#2f03308a]">
                    <?php foreach($trainers as $trainer): ?>
                        <option 
                            value="<?= $trainer['id'] ?>"
                            <?= $trainer['id'] == $pokemon['trainer_id'] ? 'selected' : '' ?>
                        >
                            <?= htmlspecialchars($trainer['name']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <!-- BOTONES -->
            <div class="flex gap-4 pt-4">

                <!-- Guardar -->
                <button type="submit" class="btn   mx-[10px] w-[50px] my-4 bg-white border-green-400 shadow-xl border-b-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M219.31,72,184,36.69A15.86,15.86,0,0,0,172.69,32H48A16,16,0,0,0,32,48V208a16,16,0,0,0,16,16H208a16,16,0,0,0,16-16V83.31A15.86,15.86,0,0,0,219.31,72ZM168,208H88V152h80Zm40,0H184V152a16,16,0,0,0-16-16H88a16,16,0,0,0-16,16v56H48V48H172.69L208,83.31ZM160,72a8,8,0,0,1-8,8H96a8,8,0,0,1,0-16h56A8,8,0,0,1,160,72Z"></path></svg>
                </button>

                <!-- Vaciar -->
                <button type="reset" class="btn  mx-[10px] w-[50px] my-4 bg-white shadow-xl border-blue-400 border-b-1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#000000" viewBox="0 0 256 256"><path d="M235.5,216.81c-22.56-11-35.5-34.58-35.5-64.8V134.73a15.94,15.94,0,0,0-10.09-14.87L165,110a8,8,0,0,1-4.48-10.34l21.32-53a28,28,0,0,0-16.1-37,28.14,28.14,0,0,0-35.82,16,.61.61,0,0,0,0,.12L108.9,79a8,8,0,0,1-10.37,4.49L73.11,73.14A15.89,15.89,0,0,0,55.74,76.8C34.68,98.45,24,123.75,24,152a111.45,111.45,0,0,0,31.18,77.53A8,8,0,0,0,61,232H232a8,8,0,0,0,3.5-15.19ZM67.14,88l25.41,10.3a24,24,0,0,0,31.23-13.45l21-53c2.56-6.11,9.47-9.27,15.43-7a12,12,0,0,1,6.88,15.92L145.69,93.76a24,24,0,0,0,13.43,31.14L184,134.73V152c0,.33,0,.66,0,1L55.77,101.71A108.84,108.84,0,0,1,67.14,88Zm48,128a87.53,87.53,0,0,1-24.34-42,8,8,0,0,0-15.49,4,105.16,105.16,0,0,0,18.36,38H64.44A95.54,95.54,0,0,1,40,152a85.9,85.9,0,0,1,7.73-36.29l137.8,55.12c3,18,10.56,33.48,21.89,45.16Z"></path></svg>
                </button>

            </div>

        </form>

    </div>

</body>
</html>
