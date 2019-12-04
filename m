Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A4F112C66
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 14:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfLDNNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 08:13:18 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54624 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbfLDNNS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 08:13:18 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-63-5de7b0eb7d76
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id A2.69.08102.BE0B7ED5; Wed,  4 Dec 2019 14:13:15 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 4 Dec 2019 14:13:09 +0100
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
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgARwk4CAAFfQAIAADk+AgAMPioCAAAc/gA==
Date:   Wed, 4 Dec 2019 13:13:08 +0000
Message-ID: <6f7b96c71bd1257b0b218a092f8aca7f32ef5468.camel@fi.rohmeurope.com>
References: <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
         <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
         <20191129120925.GA5747@sirena.org.uk>
         <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
         <20191202131140.GD1998@sirena.org.uk>
         <72a1f4c5768b8c08c2669ea01e60d1b614095a43.camel@fi.rohmeurope.com>
         <20191204124717.GR1998@sirena.org.uk>
In-Reply-To: <20191204124717.GR1998@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E29DC36A17B17E458D37862181597998@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxjHc+47yHXHAnIsk2SdmUGizr2eD2QhW6Z3X4zJzJZMOryMu5ZY
        WnZbjGyZkjmFVsY004mdoLzUIRahFV/WlIR0VVw3cZ0KLJMpo+N1A0UtYbBu91oVPp3nPP/n
        //+dD8/hSM1JVssVmm2SbBZNOiaR6mya9awebxvWPx+cWoYbwzdYXD5xgsX3a0IUPjQQYXCk
        sxzgY8FuGu/7sZ3G9ZPVNLbbK2j829k2Cl8+cwvgWw8uAhy9XkHgg3PfEvhu5e80rtvbSOEz
        x+YAvuY7yuCzf50G+NKp6wxuCfaz2NUbJvBR12UKT07ZCRwOvYn7QxcZvDvcR+I9HUEWx3o8
        FK7q3pCTIbhr3UCY7NvDCrXuT4TvnP2s0OAfJQRvs50Rbvb4GaGh6itaGKn8nhKiPx2ghKr2
        ZiAM1bVSQlffeUI4XDtDCE2nplnhnjdjE3xvUXa+aNv+dqHBvPa1rYuMl6qvssWOrB1Rj48s
        A3OZDpDAIfgSuvPNF8ABEjkNvAFQd7jr0aULoF8mrpAOwHEMzEaOX1nVkAJXo0P/NDDqDAmP
        JKGRCd9DIRluRe3jg1R8SETHo7OE6k2BO1Gg16C2KbgCtU5dJdWahxvR1w/ayDjrJoWu/Ryj
        VSEBvoDGZq48rAFcjuxlE4RakzANeYem6firIWr0x4MQTEWjg7FHfR3qmBmgVC4JM1Grb228
        zEGfN+XEU55BB/cNsPEnLEE/HIlQ+8FS5wKAc97snDc7F5idC8zHAd0MUJFYaDKINmndGlkq
        WSNbjEXK8YGlyAviq3f/Avgv8FYAEBwIgGUcoUvl/3hnWK9ZnG8pKDWKVmOeXGKSrAGAOFKX
        wp9Df+o1fIFY+rEkWx5L6RylS+NXDhzQa6DK2iZJxZL8WH2a43SI33taCV0iSwZpx4eFJtu8
        THAJaniiNsUqmQskWSyxGfPU7cizKuuhSkkKd2OrYuetxWKR0o1bQyCL2z9aU09ywRpXPamh
        zBazpE3jx9VRqI4aS8xPQGMgjQO6ZP4NVU1S/t+TnDEFQSiIztIhFWET5yVtGajyPuvamerH
        +am9S5d77lWacr34wsmnNry+u244J99zruwVJxAz+j7dvCK2vuOj9zPPa/8Op0frx18d26xf
        f/d2edKmL9/99+W6zBFf0+LZF6vTs9O7d23Pes7VOfRZJFcvVASS0aoew+HIrhYweHta2uZ3
        x1baclvEO+7Z/tCWinIdZTWK61aRslX8Hy9zvqE8BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMTktMTItMDQgYXQgMTI6NDcgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIE1vbiwgRGVjIDAyLCAyMDE5IGF0IDAyOjAyOjQxUE0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDE5LTEyLTAyIGF0IDEzOjExICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiA+ID4gTm8sIGxvb2sgYXQgdGhlIGJpbmRpbmdzIC0gd2Ugc3VwcG9ydCBh
