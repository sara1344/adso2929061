import BtnBack from "../components/BtnBack";

function Example2JSX() {

    // JS Variables

    const pkName = 'Bulbasaur'
    const pkType = 'Grass/Poison'
    const pkLevel = 5
    const pkAbilities = ['Overgrow', 'Chlorophyll']
    const pkImgUrl = ''

    return (
        <div className="container">
            <BtnBack />

            <h2>Example 2: JSX</h2>
            <p>Writing HTML-Like code within JavaScript using curly braces { } for JS expresions.</p>

            <div style={style.container}>
                <h3 style={style.title}>{pkName} (Lvl. {pkLevel})</h3>

                <img
                    src={pkImgUrl}
                    alt={pkName}
                    style={style.img}
                />

                <p>Type: {pkType}</p>
                <p>Uppercase: {pkName.toUpperCase()}</p>
                <p>Abilities:</p>

                <ul style={style.ul}>
                    {pkAbilities.map((ability, index) => (
                        <li key={index}>{ability}</li>
                    ))}
                </ul>

                <p>
                    Is it a starter? {pkLevel === 5 ? '✅ Yes' : '❌ No'}
                </p>
            </div>
        </div>
    );
}

const style = {
    container: {
        backgroundColor: '#f9f9f9',
        border: '1px dashed #ccc',
        borderRadius: '8px',
        padding: '20px',
        marginTop: '20px',
    },
    title: {
        color: '#3c5aa6',
    },
    img: {
        width: '120px',
        height: '120px',
        objectFit: 'contain',
    },
    ul: {
        textAlign: 'left',
    },
};

export default Example2JSX;