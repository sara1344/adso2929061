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

    <h1 class="textt-4xl text-center font-bold">MVC</h1>
    <small class="block text-center">Model | View | Controller </small>


    <h2 class="my-10 text-center text-xl font-bold ">The Pokémon you inquired about is the <?= htmlspecialchars($data['name']) ?></h2>
    <table >
        <div class="overflow-x-auto rounded-box border border-base-content/5 bg-base-100  mx-auto">
            <table class="table table-zebra bg-[#e8c7e98a] text-black ">
                <thead class="bg-[#b241b48a] text-white ">
                    <th class="w-1/8 ">ID</th>
                    <th class="w-1/8">Name</th>
                    <th class="w-1/8">Type</th>
                    <th class="w-1/8">Strenht</th>
                    <th class="w-1/8">Speed</th>
                    <th class="w-1/8">Accuracy</th>
                    <th class="w-1/8">Trainer</th>
                </thead>
<tbody>
    <tr>
        <td>
            <?= htmlspecialchars($data['id']) ?>
        </td>
        <td>
            <?= htmlspecialchars($data['name']) ?>
        </td>
        <td>
            <?= htmlspecialchars($data['type']) ?>
        </td>
        <td>
            <?= htmlspecialchars($data['strenght']) ?>
        </td>
        <td>
            <?= htmlspecialchars($data['speed']) ?>
        </td>
        <td>
            <?= htmlspecialchars($data['accuracy']) ?>
        </td>
        <td>
            <?= htmlspecialchars($data['tname']) ?>
        </td>
    </tr>
</tbody>

        </div>
    </table>
</body>

</html>