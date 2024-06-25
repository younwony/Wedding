document.addEventListener('DOMContentLoaded', () => {
    const canvas = document.getElementById('petalsCanvas');
    const ctx = canvas.getContext('2d');
    let petalsArray = [];
    const petalImage = new Image();
    petalImage.src = '/img/sakura.png'; // 투명한 배경의 하얀 벚꽃 이미지 경로

    function setCanvasSize() {
        canvas.width = canvas.offsetWidth;
        canvas.height = canvas.offsetHeight;
    }

    setCanvasSize(); // 초기 크기 설정

    class Petal {
        constructor() {
            this.reset();
        }

        reset() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height - canvas.height;
            this.speedX = Math.random() * 0.5 + 0.1; // X축 속도 추가
            this.speedY = Math.random() * 1 + 0.5; // Y축 속도
            this.size = Math.random() * 20 + 10;
            this.angle = Math.random() * 360;
            this.opacity = Math.random() * 0.5 + 0.5; // 투명도 설정
        }

        update() {
            this.x += this.speedX;
            this.y += this.speedY;
            if (this.y > canvas.height || this.x > canvas.width) {
                this.reset();
            }
        }

        draw() {
            ctx.save();
            ctx.globalAlpha = this.opacity; // 투명도 적용
            ctx.translate(this.x, this.y);
            ctx.rotate((this.angle * Math.PI) / 180);
            ctx.drawImage(petalImage, -this.size / 2, -this.size / 2, this.size, this.size);
            ctx.restore();
        }
    }

    function init() {
        petalsArray = [];
        for (let i = 0; i < 50; i++) {
            petalsArray.push(new Petal());
        }
    }

    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        petalsArray.forEach((petal) => {
            petal.update();
            petal.draw();
        });
        requestAnimationFrame(animate);
    }

    petalImage.onload = () => {
        setCanvasSize();
        init();
        animate();
    };

    window.addEventListener('resize', () => {
        setCanvasSize();
        init();
    });

    window.addEventListener('orientationchange', () => {
        setTimeout(() => {
            setCanvasSize();
            init();
        }, 500); // orientation change 후 크기 재설정을 위한 약간의 지연 시간 추가
    });
});
