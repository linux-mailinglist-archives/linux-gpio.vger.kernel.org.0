Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFA08118921
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 14:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfLJNHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 08:07:39 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:56292 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbfLJNHi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 08:07:38 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-fa-5def9897233e
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 81.2C.08102.7989FED5; Tue, 10 Dec 2019 14:07:35 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 10 Dec 2019 14:07:29 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgBE6YYCAAA/YgIAACHeAgAABEoCAAAYbAA==
Date:   Tue, 10 Dec 2019 13:07:28 +0000
Message-ID: <ad8bb62352137b7142fce12e3d78f5c60ebc16a4.camel@fi.rohmeurope.com>
References: <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
         <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
         <20191129120925.GA5747@sirena.org.uk>
         <ccc533df4e00bdcbe18ea45a0e0679161ff41354.camel@fi.rohmeurope.com>
         <20191210121129.GA6110@sirena.org.uk>
         <557a4c5993a6fb16710342438f74f92bdfb40ec0.camel@fi.rohmeurope.com>
         <20191210124537.GD6110@sirena.org.uk>
In-Reply-To: <20191210124537.GD6110@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1548C81BFAE2DE45A32CFD65DD6D7B43@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjOuff03gty3aWFcWRKZo0KI+pc9uNkMcyY2N1liSHZEs0Sgpf1
        SrtBS26LUxYNi+GjYBhkmmJHQT6qrEXRAnEQcK4rK6uOjU2UTahr7Bw40+6D4fwYW2+vCr/O
        c97ned7nPcl7GFLdQ2cyRpNVlExCiZZKhpe6H3o32ZtjBS+2+NJw18QkjWuip2g87wxCfDwc
        oXDkUg3Abf5xFa6/3K/CHbFmFbbZalX4xsA5iMf6bgJ88+9RgBeu1hL42KPTBP7jaEiF26u7
        IO5rewTwD0MtFB64exbgrzxXKXzGP0Nj1/UJAre4xiCO/Wkj8ERwJ54JjlL4yMQUiatG/DRe
        vHYe4obx17Zn8T2tPYCPTVXRfGvPB/ygY4bmO4fnCN7rtlH89LVhiu9s+FjFzx79EvILV5og
        39DvBvzt9l7IB6YuELy99T7Bd3vu0fxf3qx87u0V24oE6/43jcWmLXl7VxhqjnxHlv2kOXDx
        7mmyEjRr6kASg7iXkbu9l6oDyYyamwSov7uaVC5jAE2Nfxq/MAzFbUN1P9KyIY3bhI4/6EwY
        SO5ECpqNDiUIDbcX9f92CyoiAZ1ceEgo+DAKhX6mZAy59ejy76MJPcvtQmfOewglbBqi2dBi
        QpTEvYRCgesqGQNuDbJVRhONSC4DeW/fUyljc6hr+FtSwelo7tbi47oWjdwPQ3lokstBvUNb
        FOt2dMP3EangtehYffjxDKno6xMR2AiedSxLcCy5HcvcjmVuxzL3SaByA1QqGEuKBau4dbMk
        lm+WzIbS+PGOudQLlO2b/wz853vdBwgG+MAqhtCms5GKWIF6ZZFZf9AgWAyFUnmJaPEBxJDa
        NDZQHS1Qs3rhYIUomZ9QzzFQm8FuDDcVqDk56z1RLBOlJ+xqhtEiVmePN02VxGLxwD5jiXWJ
        JpgkuXlyZppFNOlFSSi3GgrlBSm0xDdEplLiuTbZzlrKhNJ4VbEGQS7TOOfsIBm/09VBqqHJ
        bBIzM9gdspSTpYZy09OgOyCDAVoNOy2zKfEv+LTPnXgEIUfo5adZrMISlVkJ8kJDFa4Pnc/o
        vvj81YGALTd/5Pkcl47NXzlepKuNzAf1a6GU7Tq7ypPkib2xM/DL8PeDUXfxAgleseeYD7my
        9uxhs3XzTWHr4eQref+krts1Offg/ez1u9uCvdOw/sKO9F+rsmJOEMsdfNdor9Osxv9uaNy3
        Zj//zSd6f9+6tw5pocUgbH2BlCzC/yQ5kKU/BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTItMTAgYXQgMTI6NDUgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDEyOjQxOjQ3UE0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+IA0KPiA+IFRoZSB0aGluZyBpcyB0aGF0IGlmIHdlIGRvIGluaXRpYWwgc2V0
