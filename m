Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7D2140855
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 11:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgAQKsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 05:48:15 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:42832 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgAQKsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 05:48:15 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-80-5e2190ed649b
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 09.2B.08102.DE0912E5; Fri, 17 Jan 2020 11:48:13 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 17 Jan 2020 11:48:08 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Thread-Topic: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Thread-Index: AQHVzRi5yTX4egnFhE+K8HvJn6t48qfuly8AgAAFDwA=
Date:   Fri, 17 Jan 2020 10:48:07 +0000
Message-ID: <9785531484b32da487a6016f5c32bf2e9bc45985.camel@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <20200117103000.GG15507@dell>
In-Reply-To: <20200117103000.GG15507@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <35BA07293542E7478D19B7C2046172B3@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tb0wTZxjPe3e9e6nUvFQqr2y6cNnm6jKRZCbvDC5kA3PL4rJlnzaz4jne
        0U5o4VoMOj8wI2HWubHMxqxp0TBAQpnaMjLXYTAMHCvRpcofjRYtoBtuasyQDiWwO06FT/e7
        5/fv+fC8kDUn+WzocHqo4pTLRN7InW19FH7lTn2ObUP8b0Sa4kMCqbvbIpCpYIwjvuQET472
        XjCQgwM/GsjVzlMcuf6gD5DpwS8Ycnj2OEPufzlqIB1HZwG5FA3wpPOfE4CcCw3ypHkkzpBA
        cz9H4rEikoj18aT2TK9A5obDXIFFam9oB9K9y7WC1ND+mfSzPyFIkbYDvHRtuIuXfrv8EyMd
        aZhhpNZQSpD+jax51/jhsvwdsmfX+45SZ+7r25fZfdE4VzFhqb7n6wY1IGDxgjSI0av4nPe4
        4AVGaEZDAP96s43Xf/oBPnL+IfACCHmUj71XBM2QifJwU/9NTtOwqAnib2OjQCNWIIJbQsO8
        LnoNj39+Eeh4E56PDCzMOfQC/qHjz4UgE3oHz/wysKAxI4rDU3cW5mloHb4xHec0DNBqfKDm
        LqNhFmXhyK2UQd8a4aauP1gdW/Dk+NzjuYjPzCQ5bWcWWfHJaK5uLcCB2TCn4xx8+GDy8QoZ
        +PfvJrh6sNK/pMG/6PYvcfuXuP1L3MeAoQ3gctlRVip7aN56hVatV1z2cvXzsas8AvSTmToN
        5nve6gEMBD1gFWREiymza7XNvHyHq2S3XXbbi5WqMuruARiyYqYpcSjHZjaVyLv3UMX1hHoG
        cmKWaW3ym4/MSOvaSWkFVZ6wz0IoYtPQV6oxQ6GltPoTR5lnkWZgmhZuzM50U2cJVeQqj71Y
        u49it3ogGpWu9jq+1nrdFXK5OtWtMfAyrJ8MNrKwN9jcyJo5p8tJs7NMNftVKdKk9irn06Lb
        IAsCcYUJaEHp6rt5mnNbrWDUivo312gVHnmRyq4BlXvfyPhr1wfv1Q0weM+YP3Di+fkXCyNp
        Hb6G7jAYD0bHbvW9PRblbNP5LutzdJ+zszF1qKuocMvZl8R0X0t3ImdwrXVqa+Hyk8GK7pHK
        /yZSI9us5oLUlsGtlZ8+uiBc33yjaC40mdtKa8WNYkgwgrqErUUYjbSe/35jtfUBFTm3Xc5b
        xypu+X/mwo329AMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjAtMDEtMTcgYXQgMTA6MzAgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gRnJpLCAxNyBKYW4gMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiANCj4gPiBQYXRj
