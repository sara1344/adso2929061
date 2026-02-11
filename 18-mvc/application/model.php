<?php
    class Model extends Database{
        protected $db;

        public function __construct()
        {
            $this->db = Database::connect();
        }

        public function listPokemons(){
            $stmt =  $this->db->query("SELECT * FROM pokemons");
            return $stmt->fetchAll();
        }
         public function consultPokemon($id)
    {
        $stmt = $this->db->prepare("SELECT p.*, t.name as tname FROM pokemons p, trainers t WHERE p.id = ? and p.trainer_id=t.id");
        if ($stmt->execute([$id])) {
            return $stmt->fetch();
        }
        return false;
    }

    public function listTrainers(){
        $stmt =  $this->db->query("SELECT * FROM trainers");
        return $stmt->fetchAll();
    }
    public function updatePokemon($data)
{
    $sql = "UPDATE pokemons SET
            name = ?,
            type = ?,
            strenght = ?,
            speed = ?,
            accuracy = ?,
            trainer_id = ?
            WHERE id = ?";

    $stmt = $this->db->prepare($sql);

    return $stmt->execute([
        $data['name'],
        $data['type'],
        $data['strenght'],
        $data['speed'],
        $data['accuracy'],
        $data['trainer_id'],
        $data['id']
    ]);
}

    }
 