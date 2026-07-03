import BtnBack from "../components/BtnBack";
import CardPokemon from "../components/CardPokemons";

function Example3Props() {

    // Data
    const pokemons = [
        { id: 1, name: 'Pikachu', type: 'Electric', power: 'Thunderbolt', image: '25.png', legendary: false},
        { id: 2, name: 'Mewtwo', type: 'Psychic', power: 'Psychic', image: '150.png', legendary: true},
        { id: 3, name: 'Gyarados', type: 'Water', power: 'Hydro Pump', image: '130.png', legendary: false}
    ];

    return (
        <div className="container">
            <BtnBack />
            <h2>Example 3: Props</h2>
            <p>Pass data from parent to children (like function arguments).</p>
            <div style={styles.cards}>
                {/* We pass different props to each card */}
                {
                    pokemons.map(pokemon => (
                        <CardPokemon
                            key       ={pokemon.id}
                            name      ={pokemon.name}
                            type      ={pokemon.type}
                            power     ={pokemon.power}
                            image     ={pokemon.image}
                            legendary ={pokemon.legendary}
                        />
                    ))
                }
            </div>
        </div>
    );
}

const styles = {
    cards: {
        display: 'flex',
        gap: '20px',
        flexWrap: 'wrap',
        justifyContent: 'center',
        marginTop: '20px',
    },
};

export default Example3Props;