import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["No Brasil", "13 milhões de pessoas", "são consideradas", "Raras"],
    typeSpeed: 80,
    loop: true,
    showCursor: true
  });
}

export { loadDynamicBannerText };
