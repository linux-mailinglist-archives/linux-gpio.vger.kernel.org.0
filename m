Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69AAD1185FC
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 12:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfLJLO5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 06:14:57 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:52354 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbfLJLO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 06:14:57 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-45-5def7e2e2cac
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DA.5B.08102.E2E7FED5; Tue, 10 Dec 2019 12:14:54 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 10 Dec 2019 12:14:49 +0100
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
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkICAAZUNgIAACqYAgAAMmACADvFigIAASP2AgBE6YYA=
Date:   Tue, 10 Dec 2019 11:14:48 +0000
Message-ID: <ccc533df4e00bdcbe18ea45a0e0679161ff41354.camel@fi.rohmeurope.com>
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
Content-ID: <D3CB460A3994D2478F0D8B51544C9882@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwTZxzH99w7L+fOCvYZcyTULc5FUDZNnhiymJjNM1mmiVmMZgyv60kb
        +0Ku7SK6LSyLYIGhZsJolRd5k2F9K3UiAae1KMOlC+FFyAbaWRmwjU6mEIew3XFT+Oe57/2+
        z+f3/V3yOwbX+OgkxmR1iJJVMOuoWOJa48zF1LTPo5nrOv6CqK67j0YFEw00elTRRaDScIRC
        kWsFAFUFQyQquu0nUU20nEQu12ES/XzpAoE6m+8CdPdxB0BTvYcxdPzpaQw9LB4m0an8OgI1
        Vz0FqKf1JIUu/XEOoJtneil0NjhEo/o73Rg6Wd9JoOikC0PdXe+goa4OCn3ZPYCjQ+1BGs31
        XyRQSWjLpmTeW+kFfHTgEM1Xeg/yVzxDNF/bNobxviYXxf/S30bxtSVfk/xo8Q2Cn/rxGMGX
        +JsAP3LqPMHfGriM8d9UPsH4xjPTNP+3L3k7tzsuQy84PtlhyraufXtPnDF0oRnPGdXubzgd
        JfNAubYQxDCQWw8f1FwFhSCW0XB9AJbc9tHqSyeA3i9GsULAMBSXAQsHaQVI4FJh6T+1lHIH
        59zxcLisjFKMZdwe6P/9PqFeEmD11Aymaj0s7b0DFE1wr8EGz835Osu9D7879yephrkJWH3i
        OqkYMdybsH22f14D7hXoypuYB3BOC30j06Q6Ngfr2n7CVZ0Ix+7P/V/XwfYnYUIZGudWw/Ot
        a1V0E+wbHAeqToHHi8K0OsNS+IM7QhwFyz2LEjwLtGcR7VlEexbR1YBsAtAimMzZgkNMT5NE
        Z5pkM1rkx8c2iw+o2/eoBfwb2BoAGAMC4CUG0yWykQPRTM0Svc2QaxTsxizJaRbtAQAZXJfA
        3sqfyNSwBiH3gCjZnlkvM4ROy64KH8vUcErWPlHMEaVn7gqG0UF256dy06WSmC3u32syOxZs
        jIlRmscmJdhFq0GUBKfDmKUsSJZd3hDFipdzl3wm46w9R7DIVRXtAunM0bGKGpxprqiXz6By
        agirzSomaVnTQRngFMDotD6PGwdaBuiWsRuVdvHyj/i827gchMlBLoPygXaHsGAl5YG3Vv62
        PE1aM9sSKt+wMd/87Vev79PP/LrdXrCzat3e6cSU0Ee5Yebewy3RFTs+KO7xb9g2WNybsUZ3
        5IbfyerffWHr5ve+fzAyqtUkR3YbXr3cPvvh5Cp4Ja7lxSKLuWx9Sl/j5rPewPW6Ofqemy5t
        DRzpGa4Jnnicldrh1k86diXDOB1hNwrpb+CSXfgPYDOpqkUEAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyaywNCg0KT24gRnJpLCAyMDE5LTExLTI5IGF0IDEyOjA5ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwNzo0ODoxM0FNICswMDAwLCBW
YWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxOS0xMS0xOSBhdCAxOTozNiAr
MDAwMCwgTWFyayBCcm93biB3cm90ZToNCj4gVGhlIGNwdWZyZXEgY29kZSBpcyBhbGwgdGhlcmUg
aW4ga2VybmVsIC0gZHJpdmVycy9jcHVmcmVxLiAgSSBjYW4ndA0KPiByZW1lbWJlciBpZiBBbmRy
b2lkIHN0aWxsIGhhcyBhIGN1c3RvbSBnb3Zlcm5vciBpbiB0aGVpciB0cmVlcyBidXQgaXQNCj4g
ZG9lc24ndCByZWFsbHkgbWFrZSBtdWNoIGRpZmZlcmVuY2UgaW4gdGVybXMgb2YgaG93IGl0IGlu
dGVyYWN0cyB3aXRoDQo+IHRoZSByZWd1bGF0b3IgZHJpdmVycy4NCj4gDQo+ID4gQW55d2F5cywg
bXkgaWRlYSB3YXMgdG8gc2V0IHRoZSBpbml0YWwgdm9sdGFnZSB2YWx1ZXMgZm9yIHRoZXNlDQo+
ID4gc3RhdGVzDQo+ID4gdmlhIERUIC0gYnV0IGFsbG93IHRoZSB2b2x0YWdlcyB0byBiZSBjaGFu
Z2VkIGF0IHJ1bi10aW1lIHRvbyAoSQ0KPiA+IGd1ZXNzDQo+ID4gdGhpcyBpZGVhIGlzIHZpc2li
bGUgaW4gdGhlIHBhdGNoIDEyKS4NCj4gDQo+IEl0J2QgYmUgbXVjaCBiZXR0ZXIgaWYgeW91IGNv
dWxkIGF2b2lkIHB1dHRpbmcgdGhlIHZvbHRhZ2VzIGluIHRoZQ0KPiBiaW5kaW5nIGlmIHRoZXkn
cmUgbm90IHN0cmljdGx5IHJlcXVpcmVkLg0KDQpZb3Ugc3VnZ2VzdGVkIGluIHRoZSBvdGhlciBt
YWlsIHRoYXQgaXQgbWlnaHQgYmUgd29ydGggbWFraW5nIGEgcnVuLQ0KbGV2ZWwgJ2dyb3VwJyBj
b25zaXN0aW5nIG9ubHkgb25lIGJ1Y2sgZm9yIGZhc3Qgdm9sdGFnZSBjaGFuZ2VzIHZpYQ0KR1BJ
T3MuIFNvIEkgYW0gYmFjayB0byBhZGRpbmcgdGhlIHJ1bi1sZXZlbCBzdXBwb3J0IHRvIHRoZSBC
RDcxODI4DQpkcml2ZXIuIFdoaWNoIGxlYWQgbWUgYmFjayB0byB0aGlzLg0KDQpUaGUgUE1JQyBz
dXBwb3J0cyB3aWRlIHJhbmdlIG9mIHZvbHRhZ2VzIGZvciB0aGVzZSBEVlMgYnVja3MgLSBidXQg
b25seQ0KNCBvZiB0aGVzZSB2b2x0YWdlcyBjYW4gYmUgc2VsZWN0ZWQgdG8gYmUgc3dpdGNoZWQg
ZmFzdCB2aWEgR1BJTyBsaW5lDQpzdGF0ZXMuIEVnLCBpbiBIVyBsZXZlbCB3ZSBjYW4gc2V0IFJV
TjAgdm9sdGFnZSAoc2VsZWN0ZWQgd2hlbiBib3RoDQpHUElPIGxpbmVzIGFyZSBMT1cpIHRvIG9u
ZSByZWdpc3Rlci4gUlVOMSB2b2x0YWdlIChzZWxlY3RlZCB3aGVuIG9uZQ0KR1BJTyBpcyBoaWdo
LCBvdGhlciBsb3cpIHRvIHNlY29uZCByZWdpc3Rlci4gU2FtZSBmb3IgUlVOMiBhbmQgUlVOMw0K
dm9sdGFnZXMuDQoNCkkgY291bGQgbWFrZSB0aGlzIHNvIHRoYXQgaW5pdGlhbGx5IHRoZXJlIGlz
IHRoZSBIVyBkZWZhdWx0IHZvbHRhZ2VzDQphcmUgcmVhZCB1cCBieSBkcml2ZXIgYW5kIGNhY2hl
ZCB0byBiZSB1c2VkIGZvciBlYWNoIGxldmVsLiBXaGVuIG5ldw0Kdm9sdGFnZSBpcyByZXF1ZXN0
ZWQgYnkgdGhlIGNvbnN1bWVyLCBjb3JyZWN0IFJVTiBsZXZlbCBpcyBzZWxlY3RlZCBvcg0KaWYg
bWF0Y2hpbmcgdm9sdGFnZSBpcyBub3Qgc2V0IHRvIGFueSBSVU4gbGV2ZWwsIHRoZW4gaXQgaXMg
d3JpdHRlbiB0bw0Kb25lIG9mIHRoZSBydW4gbGV2ZWwgcmVnaXN0ZXJzIChhbmQgY2FjaGUpLg0K
DQpQcm9ibGVtIGlzIHRoYXQgaWYgbm8gZGVmYXVsdCB2b2x0YWdlcyBhcmUgZ2l2ZW4gZnJvbSBE
VCwgdGhlIHRoZSBmaXJzdA0Kdm9sdGFnZSBjaGFuZ2VzIGFyZSBsaWtlbHkgdG8gYmUgc2xvdyAo
cmVxdWlyZSByZWdpc3RlciBhY2Nlc3MgLSBJDQpndWVzcyB0aGUgSFcgZGVmYXVsdHMgYXJlIG5v
dCB3b3JraW5nIGZvciBtYW55IHVzZS1jYXNlcykgLSB3aGljaCBtYXkNCmJlIHVuZGVzaXJhYmxl
Lg0KDQpTbyBJIHN0aWxsIHRoaW5rIHRoZSBEVCBiaW5kaW5ncyBmb3Igc2V0dGluZyB0aGVzZSBp
bml0aWFsIHZhbHVlcyBtaWdodA0KYmUgdGhlIG1vc3QgY29udmVuaWVudCB3YXkgaWYgd2UgYXJl
IG5vdCBhZGRpbmcgY3VzdG9tIEFQSSBmb3IgdGhpcy4NCkhlbmNlIEkgcGxhbiB0byBrZWVwIHRo
aXMgYmluZGluZy4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBoYXZlDQpiZXR0ZXIgaWRlYXMg
b3IgaWYgdGhpcyBpcyBhYnNvbHV0ZWx5IGEgbm8gZ28uDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5l
bg0K