IGJ1bmNoIG9mIGRpZmZlcmVudA0KPiA+ID4gc3VzcGVuZCBzdGF0ZXMgbWF0Y2hpbmcgdGhlIGRp
ZmZlcmVudCBzdXNwZW5kIHN0YXRlcyB0aGF0IHRoZQ0KPiA+ID4ga2VybmVsIGFzIGEgd2hvbGUg
c3VwcG9ydHMuICBXZSBkb24ndCBhc3N1bWUgdGhhdCB0aGUgZGV2aWNlIHdpbGwNCj4gPiA+IGtu
b3cgdGhpcyBidXQgeW91IGNhbiBhbHdheXMgdXNlIHRoZSBjdXJyZW50IHN1c3BlbmQgd2UncmUg
Z29pbmcNCj4gPiA+IGZvciB0byBkZWNpZGUgd2hlcmUgdG8gdXBkYXRlLg0KPiA+IEhtLiBTbyBp
ZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHksIHlvdSBtZWFuIHVzZXIgc2hvdWxkIHNldCB0
aGUNCj4gPiBzdXNwZW5kICd0YXJnZXQnIC0gYW5kIHRoZW4gY2FsbCB0aGUgc2V0X3N1c3BlbmRf
dm9sdGFnZSBmb3IgdGhpcw0KPiA+IHN0YXRlLiBUbyBzZXQgdm9sdGFnZXMgZm9yIGFsbCBzdGF0
ZXMgb25lIHNob3VsZCBkbyBsb29wDQo+IA0KPiBUaGUgZ2VuZXJhbCBpZGVhIGlzIHRoYXQgd2Ug
c2V0IHRoZSBzdXNwZW5kIHN0YXRlIGR1cmluZyB0aGUNCj4gcHJvY2VzcyBvZiBzdXNwZW5kaW5n
IHJhdGhlciB0aGFuIGluIGFkdmFuY2UgLSB0aGF0IHdheSB3aGVuIHRoZQ0KPiBoYXJkd2FyZSBk
b2Vzbid0IHVuZGVyc3RhbmQgZGlmZmVyZW50IHR5cGVzIG9mIHN1c3BzZW5kIHRoaW5ncw0KPiB3
b3JrIGZpbmUuDQoNCk9rLiBTbyB2b2x0YWdlIGZvciB0aGUgc3BlY2lmaWMgc3VzcGVuZCBzdGF0
ZSBpcyBzZXQganVzdCBiZWZvcmUgZ29pbmcNCnRvIHN1c3BlbmQgLSB3aGVuIHRoZSB0YXJnZXQg
c3VzcGVuZCBzdGF0ZSBpcyBhbHJlYWR5IHNlbGVjdGVkLiBNYWtlcw0Kc2Vuc2UuIFRoYW5rcy4N
Cg0KPiA+IGdldF9jdXJyZW50X21vZGUoKQ0KPiA+IGZvcl9hbGxfbW9kZXMoKSB7DQo+ID4gCXNl
dF9tb2RlKCkNCj4gPiAJc2V0X3ZvbHRhZ2UoKQ0KPiA+IH0NCj4gPiByZXN0b3JlX29yaWdpbmFs
X21vZGUoKQ0KPiA+IGFtIEkgb24gYSByaWdodCB0cmFjaz8gSSdsbCB0cnkgdG8gc2VlIGlmIEkg
Y2FuIGZpbmQgc29tZSBleGFtcGxlcw0KPiA+IG9mDQo+ID4gdGhpcyAtIHRoYW5rcy4NCj4gDQo+
IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgc2F2ZSBhbmQgcmVzdG9yZSBvZiBtb2RlPw0KDQpJIHdh
cyB0aGlua2luZyB0aGF0IHRoZXJlIGlzIHNvbWUgJ2NhaGNlZCBzdXNwZW5kIHRhcmdldCBzdGF0
ZScgaW4NCmZyYW1ld29yay4gVGhpcyBnZXQgbW9kZSBpcyBwc2V1ZG8tY29kZSBmb3IgZ2V0dGlu
ZyB0aGUgc3VzcGVuZCBtb2RlDQpmcm9tIGZyYW1ld29yayAtICJyZXN0b3JlIG1vZGUiIGlzIHJl
dHVybmluZyBiYWNrIHRoZSAib3JpZ2luYWwgbW9kZSINCmFmdGVyIHZvbHRhZ2VzIGZvciBhbGwg
bW9kZXMgYXJlIHNldC4gQnV0IHBsZWFzZSBpZ25vcmUgdGhpcyAtIEkgdGhpbmsNCkkgY2FwdHVy
ZWQgeW91ciBtZXNzYWdlIGFscmVhZHkgOikNCg0KPiAgIElmIHNldHRpbmcgdGhlDQo+IHN1c3Bl
bmQgY29uZmlndXJhdGlvbiBhZmZlY3RzIHRoZSBydW50aW1lIHN0YXRlIHRoZW4gdGhlIGhhcmR3
YXJlDQo+IGRvZXNuJ3Qgc3VwcG9ydCBzdXNwZW5kIGNvbmZpZ3VyYXRpb24uDQoNCk5vLCBpdCBk
b2VzIG5vdC4gSSBwcm9iYWJseSBleHBsYWluZWQgdGhpcyBiYWRseS4NCg0KPiANCj4gPiA+IFRo
ZSBmcmFtZXdvcmsgZG9lc24ndCBjYXJlIGhvdyBhIGRldmljZSBpcyBjb250cm9sbGVkLCB0aGF0
J3MgdXANCj4gPiA+IHRvIHRoZSBkZXZpY2UuICBMaWtlIEkgc2FpZCBJIHJlY29tbWVuZCBmaWd1
cmluZyBvdXQgd2hhdA0KPiA+ID4gdm9sdGFnZXMgYXJlIHVzZWZ1bCB0byBoYXZlIHF1aWNrIGFj
Y2VzcyB0byBhdCBydW50aW1lLCBmb3INCj4gPiA+IGV4YW1wbGUgaXQncyBsaWtlbHkgdGhhdCBp
dCdzIGdvb2QgdG8gaGF2ZSBxdWljayBhY2Nlc3MgdG8gdGhlDQo+ID4gPiBoaWdoZXN0IHZvbHRh
Z2UgdGhhdCdzIGJlZW4gc2V0IChhbmQvb3IgdGhlIHRvcCBvZiB0aGUNCj4gPiA+IGNvbnN0cmFp
bnRzKS4NCj4gPiBQcm9ibGVtIGlzIHRoYXQgdGhlIHJ1bi1sZXZlbCBjb250cm9sbGVkIHJlZ3Vs
YXRvciBjYW4ndCBiZQ0KPiA+IGluZGl2aWR1YWxseSBjb250cm9sbGVkICh1bmxlc3MgaXQgaXMg
b25seSByZWd1bGF0b3IgaW4gdGhlIGdyb3VwKS4NCj4gPiBJDQo+IA0KPiBSZWd1bGF0b3JzIHRo
YXQgaGF2ZSB0byBiZSBjb250cm9sbGVkIGVuIG1hc3NlIGFyZW4ndCByZWFsbHkNCj4gc3VwcG9y
dGVkIGJ5IHRoZSBBUEksIGl0IG9ubHkgdW5kZXJzdGFuZHMgcmVndWxhdG9ycyB0aGF0IGFyZQ0K
PiBpbmRpdmlkdWFsbHkgY29udHJvbGxhYmxlLg0KDQpUaGFua3MuIFRoaXMgd2FzIHRoZSBwaWVj
ZSBvZiBpbmZvcm1hdGlvbiBJIHdhbnRlZCBhbmQgYXNzdW1lZC4gVGh1cw0KdGhlIHBhdGNoIDEy
IGRpZCBpbnRyb2R1Y2UgbmV3IGluLWtlcm5lbCBBUElzIC0gYnV0IGFzIEkgc2FpZCwgd2UgZG9u
J3QNCmhhdmUgYW55IGluLXRyZWUgc29jcyB1c2luZyBCRDcxODI4IFJVTjAsIC4uLiwgUlVOMyBz
dGF0ZXMgZm9yIG5vdyBzbw0KSSdsbCBkcm9wIHRoZSBwYXRjaCAxMiBhbmQgbGVhdmUgb25seSB0
aGUgYmFzaWMgc3VwcG9ydCBmb3INCmluZGl2aWR1YWxseSBjb250cm9sbGFibGUgcmVndWxhdG9y
cy4NCg0KPiA+IEJ1dCBqdXN0IHRvIGNvbmZpcm0sIEkgbWVhbnQgZm9yIGV4YW1wbGUgYXNzaWdu
aW5nIGJ1Y2tzIDEsMiw2IGFuZA0KPiA+IDcNCj4gPiBpbnRvIGEgZ3JvdXAgd2hpY2ggJ3N0YXRl
JyBpcyBjaGFuZ2VkIHZpYSBHUElPIGxpbmUuIFNheSAnc3RhdGVzJw0KPiA+IGFyZQ0KPiA+IFJV
TjAsIFJVTjEuIEZvciBlYWNoIG9mIHRoZXNlIGJ1Y2tzIHdlIGNhbiBkZWZpbmUgYSB2b2x0YWdl
IGFuZA0KPiA+IGVuYWJsZS9kaXNhYmxlIHN0YXR1cyB3aGljaCBpcyB0byBiZSB1c2VkIG9uIFJV
TjAsIGFuZCBhbm90aGVyDQo+ID4gdm9sdGFnZS9zdGF0ZSB0dXBsZSBmb3IgUlVOMS4NCj4gDQo+
IFNvIHlvdSBjb3VsZCBhbHNvIGp1c3QgY3JlYXRlIGEgZ3JvdXAgY29uc2lzdGluZyBvZiBhIHNp
bmdsZQ0KPiByZWd1bGF0b3I/ICBUaGF0IHdvdWxkIGJlIGZpbmUgZm9yIHRoZSBBUEkuDQoNCkkg
dGhpbmsgSSBvbmNlIGFnYWluIGV4cGxhaW5lZCBteXNlbGYgYmFkbHkuIFRoZXJlIGNhbiBiZSBv
bmx5IG9uZQ0KZ3JvdXAgd2l0aCA0IFJVTiBzdGF0ZXMgc2VsZWN0ZWQgYnkgY29tYmluYXRpb24g
b2YgMiBHUElPIGxpbmVzLiBidWNrcw0KMSwyLDYgYW5kIDcgY2FuIGVhY2ggZWl0aGVyIGJlIGFz
c2lnbmVkIGludG8gdGhpcyBvbmUgZ3JvdXAgb3INCmNvbnRyb2xsZWQgaW5kaXZpZHVhbGx5IHZp
YSBJMkMuIEJ1dCBJIGRvdWJ0IGFzc2lnbmluZyBvbmx5IG9uZSBvZiB0aGUNCmJ1Y2tzIGluIHRo
aXMgZ3JvdXAgaXMgdGhlIHR5cGljYWwgdXNlLWNhc2UuIFdoYXQgd2Ugd291bGQgbmVlZCB3b3Vs
ZA0KcmVhbGx5IGJlIHRoZSAnZW4tbWFzc2UnIGNvbnRyb2wgLSBlaXRoZXIgdmlhIEdQSU8gb3Ig
STJDIC0gYnV0IEkgZG9uJ3QNCndhbnQgdG8gc3VnZ2VzdCBhbnkgZnJhbWV3b3JrIGV4cGFuc2lv
biBhcyBJIGRvbid0IGhhdmUgcHJvcGVyIGluLXRyZWUNCnVzZS1jYXNlIGZvciB0aGlzIGFzIG9m
IG5vdyA6KSBTbyBJJ2xsIGZvcmdldCB0aGlzIGZvciBub3cgKGFuZCB0aGFua3MNCmZvciBhbGwg
dGhlIGhlbHAhKSBhbmQgZHJvcCB0aGUgcGF0Y2ggMTIgZnJvbSBzZXJpZXMuIEknbGwgc2VlIGlm
IEkgY2FuDQpzZW5kIHVwZGF0ZWQgc2VyaWVzIHRvbW9ycm93IC0gb3IgbGF0ZXN0IGVhcmx5IG5l
eHQgd2VlayA6KQ0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg0K
