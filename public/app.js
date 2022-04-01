//websocket
const bodyElement = document.getElementById('wrapper');

// Open websocket connection
const ws = new WebSocket('ws:///192.168.100.34:61523');

bodyElement.addEventListener('keyup', event => {
    let changed = false;

    if(changed)
        ws.send(JSON.stringify(positionDate));
});

ws.onmessage = response => {
    let data = JSON.parse(response.data);
    console.log(data);
    if(data.isFirstConnect == true)
    {
        let userIp = document.querySelector("#user-ip");
        userIp.innerHTML = data.remote_ip;
        let userId = document.querySelector("#user-id");
        userId.innerHTML = data.id;
        data.messages.forEach(element => {
            addMessage(element.remote_ip, element.user_id, element.message,element.remote_ip == data.remote_ip)
        });
        // console.log(data.messages);
    }else{
        addMessage(data.remote_ip, data.id, data.message);
        console.log('not first');
    }
}

///////////////////////////////////////////////////////////////////////

const chatBtn = document.querySelector(".message-button"),
    chatMessage = document.querySelector(".message-body");

chatMessage.addEventListener("keydown", function(event) {
    if(event.keyCode === 13) {
        chatBtn.click();
    }
})

chatBtn.addEventListener("click", function(){
    if(chatMessage.value === "") {
        alert("Please write your message.")
    } else {
        let res = ws.send(JSON.stringify({message: chatMessage.value}));
        console.log(res);
        sendChatMessage();

    }
})

function sendChatMessage() {
    let userIp = document.querySelector("#user-ip").innerHTML;
    let userId = document.querySelector("#user-id").innerHTML;

    addMessage(userIp,userId,chatMessage.value,true);

    // Clear inputs
    chatMessage.value = "";
}

function addMessage(userIp,userId, message, self = false)
{
    console.log(self);
    const chatInterface = document.querySelector(".chat-interface");

    let alt, right = 'test';
    if(self){
        alt = 'alt';
        right = 'right';
    }

    // Create chat item & set styles
    const chatItem = document.createElement("figure");
    chatItem.classList.add("chat-item",right);

    // Create chat message image
    const chatImg = document.createElement("img");
    chatImg.setAttribute("src", "https://randomuser.me/api/portraits/men/"+userId+".jpg")

    // Create & style chat message body
    const chatBody = document.createElement("figcaption");
    chatBody.classList.add("chat-item_body", alt);
    chatItem.style.alignSelf = "flex-end";
    chatBody.innerHTML = '<b>'+userIp+'</b><br>' + message;

    // Append chat parts to chat item
    chatItem.append(chatImg, chatBody);

    // Append chat item to chat interface
    chatInterface.appendChild(chatItem);

    //scroll to Down
    chatInterface.scrollTop = chatInterface.scrollHeight;
}