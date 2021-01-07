Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8462ED068
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 14:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbhAGNNM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 08:13:12 -0500
Received: from smtp.asem.it ([151.1.184.197]:50393 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728172AbhAGNNM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 08:13:12 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000696951.MSG 
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 14:12:29 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 14:12:29 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Thu, 7 Jan 2021 14:12:29 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: R: [PATCH v2] gpiolib: Disallow identical line names in the same chip
Thread-Topic: [PATCH v2] gpiolib: Disallow identical line names in the same
 chip
Thread-Index: AQHW5DC+EYQ7RQ5jYUeg211EwFA6Oaob7+Gg///yR4CAAD1wkA==
Date:   Thu, 7 Jan 2021 13:12:29 +0000
Message-ID: <82fe86d57d7e422f8aae35223f871833@asem.it>
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
 <d04ed4ea7bfe4438947e05c86f031ed4@asem.it>
 <CAHp75VdhorVKXxcppuK6t+yUMS0mcLp_0rOWg7bgiWviP2rkbw@mail.gmail.com>
In-Reply-To: <CAHp75VdhorVKXxcppuK6t+yUMS0mcLp_0rOWg7bgiWviP2rkbw@mail.gmail.com>
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
X-SGOP-RefID: str=0001.0A782F1B.5FF708BD.00A9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCg0KPiBPbiBUaHUsIEphbiA3LCAyMDIxIGF0IDEyOjAzIFBNIEZsYXZpbyBTdWxp
Z29pIDxmLnN1bGlnb2lAYXNlbS5pdD4gd3JvdGU6DQo+IA0KPiA+ID4gRmxhdmlvLCBwZXJoYXBz
IG9uZSBtb3JlIHJ1bGUgdG8gdGhlIGdwaW8tbGluZS1uYW1lcyBwcm9wZXJ0eSBoYXMgdG8NCj4g
PiA+IGJlIGFkZGVkIGludG8gZG9jdW1lbnRhdGlvbiAoQmFydCwgc2FtZSB0byBEVCBkb2NzPyk6
DQo+ID4gPiAgLSBuYW1lcyBpbnNpZGUgb25lIGNoaXAgbXVzdCBiZSB1bmlxdWUNCj4gPg0KPiA+
IG9rLCBJJ2xsIGFkZCB0aGlzIHJ1bGUNCj4gDQo+IFRoYW5rcyENCj4gDQo+IE1haW4gcG9pbnQg
Zm9yIGNhbGxpbmcgeW91IGlzIHRoYXQgeW91IG1heSB0ZWxsIHRoYXQgd2hhdCB5b3UgYWxzbw0K
PiBhc3N1bWVkIHdoZW4gYXNzaWduZWQgbGluZSBuYW1lcyBpbiB5b3VyIGNhc2UocykuDQoNCmlu
IHRoZSBCSU9TIG9mIHNvbWUgb2Ygb3VyIGJvYXJkcywgSSd2ZSBhZGRlZCBzb21lIGdwaW8gbmFt
ZXMNCih1c2luZyB0aGUgQUNQSSB0YWJsZXMpIHVzaW5nIG9ubHkgdGhlIGV4aXN0aW5nIHJ1bGVz
IHdyaXR0ZW4gaW46DQoNCkRvY3VtZW50YXRpb24vZmlybXdhcmUtZ3VpZGUvYWNwaS9ncGlvLXBy
b3BlcnRpZXMucnN0DQoNCmFuZCB0YWtpbmcgY2FyZSBub3QgdG8gZHVwbGljYXRlIHRoZSBhc3Np
Z25lZCBuYW1lLg0KDQpBYm91dCB0aGUgbmFtZXMgdXNlZCwgSSd2ZSBjcmVhdGVkIGEgImdyYW1t
YXIiIHRvIGRlc2NyaWJlLA0KdXNpbmcgdGhlIDMyIGNoYXJzIG9mIHRoZSBuYW1lLCB0aGUgdXNl
ci1zcGFjZSBwdXJwb3NlIG9mIGVhY2ggZ3BpbywNCnN1Y2ggYXM6DQoNCi0gdXNlIChidXR0b24s
IGdlbmVyaWMgaW4gb3Igb3V0LCBldGMuKQ0KLSBwb2xhcml0eSAoYWN0aXZlIGxvdy9oaWdoKQ0K
LSBtb2RlIChsZXZlbCBvciBlZGdlKQ0KLSBodyBzaGFyaW5nIChhIGdwaW8gY2FuIGJlIHNpbXVs
dGFuZW91c2x5IHVzZWQgYm90aCBmcm9tIGEgdXNlcg0KICAgICAgICAgICAgICBhcHBsaWNhdGlv
biBhbmQgZnJvbSBhbiBodyBmdW5jdGlvbikNCg0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5k
eSBTaGV2Y2hlbmtvDQoNCkJlc3QgcmVnYXJkcywNCkZsYXZpbyBTdWxpZ29pDQo=
