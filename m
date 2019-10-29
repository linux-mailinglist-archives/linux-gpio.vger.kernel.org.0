Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF62E8060
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 07:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730790AbfJ2G26 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 02:28:58 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:50556 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbfJ2G26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 02:28:58 -0400
X-AuditID: c0a8fbf4-183ff70000001fa6-f5-5db7dc27a4dc
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 70.9A.08102.72CD7BD5; Tue, 29 Oct 2019 07:28:55 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 29 Oct 2019 07:28:51 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [RFC PATCH v2 05/13] clk: bd718x7: Support ROHM BD71828 clk
 block
Thread-Topic: [RFC PATCH v2 05/13] clk: bd718x7: Support ROHM BD71828 clk
 block
Thread-Index: AQHVimBwjNMwf0EEZEiGH5vTJctNV6dwqoeAgAB0NIA=
Date:   Tue, 29 Oct 2019 06:28:51 +0000
Message-ID: <95b21eeaee8025dc430623429273116c35c1b769.camel@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <5c66ac7d43ae1f57c335b6e565553fe1df703a83.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <20191028233256.798AD21479@mail.kernel.org>
In-Reply-To: <20191028233256.798AD21479@mail.kernel.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA1237DA9BAD5540B994689D32145663@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TWUwTQRh2dre7S3HNUoqMqEQbTb0Fo2aiRnkxWYzxfDEaxAUW2tCDbIvn
        C4lHpZB4gUflUAQkQFQQRYk1iFC0arEeiHhRr1BD8EINEcVdVoWn+TLf9U/yD41rAmQUbbTY
        BdHCm3Skmmis+FkzW/+8PiHmYVc0KvU/ppCjt5xCfYVeAuUH3pKouNmnQjl36lTo2aULBHr1
        rQWg74/2Yyhv4CyGPue+VKGLxQMAPWwoINGlnnMAeaoekajsiR9DBWW3COT3LkcvvC0k2utu
        ptDv9hoiLoKrLqoG3MeOvRRXVL2Lu+p6QXG1ldkk97z9Gsm1dtRj3LGifoyrqPpBcV9ro9eo
        N4YuSeLtW9cb0yxzl24JNew78FmV0TBt+9GqfCIL1OmdIISG7HzYcf0XKWMN+xjAntY4J1BL
        +BaAlS31wAlommSXQOdTStZo2SR48UsOIWtw9hsF7w+6CZkIZ9fArKAPU0Rroev4e5WCF8Hd
        3/uGMMFOhVdfN+IyZthV8HpeDVDKHgD4wF8NZCKERTDXs2dIBNiJMDurdygUZyNh7fsfKmVq
        FpZea8MVHAGDb37/vddBd3+AkIfG2enwfMNcxRoH8+87CAVPhnk5AUqZIQzePvGWOAjGukY0
        uIbdrhFu1wi3a4T7FFBVAmjmjaY03i7EzhGFzDmi1WCWjmSruRYoK9N3BQw2xTcBjAZNYByN
        6SKYAU99gmZMkjVlh4G3GRLFTJNgawKQxnVaxn/3coKGSeF37BRE6z9qPE3oIhl94FCChpW7
        0gUhQxD/sRNoWgeZqc+k0DBRSBO2pxpN9mEao0PkcHWU1iZYUgSRz7QbEuX9SLRJCyJTo6Ve
        lWxnbBm8WbpVrF4wkz4YLCzB6ebCshJcQ1isFiEqktHKUlaWGjIt/4s+gEga6MKZkk6JHS39
        m/85H6QKTKqY1S8/zWbnh6moLBDW9sS0wid0m7M94T3qXmN6c9/JI+M6F/Z0nYxddvtwzDxf
        zQazd6Vzt/7eFMeGmOkv09eN6g9aqAPR2woWuO/uXFt+/kbvhNW/rOmb4gfbikvjGxen+vSB
        Y4mbHV0omOS42Zlsqvv07ijo3h+R64kO9bYnT8LGpGmmrTytdZ/prtQRNgMfOwMXbfwfGu26
        MfQDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB0aGUgY29tbWVudHMgb25jZSBhZ2FpbiA6KQ0K
