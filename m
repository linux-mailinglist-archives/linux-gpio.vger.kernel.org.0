Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2A610D209
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 08:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfK2HsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 02:48:21 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:55590 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfK2HsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 02:48:21 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-5f-5de0cd42b140
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 00.DB.08102.24DC0ED5; Fri, 29 Nov 2019 08:48:18 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 29 Nov 2019 08:48:14 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
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
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigA==
Date:   Fri, 29 Nov 2019 07:48:13 +0000
Message-ID: <eb685cc78b936bc61ed9f7fbfa18c96398b00909.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162502.GJ9761@sirena.org.uk>
         <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
         <20191119181325.GD3634@sirena.org.uk>
         <fa69d01504817e3260d2b023ae2637aa2f1b2862.camel@fi.rohmeurope.com>
         <20191119193636.GH3634@sirena.org.uk>
In-Reply-To: <20191119193636.GH3634@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A7012CE0C8B984CBF9A799F6553634D@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TW0wUVxjOmTlz4TJmXBb3dG1Nuq29IQjWtifGtKSpceiDJaE1adMtDmVk
        0WWXzO5aL21CYi0sINF0rbpyc7mKVGSBVDdoDUVEQJGIiuKKRGqEEmkRMSDFzjBVeDpf/u/2
        P/yHJXXVjJFNtzkl2SZaTXQoPFf9tD7640t3zbGeiVhc3nONwdkPKxk8UdQB8YHBIRoPncsG
        uKT1MoXzOhsp7Bs7RGG3O4fC/U0nIW5vGAB44PF5gCd7cwjsmaki8D/5dyh89KdyiBtKZgC+
        GiikcdPoCYDbjvfS+NfWIIMrbvQQuLCiHeKxcTeBezrW4WDHeRrv7ukj8Z4zrQyevV4PccHl
        9fHLhNriWiCM9e1hhOLaXcJpb5ARypqHCcFf46aF29ebaaGs4GdKeJD/BxQmu/ZDoaCxBgj3
        j9ZB4ULfb4RwsHiKEKqPP2GER/5lifxXYWtTROe2pPQ028oPN4VZHvf+DjI9q7cX/70XZoEH
        q3IByyJ+NTpZacgFIayOvwaQ58g3uSBUwe0AdZ/Og6qG5tei3JuMqtHz0ejAdBmtakj+cDgq
        vOSnVSKC34Qa/7oHNZGISiefEhreiHzBIVLNgfxyNJ3vVMccvwGVBkZJrauGRP7AjTlNCL8K
        1d/iVA3gX0HurIdzMSRvQP77TygVI55H5c3dpIYj0fC92f/nJnRmanBuZZJ/G9UFVmrWeJRd
        u5fS8KvIkzfIaCssRhcPD8F9YIl3QYN33u1d4PYucHsXuEsBVQNQhphuTROdUlyMLLliZLsl
        Q3m+tWf4gXZ5E6fAs5aEFkCwoAW8xBKmSG5RyYBZtyjFnrrDIjosybLLKjlaAGJJk55LKVI4
        LlXcsVOS7c+ppSw0Gbg3B/ebdbzatVWSMiX5Ofsyy5oQ90XnXbNusSylSds3p1ud8zTBhqjh
        oUa9Q7KlSrLoclqS1eNIdijXoVLhSu+Pqp1zZIoZylSzdoAodt9wkY9kW4sqfKQO2uw2yWjg
        7F2KlFelFpftRdEIMLDAFMGtUNlw5fu9yBlRKgil4mzBHbXCKc5TxixQdiXs9Snp1K3hyq83
        Nvzp2hnIORbxb1L/zDHX+8HX2HdzRqIix/1N9pjls7EcmeDebE66uP6XQFXc1bMfXZkO8SfG
        dn6aqU/68rtu4+cnrB+gIxcSXD98tmbJhrb4N7p841veSvQl9m+zRjcsfa8tSq87+P3uNY9W
        rPskdFddfcx41czoMxN0WMS4d0jZIf4Hc3Z7HDsEAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWdhaW4gTWFyaywNCg0KU29ycnkgZm9yIGxvbmcgZGVsYXkgLSBJIGFtIHJlYWxseSBo
