Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AA52ED12B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 14:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbhAGNtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 08:49:49 -0500
Received: from smtp.asem.it ([151.1.184.197]:52572 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728145AbhAGNtt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 08:49:49 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000697095.MSG 
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 14:49:07 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 14:49:05 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Thu, 7 Jan 2021 14:49:05 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>
Subject: R: [PATCH v2] gpiolib: Disallow identical line names in the same chip
Thread-Topic: [PATCH v2] gpiolib: Disallow identical line names in the same
 chip
Thread-Index: AQHW5OImEYQ7RQ5jYUeg211EwFA6OaocJRow
Date:   Thu, 7 Jan 2021 13:49:05 +0000
Message-ID: <63d69976687846c6a50e904b913bd235@asem.it>
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
In-Reply-To: <CACRpkdZVw53K26hOQMfqfC+3=wdqm8kUDPdWrz-KRj1rh9ijYQ@mail.gmail.com>
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
X-SGOP-RefID: str=0001.0A782F16.5FF71152.0038,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgYW5kIEJhcnRvc3osDQoNCj4gT24gV2VkLCBKYW4gNiwgMjAyMSBhdCAxMTowOSBB
TSBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPiB3cm90
ZToNCj4gDQo+ID4gSSBjYW4gZG8gaXQgYWxyaWdodC4gQnV0IGluIHRoZSBjb250ZXh0IG9mIHVz
ZXItc3BhY2UgSSB0aGluayB0aGlzDQo+ID4gZG9lc24ndCByZWFsbHkgY2hhbmdlIGFueXRoaW5n
LiBEVCB1c2VycyBzdGlsbCBjYW4gdXNlIG5vbi11bmlxdWUNCj4gPiBuYW1lcyBhbmQgbGliZ3Bp
b2Qgc3RpbGwgaGFzIHRvIGFjY291bnQgZm9yIHRoYXQgaWYgdGhlIEFQSSBpcyB0byBiZQ0KPiA+
IGNvbnNpZGVyZWQgY29ycmVjdC4gSXMgdGhpcyBjaGFuZ2UgcmVhbGx5IHVzZWZ1bD8gSG93IGRv
ZXMgaXQgYWZmZWN0DQo+ID4gQUNQSSB1c2VycyB0aGF0IGFscmVhZHkgZGVmaW5lIG5vbi11bmlx
dWUgbmFtZXM/DQo+IA0KPiBGb3IgaGFyZHdhcmUgZGVzY3JpcHRpb24gaW5zdGFuY2VzIHRoZSBw
cm9ibGVtIHJlbWFpbnM6IGRldmljZSB0cmVlDQo+IGxpbmUtbmFtZXMgYW5kIGRldmljZSBwcm9w
ZXJ0aWVzIGNhbiBiZSBub24tdW5pcXVlLg0KPiANCj4gV2hhdCBpdCBzb2x2ZXMgaXMgdG8gZW5m
b3JjZSB1bmlxdWUgbGluZSBuYW1lcyBmb3IgZ3BpbyBjaGlwcyB3aXRoDQo+IHRoZSBzdHJ1Y3Qg
Z3Bpb19jaGlwIC5uYW1lcyBhcnJheSBzZXQgdG8gc29tZSBuYW1lcywgdGhhdCBlYWNoDQo+IG5h
bWUgaW4gdGhpcyBhcnJheSBtdXN0IGJlIHVuaXF1ZS4NCj4gDQo+IFRoaXMgaGFwcGVucyBmb3Ig
ZXhhbXBsZSB3aGVuIHR3byBVU0IgRlRESSBjb252ZXJ0ZXJzDQo+IHdpdGggdGhlIHNhbWUgR1BJ
TyBsaW5lcyBhcmUgcGx1Z2dlZCBpbi4gRWFjaCBjaGlwIGNhbiBoYXZlIGENCj4gIlRYIiBsaW5l
IGJ1dCBpdCBjYW4gbm8gbG9uZ2VyIGhhdmUgdHdvICJUWCIgbGluZXMuDQo+IA0KPiBZb3VycywN
Cj4gTGludXMgV2FsbGVpag0KDQphYm91dCB0aGUgZHVwbGljYXRlIGxpbmUgbmFtZXMsIHdoYXQg
ZG8geW91IHRoaW5rDQphYm91dCBhZGRpbmcgdG8gdGhlIGNvbW1hbmQgImdwaW9maW5kIiBvZiBs
aWJncGlvZCB0b29scywNCnRoZSBwb3NzaWJpbGl0eSB0byBkaXNjb3ZlciBhbGwgdGhlIGR1cGxp
Y2F0ZSBncGlvIGxpbmVzPw0KDQpGb3IgZXhhbXBsZSwgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxv
d2luZzoNCg0KIyBncGlvZmluZCBidXR0b25fMQ0KZ3Bpb2NoaXAwIDIwDQpncGlvY2hpcDAgMjIg
KGR1cGxpY2F0ZSkNCmdwaW9jaGlwMiAxMiAoZHVwbGljYXRlKQ0KIw0KDQpCZXN0IHJlZ2FyZHMs
DQpGbGF2aW8gU3VsaWdvaQ0K
