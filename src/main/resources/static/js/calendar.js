$(document).ready(function() {
    $('#calendar').fullCalendar({
        header: {
            left: '',
            center: 'title',
            right: ''
        },
        defaultDate: '2024-09-28',
        editable: false,
        height: 'auto',
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], // 요일의 앞 한글자만 표시
        views: {
            month: {
                titleFormat: 'YYYY년 M월' // 제목 형식을 "2024년 9월"로 설정
            }
        },
        events: [
            {
                // title 하트로
                title: '♥',
                start: '2024-09-28',
                color: '#ff6666' // 이벤트 색상 변경
            }
        ],
        dayRender: function(date, cell) {
            if (date.format() === '2024-09-28') {
                // 핑크
            }
        }

    });

    $('.fc-row').last().remove(); // 마지막 주 행 삭제
    $('td.fc-day-top[data-date="2024-10-03"]').addClass('fc-red');
    $('td.fc-day-top[data-date="2024-09-28"]').addClass('fc-red');
    $('td.fc-day-top[data-date="2024-09-16"]').addClass('fc-red');
    $('td.fc-day-top[data-date="2024-09-17"]').addClass('fc-red');
    $('td.fc-day-top[data-date="2024-09-18"]').addClass('fc-red');
});