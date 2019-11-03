Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B3DED516
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Nov 2019 22:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfKCVRr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 16:17:47 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:43003 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfKCVRr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 16:17:47 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AEA2A886BF;
        Mon,  4 Nov 2019 10:17:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572815863;
        bh=dwIa5UBqxZ5+WyHNhpTgf/cGLb9kltXhBmUP4qmi7jE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=ndWpDzkFk75cG//mnByCLXMkD1lu1yvb1b7YgyL/WPGfOZ9O8n9zTwpQtpMKNp16R
         DeJ6BvGIloDQerULQymfXYM93VpuiuRVQfjtKOMiRjf6fdnhbkKPrUdgD0w7FRjlTt
         LBDKByXEZJ2NEEEPcsXQf446JXEBB0Sklx7QLWl9wxWnw+D5ou942K8Cz3tyb841oR
         ecoJ+mIjpaCWtQbdSd8cQOv7JxZUd9vLF+YXXzvAj867RefIPuqru+9gZEyYIEKNDk
         WvtSC9IE8Pzds/kFRg5a1rDdLzoY8aBLtFg9HYE5tsj0pZ35LKy+N6Qrvzb5DUcDVm
         feIcG/xW3az7w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dbf43f70000>; Mon, 04 Nov 2019 10:17:43 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Mon, 4 Nov 2019 10:17:40 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Mon, 4 Nov 2019 10:17:40 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/2] pinctrl: bcm: nsp: use gpiolib infrastructure for
 interrupts
Thread-Topic: [PATCH 1/2] pinctrl: bcm: nsp: use gpiolib infrastructure for
 interrupts
Thread-Index: AQHVkFeSBgXJhb3KgUu11iFh5fDST6d2V0WAgALGW4A=
Date:   Sun, 3 Nov 2019 21:17:39 +0000
Message-ID: <f6ac1bc26d404aa99b9b1f619552bdc441c37f6c.camel@alliedtelesis.co.nz>
References: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
         <20191101015621.12451-2-chris.packham@alliedtelesis.co.nz>
         <b681ed9d-a31a-e5cc-04ba-6f38a5cc745b@gmail.com>
