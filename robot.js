const request = require('request')
const crypto = require('crypto')

const apiKey = '1cc26f048a222f353c15d47d02f00f4f'
const apiSecret = '$2a$12$3kpFBzCS8cOaRs1cOt54P.A2wxE9BwXpqglJZYNktuOTAYTCQyHga'
const baseUrl = 'https://demo-api.bitopro.com/v3'

// 修改为正确的下单端点
const url = '/orders/usdt_twd'
const nonce = Date.now()
const completeURL = baseUrl + url

// 创建订单数据
const orderData = {
    action: "buy",
    amount: "33.0",        // 确保数量格式正确
    price: "33.0",         // 确保价格格式正确
    type: "limit",
    timestamp: nonce       // 添加时间戳
}

// 合并身份验证信息和订单数据
const body = { 
    ...orderData,
    identity: 'bitoprotesting+angela-demo@gmail.com', 
    nonce 
}

const payload = Buffer.from(JSON.stringify(body)).toString('base64')

const signature = crypto
   .createHmac('sha384', apiSecret)
   .update(payload)
   .digest('hex')

const options = {
   method: 'POST',         // 明确指定 HTTP 方法
   url: completeURL,
   headers: {
     'X-BITOPRO-APIKEY': apiKey,
     'X-BITOPRO-PAYLOAD': payload,
     'X-BITOPRO-SIGNATURE': signature,
     'Content-Type': 'application/json'
   },
   json: true,            // 自动处理 JSON
   body: body             // 直接使用对象，不需要 JSON.stringify
}

// 发送下单请求
request(options, function(error, response, body) {
    if (error) {
        console.error('Error:', error);
        return;
    }
    console.log('Status Code:', response.statusCode);
    console.log('Request Body:', JSON.stringify(options.body, null, 2));  // 打印请求体
    console.log('Response:', body);
})