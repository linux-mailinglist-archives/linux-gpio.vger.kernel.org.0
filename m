Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC8E10E689
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 08:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfLBH52 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 02:57:28 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54580 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfLBH51 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 02:57:27 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-43-5de4c3e41a47
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id D5.A9.08102.4E3C4ED5; Mon,  2 Dec 2019 08:57:24 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 2 Dec 2019 08:57:13 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
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
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgARwk4A=
Date:   Mon, 2 Dec 2019 07:57:13 +0000
Message-ID: <297fa021fb243072dbbb7bca455e57c13e8c6843.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
         <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
         <20191129120925.GA5747@sirena.org.uk>
In-Reply-To: <20191129120925.GA5747@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD37C78CAFCD2B44BB3E47197F63E2B6@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbVBUVRjH59x77gvIda4rxmlLZ7w549SMKKZ1ZqK0ZqrbB83GZppx2sGL
        XNkdYZfZXRqwPtALwoJDWCqwLrgImCJKLpjJAOq6CK0FUcqbrevGioIFpQiBJN27N4Uv5/zP
        +Z/f838+PIcldR5Gz5rMdtlqltIEOhpeOPbQsyp8KWxYM976Iq7uvsbgvNGjDB4v90N8IBSm
        cfhCHsCHfZ0ULrzSSOEjY6UUdjjyKXz9zLcQdzQEAQ4+aAN44mo+gffPfEPgv/feoHDlnmqI
        Gw7PAPxrk4vGZ/44BfDlE1dpfNIXYHBNbzeBXTUdEI/dcxC42/8mDvjbaPx5dx+Jc1t8DH7U
        cxrios63Ny4T6yrqgDjWl8uIFXUfi+ecAUasah4mRE+tgxZ/62mmxaqirynxzt5LUJz4cR8U
        ixprgThUWQ/F9r6zhFhSMUWIx05MMuJ9z7It/LYFicmS/aOtplTz6te2LzBODwWYjJ9fympo
        HSVygGt9AYhiEb8O/dk+RBaAaFbHXwPoq2EXrR3aAfqpzQsLAMvSfCIq6GdUIJZfhQ5MV0Xe
        kHxZDLpx8CCtGov57ajx7iDUHknIPfGQ0HQyOvTlTASG/ApUM+UGqub4zcjbf57Qwsogch+6
        SKlGFL8WtfzbE9GAX4ocOaORQiQfhzxDk5TWNo+qm7tITS9Bw4OP/r8XUMtUKNI0yT+P6ptW
        a+hGNHAnn9b0crS/MMRoPSxCP5SFYTF4yjkvwTlHO+fRznm0cx7tBlQtQOmSKS1VsssJ8VY5
        M95qMaYr2w5Lugdo0zf+PZj1vuMFBAu84GmWEJZwbvegQbcw2ZKSbZRsxiRrZpps8wLEkkIs
        1yuEDDouRcreLVstj61nWCjEcStD+ww6Xs3aJcsZsvWx+yzLCohbczFs0C2yyqly1k5Tmn3O
        JtgotXi0PtYmm1Nkq5RpNyapA5JkUyZEtWKU3KBXwTlbhpSu3GqoHySwxcPlR0i2obxGWX3q
        qoNmi1nWx3HTKsCrgDHT/CRuBMSxQFjMnVPdGOUjPqk2ogQRStDLX/yuBtmlOUufA97t/WzK
        WP1d6ac318bH1N995ehs1/j63IHWTev4/tzB5R+s2PBW1j++keOn/9pz6+ZWCE2dm25TvpL7
        13XB0sTbJVdE/KCLHThFnJ1t2Xwvqjh7Z3DppJ/IHmjKo4mqQPLJ+N1vvLph4XMf8vpfPnm/
        5PXKQt8W6dZKzpU4EnjPXNYxIUCbUUp4gbTapP8ADkX8gkUEAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyayENCg0KT24gRnJpLCAyMDE5LTExLTI5IGF0IDEyOjA5ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwNzo0ODoxM0FNICswMDAwLCBW
YWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxOS0xMS0xOSBhdCAxOTozNiAr
MDAwMCwgTWFyayBCcm93biB3cm90ZToNCj4gPiA+IFRoZSBkcml2ZXIgaW50ZXJmYWNlIHdhcyBh
ZGRlZCBpbiAicmVndWxhdG9yOiBhZGQgUE0gc3VzcGVuZCBhbmQNCj4gPiA+IHJlc3VtZQ0KPiA+
ID4gaG9va3MiLg0KPiA+IEkgbG9va2VkIHRocm91Z2ggdGhlIHNldCBidXQgZGlkbid0IHNwb3Qg
YW55IG5ldyBpbnRlcmZhY2UgdG93YXJkcw0KPiA+IHRoZQ0KPiA+IHJlZ3VsYXRvciBkcml2ZXIg
KHdoaWNoIGFjY2Vzc2VzIHRoZSBIVykuIEkgc2F3IGludGVyZmFjZSB0b3dhcmRzDQo+ID4gcmVn
dWxhdG9yIGNvbnN1bWVyIGRyaXZlciB3aGljaCBjYW4gYmUgdXNlZCB0byBzZXQgdGhlIGNvbnN0
cmFpbnMNCj4gPiB0aG91Z2guDQo+IA0KPiBUaGUgcmVndWxhdG9yIGRyaXZlciBoYXMgYSBidW5j
aCBmbyBzZXRfc3VzcGVuZF8gb3BlcmF0aW9ucy4NCg0KSG1tLiBJIHNhdyB0aGVzZS4gQnV0IHVu
bGVzcyBJIGFtIG1pc3Rha2VuIGxpbnV4IG9ubHkga25vd3Mgb25lDQonc3VzcGVuZCcgc3RhdGUg
d2hlcmVhcyB0aGUgUE1JQyBoYXMgYSBmZXcgc2VwYXJhdGUgc3RhdGVzIEkgY2FuIHNlZSBhcw0K
J3N1c3BlbmQnIHN0YXRlcy4gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZCB0aGUgc2V0X3N1c3BlbmRf
dm9sdGFnZSBkb2VzDQpub3QgYWxsb3cgc2V0dGluZyBzZXBhcmF0ZSBzdXNwZW5kIHZvbHRhZ2Vz
IGRlcGVuZGluZyBvbiB0aGUgInR5cGUgb2YNCnN1c3BlbmQiIChhcyB0aGVyZSBpcyBvbmx5IG9u
ZSAnc3VzcGVuZCcgc3RhdGUpLg0KDQpGb3IgZXhhbXBsZSwgZnJvbSBDUFUgcG9pbnQgb2Ygdmll
dyB0aGUgQkQ3MTgyOCBQTUlDIHN0YXRlcyBISUJFUk5BVEUNCmFuZCBMUFNSIGFyZSBwcm9iYWJs
eSBib3RoIGp1c3QgInN1c3BlbmQiIC0gYnV0IHRoZSBQTUlDIGNvdWxkIHNldA0KZGlmZmVyZW50
IHZvbHRhZ2VzIG9yIE9OL09GRiBzdGF0ZXMgZm9yIHNvbWUgcmVndWxhdG9ycyBkZXBlbmRpbmcg
b24NCnRoZSAnc3VzcGVuZCcgdGFyZ2V0IChMUFNSIG9yIEhJQkVSTkFURSBvciBTVEFOREJZKS4N
Cg0KWWV0LCBhcyBJIHNhaWQsIEkgaGF2ZW4ndCBzZWVuIGhvdyB0aGVzZSBzdGF0ZXMgYXJlIHVz
ZWQgYnkgcmVhbA0KZGV2aWNlcyAtIHdlIGRvbid0IGN1cnJlbnRseSBoYXZlIGFueSBpbi10cmVl
IFNvQ3Mgd2hpY2ggdXNlIEJENzE4MjgNCmFuZCB1dGlsaXplIHRoZXNlIHN0YXRlcyAoYXMgZmFy
IGFzIEkga25vdykuIEhlbmNlIEkgY2FuJ3QgcmVhbGx5DQpmaWd1cmUgb3V0IGhvdyB0byBhZGQg
c3VwcG9ydCBmb3IgdGhlc2UgUE1JQyBmZWF0dXJlcyBpZiB0aGVyZSBpcyBubw0KJ2RlLWZhY3Rv
JyBtZWNoYW5pc20gaW4gcGxhY2UgOigNCj4gDQo+ID4gU3BlY2lmaWNhbGx5LCBJIGRvbid0IHNl
ZSB2b2x0YWdlIHNldHRpbmcgY2FsbGJhY2sgZm9yIGRpZmZlcmVudA0KPiA+IHJ1bi0NCj4gPiBt
b2Rlcy4gTm9yIGRvIEkgc2VlIHZvbHRhZ2Ugc2V0dGluZyAob3IgZGlmZmVyZW50aWF0aW9uKSBv
ZiBtb3JlDQo+ID4gdGhhbg0KPiA+IG9uZSBzdXNwZW5kIHN0YXRlLg0KPiANCj4gc2V0X3N1c3Bl
bmRfdm9sdGFnZS4NCg0KWWVzLiBCdXQgdGhpcyBkb2VzIG9ubHkgYWxsb3cgc2V0dGluZyBvbmUg
c3VzcGVuZCB2b2x0YWdlIGZvcg0KcmVndWxhdG9yLCBub3Qgb3duIHZvbHRhZ2UgZm9yIEhJQkVS
TkFURSwgTFBTUiwgU1RBTkRCWSBldGMgLSBvciBhbSBJDQptaXN0YWtlbj8NCg0KPiA+IFRvIGV4
cGxhaW4gaXQgZnVydGhlciAtIG15IGFzc3VtcHRpb24gaXMgdGhhdCB0aGUgQkQ3MTgyOCAncnVu
LQ0KPiA+IGxldmVscycNCj4gPiAoUlVOMCwgLi4uIFJVTjMpIGNvdWxkIGJlIG1hcHBlZCB0byBy
ZWd1bGF0b3IgbW9kZXMNCj4gPiBSRUdVTEFUT1JfTU9ERV9GQVNULCBSRUdVTEFUT1JfTU9ERV9O
T1JNQUwsIFJFR1VMQVRPUl9NT0RFX0lETEUNCj4gPiBhbmQgDQo+ID4gUkVHVUxBVE9SX01PREVf
U1RBTkRCWS4gQnV0IHJlZ3VsYXRvcnMgd2hpY2ggYXJlIGNvbnRyb2xsZWQgYnkNCj4gPiB0aGVz
ZQ0KPiANCj4gVGhhdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgYXQgYWxsLCB0aGUgbW9kZXMgYWZmZWN0
IHRoZSBxdWFsaXR5IG9mDQo+IHJlZ3VsYXRpb24gbm90IHRoZSB2b2x0YWdlIHRoYXQgaXMgc2V0
Lg0KDQpUaGFua3MuIEkgbWlzdW5kZXJzdG9vZCB0aGlzLiBJIHRob3VnaHQgdGhlc2Ugc3RhdGVz
IGNvdWxkIGJlIHVzZWQgZm9yDQpzb21lIGFkYXB0aXZlIHZvbHRhZ2VzLiBNeSB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgdGhlIFJVTjAsLi4uUlVOMyBhcmUNCmRlc2lnbmVkIGZvciB0aGF0IC0gYnV0
IEkgZGlkbid0IGtub3cgaWYgcmVndWxhdG9yIGZyYW1ld29yayBpcw0KZGVzaWduZWQgZm9yIHRo
aXMuDQoNCj4gPiBydW4tbGV2ZWxzLCBjYW4ndCBiZSBpbmRpdmlkdWFsbHkgY29udHJvbGxlZC4g
SWYgc3RhdGUgZm9yIG9uZSBpcw0KPiA+IGNoYW5nZWQsIHRoZSBzdGF0ZSBpcyBjaGFuZ2VkIGZv
ciBhbGwgb2YgdGhlbS4gVGhlIERWUyBidWNrcyAxLDIsNg0KPiA+IGFuZA0KPiANCj4gV2UgZG9u
J3QgcmVhbGx5IGhhdmUgYW55dGhpbmcgdGhhdCdkIG9ubHkgd29yayBmb3IgZ3JvdXANCj4gY29u
ZmlndXJhdGlvbg0KPiBleGNlcHQgZm9yIHRoZSBzdXNwZW5kIG1vZGVzLg0KDQpUaGFua3MuIEFz
IEkgc2FpZCwgSSB0aG91Z2h0IHRoZSAncXVhbGl0eSBvZiByZWd1bGF0aW9uJyBzdGF0ZXMgY291
bGQNCmhhdmUgYmVlbiBzdXBwb3J0aW5nIGFsc28gY2hhbmdpbmcgdGhlIHZvbHRhZ2VzLg0KDQo+
IA0KPiA+ID4gQWgsIHRoYXQncyBhY3R1YWxseSBiZXR0ZXIuICBJdCBvcGVucyB1cCBwb3NzaWJs
aXRpZXMgZm9yIG1ha2luZw0KPiA+ID4gdXNlDQo+ID4gPiBvZg0KPiA+ID4gdGhlIGZlYXR1cmUg
d2l0aG91dCBlbmNvZGluZyB2b2x0YWdlcyBpbiBEVC4gIEZvciBleGFtcGxlLCB5b3UNCj4gPiA+
IGNhbg0KPiA+ID4gY2FjaGUNCj4gPiA+IHRoZSBsYXN0IGhvd2V2ZXIgbWFueSB2b2x0YWdlcyB0
aGF0IHdlcmUgc2V0IGFuZCBqdW1wIHF1aWNrbHkgdG8NCj4gPiA+IHRoZW0NCj4gPiA+IG9yDQo+
ID4gPiBkbyBzb21ldGhpbmcgbGlrZSBwdXQgdGhlIHRvcCBvZiB0aGUgY29uc3RyYWludHMgaW4g
dG8gaGVscCB3aXRoDQo+ID4gPiBnb3Zlcm5vcnMgbGlrZSBvbmRlbWFuZC4gIEknZCByZWNvbW1l
bmQgdHJ5aW5nIGZvciBzb21ldGhpbmcgbGlrZQ0KPiA+ID4gdGhhdA0KPiA+ID4gcmF0aGVyIHRo
YW4gZW5jb2RpbmcgaW4gRFQsIGl0J2xsIHByb2JhYmx5IGJlIG1vcmUgcm9idXN0IHdpdGgNCj4g
PiA+IHRoaW5ncw0KPiA+ID4gbGlrZSBjcHVmcmVxIGNoYW5naW5nLg0KPiA+IEkgd2lzaCBJIHdh
cyB3b3JraW5nIHdpdGggdGhlIGZ1bGwgcHJvZHVjdCBzbyB0aGF0IEkgY291bGQgc2VlIGFuZA0K
PiA+IGxlYXJuIGEgcHJvcGVyIGV4YW1wbGUgb24gaG93IHRoZSBjcHVmcmVxIGFjdHVhbGx5IHVz
ZXMgdGhlc2UNCj4gPiBpbnRlcmZhY2VzIDopIEknZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0YW5k
IHRoaXMgbXVjaCBiZXR0ZXIuIE1heWJlDQo+ID4gdGhpcyBjb3VsZCBiZSBhIHRvcGljIGZvciB5
b3UgdG8gcHJlc2VudCBpbiBzb21lIExpbnV4IGNvbmZlcmVuY2UNCj4gPiA7KQ0KPiA+IEp1c3Qg
cGxlYXNlIHBpbmcgbWUgd2hlbiB5b3UgYXJlIGRvaW5nIHRoYXQgYW5kIEknbGwgYmUgbGlzdGVu
aW5nDQo+ID4gdGhlcmUNCj4gPiBmb3Igc3VyZSA7KQ0KPiANCj4gVGhlIGNwdWZyZXEgY29kZSBp
cyBhbGwgdGhlcmUgaW4ga2VybmVsIC0gZHJpdmVycy9jcHVmcmVxLiAgSSBjYW4ndA0KPiByZW1l
bWJlciBpZiBBbmRyb2lkIHN0aWxsIGhhcyBhIGN1c3RvbSBnb3Zlcm5vciBpbiB0aGVpciB0cmVl
cyBidXQgaXQNCj4gZG9lc24ndCByZWFsbHkgbWFrZSBtdWNoIGRpZmZlcmVuY2UgaW4gdGVybXMg
b2YgaG93IGl0IGludGVyYWN0cyB3aXRoDQo+IHRoZSByZWd1bGF0b3IgZHJpdmVycy4NCg0KUmln
aHQuIEkgZ3Vlc3MgeW91ciBhbnN3ZXJzIG1lYW4gdGhhdCB0aGVyZSBpcyBubyAicmVndWxhdG9y
IGdyb3VwDQpjb250cm9sIiBmb3IgImFkYXB0aXZlIHZvbHRhZ2UgY2hhbmdlcyIgc3VwcG9ydGVk
IGJ5IHJlZ3VsYXRvcg0KZnJhbWV3b3JrIC8gY3B1ZnJlcSAtIGFzIG9mIG5vdy4gRnVydGhlcm1v
cmUsIEkgaGF2ZSB1bmRlcnN0b29kIHRoYXQgaXQNCmlzIGRpZmZlcmVudCBzdG9yeSBkZXBlbmRp
bmcgb24gUE1JQyBhbmQgQ1BVL1NvQyBjYXBhYmlsaXRpZXMuIChMaWtlDQpQTUlDIGluYnVpbHQg
c3RhdGVzIGFuZCBzdGF0ZSBjaGFuZ2UgbWVjaGFuaXNtcywgU29DIHZvbHRhZ2Ugc2NhbGluZw0K
c3VwcG9ydCBldGMuKQ0KDQo+ICBBbnl3YXlzLCBteSBpZGVhIHdhcyB0byBzZXQgdGhlIGluaXRh
bCB2b2x0YWdlIHZhbHVlcyBmb3IgdGhlc2UNCj4gc3RhdGVzDQo+ID4gdmlhIERUIC0gYnV0IGFs
bG93IHRoZSB2b2x0YWdlcyB0byBiZSBjaGFuZ2VkIGF0IHJ1bi10aW1lIHRvbyAoSQ0KPiA+IGd1
ZXNzDQo+ID4gdGhpcyBpZGVhIGlzIHZpc2libGUgaW4gdGhlIHBhdGNoIDEyKS4NCj4gDQo+IEl0
J2QgYmUgbXVjaCBiZXR0ZXIgaWYgeW91IGNvdWxkIGF2b2lkIHB1dHRpbmcgdGhlIHZvbHRhZ2Vz
IGluIHRoZQ0KPiBiaW5kaW5nIGlmIHRoZXkncmUgbm90IHN0cmljdGx5IHJlcXVpcmVkLg0KDQpI
bW0uLiBJIGd1ZXNzIEkgY2FuIG9taXQgdGhhdCBmcm9tIGluLXRyZWUgZHJpdmVyIGZvciBub3cu
IEkgY2FuIHRyeQ0KbWFpbnRhaW5pbmcgb3duIHNldCBvZiBwYXRjaGVzIGZvciBleGlzdGluZyBj
dXN0b21lcnMgZm9yIG5vdy4gSSB0aGluaw0KYWRkaW5nIHRoZXNlIHRvIGJpbmRpbmdzIGxhdGVy
IGlzIG5vdCBpbXBvc3NpYmxlIDopIFJlbW92aW5nIHRoZW0gd291bGQNCnByb2JhYmx5IGJlIGhh
cmRlci4NCg0KVGhhbmtzIGFnYWluIE1hcmsuIEkgdHJ1bHkgYXBwcmVjaWF0ZSB5b3VyIGhlbHAg
YW5kIGd1aWRhbmNlIDopDQoNCkJyLA0KCU1hdHRpDQoNCg0K
