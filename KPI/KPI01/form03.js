

function toggleB() {
    var ml = document.getElementById('mid-left');
    //var mm = document.getElementById('mid-mid');
    //var mr = document.getElementById('mid-right');

    if (ml.style.display !== 'none') {
        ml.style.display = 'none'
        //mm.style.flex = '10'
        //mr.style.flex = '2'
    } else {
        ml.style.display = 'block'
        //mm.style.flex = '9'
        //mr.style.flex = '2'
    }
}
