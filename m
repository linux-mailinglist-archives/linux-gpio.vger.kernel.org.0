Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975CA103532
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfKTHbP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 02:31:15 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:61424 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfKTHbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 02:31:15 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-91-5dd4ebbf7257
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 43.E2.08102.FBBE4DD5; Wed, 20 Nov 2019 08:31:11 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 20 Nov 2019 08:31:07 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "info@metux.net" <info@metux.net>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>
Subject: Re: [PATCH v5 15/16] leds: Add common LED binding parsing support
 to LED class/core
Thread-Topic: [PATCH v5 15/16] leds: Add common LED binding parsing support
 to LED class/core
Thread-Index: AQHVnd45T/Y1eQ/PZ0CqzoQf+9hag6eRaS8AgACeLQCAAMvPAIAAyT2A
Date:   Wed, 20 Nov 2019 07:31:07 +0000
Message-ID: <6d6e42fb16bfc863631f84191123ad849d457113.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <258b5c9934e2b31a5f433a7dbb908dfe5da3d30c.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <745e427d-819e-12d7-5c94-7a8d1a414956@gmail.com>
         <4c03b7cec4d4417ba3c60b9d8a333ddd4cfa79ac.camel@fi.rohmeurope.com>
         <d9521d73-82c5-46c3-fccc-333234914f4a@gmail.com>
In-Reply-To: <d9521d73-82c5-46c3-fccc-333234914f4a@gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FC86A33E7C2D749843C86CF4F69F6F7@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbVBUVRjH59x77gvgrcsC7hFyqm2aslEQRut8MIehqW41FY2NU80QXeTK
        Uuwuc3dhIGyGckh2ZRgczHDlVVhUwJQXB8VlBMJEcnC2FhbdNl1iGCBhK97GNOxeVoUv5/zP
        839+538+PIclNd1MNJtptEiyUczS0aGw5+S91i2X/nSnbC26vh03uIYZfGC2kcHzVYMQf+cf
        p/F4zwGAa/qHKHzw5w4KHw9UUNhqLabwja8vEth77izEA+23AL61cBngRXcxgQ/fP0Hgv0t+
        p3Ddtw0Qt9fcB/jXrkoan7vzA8A/NbtpfLrfx2CHx0XgSscAxIF/rAR2Db6OfYOXabzfNUri
        ou5+Bi+PtEJcOvRm4tNCS3ULEAKjRYxQ3VIgXLD7GKHeOUUIbU1WWvhtxEkL9aXllFD21wwt
        TJb8CIXFa4egUNrRBISJujNQuDLaSQjfV98lhJPNS0xy+CdhO9JES+6uzAxj3M7PwvSnxm5S
        2bc/yju21MwUAuduG2BZxG9Dcz27bCCU1fDDAI0uz8DgYQCgrkA5pTbR/A5ku8HYQAgbyeei
        /bd7SbWH5BfC0Mi/c6RqRPCfIt+dXjrYlIoqnVcfAm+gxlrvSh3yzyPfzStA1Rz/Hpo49g0d
        DHMRaL7k3ooRwr+Khrw1UNWA34ishbOEqklei9omlihVI55HDc7rZFBHoak/lh/Wdaj7rh+q
        jyb5TehMV1wQTUTF5+vJoH4WHT7oZ4JvCEdXj47DMrDevibBvkrb19D2NbR9DV0LqCaADGJm
        VoZokeJjZSknVjbpDcq2x2RoA8ERnD8PHvS91QcIFvSBDSyhi+I+drtTNE+kmdLz9aJZnyrn
        ZEnmPoBYUhfJOT2Kx6WL+V9KsumRFcNCnZZ7wX8oRcOrWV9IUrYkP3KfYlkd4nZPKmC4LGVI
        eXszsyyrNsGGqJeHRkeaJWO6JIs5Fn2qOh+pZmVAVGudkrtvWs01Z4sGpRpEB8ErbNlU1XGS
        ba9yKGv/yuoJdDtIDTSajFK0lrM+qWC8iulzjI9Dp4GWBboIbnFKcdcpf/LxndNKHKHEtZ7+
        RY2ziKtWdCHobY/6akvsNX+S6L1kWHjRklw+Sb27L7Sx7uUYbmvMyOYOUYxI0uaHjHWcna79
        XKxwJH9Y8WDD7Km0hc7sgnf+S9j4QWJ6wvBzzwzVlF/kTyRsm5zYzphMSf6CmfftcWXe+KO5
        cx6fB6ZUxIfxMG+uBa33HHntyN4e29LbY50NYKcOmvVi/EukbBb/B5fwKJ5QBAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTEtMTkgYXQgMjA6MzAgKzAxMDAsIEphY2VrIEFuYXN6ZXdza2kgd3Jv
