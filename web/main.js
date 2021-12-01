$(document).ready(function() {
    const errors = $("#errors")[0]
    const result_table = $("#result-table")[0]
    const area = $("svg")[0]
    //initial load
    init();
    function init() {
        $("#tableofresults").load("table.jsp")
    }

    //Add CSS to the clicked button X, and remove the others
    $("#x-values :button").click(function () {
        $("#x-values :button").removeClass("active") /*input[type='button']*/
        $(this).addClass("active")
    });

    //Submit
    $("#submit")[0].addEventListener("click", async function (event) {
        event.preventDefault()
        let coord = dataValidate(true)
        if (!coord) {
            return false;
        }
        connect(coord,1)
    })

    $("#reset")[0].addEventListener("click",function (event){
        event.preventDefault()
        $("#x-values :button").removeClass("active")
        $("#y-values")[0].value = ""
        $("input[type=radio]").prop('checked', false);
        // $("input[name=\"rvalue\"][value=\"1\"]").attr('checked', true);
        $("svg circle").remove()
        while (errors.firstChild) {errors.removeChild(errors.firstChild)}
        connect({x:0,y:0,r:0},2)
    })

    function dataValidate(includeXY) {
        let errorCount = 0
        while (errors.firstChild) {errors.removeChild(errors.firstChild)}
        const r_element = $("input[name=\"rvalue\"]:checked")[0]
        if (r_element===undefined) {printError("R is not chosen"); errorCount++}
        if (includeXY) {
            const x_element = $("#x-values :button.active")[0]
            const y_value = $("#y-values")[0].value.replace(",", ".")
            if (x_element===undefined) {printError("X can't be empty"); errorCount++}
            if (y_value==="") {printError("Y can't be empty"); errorCount++}
            else if (y_value<=-5 || y_value>=3 || isNaN(Number(y_value))) {printError("Y must be a number from -5 to 3"); errorCount++}
            if (errorCount>0) {return false} else
            {return {x: x_element.value, y: y_value, r: r_element.value}}
        } else {if (errorCount>0) {return false} else {return r_element.value}}
    }

    function connect(coord, mode) {
        try {
            if (mode===2) {
                fetch("app?mode=2").then(response => {
                    if (!response.ok) {
                        throw new Error(response.status+": "+response.statusText)
                    }
                }).then(function() {
                    $("#tableofresults").load("table.jsp")
                })
            }
            else {
                let request = "?x=" + encodeURIComponent(coord.x) + "&y=" + encodeURIComponent(coord.y) + "&r=" + encodeURIComponent(coord.r) +
                    "&mode=" + mode;
                fetch("app" + request).then(response => {
                    if (!response.ok) {
                        throw new Error(response.status + ": " + response.statusText)
                    } else {
                        return response.json()
                    }
                }).then(function (result) {
                    if (result.hasOwnProperty("error")) {
                        throw new Error(result["error"])
                    } else {
                        window.location.replace("result.jsp") // put '/' in front of address to direct to root address
                        // let row = result_table.insertRow(-1)
                        // let properties = Object.keys(result)
                        // for (let property of properties) {
                        //     let cell = row.insertCell(-1)
                        //     let text = document.createTextNode(result[property])
                        //     cell.appendChild(text)
                        // }
                    }
                })
            }
        } catch (e) {
            printError(error)
        }
    }

    function printError(s) {
        let node = document.createElement("LI");                 // Create a <li> node
        node.className = "error";
        let textnode = document.createTextNode(s);         // Create a text node
        node.appendChild(textnode);                              // Append the text to <li>
        errors.appendChild(node);     // Append <li> to <ul>
    }


    area.addEventListener("mousedown", function (event) {
        let rect = area.getBoundingClientRect();
        let x = event.clientX - rect.left
        let y = event.clientY - rect.top
        let r = dataValidate();
        if (!r) {return;}
        setPointer(x,y)
        x = ((x-150)*r/120).toFixed(2)
        y = ((150-y)*r/120).toFixed(2)
        connect({x:x,y:y,r:r},0)
    })


    function setPointer(x, y) {
        area.insertAdjacentHTML("beforeend", `<circle r="5" cx="${x}" cy="${y}" fill-opacity="0.8" fill="red"></circle>`);
    }
})







