export function HomePawIcon({ size = 48 }) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 48 48"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      aria-hidden="true"
    >
      <path
        d="M8 22L24 8L40 22V38C40 39.1 39.1 40 38 40H10C8.9 40 8 39.1 8 38V22Z"
        stroke="currentColor"
        strokeWidth="2.5"
        strokeLinejoin="round"
      />
      <path
        d="M18 40V28H30V40"
        stroke="currentColor"
        strokeWidth="2.5"
        strokeLinejoin="round"
      />
      <circle cx="19" cy="22" r="2.5" fill="currentColor" />
      <circle cx="24" cy="19" r="2.5" fill="currentColor" />
      <circle cx="29" cy="22" r="2.5" fill="currentColor" />
      <ellipse cx="24" cy="27" rx="3.5" ry="2.8" fill="currentColor" />
    </svg>
  );
}
