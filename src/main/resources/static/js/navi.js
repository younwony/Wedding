function navi(target) {
    switch (target) {
        case 'kakao' :
            location.href = 'https://map.kakao.com/link/to/607282159';
            break;
        case 'naver' :
            location.href = 'nmap://search?query=양재 엘블레스&amp;appname=https://ourfirstletter.com';
            break;
        case 'tmap' :
            location.href = 'tmap://search?name=양재 엘블레스';
            break;
    }
}