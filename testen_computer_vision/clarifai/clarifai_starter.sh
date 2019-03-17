#!/bin/bash

curl -X POST \
    -H 'Authorization: Key e3a8443b500e484f8537f9ace059338b' \
    -H "Content-Type: application/json" \
    -d '
    {
        "inputs": [
            {
                "data": {
                    "image": {
                        "url": "https://lh3.googleusercontent.com/-6gebXjwyr-CHaju-YFBJJLgiaodqdZjDF9Ggu1NsV1Z0bcO-q5BXArZVN2YmaVg7UHiCPyyo4oWPQ67u6stOe4pc49bCRTzzsIuJ07ZQEZf7xeymYdtkBSLUfMSem0oN_zEEfLfoigkHVaVm0h08lMin1j55qxeYTenfDRRyxaNfi9rT_y5o4SZv87PSJo90XHwCODT93toXOrSzI1mn6elXy0MZ4io_TKFhTNog_62va9lNC14odEhl4lSH_w4Jn5jfpdVbagDZnGaUJPboTedhGyirM2RvWUFXZf1ZShE_zWAuYYaZC9fB_ur_4z_8bScFMgLzatZFzxRmfDtCwPMnJs0A2qkI1JZsirvPWj4wzLwyojcExpUR516ilUGkZx1TuGWMfVgw4Iw8IXfc7UAWaoS4CAgxQ_Ms5NQym5p5mkVR8Czurqh9_aHFvaLn-k1ah5g7gI9KD8P3XgSn8WD0Ri6FR0TFdFHHXHUiziOL80laXEr99xllobljfPq6Mt4HS4NbqCXE1gzEJgmFH2KGKWwv9cNPTXYrxWrbffWu_p5fusrdLrCoFn42Sk2xf-i4NlpaG439GjHpWKSakkhyePWK1YYm3-3TqCbMxH05er-YMWFLusw1d3p0HrAs3VrW3dK_97mFQxx3dYu-EnLo1fC3Kx7Rpo67cQULot0Joh-cDxLMMht1vXg04ppIUOAMcXCJkcZcVVxBqm1bVWq=w963-h722-no"
                    }
                }
            }
        ]
    }' \
    https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs >> response.json