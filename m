Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFC5011854C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 11:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfLJKkH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 05:40:07 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:50958 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfLJKkG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 05:40:06 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-8f-5def76030a76
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 42.1B.08102.3067FED5; Tue, 10 Dec 2019 11:40:03 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 10 Dec 2019 11:39:58 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
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
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgARwk4CAAFfQAIAADk+AgAMPioCAAAc/gIAAESOAgAkyBwA=
Date:   Tue, 10 Dec 2019 10:39:57 +0000
Message-ID: <aea80c251dbafa8f2cd433eaf397a754812338d8.camel@fi.rohmeurope.com>
References: <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
         <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
         <20191129120925.GA5747@sirena.org.uk>
         <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
         <20191202131140.GD1998@sirena.org.uk>
         <72a1f4c5768b8c08c2669ea01e60d1b614095a43.camel@fi.rohmeurope.com>
         <20191204124717.GR1998@sirena.org.uk>
         <6f7b96c71bd1257b0b218a092f8aca7f32ef5468.camel@fi.rohmeurope.com>
         <20191204141433.GU1998@sirena.org.uk>
In-Reply-To: <20191204141433.GU1998@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EDEB04F51B872489D3A15D2A5378E04@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0wUVxjNnffiDh0XKFeqpN3U2NoAYvxxE03RJtaxbZq2/jAxpTiUKbtx
        2V1ndo2PGqkGYReCWKEtW96P8nCtFUFbAxa2IHR9UFpWMbqYVbSilkWrKGppZ5gq/Lrnfuc7
        53w3+S6DG7x0HGO2OkTJKliMVATR2fjkSAK+JZy6ZE8jh+oGAjTKHfuORvfL/QQqCY1QaKQz
        F6DK7nMkyj/dSqKa8DckcrnySHSp7QcC9R29AtCVBz0ATQzmYaj4aQOG7hYMk6h6bx2BjlY+
        BeiPE2UUarvzPUCnDg5S6FB3kEb1FwYwVFbfR6DwPReGBvyrUdDfQ6E9A0M4yunoptHU+SME
        Kjy3ZmU8763wAj48lEPzFd4d/E+eIM3Xto9ifEuzi+Ivn2+n+NrCAyR/s+AXgp84s5/gC1ub
        AX+j+jDB9w4dx/ivKyYxvvHgQ5r/uyX+A27DnBXpgmPLOnOmNenNjXNMx/t7aHt75NbcyhI8
        GxREuoGOgdwy+PuxfNoNIhgDFwCw0XcX1y59AAZ+HlcuDENxK6D7Iq0KorkEWPK4llJ7cK5U
        Dx9NTlIqEcVthK23rxFakwCrJp5gGnYDePLPhSomuIXQnVNGqpjl3ofB0/WYFnaZgHmFXdOE
        jlsKG6bGp40AtwC6ssemjXAuFrbceEhqY3Owrr0f13AMHL029X/dCDsmQ4Q6NM69Dg+fSNKk
        K2FX7z1aw6/A4vwQrc0wF/5aOkIUgRc9sxI8M2rPLLVnltozS10FyGYAswSzJVNwiMmJkuhM
        lGymLOX41JbVArTtu/8j+Ne31gcwBvjAPAYzxrCHLOFUQ2S6LWObSZBNaZLTIso+ABncGM32
        7h1LNbAZwrbtomR7Rr3EEMZYdlFof6qBU7M2iaJdlJ6x8xnGCNkmh2I6VxIzxa2fmS2OGRpj
        dKp5RFy0LFozRElwOkxp6oKkycqGqJReydU7FTkr24UspapJ/eANpmi0vAZnusvra3ADYbVZ
        xbhYtlRN4tRWk9P6POgWiGWAMYrNVI30yhd87nNLicCUCFeG+jTZIcxQcdmg68MiLPDxqt6o
        f3Y+fut6fMP4eLHJKicNr1r+8pmlbVfZHS+crdqQ8uqp94qDTYu/NI8l0+A13WD15pTVHcw7
        Qd3Nk8Nr0uZd2tfs/TbmkcjuMzT57e+mNB0ILX/wW8TuTQs6wfqPvnp7/hefLCmXNgcWeRPS
        ye1nd19fu+svvF9vT/z8mJGQTULyYlyShf8AEWHJOj8EAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMTktMTItMDQgYXQgMTQ6MTQgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0IDAxOjEzOjA4UE0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+IA0KPiA+IEkgdGhpbmsgSSBvbmNlIGFnYWluIGV4cGxhaW5lZCBteXNlbGYg
