import PetDecor from './PetDecor';

export default function PetLayout({ children, variant = 'dashboard' }) {
  const isLogin = variant === 'login';

  return (
    <div className="pets-viewport">
      <div className="pets-phone">
        <div className="pets-phone-notch" aria-hidden="true" />
        <div className={`pets-phone-screen ${isLogin ? 'pets-phone-screen--login' : ''}`}>
          {isLogin ? (
            <>
              <PetDecor
                variant="login"
                catSrc={`${process.env.PUBLIC_URL}/images/gatoLogin.svg`}
                dogSrc={`${process.env.PUBLIC_URL}/images/perroLogin.svg`}
              />
              <div className="pets-phone-content">{children}</div>
            </>
          ) : (
            <div className="pets-phone-content pets-phone-content--dashboard">
              {children}
              <div className="pets-content-end">
                <PetDecor
                  variant="dashboard"
                  catSrc={`${process.env.PUBLIC_URL}/images/gatoDashboard.svg`}
                  dogSrc={`${process.env.PUBLIC_URL}/images/perroDashboard.svg`}
                />
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
