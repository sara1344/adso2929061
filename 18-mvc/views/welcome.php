<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MVC: Model | View | Controller</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="bg-[#8114838a] min-h-[100dvh] text-white p-10">
    <h1 class="textt-4xl text-center font-bold">MVC</h1>
    <small class="block text-center">Model | View | Controller </small>

    <h2 class="my-10 text-center text-xl font-bold ">List Pokemons</h2>
    <a href="views/add.php" class="btn btn-success flex mx-auto w-[200px] my-4 border-b-1"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#000000" viewBox="0 0 256 256">
            <path d="M32,64a8,8,0,0,1,8-8H216a8,8,0,0,1,0,16H40A8,8,0,0,1,32,64Zm8,72H216a8,8,0,0,0,0-16H40a8,8,0,0,0,0,16Zm104,48H40a8,8,0,0,0,0,16H144a8,8,0,0,0,0-16Zm88,0H216V168a8,8,0,0,0-16,0v16H184a8,8,0,0,0,0,16h16v16a8,8,0,0,0,16,0V200h16a8,8,0,0,0,0-16Z"></path>
        </svg> Add Pokemons</a>

    <div class="overflow-x-auto rounded-box border border-base-content/5 bg-base-100 ">
        <table class="table table-zebra bg-[#e8c7e98a] text-black " >
            <thead class="bg-[#b241b48a] text-white ">
                <th class="w-1/4 ">ID</th>
                <th class="w-1/4">Name</th>
                <th class="w-1/4">Type</th>
                <th class="w-1/4">Actions</th>
            </thead>
            <tbody>
                <?php foreach ($data as $pokemon): ?>
                    <tr>
                        <td><?= htmlspecialchars($pokemon['id']) ?></td>
                        <td><?= htmlspecialchars($pokemon['name']) ?></td>
                        <td><?= htmlspecialchars($pokemon['type']) ?></td>
                        <td>
                            <a href="consult/<?= $pokemon['id']?>" class="btn  left mx-[10px] w-[50px] my-4 bg-white border-green-400 shadow-xl border-b-1"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#000000" viewBox="0 0 256 256">
                                    <path d="M176,32c-20.61,0-38.28,18.16-48,45.85C118.28,50.16,100.61,32,80,32c-31.4,0-56,42.17-56,96s24.6,96,56,96c20.61,0,38.28-18.16,48-45.85,9.72,27.69,27.39,45.85,48,45.85,31.4,0,56-42.17,56-96S207.4,32,176,32ZM106.92,186.39C99.43,200.12,89.62,208,80,208s-19.43-7.88-26.92-21.61a104.81,104.81,0,0,1-10.24-29.23,32,32,0,1,0,0-58.32A104.81,104.81,0,0,1,53.08,69.61C60.57,55.88,70.38,48,80,48s19.43,7.88,26.92,21.61C115.35,85.07,120,105.81,120,128S115.35,170.93,106.92,186.39ZM40,128a16,16,0,1,1,16,16A16,16,0,0,1,40,128Zm162.92,58.39C195.43,200.12,185.62,208,176,208s-19.43-7.88-26.92-21.61a104.81,104.81,0,0,1-10.24-29.23,32,32,0,1,0,0-58.32,104.81,104.81,0,0,1,10.24-29.23C156.57,55.88,166.38,48,176,48s19.43,7.88,26.92,21.61C211.35,85.07,216,105.81,216,128S211.35,170.93,202.92,186.39ZM136,128a16,16,0,1,1,16,16A16,16,0,0,1,136,128Z"></path>
                                </svg></a>
                            <a href="edit/<?= $pokemon['id']?>" class="btn center mx-[10px] w-[50px] my-4 bg-white shadow-xl border-blue-400 border-b-1"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#000000" viewBox="0 0 256 256">
                                    <path d="M253.66,106.34a8,8,0,0,0-11.32,0L192,156.69,107.31,72l50.35-50.34a8,8,0,1,0-11.32-11.32L96,60.69A16,16,0,0,0,93.18,79.5L72,100.69a16,16,0,0,0,0,22.62L76.69,128,18.34,186.34a8,8,0,0,0,3.13,13.25l72,24A7.88,7.88,0,0,0,96,224a8,8,0,0,0,5.66-2.34L136,187.31l4.69,4.69a16,16,0,0,0,22.62,0l21.19-21.18A16,16,0,0,0,203.31,168l50.35-50.34A8,8,0,0,0,253.66,106.34ZM93.84,206.85l-55-18.35L88,139.31,124.69,176ZM152,180.69,83.31,112,104,91.31,172.69,160Z"></path>
                                </svg></a>
                            <a href="delete<?= $pokemon['id']?>" class="btn right mx-[10px] w-[50px] my-4 bg-red-400 shadow-xl border-red-500 border-b-1"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#000000" viewBox="0 0 256 256">
                                    <path d="M216,40H68.53a16.08,16.08,0,0,0-13.72,7.77L9.14,123.88a8,8,0,0,0,0,8.24l45.67,76.11A16.08,16.08,0,0,0,68.53,216H216a16,16,0,0,0,16-16V56A16,16,0,0,0,216,40ZM61.67,204.12,68.53,200h0ZM216,200H68.53l-43.2-72,43.2-72H216ZM106.34,146.34,124.69,128l-18.35-18.34a8,8,0,0,1,11.32-11.32L136,116.69l18.34-18.35a8,8,0,0,1,11.32,11.32L147.31,128l18.35,18.34a8,8,0,0,1-11.32,11.32L136,139.31l-18.34,18.35a8,8,0,0,1-11.32-11.32Z"></path>
                                </svg></a>

                        </td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    </div>
</body>

</html>