Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280802EF0C9
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 11:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbhAHKk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 05:40:59 -0500
Received: from smtp.asem.it ([151.1.184.197]:51105 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727471AbhAHKk6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 05:40:58 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000698777.MSG 
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 11:40:15 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 8 Jan
 2021 11:40:14 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1979.003; Fri, 8 Jan 2021 11:40:14 +0100
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
Thread-Index: AQHW5DC+EYQ7RQ5jYUeg211EwFA6Oaodigsg
Date:   Fri, 8 Jan 2021 10:40:14 +0000
Message-ID: <4a7c2f63ec2c4cde9742603e3cbbaee8@asem.it>
References: <20210105082758.77762-1-linus.walleij@linaro.org>
 <CAHp75VeXC26KxxhrSbtae2_v4Zqnaaia3nV_1sxY07uUEt3U7g@mail.gmail.com>
 <CACRpkdYixhB6rTw=DK7CetExsXSH4czVzysynZas07OTuQi0vA@mail.gmail.com>
 <CAMpxmJUJnhc9HrZnb=qE5fpZ9e0Xo7VP-hTjdK-LHk0w6n3cMQ@mail.gmail.com>
 <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
In-Reply-To: <CAHp75VcVN5Af3t-OYdO9MOXk14LV+zYQtusqft8twi_u83yZ6g@mail.gmail.com>
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
X-SGOP-RefID: str=0001.0A782F17.5FF8368F.003D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwNCiANCj4gRmxhdmlvLCBwZXJoYXBzIG9uZSBtb3JlIHJ1bGUgdG8gdGhlIGdwaW8t
bGluZS1uYW1lcyBwcm9wZXJ0eSBoYXMgdG8NCj4gYmUgYWRkZWQgaW50byBkb2N1bWVudGF0aW9u
IChCYXJ0LCBzYW1lIHRvIERUIGRvY3M/KToNCj4gIC0gbmFtZXMgaW5zaWRlIG9uZSBjaGlwIG11
c3QgYmUgdW5pcXVlDQogDQpKdXN0IGEgcXVlc3Rpb246IHdoeSAiaW5zaWRlIG9uZSBjaGlwIiBv
bmx5Pw0KVGhlIG5hbWUgc2hvdWxkIGJlIHVuaXF1ZSBmb3IgYWxsIGdwaW9jaGlwcywgc2luY2Ug
ImdwaW9maW5kIg0Kc3RvcHMgYXQgdGhlIGZpcnN0IG5hbWUgbWF0Y2gsIGFuZCBkb2Vzbid0IHNo
b3cgb3RoZXIgZ3Bpb3MNCm5hbWVzLCBldmVuIGlmIHRoZXkgZXhpc3QsIHdpdGggdGhlIHNhbWUg
bmFtZSwgaW4gb3RoZXIgZ3Bpb2NoaXAuDQoNCkkgdGhpbmsgdGhhdCBhIHJ1bGUgYXM6DQoNCi0g
bmFtZXMgbXVzdCBiZSB1bmlxdWUgKGF2b2lkIGR1cGxpY2F0ZXMgaW4gYW55IGdwaW9jaGlwcykg
DQoNCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KDQpCZXN0
IHJlZ2FyZHMsDQpGbGF2aW8gU3VsaWdvaQ0K
