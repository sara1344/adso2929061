    <?php
    class Controller
    {
        public $load;
        public $model;

        public function __construct()
        {
            $this->load = new Load;
            $this->model = new Model;

            $this->handleRequest();
        }

        private function handleRequest()
        {
            $request_uri = $_SERVER['REQUEST_URI'];
            $path = parse_url($request_uri, PHP_URL_PATH);
            $path = trim($path, '/');
            $segments = explode('/', $path);
            switch ($segments[0]) {
                case 'consult':
                    $pokemon = $this->model->consultPokemon($segments[1]);
                    $this->load->view('consult.php', $pokemon);
                    break;
                case 'edit':

                    // SI VIENE POST → GUARDAR
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {

                        $this->model->updatePokemon($_POST);

                        header("Location: /consult/" . $_POST['id']);
                        exit;
                    }

                    // SI NO → SOLO MOSTRAR FORM
                    $pokemon = $this->model->consultPokemon($segments[1]);
                    $trainers = $this->model->listTrainers();

                    $data = [
                        'pokemon' => $pokemon,
                        'trainers' => $trainers
                    ];

                    $this->load->view('edit.php', $data);

                    break;

                    $this->load->view('edit.php', $data);
                    break;
                case 'delete':
                    $pokemon = $this->model->consultPokemon($segments[1]);
                    $this->load->view('delete.php', $pokemon);
                    break;
                default:
                    $pokemons = $this->model->listPokemons();
                    $this->load->view('welcome.php', $pokemons);
                    break;
            }
        }
    }
