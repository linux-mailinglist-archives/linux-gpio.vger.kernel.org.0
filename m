Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EF32101F2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 04:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgGACXx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 22:23:53 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:45863 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGACXx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 22:23:53 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 944F68066C;
        Wed,  1 Jul 2020 14:23:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593570224;
        bh=mI32KsENUjMHrBaa4ywoRDgEOcKsi98TwBM9Vd/zqmA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=0ZlA74PotZDiJUGfC2GeoNw5Zm8QJIogcWXxcz8vFzgKeCd2kxM7GOy8dvRtVYSlm
         jrJSfNOpnZM8W7dEymC2ON8/lA0K0KVZVMq95jxGUpCjhYlDBLAqHFpEJUTSUQEUK3
         33FmhY58plKFeiN8ihahel2mT4DxT1r8JKqm2vvyCIqtMVs4YvRSQy7dx52TdUHuXp
         PWQvNFe8fLJlzvysRxQ5aAV2I0hWcKRUtjy0l89wI0nrae1sDuPRVch82g9xbzPrTJ
         Q2sijJdCQmJuBWCC3ZakLK1B6AY9ht/zCZrvbkv1jYZ+D1gTrWsJZRu8sD3gamWles
         OHnAWgCEQMF6Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efbf3b10001>; Wed, 01 Jul 2020 14:23:45 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 14:23:44 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 1 Jul 2020 14:23:44 +1200
From:   Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To:     "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
Thread-Topic: [PATCH] pinctrl: initialise nsp-mux earlier.
Thread-Index: AQHWTyWf+OJCQzu0tUG0OUfiNa14/6jw7mWAgABHbYA=
Date:   Wed, 1 Jul 2020 02:23:43 +0000
Message-ID: <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
         <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
In-Reply-To: <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:899d:a7e9:b35a:a1ab]
Content-Type: text/plain; charset="utf-8"
Content-ID: <632CE4073ECE9D4199209DF8E6A9E704@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTA2LTMwIGF0IDE1OjA4IC0wNzAwLCBSYXkgSnVpIHdyb3RlOg0KPiBNYXkg
SSBrbm93IHdoaWNoIEdQSU8gZHJpdmVyIHlvdSBhcmUgcmVmZXJyaW5nIHRvIG9uIE5TUD8gQm90
aCB0aGUgaVByb2MNCj4gR1BJTyBkcml2ZXIgYW5kIHRoZSBOU1AgR1BJTyBkcml2ZXIgYXJlIGlu
aXRpYWxpemVkIGF0IHRoZSBsZXZlbCBvZg0KPiAnYXJjaF9pbml0Y2FsbF9zeW5jJywgd2hpY2gg
aXMgc3VwcG9zZWQgdG8gYmUgYWZ0ZXIgJ2FyY2hfaW5pdGNhbGwnIHVzZWQNCj4gaGVyZSBpbiB0
aGUgcGlubXV4IGRyaXZlcg0KDQpTb3JyeSwgaXQgbG9va3MgbGlrZSBJIG1hZGUgYSBtaXN0YWtl
IGluIG15IHRlc3RpbmcgKG9yIEkgd2FzIGx1Y2t5KSwNCmFuZCB0aGlzIHBhdGNoIGRvZXNuJ3Qg
Zml4IHRoZSBpc3N1ZS4gV2hhdCBpcyBoYXBwZW5pbmcgaXM6DQoxKSBuc3AtcGlubXV4IGRyaXZl
ciBpcyByZWdpc3RlcmVkIChhcmNoX2luaXRjYWxsKS4NCjIpIG5zcC1ncGlvLWEgZHJpdmVyIGlz
IHJlZ2lzdGVyZWQgKGFyY2hfaW5pdGNhbGxfc3luYykuDQozKSBvZl9wbGF0Zm9ybV9kZWZhdWx0
X3BvcHVsYXRlX2luaXQoKSBpcyBjYWxsZWQgKGFsc28gYXQgbGV2ZWwNCmFyY2hfaW5pdGNhbGxf
c3luYyksIHdoaWNoIHNjYW5zIHRoZSBkZXZpY2UgdHJlZSwgYWRkcyB0aGUgbnNwLWdwaW8tYQ0K
ZGV2aWNlLCBydW5zIGl0cyBwcm9iZSwgYW5kIHRoaXMgcmV0dXJucyAtRVBST0JFX0RFRkVSIHdp
dGggdGhlIGVycm9yDQptZXNzYWdlLg0KNCkgT25seSBub3cgbnNwLXBpbm11eCBkZXZpY2UgaXMg
cHJvYmVkLg0KDQpDaGFuZ2luZyB0aGUgJ2FyY2hfaW5pdGNhbGxfc3luYycgdG8gJ2RldmljZV9p
bml0Y2FsbCcgaW4gbnNwLWdwaW8tYQ0KZW5zdXJlcyB0aGF0IHRoZSBwaW5tdXggaXMgcHJvYmVk
IGZpcnN0IHNpbmNlDQpvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlX2luaXQoKSB3aWxsIGJl
IGNhbGxlZCBiZXR3ZWVuIHRoZSB0d28NCnJlZ2lzdGVyIGNhbGxzLCBhbmQgdGhlIGVycm9yIGdv
ZXMgYXdheS4gSXMgdGhpcyBjaGFuZ2UgYWNjZXB0YWJsZSBhcyBhDQpzb2x1dGlvbj8NCg0KPiA+
IHRob3VnaCB0aGUgcHJvYmUgd2lsbCBzdWNjZWVkIHdoZW4gdGhlIGRyaXZlciBpcyByZS1pbml0
aWFsaXNlZCwgdGhlDQo+ID4gZXJyb3IgY2FuIGJlIHNjYXJ5IHRvIGVuZCB1c2Vycy4gVG8gZml4
IHRoaXMsIGNoYW5nZSB0aGUgdGltZSB0aGUNCj4gDQo+IFNjYXJ5IHRvIGVuZCB1c2Vycz8gSSBk
b24ndCBrbm93IGFib3V0IHRoYXQuIC1FUFJPQkVfREVGRVIgd2FzDQo+IGludHJvZHVjZWQgZXhh
Y3RseSBmb3IgdGhpcyBwdXJwb3NlLiBQZXJoYXBzIHVzZXJzIG5lZWQgdG8gbGVhcm4gd2hhdA0K
PiAtRVBST0JFX0RFRkVSIGVycm5vIG1lYW5zPw0KDQpUaGUgYWN0dWFsIGVycm9yIG1lc3NhZ2Ug
aW4gc3lzbG9nIGlzOg0KDQprZXJuLmVyciBrZXJuZWw6IGdwaW9jaGlwX2FkZF9kYXRhX3dpdGhf
a2V5OiBHUElPcyA0ODAuLjUxMQ0KKDE4MDAwMDIwLmdwaW8pIGZhaWxlZCB0byByZWdpc3Rlciwg
LTUxNw0KDQpTbyBhbiBlbmQgdXNlciBzZWVzICJlcnIiIGFuZCAiZmFpbGVkIiwgYW5kIGRvZXNu
J3Qga25vdyB3aGF0ICItNTE3Ig0KbWVhbnMuDQoNCg==
