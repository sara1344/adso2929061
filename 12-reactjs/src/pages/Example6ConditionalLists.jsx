import { useState } from 'react';
import BtnBack from '../components/BtnBack';

function Example6ConditionalLists() {
    const [showLegendary, setShowLegendary] = useState(true);

    const pokemons = [
        { id: 1, name: 'Pikachu', type: 'Electric', legendary: false },
        { id: 2, name: 'Mewtwo', type: 'Psychic', legendary: true },
        { id: 3, name: 'Bulbasaur', type: 'Grass', legendary: false },
        { id: 4, name: 'Articuno', type: 'Ice', legendary: true },
    ];

    const visiblePokemons = showLegendary
        ? pokemons
        : pokemons.filter((pokemon) => !pokemon.legendary);

    return (
        <div className="container">
            <BtnBack />
            <h2>Example 6: Conditional & Lists</h2>
            <p>Render lists with map and show content conditionally.</p>

            <label style={styles.toggle}>
                <input
                    type="checkbox"
                    checked={showLegendary}
                    onChange={(e) => setShowLegendary(e.target.checked)}
                />
                Show legendary Pokémon
            </label>

            <ul style={styles.list}>
                {visiblePokemons.length > 0 ? (
                    visiblePokemons.map((pokemon) => (
                        <li key={pokemon.id} style={styles.item}>
                            <strong>{pokemon.name}</strong> - {pokemon.type}
                            {pokemon.legendary && <span style={styles.badge}>Legendary</span>}
                        </li>
                    ))
                ) : (
                    <li style={styles.empty}>No Pokémon to display.</li>
                )}
            </ul>
        </div>
    );
}

const styles = {
    toggle: {
        display: 'flex',
        alignItems: 'center',
        gap: '8px',
        margin: '20px 0',
        cursor: 'pointer',
    },
    list: {
        listStyle: 'none',
        padding: 0,
        margin: 0,
        display: 'grid',
        gap: '10px',
    },
    item: {
        backgroundColor: '#f5f5f5',
        border: '1px solid #ddd',
        borderRadius: '8px',
        padding: '12px 16px',
        display: 'flex',
        alignItems: 'center',
        gap: '10px',
    },
    badge: {
        backgroundColor: '#ffcb05',
        color: '#3c5aa6',
        padding: '2px 8px',
        borderRadius: '12px',
        fontSize: '0.8rem',
        fontWeight: 'bold',
    },
    empty: {
        color: '#888',
        fontStyle: 'italic',
    },
};

export default Example6ConditionalLists;
