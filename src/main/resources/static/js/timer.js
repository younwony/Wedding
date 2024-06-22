$(document).ready(function() {
    const weddingDate = new Date('2024-09-28T17:00:00');

    function updateCountdown() {
        const now = new Date();
        const timeDiff = weddingDate - now;

        if (timeDiff < 0) {
            document.getElementById('countdown').innerHTML = '결혼식이 진행 중입니다!';
            return;
        }

        const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
        const hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);

        document.getElementById('countdown').innerHTML = `D-${days} ${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
    }

    // 1초마다 업데이트
    setInterval(updateCountdown, 1000);
    // 초기 호출
    updateCountdown();
});