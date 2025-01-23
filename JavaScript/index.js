function pullDown() {

  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  const pullDownChild = document.querySelectorAll(".pull-down-list")
  const currentList = document.getElementById("current-list")

  pullDownButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#FFBEDA;")
  })

  pullDownButton.addEventListener('mouseout', function(){

    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsのstyle属性にdisplay:block;が指定されている場合（つまり表示されている時）実行される
      pullDownParents.removeAttribute("style")
    } else {
      // pullDownParentsのstyle属性にdisplay:block;が指定されていない場合（つまり非表示の時）実行される
      pullDownParents.setAttribute("style", "display:block;")
    }
  })



  pullDownChild.forEach(function(list) {
    list.addEventListener('click', function() {
      const value = list.innerHTML
      currentList.innerHTML = value
    })


  })
}

window.addEventListener('load', pullDown)