dGluZyBvZiB2b2x0YWdlcyAoYmFzZWQgb24NCj4gPiBiaW5kaW5nIGRhdGEpIHdlIGNhbiBzZXQg
dGhlIHZvbHRhZ2VzIHRvIHJlZ2lzdGVycyBiZWZvcmUgd2Ugc3dpdGNoDQo+ID4gdG8NCj4gPiB0
aGF0IHJ1bi1sZXZlbC4gSWYgd2UgZG9uJ3QgZG8gaW5pdGlhbCBzZXR0aW5nIHRoZW4gd2Ugd2ls
bCBvbmx5IGRvDQo+ID4gc2V0dGluZyB3aGVuIHZvbHRhZ2UgY2hhbmdlIGlzIGFjdHVhbGx5IHJl
cXVlc3RlZCAtIHdoaWNoIG1heSBiZQ0KPiA+IHRvbw0KPiA+IGxhdGUuIChJIGFjdHVhbGx5IGhl
YXJkIHNvbWV3aGVyZSB0aGF0IHRoZXJlIGlzIDQwIHVTIHRpbWUgbGltaXQgLQ0KPiA+IGJ1dA0K
PiA+IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGlzIGNvdW50ZWQuIFN0YXJ0aW5nIGZyb20gd2hhdD8g
LSBhbmQgSSBkb24ndA0KPiA+IHNlZQ0KPiA+IGhvdyB0aGlzIGlzIGd1YXJhbnRlZWQgZXZlbiB3
aXRoIEdQSU8gaWYgaW50ZXJydXB0cyBhcmUgdG8gYmUNCj4gPiBzZXJ2ZWQpLg0KPiANCj4gSSBz
dXNwZWN0IHRoYXQgaWYgdGhhdCBsaW1pdCBpcyBhIHJlYWwgdGhpbmcgaXQncyBmcm9tIHNvbWUg
cnVudGltZQ0KPiBwZXJmb3JtYW5jZSBtZXRyaWNzIHdoZXJlIHBlb3BsZSBhcmUgZG9pbmcgYmVu
Y2htYXJraW5nIHRvIHZlcmlmeQ0KPiB0aGF0DQo+IGV2ZXJ5dGhpbmcgaXMgd29ya2luZyBmaW5l
IHJhdGhlciB0aGFuIGFuIGFic29sdXRlIHRoaW5nIHRoYXQgaXMgYQ0KPiBiYXNpYw0KPiByZXF1
aXJlbWVudCBmb3Igb3BlcmF0aW9uLg0KPiANCj4gPiBTbywgSSBhbSBhZ2FpbiB3b25kZXJpbmcg
aWYgSSBzaG91bGQganVzdCB1cHN0cmVhbSB0aGUgYmFzaWMNCj4gPiBjb250cm9sDQo+ID4gd2l0
aCBJMkMgZm9yIFNvQ3Mgd2hpY2ggZG8gbm90IHJlcXVpcmUgZmFzdCBEVlMgdm9sdGFnZSBjaGFu
Z2VzIGFuZA0KPiA+IHBlcmhhcHMgbWFpbnRhaW4vcHJvdmlkZSBvd24gc2V0IG9mIHBhdGNoZXMg
d2l0aCBhZGRpdGlvbmFsDQo+ID4gaW50ZXJmYWNlDQo+ID4gZm9yIHJ1bi1sZXZlbCBjb250cm9s
IGZvciB0aG9zZSBjdXN0b21lcnMgd2hvIHJlcXVpcmUgaXQuLi4gU29ycnkNCj4gPiBmb3INCj4g
PiBiZWluZyBzdWNoIGEgZGlmZmljdWx0IGd1eS4gRGVjaXNpb24gbWFraW5nIHNlZW1zIHRvIG5v
dCBiZSBteQ0KPiA+IHN0cm9uZw0KPiA+IHBvaW50IDovDQo+IA0KPiBZZXMsIGRlZmluaXRlbHkg
c3VibWl0IHRoZSBiYXNpYyBzdHVmZiBzZXBhcmF0ZWx5IC0gdGhlIEdQSU8gY2hhbmdlcw0KPiBj
YW4NCj4gYmUgcmV2aWV3ZWQgYXMgYSBzZXBhcmF0ZSwgaW5jcmVtZW50YWwgcGF0Y2guDQoNClJp
Z2h0LiBUaGF0IHdhcyByYXRpb25hbGUgYmVoaW5kIHNwbGl0dGluZyB0aGUgcmVndWxhdG9yIHN1
cHBvcnQgaW4gdHdvDQpwYXRjaGVzLiBJIHdhcyBqdXN0IHVuc3VyZSBpZiBJIHNob3VsZCBhZGQg
YWxsIHRoZSBEVCBiaW5kaW5ncyBhbHJlYWR5DQpoZXJlLiBXZWxsLCBJIGd1ZXNzIEkgd2lsbCBk
cm9wIHRoZSBydW4tbGV2ZWwgb25lcyBmb3Igbm93LiBBZGRpbmcgbmV3DQpiaW5kaW5ncyBsYXRl
ciBtaWdodCBub3QgYmUgYXMgaGFyZCBhcyByZW1vdmluZyB0aGVtLiBUaGFua3MgZm9yDQpzdXBw
b3J0ISBEaXNjdXNzaW5nIHRoaXMgd2l0aCBzb21lb25lIGlzIGRlZmluaXRlbHkgaGVscGZ1bCA6
KQ0KDQpCciwNCglNYXR0aQ0K
