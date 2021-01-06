Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0362EBEB3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 14:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbhAFNbq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 08:31:46 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2544 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbhAFNbp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:31:45 -0500
Received: from dggeme710-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4D9qvz2xRgzVxRF;
        Wed,  6 Jan 2021 21:29:19 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme710-chm.china.huawei.com (10.1.199.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 6 Jan 2021 21:30:50 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.1913.007;
 Wed, 6 Jan 2021 21:30:50 +0800
From:   zhengyongjun <zhengyongjun3@huawei.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSBncGlvOiB1c2UgcmVzb3VyY2Vfc2l6ZQ==?=
Thread-Topic: [PATCH -next] gpio: use resource_size
Thread-Index: AQHW5C5q+s91KXd8Pkm1FNgcLEyCcaoal7uQ
Date:   Wed, 6 Jan 2021 13:30:50 +0000
Message-ID: <54742734960f410095dde662359fe9a5@huawei.com>
References: <20210106131900.517-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210106131900.517-1-zhengyongjun3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.249]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

U29ycnksIHRoaXMgaXMgbXkgZmF1bHQsIGFsbCB0aGlzIGZpdmUgZ3BpbyByZWxhdGVkIHBhdGNo
IGNvbW1pdCBtc2cgaXMgd3JvbmcsIEkgd2lsbCBzZW5kIHBhdGNoIHYyLCBwbGVhc2UgaWdub3Jl
IGl0Lg0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7Iyzogemhlbmd5b25nanVuIA0Kt6LLzcqx
vOQ6IDIwMjHE6jHUwjbI1SAyMToxOQ0KytW8/sjLOiBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7
IGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb207IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQqzrcvNOiB6aGVuZ3lvbmdqdW4gPHpoZW5neW9u
Z2p1bjNAaHVhd2VpLmNvbT4NCtb3zOI6IFtQQVRDSCAtbmV4dF0gZ3BpbzogdXNlIHJlc291cmNl
X3NpemUNCg0KVXNlIHJlc291cmNlX3NpemUgcmF0aGVyIHRoYW4gYSB2ZXJib3NlIGNvbXB1dGF0
aW9uIG9uIHRoZSBlbmQgYW5kIHN0YXJ0IGZpZWxkcy4NCg0KU2lnbmVkLW9mZi1ieTogWmhlbmcg
WW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0KLS0tDQogZHJpdmVycy9ncGlvL2dw
aW8tbWMzMzg4MC5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tbWMzMzg4MC5jIGIv
ZHJpdmVycy9ncGlvL2dwaW8tbWMzMzg4MC5jIGluZGV4IGY4MTk0ZjdjNjE4Ni4uNzA0Y2Q0ZTYx
NzFmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tbWMzMzg4MC5jDQorKysgYi9kcml2
ZXJzL2dwaW8vZ3Bpby1tYzMzODgwLmMNCkBAIC05OSw3ICs5OSw3IEBAIHN0YXRpYyBpbnQgbWMz
Mzg4MF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KIA0KIAltYy0+c3BpID0gc3BpOw0K
IA0KLQltYy0+Y2hpcC5sYWJlbCA9IERSSVZFUl9OQU1FLA0KKwltYy0+Y2hpcC5sYWJlbCA9IERS
SVZFUl9OQU1FOw0KIAltYy0+Y2hpcC5zZXQgPSBtYzMzODgwX3NldDsNCiAJbWMtPmNoaXAuYmFz
ZSA9IHBkYXRhLT5iYXNlOw0KIAltYy0+Y2hpcC5uZ3BpbyA9IFBJTl9OVU1CRVI7DQotLQ0KMi4y
Mi4wDQoNCg==