In-Reply-To: <b681ed9d-a31a-e5cc-04ba-6f38a5cc745b@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:c5c6:9a61:cb8f:b19f]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEC19D1D8A2BCA428FDDA13688F0F327@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCAyMDE5LTExLTAxIGF0IDE5OjU1IC0wNzAwLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
Og0KPiANCj4gT24gMTAvMzEvMjAxOSA2OjU2IFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+
IFVzZSBtb3JlIG9mIHRoZSBncGlvbGliIGluZnJhc3RydWN0dXJlIGZvciBoYW5kbGluZyBpbnRl
cnJ1cHRzLiBUaGUNCj4gPiByb290IGludGVycnVwdCBzdGlsbCBuZWVkcyB0byBiZSBoYW5kbGVk
IG1hbnVhbGx5IGFzIGl0IGlzIHNoYXJlZCB3aXRoDQo+ID4gb3RoZXIgcGVyaXBoZXJhbHMgb24g
dGhlIFNvQy4NCj4gPiANCj4gPiBUaGlzIHdpbGwgYWxsb3cgbXVsdGlwbGUgaW5zdGFuY2VzIG9m
IHRoaXMgZHJpdmVyIHRvIGJlIHN1cHBvcnRlZCBhbmQNCj4gPiB3aWxsIGNsZWFuIHVwIGdyYWNl
ZnVsbHkgb24gZmFpbHVyZSB0aGFua3MgdG8gdGhlIGRldmljZSBtYW5hZ2VkIEFQSXMuDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0
ZWxlc2lzLmNvLm56Pg0KPiA+IC0tLQ0KPiANCj4gSnVzdCBhIGNvdXBsZSBvZiBjb21tZW50cyBi
ZWxvdzoNCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArCQlpcnFjLT5uYW1lID0gZGV2X25hbWUoZGV2
KTsNCj4gDQo+IFRoZSBpcnFfY2hpcCB1c2VkIHRvIGJlIG5hbWVkICJncGlvLWEiIG5vdyBpdCBt
b3N0IGxpa2VseSB3aWxsIGNvbnRhaW4NCj4gdGhlIGFkZHJlc3MudW5pdC1uYW1lIG5vdGF0aW9u
IGZyb20gRGV2aWNlIFRyZWUsIHNpbmNlIHRoaXMgaXMgdmlzaWJsZQ0KPiBpbiAvcHJvYy9pbnRl
cnJ1cHRzIG9uZSBtaWdodCBjb25zaWRlciB0aGlzIHRvIGJlIGFuIEFCSSBicmVha2FnZS4NCj4g
DQoNCk9vcHMgbXkgYmFkLiBJJ2QgZXZlbiBiZWVuIHRvbGQgYXMgbXVjaCBmcm9tIGFub3RoZXIg
cGF0Y2guIEZpeGVkIGluDQp2My4NCg0KPiA+ICsJCWlycWMtPmlycV9hY2sgPSBuc3BfZ3Bpb19p
cnFfYWNrOw0KPiA+ICsJCWlycWMtPmlycV9tYXNrID0gbnNwX2dwaW9faXJxX21hc2s7DQo+ID4g
KwkJaXJxYy0+aXJxX3VubWFzayA9IG5zcF9ncGlvX2lycV91bm1hc2s7DQo+ID4gKwkJaXJxYy0+
aXJxX3NldF90eXBlID0gbnNwX2dwaW9faXJxX3NldF90eXBlOw0KPiA+ICANCj4gPiAtCQkJaXJx
X3NldF9jaGlwX2FuZF9oYW5kbGVyKGlycSwgJm5zcF9ncGlvX2lycV9jaGlwLA0KPiA+IC0JCQkJ
CQkgaGFuZGxlX3NpbXBsZV9pcnEpOw0KPiA+IC0JCQlpcnFfc2V0X2NoaXBfZGF0YShpcnEsIGNo
aXApOw0KPiA+IC0JCX0NCj4gPiArCQl2YWwgPSByZWFkbChjaGlwLT5iYXNlICsgTlNQX0NISVBf
QV9JTlRfTUFTSyk7DQo+ID4gKwkJdmFsID0gdmFsIHwgTlNQX0NISVBfQV9HUElPX0lOVF9CSVQ7
DQo+ID4gKwkJd3JpdGVsKHZhbCwgKGNoaXAtPmJhc2UgKyBOU1BfQ0hJUF9BX0lOVF9NQVNLKSk7
DQo+ID4gIA0KPiA+ICAJCS8qIEluc3RhbGwgSVNSIGZvciB0aGlzIEdQSU8gY29udHJvbGxlci4g
Ki8NCj4gPiAtCQlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycSwgbnNwX2dw
aW9faXJxX2hhbmRsZXIsDQo+ID4gLQkJCQkgICAgICAgSVJRRl9TSEFSRUQsICJncGlvLWEiLCBj
aGlwKTsNCj4gPiArCQlyZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgaXJxLCBuc3BfZ3Bpb19p
cnFfaGFuZGxlciwNCj4gPiArCQkJCSAgICAgICBJUlFGX1NIQVJFRCwgImdwaW8tYSIsICZjaGlw
LT5nYyk7DQo+ID4gIAkJaWYgKHJldCkgew0KPiA+ICAJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJV
bmFibGUgdG8gcmVxdWVzdCBJUlElZDogJWRcbiIsDQo+ID4gIAkJCQlpcnEsIHJldCk7DQo+ID4g
LQkJCWdvdG8gZXJyX3JtX2dwaW9jaGlwOw0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICAJCX0N
Cj4gPiAgDQo+ID4gLQkJdmFsID0gcmVhZGwoY2hpcC0+YmFzZSArIE5TUF9DSElQX0FfSU5UX01B
U0spOw0KPiA+IC0JCXZhbCA9IHZhbCB8IE5TUF9DSElQX0FfR1BJT19JTlRfQklUOw0KPiA+IC0J
CXdyaXRlbCh2YWwsIChjaGlwLT5iYXNlICsgTlNQX0NISVBfQV9JTlRfTUFTSykpOw0KPiA+ICsJ
CWdpcnEgPSAmY2hpcC0+Z2MuaXJxOw0KPiA+ICsJCWdpcnEtPmNoaXAgPSBpcnFjOw0KPiA+ICsJ
CS8qIFRoaXMgd2lsbCBsZXQgdXMgaGFuZGxlIHRoZSBwYXJlbnQgSVJRIGluIHRoZSBkcml2ZXIg
Ki8NCj4gPiArCQlnaXJxLT5wYXJlbnRfaGFuZGxlciA9IE5VTEw7DQo+ID4gKwkJZ2lycS0+bnVt
X3BhcmVudHMgPSAwOw0KPiA+ICsJCWdpcnEtPnBhcmVudHMgPSBOVUxMOw0KPiA+ICsJCWdpcnEt
PmRlZmF1bHRfdHlwZSA9IElSUV9UWVBFX05PTkU7DQo+ID4gKwkJZ2lycS0+aGFuZGxlciA9IGhh
bmRsZV9zaW1wbGVfaXJxOw0KPiANCj4gSXQgbWlnaHQgYmUgd29ydGggY3JlYXRpbmcgYSBoZWxw
ZXIgdGhhdCBjYW4gYmUgY2FsbGVkIHRvIGluaXRpYWxpemUgYWxsDQo+IHJlbGV2YW50IG1lbWJl
cnMgdG8gdGhlIHZhbHVlcyB0aGF0IGluZGljYXRlOiBsZXQgbWUgbWFuYWdlIHRoZQ0KPiBpbnRl
cnJ1cHQuIFRoaXMgd291bGQgbWFrZSB1cyBtb3JlIGZ1dHVyZSBwcm9vZiB3aXRoIHJlc3BlY3Qg
dG8NCj4gYXNzdW1wdGlvbnMgYmVpbmcgbWFkZSBpbiBncGlvbGliIGFzIHdlbGwgYXMgaWYgbmV3
IGZpZWxkcyBhcmUgYWRkZWQgaW4NCj4gdGhlIGZ1dHVyZS4gVGhpcyB3b3VsZCBiZSBhIHNlcGFy
YXRlIHBhdGNoIG9idmlvdXNseS4NCg0KRm9yIG5vdyBJJ2xsIGxlYXZlIHRoaXMgYXMtaXMuIExp
bnVzIFcgd2FzIHRoaW5raW5nIGFib3V0IHdoYXQgYW4gQVBJDQpmb3IgZGV2aWNlcyByZXF1aXJp
bmcgc2hhcmVkIGlycXMgd291bGQgbG9vayBsaWtlLiBJZiB0aGF0IGhhcHBlbnMgc29vbg0KdGhl
biB0aGVuIHRoaXMgZHJpdmVyIGNvdWxkIHN3aXRjaCB0byB1c2UgdGhpcyBBUEkuIElmIGl0J3Mg
Z29pbmcgdG8gYmUNCmEgd2hpbGUgSSdsbCBsb29rIGF0IGFkZGluZyBhIGhlbHBlciBhcyBzdWdn
ZXN0ZWQgYW5kIHVwZGF0aW5nIHRoZSAzDQpkcml2ZXJzIHRoYXQgSSBrbm93IG9mIHRoYXQgY291
bGQgYmVuZWZpdCBmcm9tIGl0Lg0KDQo+IA0KPiBPdGhlciB0aGFuIHRoYXQ6DQo+IA0KPiBSZXZp
ZXdlZC1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+DQo=
