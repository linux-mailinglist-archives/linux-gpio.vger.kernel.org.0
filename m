Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B3A122516
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 07:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLQG4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 01:56:33 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:45098 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfLQG4d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 01:56:33 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-5b-5df87c1ebcc5
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 31.34.08102.E1C78FD5; Tue, 17 Dec 2019 07:56:30 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 17 Dec 2019 07:56:26 +0100
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
Thread-Index: AQHVsAfYI3uVDvKcOUypO4bwmJ45Qqe80OIAgAEMf4A=
Date:   Tue, 17 Dec 2019 06:56:23 +0000
Message-ID: <06f1f3529fc168daa513e0a6db7b4e0147f86358.camel@fi.rohmeurope.com>
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
Content-ID: <270552940107BB4D8F91F4EA5DFF4642@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfVAUZRzHe3af23142WY9MR4prU6LMULAzHmmmIaZatxmimFqppnSkxbY
        OCa4o72DEW2KSQVBYsTzZLoA5XiRt+nwitEIhhs6DA8ijxej0AhlGNQGswgUxdplVfjr+T7P
        9/l+P88fvwfR+jo2AmWYbZJsFjMNTDD0Ntw5Fb3+k1vG2IOthNQGRlhSOFPPksUjZ1kyW+mH
        xDExyZBJbyEgx30DOnKo71sd2VfjZshYWysk4//2ADI3fJAiR++epMjNkt91pLqgFpJvjt8F
        ZKi9giFtf34NyNnmYYbU/RKgSEVdLyQ3/i6iSMD/OnH4Z1hyyd/DkH2BUZoc6PSx5N6FU5CU
        DmxPWCe0VLUA4c7CESDcGD3AClUte4XvnJdYwdNUxAgXL3QwQldlCyvUlNp1wlx/GRSmqt1Q
        +HH0NCWUV92mBHeJDwgNzfOs8I9nfRL/fkh8imjLfScj3Rzzygchps6TTUx2O7v7/GmvLh+c
        YItBEML8Vlx2pUBXDIKRnh8BeOiYg9U2vQBPLQ7AYoAQw8fj4l+XAmF8NHYs1DCqpvnhEPzV
        9ztUvZpPwe4fCijtTirumq65r1/CPdMuWtWQfwZ7S1qBWsnxibix6mMN1Q/w2LB9qTOI34Iv
        X/dCVQN+HS7Kn6E0Vjj2TM3rtEfzuLbjZ1rTa/DVK/funxtw5+2JpSfT/Cbsbo/Rogn44uI4
        q+mn8dFDE0ua41fhc19OwsPgMecKgnM57VyRdq5IO1ekTwBdE8BZYkZmumiT4jbLUs5m2WLK
        UpZUS5YHaGM3ewb81/1GN6AQ6AZrEWVYw4Vuv2XUP5piScsziVZTspyTKVm7AUa0IYw789S8
        Uc+liXl7JNnywHocQUM4FzlRZtTzKusjScqW5AfuEwgZMPf8XqV0lSylS7s/zMi0LdsUClLL
        gyPCrJI5TZLFHJspWR2PZKsyH6oVqnCH9ihxzpotZimnWtQPotDhq5UuGvkq61y0HpotZiki
        nBtUSbx61ZRjfgi6BsIRMKzm/lKLQpW/97DnmoKgFMSWxDkVYROXrYh8YHl7xwsksr/8XUeS
        /VXX9bLCRFvnuY0JjfW+F7dF+zZugOPlztiBxvPUF6l0c8zgs0mbovqmu36L9dd2oG3vWXeW
        VPsf2WoHFW2zazfs90Tt7Nv1x1j8k/vl+ZG83F2labk3IwOX7QsJg0b08k9xxtdSGno/k01v
        1n8uBr0FPw11QQO0msS452jZKv4PHr7zGzgEAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIE1hcmssDQoNCk9uIE1vbiwgMjAxOS0xMi0xNiBhdCAxNDo1NSArMDAwMCwgTWFyayBC
cm93biB3cm90ZToNCj4gT24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMTE6NDY6MTFBTSArMDIwMCwg
TWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiANCj4gPiArc3RhdGljIGludCBiZDcxODI4X2xkbzZf
Z2V0X3ZvbHRhZ2Uoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYpDQo+ID4gK3sNCj4gPiArCXJl
dHVybiBCRDcxODI4X0xET182X1ZPTFRBR0U7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgcmVndWxhdG9yX29wcyBiZDcxODI4X2xkbzZfb3BzID0gew0KPiA+ICsJLmVu
YWJsZSA9IHJlZ3VsYXRvcl9lbmFibGVfcmVnbWFwLA0KPiA+ICsJLmRpc2FibGUgPSByZWd1bGF0
b3JfZGlzYWJsZV9yZWdtYXAsDQo+ID4gKwkuZ2V0X3ZvbHRhZ2UgPSBiZDcxODI4X2xkbzZfZ2V0
X3ZvbHRhZ2UsDQo+IA0KPiBZb3UgY2FuIGp1c3Qgc2V0IGZpeGVkX3VWIGluIHRoZSByZWd1bGF0
b3JfZGVzYywgeW91IGRvbid0IG5lZWQgYQ0KPiBnZXRfdm9sdGFnZSgpIG9wZXJhdGlvbiBoZXJl
LiAgT3RoZXJ3aXNlIHRoaXMgbG9va3MgZ29vZCwgSSdsbCBhcHBseQ0KPiBpdA0KPiBhbmQgcGxl
YXNlIHNlbmQgYW4gaW5jcmVtZW50YWwgZml4IGZvciB0aGlzLg0KDQpXaWxsIGRvIDopDQoNCkJy
LA0KCU1hdHRpDQo=
