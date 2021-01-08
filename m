Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B752C2EF41B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 15:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbhAHOoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 09:44:07 -0500
Received: from smtp.asem.it ([151.1.184.197]:61361 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbhAHOoH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 09:44:07 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000699395.MSG 
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 15:43:25 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 Jan
 2021 15:43:23 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Fri, 8 Jan 2021 15:43:23 +0100
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
Thread-Index: AQHW5OImEYQ7RQ5jYUeg211EwFA6OaocJRow///5/QCAAavHgP//80OAgAARCPA=
Date:   Fri, 8 Jan 2021 14:43:23 +0000
Message-ID: <4187c68a8567442f9a1ff365d28085af@asem.it>
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
 <63d69976687846c6a50e904b913bd235@asem.it>
 <CAMuHMdW=TMbBUYVd0XVT88F+wDZ09F_WTB=f50eyRSire7TWSg@mail.gmail.com>
 <860764e8df53481bb43c79560b859979@asem.it>
 <CAMuHMdUoWv9qZLYzQyxXsGd4mhiqA7SRHYF33EvSvjBUOzYVnw@mail.gmail.com>
In-Reply-To: <CAMuHMdUoWv9qZLYzQyxXsGd4mhiqA7SRHYF33EvSvjBUOzYVnw@mail.gmail.com>
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
X-SGOP-RefID: str=0001.0A782F1C.5FF86F8C.003B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gPiA+ID4gYWJvdXQgdGhlIGR1cGxpY2F0ZSBsaW5lIG5hbWVzLCB3aGF0
IGRvIHlvdSB0aGluaw0KPiA+ID4gPiBhYm91dCBhZGRpbmcgdG8gdGhlIGNvbW1hbmQgImdwaW9m
aW5kIiBvZiBsaWJncGlvZCB0b29scywNCj4gPiA+ID4gdGhlIHBvc3NpYmlsaXR5IHRvIGRpc2Nv
dmVyIGFsbCB0aGUgZHVwbGljYXRlIGdwaW8gbGluZXM/DQo+ID4gPiA+DQo+ID4gPiA+IEZvciBl
eGFtcGxlLCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOg0KPiA+ID4gPg0KPiA+ID4gPiAj
IGdwaW9maW5kIGJ1dHRvbl8xDQo+ID4gPiA+IGdwaW9jaGlwMCAyMA0KPiA+ID4gPiBncGlvY2hp
cDAgMjIgKGR1cGxpY2F0ZSkNCj4gPiA+DQo+ID4gPiBUaGlzIGNhbm5vdCBoYXBwZW4sIGFzIHRo
ZSBkdXBsaWNhdGUgaXMgb24gdGhlIHNhbWUgZ3Bpb2NoaXAuDQo+ID4NCj4gPiBKdXN0IGEgcXVl
c3Rpb246ICBJIHRoaW5rIHRoYXQgYSBkdXBsaWNhdGUgbmFtZSBjYW4gYmUgcHJlc2VudA0KPiA+
IGJvdGggaW4gdGhlIHNhbWUgZ3Bpb2NoaXAgYW5kIGFsc28gaW4gZGlmZmVyZW50IGdwaW9jaGlw
cy4NCj4gPiBUaGUgc2FtZSBncGlvIGxpbmUgbmFtZSBjYW4gYmUgd3JvbmdseSBwcmVzZW50IG9u
IGRpZmZlcmVudCBncGlvY2hpcHMsDQo+ID4gZm9yIGV4YW1wbGUgY2F1c2VkIGJ5IGEgbWlzdGFr
ZSB3cml0aW5nIGFuIEFDUEkgdGFibGUuDQo+IA0KPiBBIGR1cGxpY2F0ZSBuYW1lIGluIHRoZSBz
YW1lIGdwaW9jaGlwIGlzIHJlamVjdGVkLCBhcyBwZXIgdGhlIHBhdGNoIHRoYXQNCj4gc3RhcnRl
ZCB0aGlzIHRocmVhZC4NCg0KcmlnaHQsIHRoYW5rcyBHZWVydCENCg0KPiANCj4gR3J7b2V0amUs
ZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KDQpCZXN0IHJl
Z2FyZHMsDQpGbGF2aW8NCg==