YXZpbmcgdG9vIG1hbnkgdGhpbmdzIG9uIG15IHRhYmxlDQpyaWdodCBub3cgOi8NCg0KT24gVHVl
LCAyMDE5LTExLTE5IGF0IDE5OjM2ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBPbiBUdWUs
IE5vdiAxOSwgMjAxOSBhdCAwNjo1MTozN1BNICswMDAwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3Rl
Og0KPiA+IE9uIFR1ZSwgMjAxOS0xMS0xOSBhdCAxODoxMyArMDAwMCwgTWFyayBCcm93biB3cm90
ZToNCj4gPiA+IEFoLCBPSy4gIEkgZGlkbid0IGV2ZW4gbm90aWNlIHRoYXQgcGF0Y2ggd2hlbiBJ
IHNjYW5uZWQgdGhlDQo+ID4gPiBzZXJpZXMuDQo+ID4gPiBJJ2xsIGxvb2sgb3V0IGZvciB0aGlz
IG5leHQgdGltZSBhcm91bmQgYnV0IHRoYXQgc291bmRzIGxpa2UgaXQncw0KPiA+ID4gZ2VuZXJh
bGx5IGdvaW5nIGluIHRoZSByaWdodCBkaXJlY3Rpb24sIGVzcGVjaWFsbHkgaWYgaXQncw0KPiA+
ID4gaW50ZWdyYXRlZA0KPiA+ID4gd2l0aCB0aGUgc3VzcGVuZCBtb2RlIHJlZ3VsYXRvciBiaW5k
aW5ncyB0aGF0IENodW55YW4gZGlkLg0KPiA+IFByb2JhYmx5IGl0IGlzIG5vdCBhcyBJIGFtIG5v
dCBmYW1pbGlhciB3aXRoIENodW55YW4ncyB3b3JrLiBJJ2xsDQo+ID4gdHJ5DQo+ID4gbG9va2lu
ZyB3aGF0IGhhcyBiZWVuIGRvbmUgb24gdGhhdCBmcm9udCA6KSBBbmQgSSBhbSBwcmV0dHkgc3Vy
ZQ0KPiA+IHlvdQ0KPiA+IG1pZ2h0IG5vdCBiZSBoYXBweSB3aXRoIHRoYXQgcGF0Y2ggLSBidXQg
cGVyaGFwcyB5b3UgY2FuIGdpdmUgbWUgYQ0KPiA+IG51ZGdlIHRvIGJldHRlciBkaXJlY3Rpb24u
Li4NCj4gDQo+IFRoZSBkcml2ZXIgaW50ZXJmYWNlIHdhcyBhZGRlZCBpbiAicmVndWxhdG9yOiBh
ZGQgUE0gc3VzcGVuZCBhbmQNCj4gcmVzdW1lDQo+IGhvb2tzIi4NCg0KSSBsb29rZWQgdGhyb3Vn
aCB0aGUgc2V0IGJ1dCBkaWRuJ3Qgc3BvdCBhbnkgbmV3IGludGVyZmFjZSB0b3dhcmRzIHRoZQ0K
cmVndWxhdG9yIGRyaXZlciAod2hpY2ggYWNjZXNzZXMgdGhlIEhXKS4gSSBzYXcgaW50ZXJmYWNl
IHRvd2FyZHMNCnJlZ3VsYXRvciBjb25zdW1lciBkcml2ZXIgd2hpY2ggY2FuIGJlIHVzZWQgdG8g
c2V0IHRoZSBjb25zdHJhaW5zDQp0aG91Z2guDQoNClNwZWNpZmljYWxseSwgSSBkb24ndCBzZWUg
dm9sdGFnZSBzZXR0aW5nIGNhbGxiYWNrIGZvciBkaWZmZXJlbnQgcnVuLQ0KbW9kZXMuIE5vciBk
byBJIHNlZSB2b2x0YWdlIHNldHRpbmcgKG9yIGRpZmZlcmVudGlhdGlvbikgb2YgbW9yZSB0aGFu
DQpvbmUgc3VzcGVuZCBzdGF0ZS4NCg0KVG8gZXhwbGFpbiBpdCBmdXJ0aGVyIC0gbXkgYXNzdW1w
dGlvbiBpcyB0aGF0IHRoZSBCRDcxODI4ICdydW4tbGV2ZWxzJw0KKFJVTjAsIC4uLiBSVU4zKSBj
b3VsZCBiZSBtYXBwZWQgdG8gcmVndWxhdG9yIG1vZGVzDQpSRUdVTEFUT1JfTU9ERV9GQVNULCBS
RUdVTEFUT1JfTU9ERV9OT1JNQUwsIFJFR1VMQVRPUl9NT0RFX0lETEUgYW5kIA0KUkVHVUxBVE9S
X01PREVfU1RBTkRCWS4gQnV0IHJlZ3VsYXRvcnMgd2hpY2ggYXJlIGNvbnRyb2xsZWQgYnkgdGhl
c2UNCnJ1bi1sZXZlbHMsIGNhbid0IGJlIGluZGl2aWR1YWxseSBjb250cm9sbGVkLiBJZiBzdGF0
ZSBmb3Igb25lIGlzDQpjaGFuZ2VkLCB0aGUgc3RhdGUgaXMgY2hhbmdlZCBmb3IgYWxsIG9mIHRo
ZW0uIFRoZSBEVlMgYnVja3MgMSwyLDYgYW5kDQo3IHN1cHBvcnQgdGhpcy4gUmVzdCBvZiB0aGUg
TERPcyBhbmQgQlVDS3MgKGFuZCBhbHNvIHRob3NlIERWUyBidWNrcw0Kd2hpY2ggYXJlIG5vdCBj
b25maWd1cmVkIHRvIGJlIGNvbnRyb2xsZWQgYnkgcnVuLWxldmVscykgaGF2ZSBtb2RlcyBSVU4N
CmFuZCBJRExFLCB3aGVyZSB0aGUgcHJvY2Vzc29yIHN0YXlzIHBvd2VyZWQuDQoNCkluIGFkZGl0
aW9uIHRvIHRoZXNlIChhY3RpdmUpIG1vZGVzL3N0YXRlcywgdGhlcmUgaXMgZmV3IHN0YXRlcyB3
aGVyZQ0KcHJvY2Vzc29yIGlzIG5vdCBwb3dlcmVkLiBJIGd1ZXNzIHRoZXNlIGNvdWxkIGJlIG1h
cHBlZCB0byAnZGlmZmVyZW50Jw0Kc3VzcGVuZCBzdGF0ZXMuIEF0IGxlYXN0IExQU1IsIEhCTlQg
YW5kIFNISVAgc3RhdGVzIGFyZSBzdWNoLiBUaGVzZSBhcmUNCmFnYWluIGdsb2JhbCBQTUlDIHN0
YXRlcyAtIG5vdCBwZXIgcmVndWxhdG9yIHN0YXRlcy4gVGhleSBjYW4gYmUgZWl0aGVyDQpjb250
cm9sbGVkIGJ5IGRyaXZpbmcgYSBwaW4gb24gUE1JQyAtIG9yIGJ5IEkyQyByZWdpc3RlciBzZXR0
aW5nLiBJDQpkb24ndCBzZWUgaG93IEkgY291bGQgZGlmZmVyZW50aWF0ZSB0aGVzZSBzdGF0ZXMg
d2hlbiB1c2luZyBzdGFuZGFyZA0KQVBJcyAtIG5vciBkbyBJIGtub3cgaWYgdGhlc2Ugc2hvdWxk
IGJlIGNoYW5nZWQgdmlhIHJlZ3VsYXRvcg0KaW50ZXJmYWNlcyBhdCBhbGwuDQoNCkFsbCBpbiBh
bGwgLSBJIGFtIGFsc28gYSBiaXQgdW5zdXJlIGhvdyBJIHNob3VsZCBkbyB0aGUgbWFwcGluZyBv
ZiB0aGUNClBNSUMgbG93LXBvd2VyIG1vZGVzIHRvIHRoZSBtb2RlcyB1c2VkIGJ5IExpbnV4IC0g
dGhlIGN1cnNlIG9mIHdvcmtpbmcNCmZvciBjb21wb25lbnQgdmVuZG9yIGlzIHRoYXQgSSBoYXZl
IGxpbWl0ZWQgdmlzaWJpbGl0eSB0byBhY3R1YWwgZW5kLQ0KcHJvZHVjdHMgLSBpZiB0aGV5IGFy
ZSBub3QgaW4tdHJlZS4gOiggQW5kIEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBhbnkNCmluLXRyZWUg
Ym9hcmRzIHdoaWNoIHVzZSB0aGVzZSBsb3ctcG93ZXIgc3RhdGVzIChhdCBsZWFzdCBmb3Igbm93
KSAtIFNvDQppZiB5b3Ugb3IgUm9iIGRvIG5vdCBvYmplY3QgLSBJIHdpbGwgbGVhdmUgdGhlc2Ug
YmluZGluZ3MgaW4gdGhpcyBkb2MgLQ0KYnV0IEkgbmVlZCB0byBjb25zaWRlciB0aGUgdmFsdWUg
b2YgYWRkaW5nIHN0dWZmIHByZXNlbnRlZCBpbiBwYXRjaCAxMg0KaW4tdHJlZSBrZXJuZWwuLi4g
R3Vlc3MgSSdsbCBkcm9wIGl0IG91dCB1bmxlc3MgSSBnZXQgc29tZSBiZXR0ZXINCnVuZGVyc3Rh
bmRpbmcgaG93IHJ1bi1sZXZlbHMgYW5kIGxvdy1wb3dlciBtb2RlcyBhcmUgaGFuZGxlZCBpbiBz
b21lIG9mDQp0aGUgYWN0dWFsIGRldmljZXMuIFdlIGNhbiBhbHdheXMgYWRkIHRoaXMgc3VwcG9y
dCBsYXRlciA6KQ0KDQo+ID4gPiBZZXMsIEkgdGhpbmsgdGhpcyBuZWVkcyBjbGFyaWZpY2F0aW9u
IGFzIEkgY29tcGxldGVseSBmYWlsZWQgdG8NCj4gPiA+IHBpY2sNCj4gPiA+IHVwDQo+ID4gPiBv
biB0aGlzIGFuZCBkaWQgaW5kZWVkIHJlYWQgdGhpcyBhcyByZWZlcnJpbmcgdG8gdGhlDQo+ID4g
PiBtb2Rlcy4gICJWb2x0YWdlcw0KPiA+ID4gdGhhdCBjYW4gYmUgc2V0IGluIFJVTiBtb2RlIiBv
ciBzb21ldGhpbmc/ICBJIHRha2UgaXQgdGhlc2UNCj4gPiA+IHZvbHRhZ2VzDQo+ID4gPiBhcmUN
Cj4gPiA+IGZpeGVkIGFuZCB0aGUgT1MgY2FuJ3QgY2hhbmdlIHRoZW0/DQo+ID4gVW5mb3J0dW5h
dGVseSB0aGV5IGFyZSBub3QuIFZvbHRhZ2VzIGFuZCBlbmFibGUvZGlzYWJsZSBzdGF0dXNlcw0K
PiA+IGZvcg0KPiA+IGVhY2ggcnVuLWxldmVsIChhbmQgaW5kaXZpZHVhbGx5IGZvciBlYWNoIHJ1
bi1sZXZlbCBjYXBhYmxlIGJ1Y2spDQo+ID4gY2FuDQo+ID4gYmUgY2hhbmdlZCBhdCBydW50aW1l
IHZpYSBJMkMuIEFuZCBhIGN1c3RvbWVyIHJlcXVlc3RlZCBtZSBhbHNvIHRvDQo+ID4gc3VwcG9y
dCB0aGlzIC0gaGVuY2UgdGhlIGluLWtlcm5lbCBBUEkgLSBidXQgSSBhbSBzdXJlIHlvdSBoYXZl
DQo+ID4gc29tZQ0KPiA+IG5pY2Ugd29yZHMgd2hlbiB5b3UgY2hlY2sgdGhlIHBhdGNoIDEyLiA6
XQ0KPiANCj4gQWgsIHRoYXQncyBhY3R1YWxseSBiZXR0ZXIuICBJdCBvcGVucyB1cCBwb3NzaWJs
aXRpZXMgZm9yIG1ha2luZyB1c2UNCj4gb2YNCj4gdGhlIGZlYXR1cmUgd2l0aG91dCBlbmNvZGlu
ZyB2b2x0YWdlcyBpbiBEVC4gIEZvciBleGFtcGxlLCB5b3UgY2FuDQo+IGNhY2hlDQo+IHRoZSBs
YXN0IGhvd2V2ZXIgbWFueSB2b2x0YWdlcyB0aGF0IHdlcmUgc2V0IGFuZCBqdW1wIHF1aWNrbHkg
dG8gdGhlbQ0KPiBvcg0KPiBkbyBzb21ldGhpbmcgbGlrZSBwdXQgdGhlIHRvcCBvZiB0aGUgY29u
c3RyYWludHMgaW4gdG8gaGVscCB3aXRoDQo+IGdvdmVybm9ycyBsaWtlIG9uZGVtYW5kLiAgSSdk
IHJlY29tbWVuZCB0cnlpbmcgZm9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQNCj4gcmF0aGVyIHRo
YW4gZW5jb2RpbmcgaW4gRFQsIGl0J2xsIHByb2JhYmx5IGJlIG1vcmUgcm9idXN0IHdpdGggdGhp
bmdzDQo+IGxpa2UgY3B1ZnJlcSBjaGFuZ2luZy4NCg0KSSB3aXNoIEkgd2FzIHdvcmtpbmcgd2l0
aCB0aGUgZnVsbCBwcm9kdWN0IHNvIHRoYXQgSSBjb3VsZCBzZWUgYW5kDQpsZWFybiBhIHByb3Bl
ciBleGFtcGxlIG9uIGhvdyB0aGUgY3B1ZnJlcSBhY3R1YWxseSB1c2VzIHRoZXNlDQppbnRlcmZh
Y2VzIDopIEknZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0YW5kIHRoaXMgbXVjaCBiZXR0ZXIuIE1h
eWJlDQp0aGlzIGNvdWxkIGJlIGEgdG9waWMgZm9yIHlvdSB0byBwcmVzZW50IGluIHNvbWUgTGlu
dXggY29uZmVyZW5jZSA7KQ0KSnVzdCBwbGVhc2UgcGluZyBtZSB3aGVuIHlvdSBhcmUgZG9pbmcg
dGhhdCBhbmQgSSdsbCBiZSBsaXN0ZW5pbmcgdGhlcmUNCmZvciBzdXJlIDspDQoNCkFueXdheXMs
IG15IGlkZWEgd2FzIHRvIHNldCB0aGUgaW5pdGFsIHZvbHRhZ2UgdmFsdWVzIGZvciB0aGVzZSBz
dGF0ZXMNCnZpYSBEVCAtIGJ1dCBhbGxvdyB0aGUgdm9sdGFnZXMgdG8gYmUgY2hhbmdlZCBhdCBy
dW4tdGltZSB0b28gKEkgZ3Vlc3MNCnRoaXMgaWRlYSBpcyB2aXNpYmxlIGluIHRoZSBwYXRjaCAx
MikuDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
