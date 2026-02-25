<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List All Pets (View)</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="bg-emerald-900 p-12">
    <h1 class="p-2 text-emerald-300 text-4xl text-center my-8 pt-8">List All Pets (View)</h1>
    <div class="overflow-x-auto rounded-box border border-base-content/5 bg-base-100">
        <table class="table bg-emerald-100">
            <!-- head -->
            <thead>
                <tr class="bg-emerald-950 text-emerald-100">
                    <th>Id</th>
                    <th>Name</th>
                    <th>Kind</th>
                    <th>Breed</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- row 1 -->
                @foreach ($pets as $pet)
                <tr class="even:bg-emerald-200">
                    <th>{{ $pet->id }}</th>
                    <td>{{ $pet->name }}</td>
                    <td>{{ $pet->kind }}</td>
                    <td>{{ $pet->breed }}</td>
                    <td>
                        <a class="btn btn-xs bg-emerald-300 text-emerald-100 flex py-4 w-[50px] hover:bg-emerald-400 scale:90 hover:scale-110 transition-all" 
                        href="{{ url('view/pet/'. $pet->id) }}"> 
                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="#000000" viewBox="0 0 256 256"><path d="M237.2,151.87v0a47.1,47.1,0,0,0-2.35-5.45L193.26,51.8a7.82,7.82,0,0,0-1.66-2.44,32,32,0,0,0-45.26,0A8,8,0,0,0,144,55V80H112V55a8,8,0,0,0-2.34-5.66,32,32,0,0,0-45.26,0,7.82,7.82,0,0,0-1.66,2.44L21.15,146.4a47.1,47.1,0,0,0-2.35,5.45v0A48,48,0,1,0,112,168V96h32v72a48,48,0,1,0,93.2-16.13ZM76.71,59.75a16,16,0,0,1,19.29-1v73.51a47.9,47.9,0,0,0-46.79-9.92ZM64,200a32,32,0,1,1,32-32A32,32,0,0,1,64,200ZM160,58.74a16,16,0,0,1,19.29,1l27.5,62.58A47.9,47.9,0,0,0,160,132.25ZM192,200a32,32,0,1,1,32-32A32,32,0,0,1,192,200Z"></path></svg>
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>

</html>