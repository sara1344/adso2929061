import BtnBack from '../components/BtnBack';

function WelcomeMessage() {
    return <p>Welcome to the Pokémon world!</p>;
}

function PokemonBadge({ label }) {
    return <span className="pokemon-badge">{label}</span>;
}

function Example1Components() {
    return (
        <div className="container">
            <BtnBack />
            <h2>Example 1: Components</h2>
            <p>Reusable and independent pieces of UI that can be combined to build pages.</p>

            <WelcomeMessage />

            <div style={styles.badges}>
                <PokemonBadge label="Grass" />
                <PokemonBadge label="Fire" />
                <PokemonBadge label="Water" />
            </div>
        </div>
    );
}

const styles = {
    badges: {
        display: 'flex',
        gap: '10px',
        marginTop: '20px',
        flexWrap: 'wrap',
    },
};

export default Example1Components;