dGU6DQo+IEhpIE1hdHRpLA0KPiANCj4gT24gMTEvMTkvMTkgODoyMSBBTSwgVmFpdHRpbmVuLCBN
YXR0aSB3cm90ZToNCj4gPiBIZWxsbyBKYWNlaywNCj4gPiANCj4gPiBPbiBNb24sIDIwMTktMTEt
MTggYXQgMjI6NTUgKzAxMDAsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6DQo+ID4gPiBIaSBNYXR0
aSwNCj4gPiA+IA0KPiA+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guIElmIHlvdXIgZHJpdmVy
IGRvZXMgbm90IGRlcGVuZA0KPiA+ID4gb24gaXQgdGhlbiBwbGVhc2Ugc2VuZCBpcyBzZXBhcmF0
ZWx5Lg0KPiA+IA0KPiA+IFRoZSBCRDcxODI4IGRlcGVuZHMgb24gZGV2aWNlLXRyZWUgbm9kZSBs
b29rLXVwLiBJdCBkb2VzIG5vdA0KPiA+IHV0aWxpemUNCj4gPiB0aGUgY29tbW9uIHByb3BlcnR5
IHBhcnNpbmcuIEkgY291bGQgb2YgY291cnNlIGRvIHRoZSBjaGlsZCBkdC1ub2RlDQo+ID4gd2Fs
a2luZyBpbiBCRDcxODI4IGRyaXZlciAtIGJ1dCBpdCBraW5kIG9mIGJyZWFrcyBteSBtb3RpdmF0
aW9uIHRvDQo+ID4gZG8NCj4gPiB0aGUgTEVEIGNvcmUgaW1wcm92ZW1lbnQgaWYgSSBhbnl3YXlz
IG5lZWQgdG8gZG8gdGhlIHBhcnNpbmcgaW4NCj4gPiBCRDcxODI4DQo+ID4gZHJpdmVyIDspDQo+
IA0KPiBJZiB5b3UgZG8gbm90IHBsYW4gb24gc3BlbmRpbmcgdG9vIG11Y2ggdGltZSBvbiBjb250
cmlidXRpbmcgdGhpcw0KPiBzZXQgdGhlbiBJIHByb3Bvc2UgYWRoZXJpbmcgdG8gdGhlIGN1cnJl
bnRseSB1c2VkIHBhcnNpbmcgc2NoZW1hIDotKQ0KDQpJIGhhdmUgbm8gb2JqZWN0aW9ucyBvbiBk
b2luZyBmZXcgaXRlcmF0aW9ucyBvZiB0aGUgcGF0Y2hlcy4gQW5kIEkgdGVuZA0KdG8gdGFrZSBj
YXJlIG9mIHByb2JsZW1zIG15IGNoYW5nZXMgY2F1c2UuIFNvIEkgYW0gcHJlcGFyZWQgdG8gc3Bl
bmQNCnRoZSByZXF1aXJlZCB0aW1lIGZpeGluZyB0aGUgbm9kZSBsb29rLXVwIGFuZCBjb21tb24g
cHJvcGVydHkgcGFyc2luZw0KZm9yIGRyaXZlcnMgSSBkbyBicmVhay4gV2hhdCBJIGFtIG5vdCBw
cmVwYXJlZCBpcyB0byBjaGFuZ2UgYW5kIHRlc3QNCmFsbCBvZiB0aGUgZXhpc3RpbmcgZHJpdmVy
cyAtIHNvIGl0J3MgYmV0dGVyIHRvIG5vdCBwcm9taXNlIHN1Y2ggOikNCg0KPiBBbmQgeW91IGhh
dmUgdG8ga25vdyB0aGF0IGZyb20gdGhpcyBkZXZlbG9wbWVudCBjeWNsZSBJIGhhbmRlZA0KPiBv
dmVyIExFRCB0cmVlIG1haW50ZW5hbmNlIHRvIFBhdmVsIE1hY2hlaywgc28geW91IHdpbGwgcmVx
dWlyZQ0KPiB0byBoYXZlIGhpcyBhY2NlcHRhbmNlIGluIHRoZSBmaXJzdCBwbGFjZS4NCg0KV2Vs
bCwgdGhlbiBJIGZvciBzdXJlIHdhaXQgZm9yIFBhdmVsJ3MgdGFrZSBvbiB0aGlzLiBJbiBnZW5l
cmFsIEkgaGF2ZQ0KaGFkIHNvbWUgcG9zaXRpdmUgZmVlZGJhY2sgYWJvdXQgZG9pbmcgdGhlIERU
IG5vZGUgbG9vay11cCBhbmQgY29tbW9uDQpwcm9wZXJ0eSBwYXJzaW5nIGluIGEgY2VudHJhbGl6
ZWQgbWFubmVyIGluIExFRCBjb3JlLiBTbyBtYXliZSBhbHNvDQpQYXZlbCBzZWVzIHRoZSB2YWx1
ZSBvZiBhZGRpbmcgdGhpcyBub3cgZm9yIG5ldyBkcml2ZXJzIC0gaW5zdGVhZCBvZg0KYWRkaW5n
IG9uZSBtb3JlIGRyaXZlciB3aXRoIGNvcHktcGFzdGUgbm9kZSBsb29rLXVwIGNvZGUuIEkgd2Fu
dCB0bw0KdGhhbmsgeW91IGZvciBhbGwgdGhlIGNvbW1lbnRzIHRob3VnaCwgaXQncyBuaWNlIHRo
YXQgeW91IGhhdmUgYmVlbg0KYWN0aXZlIG9uIHRoaXMgdG9waWMhDQoNCj4gPiA+ICBCZXNpZGVz
LCB3ZSB3b3VsZCByZXF1aXJlDQo+ID4gPiB0byBjb252ZXJ0IG1hbnkgb2YgY3VycmVudCBMRUQg
ZHJpdmVycyB0byB2ZXJpZnkgaG93IHRoZQ0KPiA+ID4gcHJvcG9zZWQgcGFyc2luZyBtZWNoYW5p
c20gd2lsbCB3b3JrIHdpdGggdGhlbS4NCj4gPiANCj4gPiBJIHNlZSB0aGUgcmlzayB5b3UgYXJl
IHBvaW50aW5nIG91dC4gQW5kIEkgYWN0dWFsbHkgdGhpbmsgd2UgY291bGQNCj4gPiBkZWZhdWx0
IHRvIG9sZCBtZWNoYW5pc20gaWYgb2ZfbWF0Y2ggb3IgbWF0Y2hfcHJvcGVydHkgaXMgbm90IGdp
dmVuDQo+ID4gKGZvciBub3cpLiBJIGNvdWxkIHRoZW4gc2VlIHRoZSBleGlzdGluZyBkcml2ZXJz
IHdobyB1c2UgaW5pdF9kYXRhDQo+ID4gLQ0KPiA+IGFuZCBlbnN1cmUgdGhvc2UgYXJlIGluaXRp
YWxpemluZyB0aGUgbmV3IG1hdGNoX3Byb3BlcnR5IGFuZA0KPiA+IG9mX21hdGNoDQo+ID4gaW4g
aW5pdF9kYXRhIHdpdGggMC4gVGhhdCB3b3VsZCBiZSBxdWl0ZSB0cml2aWFsIHRhc2suDQo+ID4g
DQo+ID4gVGhhdCB3b3VsZCBhbGxvdyB1cyB0byBjb252ZXJ0IGFuZCB0ZXN0IGV4aXN0aW5nIGRy
aXZlcnMgb25lLWJ5LW9uZQ0KPiA+IHdoaWxlIGFsbG93aW5nIG5ldyBkcml2ZXJzIHRvIG9mZmxv
YWQgdGhlIExFRCBub2RlIGxvb2stdXAgYW5kDQo+ID4gY29tbW9uDQo+ID4gcHJvcGVydHkgcGFy
c2luZyB0byBMRUQgY29yZS4gTm8gcmlzaywgYnV0IGxlc3MgZHJpdmVycyB0byBjb252ZXJ0DQo+
ID4gaW4NCj4gPiB0aGUgZnV0dXJlIC0gYW5kIHNpbXBsZXIgZHJpdmVycyB0byBtYWludGFpbiB3
aGVuIGFsbCBvZiB0aGVtIGRvDQo+ID4gbm90DQo+ID4gbmVlZCB0byBkdXBsaWNhdGUgbm9kZSBs
b29rLXVwIG9yIGJhc2ljIHByb3BlcnR5IHBhcnNpbmcgOykNCj4gDQo+IEkgcGVyc29uYWxseSB3
b3VsZCBwcmVmZXIgdG8gZG8gdGhlIG1hc3NpdmUgZHJpdmVyIHVwZGF0ZSB0byB1c2luZw0KPiB0
aGUgbmV3IG1lY2hhbmlzbS4gSSBrbm93IHRoYXQgdGhpcyBpcyB0aW1lIGNvbnN1bWluZyBidXQg
d2UgYXJlIG5vdA0KPiBpbiBhIGh1cnJ5Lg0KDQpJIHVuZGVyc3RhbmQgdGhlIHByZWZlcmVuY2Ug
b2YgbWFzc2l2ZSB1cGRhdGUgLSBidXQgSSBhbHNvIGtub3cgdGhhdCBpZg0Kd2Ugd2FpdCBmb3Ig
c29tZW9uZSB0byBkbyBhIG1hc3NpdmUgdXBkYXRlIGFuZCBuZWdsZWN0IGltcHJvdmVtZW50cw0K
ZG9uZSBpbiBzbWFsbCBzdGVwcywgdGhlbiB0aGVyZSBpcyBhIHJpc2sgdGhhdCB0aGVyZSB3b24n
dCBiZSBhbnkNCnVwZGF0ZXMgYXQgYWxsLi4uDQoNCj4gPiBUbyBtYWtlIHRoaXMgbW9yZSBjb25j
cmV0ZToNCj4gPiANCj4gPiBXZSBjYW4gb25seSBkbyB0aGUgbmV3IERUIG5vZGUgbG9vay11cCBp
ZiBlaXRoZXINCj4gPiBpZiAoaW5pdF9kYXRhLT5tYXRjaF9wcm9wZXJ0eS5uYW1lICYmIGluaXRf
ZGF0YS0NCj4gPiA+bWF0Y2hfcHJvcGVydHkuc2l6ZSkNCj4gPiBvcg0KPiA+IGlmIChpbml0X2Rh
dGEtPm9mX21hdGNoKQ0KPiA+IFRoYXQgd291bGQga2VlcCB0aGUgbm9kZS1sb29rdXAgc2FtZSBm
b3IgYWxsIGV4aXN0aW5nIGRyaXZlcnMuDQo+ID4gDQo+ID4gRWcsIA0KPiA+IGxlZF9maW5kX2Z3
bm9kZSBjb3VsZCBmb3Igbm93IGp1c3QgZG86DQo+ID4gDQo+ID4gc3RydWN0IGZ3bm9kZV9oYW5k
bGUgKmxlZF9maW5kX2Z3bm9kZShzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsDQo+ID4gCQkJCSAgICAg
IHN0cnVjdCBsZWRfaW5pdF9kYXRhICppbml0X2RhdGEpDQo+ID4gew0KPiA+IAkvKg0KPiA+ICAg
ICAgICAgKiBUaGlzIHNob3VsZCBuZXZlciBiZSBjYWxsZWQgVy9PIGluaXQgZGF0YS4NCj4gPiAJ
Ki8NCj4gPiAJaWYgKCFpbml0X2RhdGEpDQo+ID4gCQlyZXR1cm4gTlVMTDsNCj4gPiANCj4gPiAJ
LyoNCj4gPiAJICogRm9yIG9sZCBkcml2ZXJzIHdoaWNoIGRvIG5vdCBwb3B1bGF0ZSBuZXcgbWF0
Y2ggaW5mb3JtYXRpb24NCj4gPiAJICoganVzdCBkaXJlY3RseSB1c2UgdGhlIGdpdmVuIGluaXRf
ZGF0YS0+Zndub2RlIG5vIG1hdHRlciBpZg0KPiA+IAkgKiBpdCBpcyBOVUxMIG9yIG5vdC4gLSBh
cyBvbGQgZnVuY3Rpb25hbGl0eSBkaWQuDQo+ID4gCSAqLw0KPiA+IAlpZiAoICghaW5pdF9kYXRh
LT5tYXRjaF9wcm9wZXJ0eS5uYW1lIHx8DQo+ID4gCSAgICAgICFpbml0X2RhdGEtPm1hdGNoX3By
b3BlcnR5LnNpemUpICYmICFpbml0X2RhdGEtPm9mX21hdGNoKQ0KPiA+IAkJcmV0dXJuIGluaXRf
ZGF0YS0+Zndub2RlOw0KPiA+IA0KPiA+IAkvKiBtYXRjaCBpbmZvcm1hdGlvbiB3YXMgZ2l2ZW4g
LSBkbyBub2RlIGxvb2stdXAgKi8NCj4gPiAJLi4uDQo+ID4gfQ0KPiA+IA0KPiA+IEZ1cnRoZXJt
b3JlLCB0aGUgY29tbW9uIHByb3BlcnR5IHBhcnNpbmcgY291bGQgYWxzbyBiZSAoZm9yIG5vdykN
Cj4gPiBkb25lDQo+ID4gb25seSBpZiBtYXRjaCBkYXRhIGlzIGdpdmVuOg0KPiA+IA0KPiA+IAkv
Kg0KPiA+IAkgKiBGb3Igbm93IG9ubHkgYWxsb3cgY29yZSB0byBwYXJzZSBEVCBwcm9wZXJ0aWVz
IGlmDQo+ID4gCSAqIHBhcnNpbmcgaXMgZXhwbGljaXRseSByZXF1ZXN0ZWQgYnkgZHJpdmVyIG9y
IGlmIGNvcmUgaGFzDQo+ID4gCSAqIGZvdW5kIG5ldyBtYXRjaCBkYXRhIGZyb20gaW5pdF9kYXRh
IGFuZCB0aGVuIHNldCB0aGUgZmxhZw0KPiA+IAkgKi8NCj4gPiAJaWYgKElOVkVOVF9BX0NPT0xf
TkVXX0ZMQUdfTkFNRV9IRVJFKQ0KPiA+IAkJbGVkX2FkZF9wcm9wcyhsZWRfY2RldiwgJnByb3Bz
KTsNCj4gPiANCj4gPiBvciBqdXN0IHNpbXBseTogDQo+ID4gCWlmICgoaW5pdF9kYXRhLT5tYXRj
aF9wcm9wZXJ0eS5uYW1lICYmDQo+ID4gCSAgICBpbml0X2RhdGEtPm1hdGNoX3Byb3BlcnR5LnNp
emUpIHx8IGluaXRfZGF0YS0+b2ZfbWF0Y2gpDQo+ID4gCQlsZWRfYWRkX3Byb3BzKGxlZF9jZGV2
LCAmcHJvcHMpOw0KPiA+IA0KPiA+IChidXQgdGhpcyB3b24ndCBhbGxvdyBkcml2ZXIgdG8gYXNr
IGZvciBjb21tb24gcGFyc2luZyBldmVuIGlmIGl0DQo+ID4gd2FzDQo+ID4gdmVyaWZpZWQgZm9y
IHRoaXMgZHJ2IHRvIHdvcmsgLSBoZW5jZSBJIGxpa2UgdGhlIGZsYWcgYmV0dGVyKQ0KPiA+IA0K
PiA+IEFuZCBpZiB5b3UgZG9uJ3QgZmVlbCBjb25maWRlbnQgSSBjYW4gZXZlbiBkcm9wIHRoZSAi
Y29tbW9uDQo+ID4gcHJvcGVydHkNCj4gPiBwYXJzaW5nIiBmcm9tIHRoZSBzZXJpZXMgYW5kIGxl
YXZlIG9ubHkgdGhlICJub2RlIGxvb2stdXAgaWYgbWF0Y2gtDQo+ID4gZGF0YSANCj4gPiB3YXMg
Z2l2ZW4iIHRvIGl0Lg0KPiA+IA0KPiA+IEFueXdheXMsIEkgd291bGQgbGlrZSB0byBpbnRyb2R1
Y2UgdGhpcyBzdXBwb3J0IHdoaWxlIEkgYW0gd29ya2luZw0KPiA+IHdpdGgNCj4gPiB0aGUgQkQ3
MTgyOCBkcml2ZXIgd2hpY2ggcmVhbGx5IGhhcyB0aGUgTEVEcyAtIGJ1dCBJIGNhbiBtb2RpZnkg
dGhlDQo+ID4gcGF0Y2ggc2VyaWVzIHNvIHRoYXQgaXQgb25seSBpbXBhY3RzIHRvIGRyaXZlcnMg
d2hpY2ggaW1wbGVtZW50IHRoZQ0KPiA+IG5ldw0KPiA+IG1hdGNoIGRhdGEgaW4gaW5pdF9kYXRh
IGFuZCBsZWF2ZSBvbGQgZHJpdmVycyB0byBiZSBjb252ZXJ0ZWQgb25lLQ0KPiA+IGJ5LQ0KPiA+
IG9uZSB3aGVuIHRoZXkgY2FuIGJlIHRlc3RlZC4NCj4gPiANCj4gPiA+ICBJJ3ZlIGJlZW4gdGVz
dGluZw0KPiA+ID4gbXkgTEVEIG5hbWUgY29tcG9zaXRpb24gc2VyaWVzIHVzaW5nIFFFTVUgYW5k
IHN0dWJiaW5nIHRoaW5ncyBpbg0KPiA+ID4gZHJpdmVycyB3aGVyZSBuZWNlc3NhcnkgYW5kIEkg
cHJvcG9zZSB0byB1c2UgdGhlIHNhbWUgYXBwcm9hY2gNCj4gPiA+IGluIHRoaXMgY2FzZS4NCj4g
PiANCj4gPiBJIGRvbid0IHBsYW4gdG8gZG8gYW55IG1hc3MtY29udmVyc2lvbiBhcyBpdCBpcyBz
b21ld2hhdCByaXNreS4gSQ0KPiA+IGNhbg0KPiANCj4gWW91IGRvIG5vdCBuZWVkIGhhcmR3YXJl
IHRvIHRlc3QgRFQgcGFyc2luZyBhcyBJIG1lbnRpb25lZCBiZWZvcmUsDQo+IHNvIEkgZG9uJ3Qg
c2VlIHRvbyBtdWNoIHJpc2sgaW52b2x2ZWQuDQoNClllcyAtIGlmIHlvdSBoYXZlIHRoZSB0aW1l
IHRvIHRlc3QgYWxsIHRoZSBkcml2ZXJzIGF0IG9uY2UgLSBhbmQNCmFzc3VtaW5nIHlvdSAgZG9u
J3QgZG8gc29tZSBzaWxseSBtaXN0YWtlIHRoZXJlLiBGaW5hbCB2ZXJpZmljYXRpb24NCnNob3Vs
ZCBhbHdheXMgYmUgZG9uZSBpbiBIVy4gQnV0IGFzIEkgc2FpZCwgSSB3YW50IHRvIGVuc3VyZSBh
bGwgdGhlDQpkcml2ZXJzIEkgY29udmVydCB0byBuZXcgbWVjaGFuaXNtIHdpbGwgd29yayAodGhl
IGJlc3QgSSBjYW4pIC0gYW5kIGFzDQpJIGNhbid0IHRlc3QgYWxsIHRoZSBkcml2ZXJzIEkgd29u
J3QgZG8gbWFzcy1jb252ZXJzaW9uLiBJIGhhdmUgb2ZmZXJlZA0KYSBpbml0aWFsIHNvbHV0aW9u
IGluIHRoZSBwYXRjaCAoYW5kIHN1Z2dlc3RlZCByZWR1Y2VkIHZlcnNpb24gdG8NCm1pdGlnYXRl
IHRoZSByaXNrIG9mIGJyZWFraW5nIGFueXRoaW5nIGluIHRoaXMgZW1haWwpIC0gYW5kIEkgc2Vl
IHRoaXMNCmJlbmVmaWNpYWwgYW5kIGFzIGEgZ29vZCBzdGFydGluZyBwb2ludCBlbmFibGluZyB0
aGUgcmVzdCBvZiB0aGUNCmltcHJvdmVtZW50cy4gQnV0IGFzIHlvdSBzYWlkLCB3ZSBuZWVkIGFs
c28gUGF2ZWwncyB0YWtlIG9uIHRoaXMuDQoNCj4gPiBkbyBjb252ZXJzaW9uIHRvIHNvbWUgb2Yg
dGhlIGRyaXZlcnMgKHNpbXBsZSBvbmVzIHdoaWNoIEkgY2FuDQo+ID4gdW5kZXJzdGFuZCB3aXRo
b3V0IHRvbyBtdWNoIG9mIHBhaW4pIC0gYW5kIGFzayBpZiBhbnlvbmUgaGF2aW5nDQo+ID4gYWNj
ZXNzDQo+ID4gdG8gYWN0dWFsIEhXIHdpdGggTEVEcyBjb3VsZCBiZSBraW5kIGVub3VnaCB0byB0
ZXN0IHRoZSBwYXRjaCBmb3INCj4gPiB0aGUNCj4gPiBkZXZpY2UuIFRlc3RlZCBkcml2ZXJzIGNh
biB0aGVuIGJlIHRha2VuIGluLXRyZWUgYXMgZXhhbXBsZXMuIEFuZA0KPiA+IHdobw0KPiA+IGtu
b3dzLCBtYXliZSB0aGVyZSBpcyBzb21lIGRldmVsb3BlcnMgbG9va2luZyBmb3IgYSBob2JieSBw
cm9qZWN0DQo+ID4gd2l0aA0KPiA+IGFjY2VzcyB0byBMRUQgY29udHJvbGxlciB0byBoZWxwIHdp
dGggdGhlIHJlc3QgOykgSSBkb24ndCBoYXZlIHRoZQ0KPiA+IGFtYml0aW9uIHRvIGNoYW5nZSBh
bGwgb2YgdGhlIExFRCBkcml2ZXJzIGJ1dCBJIHRoaW5rIEkgY2FuIGdpdmUgbXkNCj4gPiAxMA0K
PiA+IGNlbnRzIGJ5IGNvbnRyaWJ1dGluZyB0aGUgbWVjaGFuaXNtIGFuZCBkb2luZyBmZXcgZXhh
bXBsZXMgOikNCj4gDQo+IElmIHlvdSB3YW50IHRvIGludHJvZHVjZSBnb29kLCByb2J1c3QgbWVj
aGFuaXNtLCB0aGVuIGl0IHNob3VsZCBiZQ0KPiB0ZXN0ZWQgYWdhaW5zdCB3aWRlc3QgcG9zc2li
bGUgc3BlY3RydW0gb2YgdXNlIGNhc2VzLg0KDQpZZXMuIE9UT0gsIGlmIHRoZSBtZWNoYW5pc20g
aXMgc3ViLW9wdGltYWwsIHRoZW4gdGhlIGJlYXV0eSBvZiBvcGVuDQpzb3VyY2UgaXMgdGhhdCBp
dCBjYW4gYmUgaW1wcm92ZWQuIFByZXBhcmluZyBpbiBhZHZhbmNlIGZvciBzb21ldGhpbmcNCnRo
YXQgbmV2ZXIgaGFwcGVucyBpcyBhbHNvIGEgd2FzdGUuIEJ1dCBJIGd1ZXNzIHdlIGRvbid0IG5l
ZWQgdG8NCmRpc2N1c3MgdGhpcyBwaGlsb3NwaHkgaGVyZSA6KQ0KDQo+ID4gQW55d2F5cywgcGxl
YXNlIGxldCBtZSBrbm93IGlmIHlvdSB0aGluayB5b3UgY291bGQgYWNjZXB0IHBhdGNoDQo+ID4g
d2hpY2gNCj4gPiB3b24ndCBjaGFuZ2UgZXhpc3RpbmcgZHJpdmVyIGZ1bmN0aW9uYWxpdHkgLSBi
dXQgYWxsb3dzIG5ldyBkcml2ZXJzDQo+ID4gdG8NCj4gPiBub3QgZHVwbGljYXRlIHRoZSBjb2Rl
LiBFbHNlIEknbGwganVzdCBkdXBsaWNhdGUgdGhlIGxvb2t1cCBjb2RlIGluDQo+ID4gb25lDQo+
ID4gbW9yZSBkcml2ZXIgYW5kIGhvcGUgSSBkb24ndCBoYXZlIGFub3RoZXIgUE1JQyB3aXRoIExF
RCBjb250cm9sbGVyDQo+ID4gb24NCj4gPiBteSB0YWJsZSB0b28gc29vbi4uLg0KPiA+IA0KPiA+
IChJIGFtIGhhdmluZyAic29tZSIgcHJlc3N1cmUgdG8gZG8gZmV3IG90aGVyIHRhc2tzIEkgcmVj
ZW50bHkgZ290Lg0KPiA+IFNvIEkNCj4gPiBhbSBhZnJhaWQgSSB3b24ndCBoYXZlIHRvbyBtdWNo
IHRpbWUgdG8gaW52ZXN0IG9uIExFRHMgdGhpcyB5ZWFyIDooDQo+ID4gVGh1cyBzZXR0aW5nIHVw
IHRoZSBxZW11IGFuZCBzdGFydGluZyB3aXRoIHN0dWJiaW5nIGlzIHJlYWxseSBub3QNCj4gPiBh
bg0KPiA+IG9wdGlvbiBmb3IgbWUgYXQgdGhpcyBwaGFzZSkuDQo+IA0KPiBBcyBtZW50aW9uZWQg
YmVmb3JlIC0gSSBubyBsb25nZXIgYXBwbHkgcGF0Y2hlcyBzbyB5b3Ugd2lsbCBuZWVkIHRvDQo+
IGNvbnN1bHQgUGF2ZWwsIGJ1dCBJIGJldCBoZSB3aWxsIGhhdmUgc2ltaWxhciBvcGluaW9uLg0K
DQpXaG8ga25vd3MsIG1heWJlIGhlIGNhbiBzZWUgdGhpcyBkaWZmZXJlbnRseSA6KSBUaGFua3Mg
YW55d2F5cyENCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQo=
