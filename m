Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA5BC14082D
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 11:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgAQKoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 05:44:00 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:42676 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgAQKoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 05:44:00 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-4e-5e218fed4080
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 71.2B.08102.DEF812E5; Fri, 17 Jan 2020 11:43:57 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Fri, 17 Jan 2020 11:43:52 +0100
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
Subject: Re: [PATCH v10 08/13] regulator: bd718x7: Split driver to common
 and bd718x7 specific parts
Thread-Topic: [PATCH v10 08/13] regulator: bd718x7: Split driver to common
 and bd718x7 specific parts
Thread-Index: AQHVzRntgaf9+M1fgkumSvjxkUTUjqfult4AgAAELYA=
Date:   Fri, 17 Jan 2020 10:43:52 +0000
Message-ID: <4bd035fb2c78e96f18006f06c5d8d9d2f1a1b70d.camel@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <def409ab024717e6cd917c488e62fe04ad66bd52.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <20200117102854.GF15507@dell>
In-Reply-To: <20200117102854.GF15507@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E804124311BA34ABBF2DA0AA5EEBD93@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0gUURiGOzOzs8fLxrStebIU3BIpsVrqxyEsggimfkQQEQhqY06upLs2
        OxvdqDXsplZ2I9p0DVm1zC5u2cXVLpu3tig0tZXUWiqhTc2oLLOymabSPzPfOe95vucMfANJ
        bR8dATNMIi+YuEw9HUzdOz/qih84Gp284GBRPHa2dqjxgcFyNf5c7KXwKf8bGpc0PFHh/EfX
        VfhFzVUKv/zSCPBw+0ECn/xRQeCPBb0qfK3kB8DPaotoXNN/GeCmi+00LnveSuCishYKt3pX
        4B5vI4331Teo8a/OampZGFvlqALsB98+Neuo2snetveoWVflIZrt7qyj2WbfTYI97Rgh2PMX
        v6rZT66oNcGJIQmpnLh1bUa6af7SDSHGu6PVZHYgatvoYL7KBnKj8kAQRMwi5P+SA/JAMNQy
        HQBVdnwnlUULQCfuO+g8ACHNJKC8LrUM6BgDcra8peQzJOOE6IS3F8jBVGYTGvOVEsqhdPQx
        t5ySWR2zGPXf3y2XFBODzuTQ8gkNsxo9LvpGKaoGgJpGzpJyEMTMRaftbpVcAyYSHbIN/mlJ
        MuHI1fdVpVyaQc66p6RSh6F3r3/93dej+hH/Hy3JzEFXaucr6DLUNtCsUupodDLfr1buMAU9
        PPOGKgTT7BMM9nHaPoG2T6DtE+hzQFUJUBaXkZnOibxhnsBb5wlmY5b02mjOcgFlYj7fAmOe
        lR5AQOAB0yGhD9Po6iKTtZNTzWnbjZzFmCJYM3mLByBI6nWansPRyVpNGrd9By+Y/0UzIKUP
        18T6jyVpGdm1meezeeFfOhNCPdJYCyRwisCn89s2ZWSK4zEBg+TmwRE6C29K4wXOKhpT5PFI
        sUjzIUehknf2EdlryeaypF0F9QIDLHxXXErC240O6dlQXFZKaimT2cRHhGtsuRLAyIDRavqv
        C4BwCPRTNZ3yZ4RKP8//bgFJREiiwuVRskjkxqMIG6i9cHZwzY2FPq87zF4dsi4u8ZoYeSHg
        K4Dltypinw6v3zXpzkCzs+1RR8XA49XXV746/qyl/2d56lhCaNX+obb3k47HxPh3D8VvNVx6
        Hht35EFcXVP70MNLtl2BHDF+cVe9u6+7JklM3HOg133YuWXJdLdlvadzVQmcJnYPz+rqx3v1
        lMXIGeaSgoX7DThf9fj5AwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBGcmksIDIwMjAtMDEtMTcgYXQgMTA6MjggKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gRnJpLCAxNyBKYW4gMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBGZXcgUk9ITSBQTUlDcyBhbGxvdyBzZXR0aW5nIHRoZSB2b2x0YWdlIHN0YXRlcyBm
