export default function PetDecor({ catSrc, dogSrc, variant = 'dashboard' }) {
  const isLogin = variant === 'login';

  return (
    <>
      {isLogin && (
        <>
          <div className="pets-decor-wrap cat-top" aria-hidden="true">
            <div className="pets-decor-glow" />
          </div>
          <div className="pets-decor-wrap dog-bottom" aria-hidden="true">
            <div className="pets-decor-glow" />
          </div>
        </>
      )}
      {!isLogin && <div className="pets-decor-semicircle" aria-hidden="true" />}
      <img
        src={catSrc}
        alt=""
        className={`pets-decor-img cat-img ${isLogin ? 'cat-img--login' : 'cat-img--dashboard'}`}
        aria-hidden="true"
      />
      <img
        src={dogSrc}
        alt=""
        className={`pets-decor-img dog-img ${isLogin ? 'dog-img--login' : 'dog-img--dashboard'}`}
        aria-hidden="true"
      />
    </>
  );
}
