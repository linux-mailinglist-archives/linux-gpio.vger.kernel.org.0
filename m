Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9B9122774
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 10:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfLQJP5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 04:15:57 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:50236 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbfLQJP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 04:15:57 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-67-5df89cca770e
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 46.55.08102.ACC98FD5; Tue, 17 Dec 2019 10:15:54 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 17 Dec 2019 10:15:49 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v6 09/15] regulator: bd71828: Basic support for ROHM
 bd71828 PMIC regulators
Thread-Topic: [PATCH v6 09/15] regulator: bd71828: Basic support for ROHM
 bd71828 PMIC regulators
Thread-Index: AQHVsAfYI3uVDvKcOUypO4bwmJ45Qqe80OIAgAEzbYA=
Date:   Tue, 17 Dec 2019 09:15:48 +0000
Message-ID: <f56acdc65ab341f9c4ec0709fbfcc32b9f16d6ae.camel@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <20191216145528.GE4161@sirena.org.uk>
In-Reply-To: <20191216145528.GE4161@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D46A00866A9A2D4495284B4D77EF2287@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0wTZxj2u7veHT/OHRXks07jurjNLSgYtnxuSojxx5k4ssRky1ywPeSk
        HaXFa1lk/iGRqQMVC0gMpUWlMIkQKwWiokZSKmpnWBpPrEFdmMTfAaYMUFB356nw1/d87/M+
        z/P+8b40rvVSOtpsdQiilbfoyWiis3GiJSnkHs9MvnJpLqoPX6fQnsE/KPSyoptCI54Qgar6
        B0g00LkHoMPBHg3a+2ebBhV7fSTqaz9JoL//uwjQqPQ7hg5OHsPQv/vuaNDR3fUEaj08CdC1
        DjeJ2p+cAKi7SSJRw40whtwNlwk09LQEQ+HQalQVGqTQ7dBFEhWHIzjadT5IoVe9LQQq61mb
        Po9rrm0G3MSLCsANRXZRXG3zdu6M6zbF+Y+XkNyt3nMkd8HTTHHeskoNN3q1nODuHfUR3KXI
        KYw7VPsc43z7goBrbBqjuGf++d+xG2OWZ/GOXzaYc6xL0owxplppR35F9LZjrl6iCAxHlYIo
        GrKp8FC3pCkF0bSWvQ5gl/M+pX4uA7j/SRsoBTRNssth6U1KEcSzSbDqhZdUMM5KMbDm7E8K
        nsVmQV/Xbkzt2QwvPPC+xV9D6YgHVzDBLoTOcORNnWEz4F23D1ezrgLYJ1W+MY1il8J/HncS
        CgbsPFhSNIipYYnQf29Mo07Nwvpzf+EqToAP7756W9fD88/7CWVmnF0EfR1LVJgOD3R+orp8
        BA/u7afUEeLgleoBwglmu6YFuKbErimxa5rYNU18BGiOA5jHmy05vENIWSwKBYtFmylPfjbb
        8vxAXbqR0+B1YF0AYDQIgDk0pk9gYteOZ2pnZtmyC0283WQQCyyCPQAgjevjmdMLxjK1TDZf
        +Ksg2t5Rc2lCn8h82l+eqWWVrFxByBfEd+yHNK2HzNNq2TROFHKEbVvMFscUjdFRinm0Lt4u
        WLMFkS9wmAzKchjs8nYoVKyc+7F8GVrGns/nyVVVGgJf0M6HnjqcDnoa6nAtYbVZBV0iU1gj
        t7JKq6nA+j7oEUikgX4W43TJbKx8ee99HskRmByxNGNUiXDwU5SuCPx2c8V48k7jB8XSluRy
        5kZ225dMwFDT2lXcdG3FHXvEGZizJtyzMc1rzm1YPzEjddmGnw2tPa/9kVWNzPBnYzMQPBEb
        nL1y/mSTbXLolGRMivvq+/Tq1APg2+HKReVp7bqtt9adTW2xGEt2/liRe3I0oWPE/XjrJulZ
        30Jja9kPKd/oCbuJT/kcF+38/5X8RXI2BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyaywNCg0KT24gTW9uLCAyMDE5LTEyLTE2IGF0IDE0OjU1ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiBPbiBXZWQsIERlYyAxMSwgMjAxOSBhdCAxMTo0NjoxMUFNICswMjAwLCBN
YXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+IA0KPiA+ICtzdGF0aWMgaW50IGJkNzE4MjhfbGRvNl9n
ZXRfdm9sdGFnZShzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldikNCj4gPiArew0KPiA+ICsJcmV0
dXJuIEJENzE4MjhfTERPXzZfVk9MVEFHRTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCByZWd1bGF0b3Jfb3BzIGJkNzE4MjhfbGRvNl9vcHMgPSB7DQo+ID4gKwkuZW5h
YmxlID0gcmVndWxhdG9yX2VuYWJsZV9yZWdtYXAsDQo+ID4gKwkuZGlzYWJsZSA9IHJlZ3VsYXRv
cl9kaXNhYmxlX3JlZ21hcCwNCj4gPiArCS5nZXRfdm9sdGFnZSA9IGJkNzE4MjhfbGRvNl9nZXRf
dm9sdGFnZSwNCj4gDQo+IFlvdSBjYW4ganVzdCBzZXQgZml4ZWRfdVYgaW4gdGhlIHJlZ3VsYXRv
cl9kZXNjLCB5b3UgZG9uJ3QgbmVlZCBhDQo+IGdldF92b2x0YWdlKCkgb3BlcmF0aW9uIGhlcmUu
ICBPdGhlcndpc2UgdGhpcyBsb29rcyBnb29kLCBJJ2xsIGFwcGx5DQo+IGl0DQo+IGFuZCBwbGVh
c2Ugc2VuZCBhbiBpbmNyZW1lbnRhbCBmaXggZm9yIHRoaXMuDQoNCkp1c3QgdG8gY29uZmlybSAt
IGFyZSB5b3UgYWxzbyB0YWtpbmcgaW4gdGhlDQpbUEFUQ0ggdjYgMDgvMTVdIHJlZ3VsYXRvcjog
YmQ3MTh4NzogU3BsaXQgZHJpdmVyIHRvIGNvbW1vbiBhbmQgYmQ3MTh4Nw0Kc3BlY2lmaWMgcGFy
dHMNCg0KSSB0aGluayB0aGVyZSBpcyBhIGRlcGVuZGVuY3kuIChJIGFtIHByZXBhcmluZyBuZXh0
IHZlcnNpb24gb2YgdGhlDQpzZXJpZXMgc28gSSdsbCBkcm9wIHRoZSBhbHJlYWR5IGFwcGxpZWQg
cGF0Y2hlcy4pDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