b3IgZGlmZmVyZW50DQo+ID4gc3lzdGVtIHN0YXRlcw0KPiA+IGxpa2UgUlVOLCBJRExFLCBTVVNQ
RU5EIGFuZCBMUFNSLiBTdGF0ZXMgYXJlIHRoZW4gY2hhbmdlZCB2aWEgU29DDQo+ID4gc3BlY2lm
aWMNCj4gPiBtZWNoYW5pc21zLiBiZDcxOHg3IGRyaXZlciBpbXBsZW1lbnRlZCBkZXZpY2UtdHJl
ZSBwYXJzaW5nDQo+ID4gZnVuY3Rpb25zIGZvcg0KPiA+IHRoZXNlIHN0YXRlIHNwZWNpZmljIHZv
bHRhZ2VzLiBUaGUgcGFyc2luZyBmdW5jdGlvbnMgY2FuIGJlIHJlLXVzZWQgDQo+ID4gYnkNCj4g
PiBvdGhlciBST0hNIGNoaXAgZHJpdmVycyBsaWtlIGJkNzE4MjguIFNwbGl0IHRoZSBnZW5lcmlj
IGZ1bmN0aW9ucw0KPiA+IGZyb20NCj4gPiBiZDcxOHg3LXJlZ3VsYXRvci5jIHRvIHJvaG0tcmVn
dWxhdG9yLmMgYW5kIGV4cG9ydCB0aGVtIGZvciBvdGhlcg0KPiA+IG1vZHVsZXMNCj4gPiB0byB1
c2UuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0
dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiBubyBjaGFuZ2VzIHNpbmNlIHY5DQo+ID4gDQo+
ID4gIGRyaXZlcnMvcmVndWxhdG9yL0tjb25maWcgICAgICAgICAgICAgfCAgIDQgKw0KPiA+ICBk
cml2ZXJzL3JlZ3VsYXRvci9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVy
cy9yZWd1bGF0b3IvYmQ3MTh4Ny1yZWd1bGF0b3IuYyB8IDE4MyArKysrKysrKy0tLS0tLS0tLS0t
LQ0KPiA+IC0tLS0tLQ0KPiA+ICBkcml2ZXJzL3JlZ3VsYXRvci9yb2htLXJlZ3VsYXRvci5jICAg
IHwgIDk1ICsrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9saW51eC9tZmQvcm9obS1nZW5lcmlj
LmggICAgICB8ICA2NiArKysrKysrKysrDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMjIxIGluc2Vy
dGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvcmVndWxhdG9yL3JvaG0tcmVndWxhdG9yLmMNCj4gDQo+IFsuLi5dDQo+IA0KPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaA0KPiA+IGIvaW5jbHVkZS9s
aW51eC9tZmQvcm9obS1nZW5lcmljLmgNCj4gPiBpbmRleCBmZjNkZDc1NzhmZDMuLjZjYzVhMDgx
OTk1OSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaA0K
PiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oDQo+ID4gQEAgLTQsNiAr
NCw5IEBADQo+ID4gICNpZm5kZWYgX19MSU5VWF9NRkRfUk9ITV9IX18NCj4gPiAgI2RlZmluZSBf
X0xJTlVYX01GRF9ST0hNX0hfXw0KPiA+ICANCj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2RyaXZlci5oPg0KPiA+ICsNCj4gPiAg
ZW51bSByb2htX2NoaXBfdHlwZSB7DQo+ID4gIAlST0hNX0NISVBfVFlQRV9CRDcxODM3ID0gMCwN
Cj4gPiAgCVJPSE1fQ0hJUF9UWVBFX0JENzE4NDcsDQo+ID4gQEAgLTE3LDQgKzIwLDY3IEBAIHN0
cnVjdCByb2htX3JlZ21hcF9kZXYgew0KPiA+ICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiA+
ICB9Ow0KPiA+ICANCj4gPiArZW51bSB7DQo+ID4gKwlST0hNX0RWU19MRVZFTF9VTktOT1dOLA0K
PiA+ICsJUk9ITV9EVlNfTEVWRUxfUlVOLA0KPiA+ICsJUk9ITV9EVlNfTEVWRUxfSURMRSwNCj4g
PiArCVJPSE1fRFZTX0xFVkVMX1NVU1BFTkQsDQo+ID4gKwlST0hNX0RWU19MRVZFTF9MUFNSLA0K
PiA+ICsjZGVmaW5lIFJPSE1fRFZTX0xFVkVMX01BWCBST0hNX0RWU19MRVZFTF9MUFNSDQo+IA0K
PiBIYXZlbid0IHNlZW4gdGhpcyBiZWZvcmUuICBJcyBpdCBsZWdpdD8NCj4gDQoNCkkgZG9uJ3Qg
a25vdyB3aHkgaXQgd291bGRuJ3QgYmUgOikgSSBraW5kIG9mIGdyZXcgdXNlZCB0byB0aGF0IHdo
ZW4gSQ0Kc3RpbGwgZGlkIHNvbWUgbmV0d29ya2luZyBzdHVmZi4NCg0KSXQgZG9lc24ndCByZWFs
bHkgbWF0dGVyIGluIHRoaXMgY2FzZSBidXQgZm9yIGV4YW1wbGUgdGhlIG5ldGxpbmsNCmhlYWRl
cnMgZG86DQoNCmVudW0gew0KICAgZm9vLA0KI2RlZmluZSBmb28gZm9vDQogICBiYXIsDQojZGVm
aW5lIGJhciBiYXINCi4uLg0KfTsNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djUuNS1yYzYvc291cmNlL2luY2x1ZGUvdWFwaS9saW51eC9ydG5ldGxpbmsuaA0KDQpXaGF0IGlz
IHRoZSBnb29kIGhlcmUgaXMgdGhhdCB0aGlzIGFsbG93cyBvbmUgdG8gbmljZWx5IGV4Y2x1ZGUN
CnVuc3VwcG9ydGVkIHN0dWZmIHVzaW5nIHByZXByb2Nlc3NvcjoNCg0KI2luY2x1ZGUgPGhlYWRl
cl93aXRoX29yX3dpdGhvdXRfZm9vX2RlcGVuZG5nX29uX3ZlcnNpb24uaD4NCg0KI2lmZGVmIGZv
bw0KdXNlX2Zvbyhmb28pOw0KI2VuZGlmDQoNCldoYXQgYWJvdXQ6DQo+IA0KPiAgICAgIFJPSE1f
RFZTX0xFVkVMX01BWCA9IFJPSE1fRFZTX0xFVkVMX0xQU1INCg0KQW55d2F5cywgSSBkb24ndCBz
ZWUgd2h5IGRlZmluZSB3b3VsZG4ndCBiZSBPayBoZXJlIC0gYnV0IHN1cmUgaXQgY2FuDQpiZSBj
aGFuZ2VkIGlmIHlvdSBpbnNpc3QgOykgSnVzdCBsZXQgbWUga25vdyBpZiB5b3UgY2FuIGFjY2Vw
dCB0aGUNCmRlZmluZSBvciBub3QgOikNCg0KDQo+IA0K
