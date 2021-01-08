Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87BA82EF40C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 15:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbhAHOjq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 09:39:46 -0500
Received: from smtp.asem.it ([151.1.184.197]:52280 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbhAHOjq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 09:39:46 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000699387.MSG 
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 15:39:04 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 Jan
 2021 15:39:02 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Fri, 8 Jan 2021 15:39:02 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: R: [PATCH v2] gpiolib: Disallow identical line names in the same chip
Thread-Topic: [PATCH v2] gpiolib: Disallow identical line names in the same
 chip
Thread-Index: AQHW5OImEYQ7RQ5jYUeg211EwFA6OaocJRow///5/QCAAavHgA==
Date:   Fri, 8 Jan 2021 14:39:02 +0000
Message-ID: <860764e8df53481bb43c79560b859979@asem.it>
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
 <63d69976687846c6a50e904b913bd235@asem.it>
 <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
In-Reply-To: <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F17.5FF86E86.00B6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gPg0KPiA+IGFib3V0IHRoZSBkdXBsaWNhdGUgbGluZSBuYW1lcywgd2hh
dCBkbyB5b3UgdGhpbmsNCj4gPiBhYm91dCBhZGRpbmcgdG8gdGhlIGNvbW1hbmQgImdwaW9maW5k
IiBvZiBsaWJncGlvZCB0b29scywNCj4gPiB0aGUgcG9zc2liaWxpdHkgdG8gZGlzY292ZXIgYWxs
IHRoZSBkdXBsaWNhdGUgZ3BpbyBsaW5lcz8NCj4gPg0KPiA+IEZvciBleGFtcGxlLCBzb21ldGhp
bmcgbGlrZSB0aGUgZm9sbG93aW5nOg0KPiA+DQo+ID4gIyBncGlvZmluZCBidXR0b25fMQ0KPiA+
IGdwaW9jaGlwMCAyMA0KPiA+IGdwaW9jaGlwMCAyMiAoZHVwbGljYXRlKQ0KPiANCj4gVGhpcyBj
YW5ub3QgaGFwcGVuLCBhcyB0aGUgZHVwbGljYXRlIGlzIG9uIHRoZSBzYW1lIGdwaW9jaGlwLg0K
DQpKdXN0IGEgcXVlc3Rpb246ICBJIHRoaW5rIHRoYXQgYSBkdXBsaWNhdGUgbmFtZSBjYW4gYmUg
cHJlc2VudA0KYm90aCBpbiB0aGUgc2FtZSBncGlvY2hpcCBhbmQgYWxzbyBpbiBkaWZmZXJlbnQg
Z3Bpb2NoaXBzLg0KVGhlIHNhbWUgZ3BpbyBsaW5lIG5hbWUgY2FuIGJlIHdyb25nbHkgcHJlc2Vu
dCBvbiBkaWZmZXJlbnQgZ3Bpb2NoaXBzLA0KZm9yIGV4YW1wbGUgY2F1c2VkIGJ5IGEgbWlzdGFr
ZSB3cml0aW5nIGFuIEFDUEkgdGFibGUuDQoNCj4gDQo+ID4gZ3Bpb2NoaXAyIDEyIChkdXBsaWNh
dGUpDQo+ID4gIw0KPiANCj4gSSBkb24ndCBsaWtlIHRoZSAiKGR1cGxpY2F0ZSkiIHN1ZmZpeC4g
IEl0IG1ha2VzIHNjcmlwdGluZyBoYXJkZXIgKGFuZA0KPiBtb3JlIHVuc2FmZSkuDQo+IFdoYXQg
YWJvdXQgb3V0cHV0dGluZyBvbmx5IHRoZSBmaXJzdCBvbmUsIHVubGVzcyAiLWEiIGlzIHNwZWNp
ZmllZD8NCj4gDQo+ICMgZ3Bpb2ZpbmQgLWEgYnV0dG9uXzENCj4gZ3Bpb2NoaXAwIDIwDQo+IGdw
aW9jaGlwMSAyMg0KPiBncGlvY2hpcDIgMTINCj4gIw0KDQpPaywgSSBsaWtlIHRoZSAiLWEiIG9w
dGlvbiENCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KDQpCZXN0IHJlZ2FyZHMsDQpGbGF2aW8NCg==