YmFkbHkuIFRoZXJlIGNhbiBiZSBvbmx5IG9uZQ0KPiA+IGdyb3VwIHdpdGggNCBSVU4gc3RhdGVz
IHNlbGVjdGVkIGJ5IGNvbWJpbmF0aW9uIG9mIDIgR1BJTyBsaW5lcy4NCj4gPiBidWNrcw0KPiA+
IDEsMiw2IGFuZCA3IGNhbiBlYWNoIGVpdGhlciBiZSBhc3NpZ25lZCBpbnRvIHRoaXMgb25lIGdy
b3VwIG9yDQo+ID4gY29udHJvbGxlZCBpbmRpdmlkdWFsbHkgdmlhIEkyQy4gQnV0IEkgZG91YnQg
YXNzaWduaW5nIG9ubHkgb25lIG9mDQo+ID4gdGhlDQo+ID4gYnVja3MgaW4gdGhpcyBncm91cCBp
cyB0aGUgdHlwaWNhbCB1c2UtY2FzZS4gV2hhdCB3ZSB3b3VsZCBuZWVkDQo+ID4gd291bGQNCj4g
DQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhcyB1bnVzdWFsIGFzIHlvdSdyZSB0aGlua2luZyAt
IHRoZQ0KPiByZWd1bGF0b3JzIHBlb3BsZSB3YW50IHRvIGNvbnRyb2wgcXVpY2tseSBhcmUgdXN1
YWxseSB0aGUgbWFpbg0KPiBDUFUgc3VwcGx5IHJlZ3VsYXRvcnMgYW5kIHRoZXNlIG9mdGVuIHZh
cnkgaW5kZXBlbmRlbnRseSBvZg0KPiBhbnl0aGluZyBlbHNlLg0KDQpIbW0uIEkgc2VlIHlvdXIg
cG9pbnQuIFlvdSBtaWdodCBiZSBjb3JyZWN0LiBBbGxvd2luZyBvbmx5IG9uZSBidWNrIHRvDQpi
ZSBhc3NpZ25lZCBpbiAncnVuLWxldmVsIGdyb3VwJyAodG8gYmUgY29udHJvbGxlZCBieSBHUElP
cykgd291bGQgYmUNCnRvdGFsbHkgcG9zc2libGUgd2l0aCBjdXJyZW50IHJlZ3VsYXRvciBBUEkg
LSBhbmQgaXQgbWlnaHQgYmUgdXNlZnVsDQpmb3Igc2NhbGluZyB0aGUgQ1BVIHZvbHRhZ2UuIEkg
YXBwcmVjaWF0ZSB5b3VyIGhlbHAgYW5kIGV4cGVyaWVuY2UgaGVyZQ0KOikgSW1wbGVtZW50aW5n
IGl0IHdvdWxkIGJlIGFsc28gcHJldHR5IHNpbXBsZSwgY2FjaGluZyBhbmQgY29udHJvbGxpbmcN
CnRoZSBydW4tbGV2ZWwgdm9sdGFnZXMgaXMgYWxyZWFkeSB0aGVyZSBpbiBwYXRjaCAxMiwgSSBq
dXN0IHNob3VsZA0KcmVzdHJpY3QgdGhlIGdyb3VwIHNpemUgdG8gb25lIGJ1Y2suIEkgd2lsbCBz
ZWUgaG93IGl0IHdvcmtzIGFuZCBhbHNvDQphc2sgaWYgbXkgY29sbGVhZ3VlcyBrbm93IHdoZXRo
ZXIgdGhpcyBpcyB2YWx1YWJsZSB3aXRoIG91ciBjdXJyZW50DQpjdXN0b21lcidzIFNPQ3MuIFRo
YW5rcyBhIGJ1bmNoIQ0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg==
