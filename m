Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B92F211424
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 22:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgGAUOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 16:14:34 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46790 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGAUOd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 16:14:33 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 105798066C;
        Thu,  2 Jul 2020 08:14:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593634469;
        bh=Eu6jgm3NiuboW9BNq0ffMjy8+wi/WlaTvN48hYI/GIE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=RDTKxRKhFt/UfI8CYa6LhybSu5UYsKUzKMEirbhVqNSlKgBKcQkRCa/7PJxnVELty
         /kUataiaYsMJzO1mhduz+Xo85AC5RCSeN3qULwvNpjXRUBJuIrHlDnDKa/KnqUlS/b
         VoO3zON2eet7WrD2w2nj0HEMPDyGLVH4QT/SbA+8saAbnddxOmoJA4hm71Yr3yWvkP
         vkqHoljnyylrIisyamJB9XIjwsjDVwFDXSPdwZGgAp3+A+uSJz2a++yoB4Mm227R9R
         jrs7mBq54E0wvRFoqIBkvcnGBfC+v8anYhfLtmydzEIpWO3HuQgOuFCSxm0bRP/V00
         EKWSCkwSaY9QA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efceea50000>; Thu, 02 Jul 2020 08:14:29 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Jul 2020 08:14:26 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 2 Jul 2020 08:14:26 +1200
From:   Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To:     "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: nsp: Set irq handler based on trig type
Thread-Topic: [PATCH] pinctrl: nsp: Set irq handler based on trig type
Thread-Index: AQHWTx+/8qCNGR2rU06YsESnEFh/Lqjw87eAgAFtTgA=
Date:   Wed, 1 Jul 2020 20:14:26 +0000
Message-ID: <f6b29c23d867a208a7e4b8c3e71127c078f0b44a.camel@alliedtelesis.co.nz>
References: <20200630204704.17736-1-mark.tomlinson@alliedtelesis.co.nz>
         <bc6c62f7-1ae5-4f7d-43ba-efae057e8cb7@broadcom.com>
In-Reply-To: <bc6c62f7-1ae5-4f7d-43ba-efae057e8cb7@broadcom.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:48db:7852:a64c:8a05]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C9C4F6BD9F26442A3E8EA0DE2DF9717@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTA2LTMwIGF0IDE1OjI2IC0wNzAwLCBSYXkgSnVpIHdyb3RlOg0KPiAtCXUz
MiB0cmlnZ2VyX3R5cGU7DQo+ID4gIA0KPiA+IC0JdHJpZ2dlcl90eXBlID0gaXJxX2dldF90cmln
Z2VyX3R5cGUoZC0+aXJxKTsNCj4gPiAtCWlmICh0cmlnZ2VyX3R5cGUgJiAoSVJRX1RZUEVfRURH
RV9GQUxMSU5HIHwgSVJRX1RZUEVfRURHRV9SSVNJTkcpKQ0KPiA+IC0JCW5zcF9zZXRfYml0KGNo
aXAsIFJFRywgTlNQX0dQSU9fRVZFTlQsIGdwaW8sIHZhbCk7DQo+ID4gKwluc3Bfc2V0X2JpdChj
aGlwLCBSRUcsIE5TUF9HUElPX0VWRU5ULCBncGlvLCB2YWwpOw0KPiANCj4gDQo+IEkgaGF2ZSBh
IHF1ZXN0aW9uIGhlcmUuIEkgYXNzdW1lIHdyaXRpbmcgYSBiaXQgdG8gdGhpcyByZWdpc3RlciB3
aWxsDQo+IHJlc3VsdCBpbiBjbGVhcmluZyB0aGF0IGJpdCwgaXMgdGhhdCB0cnVlPw0KPiANCj4g
QmFzZWQgb24gdGhlIGRyaXZlciwgdGhlICduc3BfZ3Bpb19pcnFfaGFuZGxlcicgc2VlbXMgdG8g
cmVseSBvbg0KPiAnTlNQX0dQSU9fRVZFTlQnIHJlZ2lzdGVyIHRvIGZpZ3VyZSBvdXQgd2hpY2gg
R1BJTyB0aGUgaW50ZXJydXB0IGlzIGZvci4NCj4gQW5kIGlmIHNvLCBhbmQgaWYgdGhpcyBpcyBj
bGVhcmVkIGhlcmUgdGhhdCBpcyBpbnZva2VkIGJlZm9yZSB0aGUgYWN0dWFsDQo+IElSUSBoYW5k
bGVyLCBob3cgZG9lcyB0aGlzIHdvcms/DQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBjaGFuZ2UgbWFz
a2VkIGFub3RoZXIgaXNzdWUgSSB3YXMgaGF2aW5nLiBIb3dldmVyLA0KdGhlIG9yaWdpbmFsIGNv
ZGUgaXMgc3RpbGwgd3JvbmcgYXMgdXNpbmcgbnNwX3NldF9iaXQoKSB3aWxsIGRvIGENCnJlYWQv
bW9kaWZ5L3dyaXRlIGFuZCBjbGVhciBhbGwgZXZlbnRzIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBncGlv
IGlzLg0KDQpJIGhhdmUgZm91bmQgYW5vdGhlciBpc3N1ZSwgd2hlcmUgSSdtIGdldHRpbmcgbWFu
eSBtb3JlIGVkZ2UtdHJpZ2dlcmVkDQppbnRlcnJ1cHRzIHRoYW4gSSB0aGluayBJIHNob3VsZCBi
ZSwgc28gSSdsbCBzb3J0IHRoYXQgYW5kIHNlbmQgYSB2MiBvZg0KdGhpcyBwYXRjaC4NCg0K