aCBzZXJpZXMgaW50cm9kdWNpbmcgc3VwcG9ydCBmb3IgUk9ITSBCRDcxODI4IFBNSUMNCj4gPiAN
Cj4gPiBST0hNIEJENzE4MjggaXMgYSBwb3dlciBtYW5hZ2VtZW50IElDIGNvbnRhaW5pbmcgNyBi
dWNrcyBhbmQgNw0KPiA+IExET3MuIEFsbA0KPiA+IHJlZ3VsYXRvcnMgY2FuIGJlIGNvbnRyb2xs
ZWQgaW5kaXZpZHVhbGx5IHZpYSBJMkMuIEJ1Y2tzIDEsMiw2IGFuZA0KPiA+IDcgY2FuIGFsc28g
YmUgYXNzaWduZWQgdG8gYSAicmVndWxhdG9yIGdyb3VwIiBjb250cm9sbGVkIGJ5IHJ1bi0NCj4g
PiBsZXZlbHMuDQo+ID4gRWcuIFJ1biBsZXZlbCBzcGVjaWZpYyB2b2x0YWdlcyBhbmQgZW5hYmxl
L2Rpc2FibGUgc3RhdHVzZXMgZm9yDQo+ID4gZWFjaCBvZg0KPiA+IHRoZXNlIGJ1Y2tzIGNhbiBi
ZSBzZXQgdmlhIHJlZ2lzdGVyIGludGVyZmFjZS4gVGhlIGJ1Y2sgcnVuLWxldmVsDQo+ID4gZ3Jv
dXANCj4gPiBhc3NpZ25tZW50IChzZWxlY3Rpb24gaWYgYnVjayBpcyB0byBiZSBjb250cm9sbGVk
IGluZGl2aWR1YWxseSBvcg0KPiA+IHZpYQ0KPiA+IHJ1bi1sZXZlbHMpIGNhbiBiZSBjaGFuZ2Vk
IGF0IHJ1bi10aW1lIHZpYSBJMkMuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYnJpbmdz
IG9ubHkgdGhlIGJhc2ljIHN1cHBvcnQgZm9yIGNvbnRyb2xsaW5nDQo+ID4gcmVndWxhdG9ycyBp
bmRpdmlkdWFsbHkgdmlhIEkyQy4NCj4gPiANCj4gPiBJbiBhZGRpdGlvbiB0byB0aGUgYnVja3Mg
YW5kIExET3MgdGhlcmUgYXJlOg0KPiA+IA0KPiA+IC0gVGhlIHVzdWFsIGNsayBnYXRlDQo+ID4g
LSA0IElPIHBpbnMgKG1vc3RseSB1c2FibGUgYXMgR1BPIG9yIHRpZWQgdG8gc3BlY2lmaWMgcHVy
cG9zZSkNCj4gPiAtIHBvd2VyIGJ1dHRvbiBzdXBwb3J0DQo+ID4gLSBSVEMNCj4gPiAtIHR3byBM
RURzDQo+ID4gLSBiYXR0ZXJ5IGNoYXJnZXINCj4gPiAtIEhBTEwgc2Vuc29yIGlucHV0DQo+ID4g
DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIHJlZ3VsYXRvcnMsIGNsaywg
UlRDLCBHUElPcyBhbmQNCj4gPiBMRURzLg0KPiA+IA0KPiA+IFBvd2VyLXN1cHBseSBkcml2ZXIg
Zm9yIGNoYXJnZXIgaXMgbm90IGluY2x1ZGVkIGluIHRoaXMgc2VyaWVzLg0KPiA+IA0KPiA+IFRo
ZSBzZXJpZXMgYWxzbyBhZGRzIExFRCBEVC1ub2RlIGxvb2t1cCBiYXNlZCBvbiBub2RlIG5hbWUg
b3IgZ2l2ZW4NCj4gPiBwcm9wZXJ0eSBuYW1lL3ZhbHVlIHBhaXIgaW4gTEVEIGNvcmUuIEl0IGFs
c28gYWRkcyBnZW5lcmljIGRlZmF1bHQtDQo+ID4gc3RhdGUNCj4gPiBhbmQgZGVmYXVsdC10cmln
Z2VyIHByb3BlcnR5IGhhbmRsaW5nIHRvIExFRCBjb3JlLiBGb2xsb3ctdXANCj4gPiBwYXRjaGVz
DQo+ID4gc2ltcGxpZnlpbmcgZmV3IG90aGVyIExFRCBkcml2ZXJzIHNob3VsZCBmb2xsb3cuDQo+
ID4gDQo+ID4gQ2hhbmdlbG9nIHYxMDoNCj4gPiAgIC0gU3BsaXQgUlRDIHBhdGNoIHRvIGEgQkQ3
MDUyOCBmaXggKHdoaWNoIGhvcGVmdWxseSBnb2VzIHRvIDUuNCkNCj4gPiBhbmQgdG8NCj4gPiAg
ICAgQkQ3MTgyOCBzdXBwb3J0DQo+IA0KPiBTdGlsbCBtaXNzaW5nIExFRCBBY2tzLg0KPiANCg0K
WWVwLiBJIGtub3cuIEkgaGF2ZW4ndCBoZWFyZCBmcm9tIFBhdmVsIHJlY2VudGx5IGFuZCB0aGUg
cGF0Y2ggMTINCmRlZmluaXRlbHkgcmVxdWlyZXMgaGlzIGFjay4gQ2FuIHlvdSB0YWtlIHRoZSBv
dGhlciBwYXRjaGVzIGluIGFuZA0KbGVhdmUgMTIgYW5kIDEzIG91dCBmb3Igbm93PyBJIGNhbiBj
b250aW51ZSB3b3JrIG9uIExFRHMgd2l0aCBQYXZlbCBidXQNCkkgd291bGQgcmVhbGx5IGxpa2Ug
dG8gaGF2ZSB0aGUgcmVndWxhdG9ycyB3b3JraW5nIGFuZCBCRDcwNTI4IFJUQw0KZml4ZWQgaW4g
bmV4dCByZWxlYXNlLi4uDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
