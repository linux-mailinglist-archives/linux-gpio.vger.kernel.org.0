Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC99A101FB9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 10:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfKSJMO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 04:12:14 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:42746 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfKSJMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 04:12:14 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-33-5dd3b1ebf61b
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id A1.7C.08102.BE1B3DD5; Tue, 19 Nov 2019 10:12:11 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 19 Nov 2019 10:12:06 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
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
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 09/16] regulator: bd71828: Basic support for ROHM
 bd71828 PMIC regulators
Thread-Topic: [PATCH v5 09/16] regulator: bd71828: Basic support for ROHM
 bd71828 PMIC regulators
Thread-Index: AQHVnd2DWIMPtP3SE0CbN3AnPrzvvaeRC7QAgAEapIA=
Date:   Tue, 19 Nov 2019 09:12:06 +0000
Message-ID: <bd5499bcb2cceb163ab7829eced05360c725f6e3.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <ffd3ea4858f820e565aba88ccac395ce5b661538.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162032.GI9761@sirena.org.uk>
In-Reply-To: <20191118162032.GI9761@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDAFFAA195E63A428FBFB188D7C56A34@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwTZxzH89w7lVuOCvKASrJbFt+iDOaSZ4txukw9t8w598+yhMAhJyVC
        y65lwowTJp22MiaxZthIeWeGt46i21RqTC0OqnarWMaiDKqMDHSSOQRRg7vbTeGv+93z/X6+
        3+eP38Pg+mY6kckxWiTZKObylI64cPKxZ/Wdjr60V4buJ6CGUJhGB+810WiyKkCgY5ERCo1c
        OAhQtT9IosOXT5GobqKSRDbbIRLdOP0dgXo6hwAaetAN0NT1QxhyPPkWQ3+X/U6i2i8bCNRZ
        /QSgvrMnKHT6bjtAl1quU6jNP0ijxl9DGDrR2EOgifs2DIUCm9BgoJtCB0IDOLJ6/TSa7e8g
        UHlwy4YkodXVCoSJASstuFr3Cmecg7RQ3zWGCZ5mGyXc7O+ihPryo6TwZ9lFQpi6UkEI5aea
        gTBa6yaEnwZ+wIRvXDOYcLJlmhb+8SRt5z5esC5TtHz6YU62MXl9xgJDZa0V5LfrCmccI3gx
        KNPZQRQDubVwvP4hbgc6Rs+FAXQ0fU1rPz0AtvlLSTtgGIpbB+2/0SoQy62Gxx7VU6oH545H
        w/PBc5gqLOQyYfhMCFf9sdxOePNOjOZ/Aw7UdOPqTHAvw6amWVKdWW4bvBopBVrXFQAfeEsw
        lY3iUuHQ5U9UD+CWQlvxvf/icS4eekanSe3SHGzo+hnX5jg4dnv2/3MeemcihBqDcyug+2yy
        hm6AT689xLX5Reg4HKG1K8TA3uMjxBGwyDmvwTlHO+fRznm0cx5dA8hmAPPEnNxs0SKlrJGl
        gjWyyZCnfHaa8jxA273JH8FT31YfwBjgAwkMxsexw4V9afoXMk1ZRQbRbEiXC3Ilsw9ABudj
        2W23fknTs1li0WeSbHomLWYIPp5dFqlI03Nq125JypfkZ+oShuEh62hXQmNkKVsq3JWTa5mT
        MSZKDdclxpolY5YkiwUWQ7q6HulmZT9UKVrpveRWcNacL+YppxoaAKuYI2NVdTjjr2qsw/WE
        0WSUEuPZIoNi5VSrocD4vGgcxDOAX8j2q0HRygN8njOuVGBKRUfbNbXCIs5JicVguzWsi1qe
        khoX3DS151bfcG/GylJfCbWLf/TSvvF9r7+t37P2o6+qF/csWX4xfWPcm5tXDe8veTUl8n1G
        hUW34+jV8JS7dvcH74tbv/C6kt9qWfr4xt3U9amhGqu7k7/tGu39q4s1V27OTPLaE/bCdz/n
        /3hn0eR0oWWLK2APrqje/95rPGE2iCkrcdks/gubXQWTPQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIE1hcmssDQoNCk9uIE1vbiwgMjAxOS0xMS0xOCBhdCAxNjoyMCArMDAwMCwgTWFyayBC
cm93biB3cm90ZToNCj4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDg6NTc6NTdBTSArMDIwMCwg
TWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiANCj4gPiArc3RhdGljIGludCByYW1wX2RlbGF5X3N1
cHBvcnRlZChzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldikNCj4gPiArew0KPiA+ICsJc3dpdGNo
IChyZGV2LT5kZXNjLT5pZCkgew0KPiA+ICsJY2FzZSBCRDcxODI4X0JVQ0sxOg0KPiA+ICsJY2Fz
ZSBCRDcxODI4X0JVQ0syOg0KPiA+ICsJY2FzZSBCRDcxODI4X0JVQ0s2Og0KPiA+ICsJY2FzZSBC
RDcxODI4X0JVQ0s3Og0KPiA+ICsJCXJldHVybiAxOw0KPiA+ICsJZGVmYXVsdDoNCj4gPiArCQli
cmVhazsNCj4gPiArCX0NCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0
aWMgaW50IGJkNzE4Mjhfc2V0X3JhbXBfZGVsYXkoc3RydWN0IHJlZ3VsYXRvcl9kZXYgKnJkZXYs
IGludA0KPiA+IHJhbXBfZGVsYXkpDQo+ID4gK3sNCj4gPiArCXVuc2lnbmVkIGludCB2YWw7DQo+
ID4gKw0KPiA+ICsJaWYgKCFyYW1wX2RlbGF5X3N1cHBvcnRlZChyZGV2KSkgew0KPiA+ICsJCWRl
dl9lcnIoJnJkZXYtPmRldiwgIiVzOiBjYW4ndCBzZXQgcmFtcC1kZWxheVxuIiwNCj4gPiArCQkJ
cmRldi0+ZGVzYy0+bmFtZSk7DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBSYXRoZXIg
dGhhbiBkb2luZyB0aGlzIGl0J3MgYmV0dGVyIHRvIGp1c3Qgbm90IHByb3ZpZGUgdGhlIG9wZXJh
dGlvbg0KPiBmb3INCj4gZGV2aWNlcyB0aGF0IGRvbid0IHN1cHBvcnQgaXQsIHRoYXQgbWFrZXMg
dGhlIGhhbmRsaW5nIGluIHRoZSBjb3JlDQo+IGVhc2llci4NCg0KTWFrZXMgc2Vuc2UuIEknbGwg
Y2hhbmdlIHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg0K