DQpPbiBNb24sIDIwMTktMTAtMjggYXQgMTY6MzIgLTA3MDAsIFN0ZXBoZW4gQm95ZCB3cm90ZToN
Cj4gUXVvdGluZyBNYXR0aSBWYWl0dGluZW4gKDIwMTktMTAtMjQgMDQ6NDQ6NDApDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1iZDcxOHg3LmMgYi9kcml2ZXJzL2Nsay9jbGstYmQ3
MTh4Ny5jDQo+ID4gaW5kZXggYWU2ZTViYWVlMzMwLi5kMTdhMTllMDQ1OTIgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9jbGsvY2xrLWJkNzE4eDcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2Ns
ay1iZDcxOHg3LmMNCj4gPiBAQCAtOCw2ICs4LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvbWZkL3JvaG0tYmQ3MTh4Ny5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbWZk
L3JvaG0tYmQ3MTgyOC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvbWZkL3JvaG0tYmQ3MDUyOC5o
Pg0KPiANCj4gSXQgd291bGQgYmUgcmVhbGx5IGdyZWF0IHRvIG5vdCBuZWVkIHRvIGluY2x1ZGUg
dGhlc2UgcmFuZG9tIGhlYWRlcg0KPiBmaWxlcyBpbiB0aGlzIGRyaXZlciBhbmQganVzdCB1c2Ug
cmF3IG51bWJlcnMgc29tZWhvdy4gTG9va3MgbGlrZQ0KPiBtYXliZQ0KPiBpdCBjYW4gYmUgZG9u
ZSBieSBwb3B1bGF0aW5nIGEgZGlmZmVyZW50IGRldmljZSBuYW1lIGZyb20gdGhlIG1mZA0KPiBk
cml2ZXINCj4gZGVwZW5kaW5nIG9uIHRoZSB2ZXJzaW9uIG9mIHRoZSBjbGsgY29udHJvbGxlciBk
ZXNpcmVkPyBUaGVuIHRoYXQgY2FuDQo+IGJlDQo+IG1hdGNoZWQgaW4gdGhpcyBjbGsgZHJpdmVy
IGFuZCB3ZSBjYW4ganVzdCBwdXQgdGhlIHJlZ2lzdGVyIGluZm8gaW4NCj4gdGhpcw0KPiBmaWxl
Pw0KDQpJIHN0aWxsIGxpa2Uga2VlcGluZyB0aGUgY2hpcCB0eXBlIGluZm9ybWF0aW9uIG9uIG9u
ZSBoZWFkZXIgLSBubw0KbWF0dGVyIHdoYXQtZXZlciBmb3JtYXQgdGhlIGNsay1jb250cm9sbGVy
IHR5cGUvdmVyc2lvbiBpbmZvcm1hdGlvbiBpcy4NClJhdGlvbmFsZSBpcyB0aGF0IE1GRCBhbmQg
YWxzbyBmZXcgb3RoZXIgc3ViLWRldmljZXMgKG5vdCBvbmx5IHRoZSBjbGspDQpuZWVkIHRvIHVz
ZSBpdC4gQ3VycmVudGx5IGF0IGxlYXN0IHRoZSBSVEMuDQoNCkJ1dCBpZiB3ZSBkZWZpbmUgY2xr
IHJlZ2lzdGVyIGluZm9ybWF0aW9uIGZvciBhbGwgUE1JQ3MgaW4gdGhpcyBjLWZpbGUsIA0KdGhl
biAoSSB0aGluaykgd2UgY2FuIG9ubHkgaW5jbHVkZSB0aGUgPGxpbnV4L21mZC9yb2htLWdlbmVy
aWMuaD4gLQ0Kd2hpY2ggY29udGFpbnMgdGhlIFBNSUMgdHlwZSBkZWZpbmVzIGFuZCB0aGUgZ2Vu
ZXJpYyBNRkQgZGF0YQ0Kc3RydWN0dXJlLiBUaGF0IHdvdWxkOg0KDQotI2luY2x1ZGUgPGxpbnV4
L21mZC9yb2htLWJkNzE4eDcuaD4NCi0jaW5jbHVkZSA8bGludXgvbWZkL3JvaG0tYmQ3MTgyOC5o
Pg0KLSNpbmNsdWRlIDxsaW51eC9tZmQvcm9obS1iZDcwNTI4Lmg+DQorI2luY2x1ZGUgPGxpbnV4
L21mZC9yb2htLWdlbmVyaWMuaD4NCg0KVGhhdCB3YXkgdGhlIGNoaXAtdHlwZSBpbmZvcm1hdGlv
biBjb3VsZCBzdGlsbCBiZSBzYW1lIGZvciBNRkQgYW5kIGFsbA0Kc3ViLWRldmljZXMgYnV0IGNs
ayBkcml2ZXIgd291bGQgbm90IG5lZWQgdG8gaW5jbHVkZSBhbGwgdGhlIGRldGFpbHMNCmZvciBh
bGwgdGhlIFBNSUNzLiBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCB3ZWxsIGFzIGNsayByZWdpc3Rl
cnMgZm9yDQp0aGVzZSBQTUlDcyBhcmUgcmVhbGx5ICpsaW1pdGVkKi4NCg0KPiANCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvY2xrZGV2
Lmg+DQo+ID4gQEAgLTIxLDEwICsyMiw4IEBAIHN0cnVjdCBiZDcxOHh4X2NsayB7DQo+ID4gICAg
ICAgICBzdHJ1Y3Qgcm9obV9yZWdtYXBfZGV2ICptZmQ7DQo+ID4gIH07DQo+ID4gIA0KPiA+IC1z
dGF0aWMgaW50IGJkNzE4MzdfY2xrX3NldChzdHJ1Y3QgY2xrX2h3ICpodywgaW50IHN0YXR1cykN
Cj4gPiArc3RhdGljIGludCBiZDcxODM3X2Nsa19zZXQoc3RydWN0IGJkNzE4eHhfY2xrICpjLCBp
bnQgc3RhdHVzKQ0KPiANCj4gc2hvdWxkIGl0IGJlIHVuc2lnbmVkIGludCBzdGF0dXM/IE9yIG1h
eWJlIHUzMj8NCj4gDQo+ID4gIHsNCj4gPiAtICAgICAgIHN0cnVjdCBiZDcxOHh4X2NsayAqYyA9
IGNvbnRhaW5lcl9vZihodywgc3RydWN0DQo+ID4gYmQ3MTh4eF9jbGssIGh3KTsNCj4gPiAtDQo+
ID4gICAgICAgICByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGMtPm1mZC0+cmVnbWFwLCBjLT5y
ZWcsIGMtPm1hc2ssDQo+ID4gc3RhdHVzKTsNCj4gPiAgfQ0KPiA+ICANCj4gPiBAQCAtMzMsMTQg
KzMyLDE2IEBAIHN0YXRpYyB2b2lkIGJkNzE4MzdfY2xrX2Rpc2FibGUoc3RydWN0IGNsa19odw0K
PiA+ICpodykNCj4gPiAgICAgICAgIGludCBydjsNCj4gPiAgICAgICAgIHN0cnVjdCBiZDcxOHh4
X2NsayAqYyA9IGNvbnRhaW5lcl9vZihodywgc3RydWN0DQo+ID4gYmQ3MTh4eF9jbGssIGh3KTsN
Cj4gPiAgDQo+ID4gLSAgICAgICBydiA9IGJkNzE4MzdfY2xrX3NldChodywgMCk7DQo+ID4gKyAg
ICAgICBydiA9IGJkNzE4MzdfY2xrX3NldChjLCAwKTsNCj4gPiAgICAgICAgIGlmIChydikNCj4g
PiAgICAgICAgICAgICAgICAgZGV2X2RiZygmYy0+cGRldi0+ZGV2LCAiRmFpbGVkIHRvIGRpc2Fi
bGUgMzJLIGNsaw0KPiA+ICglZClcbiIsIHJ2KTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAgc3RhdGlj
IGludCBiZDcxODM3X2Nsa19lbmFibGUoc3RydWN0IGNsa19odyAqaHcpDQo+ID4gIHsNCj4gPiAt
ICAgICAgIHJldHVybiBiZDcxODM3X2Nsa19zZXQoaHcsIDEpOw0KPiA+ICsgICAgICAgc3RydWN0
IGJkNzE4eHhfY2xrICpjID0gY29udGFpbmVyX29mKGh3LCBzdHJ1Y3QNCj4gPiBiZDcxOHh4X2Ns
aywgaHcpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBiZDcxODM3X2Nsa19zZXQoYywgMHhm
ZmZmZmZmZik7DQo+IA0KPiBCZWNhdXNlIG5vdyB0aGlzIGlzIHBhc3NpbmcgLTEgdG8gdW5zaWdu
ZWQgaW50IHRha2luZw0KPiByZWdtYXBfdXBkYXRlX2JpdHMoKT8NCg0KSSB0aGluayB0aGF0IGJp
dC13aXNlIGl0IGlzIGFsbCB0aGUgc2FtZS4gQ3VycmVudGx5IHJlZ2lzdGVycyBhcmUgb25seQ0K
OGJpdHMgd2lkZSBzbyBpdCBpcyBlbm91Z2ggdGhhdCBsb3dlc3QgOCBiaXRzIGFyZSBzZXQuIEFu
ZCAweGZmZmZmZmZmDQpzaG91bGQgd29yayBuaWNlbHkgdXAtdG8gMzJiaXQgcmVnaXN0ZXJzIGFz
IGxvbmcgYXMgaW50IGlzIDMyIGJpdCBvcg0KbW9yZS4NCg0KQnV0IHlvdSBhcmUgY29ycmVjdCB0
aGF0IHRoaXMgaXMgbm90IGxvb2tpbmcgZ29vZC4gQXQgZmlyc3Qgc2lnaHQNCnVuc2lnbmVkIGlu
dCBpcyBtdWNoIG5pY2VyLiBJIHByZWZlciB1bnNpZ25lZCBpbnQgb3ZlciBmb3JjZWQgdTMyIHRv
DQpndWFyYW50ZWUgbmF0dXJhbCBhbGlnbm1lbnQgLSB3aGljaCBkb2VzIG5vdCByZWFsbHkgbWF0
dGVyIGluIHRoaXMgY2FzZQ0KZWl0aGVyLiB1bnNpZ25lZCBpbnQgbWF0Y2hlcyByZWdtYXAgdGhv
dWdoIHNvIEknbGwgc3dpdGNoIHRvIGl0LiBUaGFua3MNCmZvciBwb2ludGluZyB0aGlzIG91dCA6
KQ0KDQpJJ2xsIHRyeSB0byBpbmNsdWRlIHRoZXNlIGNsayBjaGFuZ2VzIGluIHYzLg0KDQoNCkJy
LA0KCU1hdHRpIFZhaXR0aW5lbg0K
