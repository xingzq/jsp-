window.onload=function(){
	var banner = document.getElementById('banner');
            var list = document.getElementById('banner_imgs');
            var buttons = document.getElementById('buttons').getElementsByTagName('span');
            var prev = document.getElementById('prev');
            var next = document.getElementById('next');
	var index = 1;
	var len = 3;
	var animated = false;
	var interval = 3000;
	var timer;

	function animate (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 300;
                var inteval = 12;
                var speed = offset/(time/inteval);
                var left = parseInt(list.style.left) + offset;

                var go = function (){
                    if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                        list.style.left = parseInt(list.style.left) + speed + 'px';
                        setTimeout(go, inteval);
                    }
                    else {
                        list.style.left = left + 'px';
                        if(left>-800){
                            list.style.left = -840 * len + 'px';
                        }
                        if(left<(-840 * len)) {
                            list.style.left = '-840px';
                        }
                        animated = false;
                    }
                }
                go();
            }

            function showButton() {
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons[i].className == 'on'){
                        buttons[i].className = '';
                        break;
                    }
                }
                buttons[index - 1].className = 'on';
            }

            function play() {
                timer = setTimeout(function () {
                    next.onclick();
                    play();
                }, interval);
            }
            function stop() {
                clearTimeout(timer);
            }

            next.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                animate(-840);
                showButton();
            }
            prev.onclick = function () {
                if (animated) {
                    return;
                }
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                animate(840);
                showButton();
            }

            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    if (animated) {
                        return;
                    }
                    if(this.className == 'on') {
                        return;
                    }
                    var myIndex = parseInt(this.getAttribute('index'));
                    var offset = -840 * (myIndex - index);

                    animate(offset);
                    index = myIndex;
                    showButton();
                }
            }

            banner.onmouseover = stop;
            banner.onmouseout = play;

            play();

}