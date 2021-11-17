$(document).ready(function() {
    const errors = $("#errors")[0]
    const result_table = $("#result-table")[0]

    //Add CSS to the clicked button X, and remove the others
    $("#x-values :button").click(function () {
        $("#x-values :button").removeClass("active") /*input[type='button']*/
        $(this).addClass("active")
    });

    //Submit
    $("#submit")[0].addEventListener("click", async function (event) {
        event.preventDefault()
        let coord = dataValidate()
        if (!coord) {
            return false;
        }
        connect(coord,true)

    })

    $("#reset")[0].addEventListener("click",function (event){
        event.preventDefault()
        $("#x-values :button").removeClass("active")
        $("#y-values")[0].value = ""
        // $(":radio").removeAttr('checked');
        // $("input[name=\"rvalue\"][value=\"1\"]").attr('checked', true);
        while(result_table.rows.length > 1){
            result_table.deleteRow(-1);
        }
    })

    function dataValidate() {
        const x_element = $("#x-values :button.active")[0]
        const y_value = $("#y-values")[0].value.replace(",",".")
        const r_value = $("input[name=\"rvalue\"]:checked")[0].value
        while (errors.firstChild) {errors.removeChild(errors.firstChild)}
        let errorCount = 0
        if (x_element===undefined) {printError("X can't be empty"); errorCount++}
        if (y_value==="") {printError("Y can't be empty"); errorCount++}
        else if (y_value<=-5 || y_value>=3 || isNaN(Number(y_value))) {printError("Y must be a number from -5 to 3"); errorCount++}
        if (errorCount>0) {return false}
        return {x: x_element.value, y: y_value, r: r_value}
    }

    function connect(coord, isLimit) {
        let request = "?x=" + encodeURIComponent(coord.x) + "&y=" + encodeURIComponent(coord.y) + "&r=" + encodeURIComponent(coord.r) +
            "&islimit=" + (isLimit?1:0);
        console.log(request)
        fetch("app"+request).then(response => {
            if (!response.ok) {
                throw new Error(response.status+": "+response.statusText)
            } else {
                return response.json()
            }
        }).then(function (result) {
            if (result.hasOwnProperty("error")) {throw new Error(result["error"])}
            else {
                let row = result_table.insertRow(-1)
                let properties = Object.keys(result)
                for (let property of properties) {
                    let cell = row.insertCell(-1)
                    let text = document.createTextNode(result[property])
                    cell.appendChild(text)
                }
            }
        }).catch(error => {
            printError(error)
        })
        /*
        let form = new FormData()
        for (let key in coord) {
            form.append(key, coord[key])
        }
        const response = await fetch("main/main.php",{
            method: "POST",
            body: form
        })
        if (response.ok) {
            let result = await response.json()
            return result
        } else return JSON.parse('{"error":"'+response.status+': '+response.statusText+'"}')
        */
    }

    function printError(s) {
        let node = document.createElement("LI");                 // Create a <li> node
        node.className = "error";
        let textnode = document.createTextNode(s);         // Create a text node
        node.appendChild(textnode);                              // Append the text to <li>
        errors.appendChild(node);     // Append <li> to <ul>
    }

    const area = $("svg")[0];
    area.addEventListener("mousedown", function (event) {
        let rect = area.getBoundingClientRect();
        let x = event.clientX - rect.left
        let y = event.clientY - rect.top
        const r = $("input[name=\"rvalue\"]:checked")[0].value
        setPointer(x,y)
        x = ((x-150)*r/120).toFixed(2)
        y = ((150-y)*r/120).toFixed(2)
        connect({x:x,y:y,r:r},false)
    })


    function setPointer(x, y) {
        area.insertAdjacentHTML("beforeend", `<circle r="5" cx="${x}" cy="${y}" fill-opacity="0.8" fill="red"></circle>`);
    }
})






