Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD3F102B36
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 18:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKSRy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 12:54:29 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:60094 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfKSRy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 12:54:29 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-55-5dd42c5123c0
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id F8.5F.08102.15C24DD5; Tue, 19 Nov 2019 18:54:25 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 19 Nov 2019 18:54:25 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 10/16] gpio: devres: Add devm_gpiod_get_parent_array
Thread-Topic: [PATCH v5 10/16] gpio: devres: Add devm_gpiod_get_parent_array
Thread-Index: AQHVnd2XL+xAnx6QeEuZbGk0ju43uqeSgwCAgAA1PIA=
Date:   Tue, 19 Nov 2019 17:54:24 +0000
Message-ID: <ece1ab1418e237d6f4968fc4cf59202c35f02ba7.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <8dd9dad2765d47fd6c6fec20566326d00e48a696.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdY_2WzAnK01bQdMF69KsDvHHu9TXuyRoBcmiQMziux=eQ@mail.gmail.com>
In-Reply-To: <CACRpkdY_2WzAnK01bQdMF69KsDvHHu9TXuyRoBcmiQMziux=eQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.203.185.189]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0468ECED5D432047BC0A3EE8F832215A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVBUVRSf+77BffZYUW6kTq5jjGCilTM3x0xrHJ+Vjox/NOkQPeK1S8Iu
        83bXEW2cLUNYFnekEGRjIWBRZmFDUPxgcEJcDKiQVSAkkYF2KNAgSTSKsPd8Kfx1zz2/r/PH
        OQyu9dKRTLLRIkpGIUVHhRJNlf/Uvhi3qit+zUBFLPIEummUOXaSRvfd7QQ6PhikULApE6AS
        fweJHN+fJVHZ+AkS2e1ZJPq5/jSBWs8MADQw2QLQg64sDOVNn8LQvZzbJCo94iHQmZJpgG40
        FFGo/u43AF2t6qKQz99Po4qfAhgqqmgl0PiEHUOB9i2ov72FQocDvTjKuOSn0UxPLYGcHVs3
        LeWri6sBP96bQfPF1Qf5i65+mi9vHMH4Oq+d4m/1NFJ8ufNLkv8t5wrBP/ghl+CdZ72AHy6t
        Ifjves9jfEHxFMZXVj2k+T/rlu7kds/bkChY9u1K1htjN34wz3DqUi6W9teq/UeLb1I2EIzJ
        BiEM5F6Bt89/SmaDUEbLdQOY01lEqZ9WAL9ouisjDENxG2D2TVoRhHOvwiutRYTCwbmjGjg1
        mk8owALubZhxwkeppHdgYbAQU+v1MGum6rEPwa2A5T9uVtostwP22QtoNesOgBn19bTCCeHi
        4JjjTYUDuCXQbht7bINzEbBu+CGpDs1BT+M1XK0XwpFfZv7v6+C3LR24YoNzK2FNQ6wq3QSP
        H7lBqPUymOcYpNURwmBbYZA4Bha55iS4ZtWuOWrXHLVrjvprQHoBTBWSU/SCRVy7WhKtqyWT
        IVV+PjSl1gF19+5fAI+atzUDjAHN4FkG0y1kbaArXjs/0ZSUbhDMhgTJmiKamwFkcF04u2Oo
        M17LJgnpB0TJ9AR6jiF0EWzUYG68llOy9opimig9QRczjA6yU1GyaZgk6sX9HyWnWGZhjAlR
        zEMjw82iMUmUBKvFkKCsR4JZ3g8F0si556JlOWtOE1LlriptBzHMsRF3Gc743RVluJYwmoxi
        ZARrf0amcgrVYDU+DRoFEQzQLWCnFSONfIBPfUblCEyOqPVdVyIswiwUaQOeyx+vsHguv54P
        /d4G/2FD1OSjuIOdvpc0L2sP/H0h7P2sQyd97tKc7T3/Vn4yHGUl7eeWwD/0uz6fSDod1rbn
        +UCB843ozOV6W37J4qmveu+F9q0fuvXe1YtvOX5PfG2b49rOod171uXWCO867/z6wqG89M+6
        +zau3OIeb9samEiLKdVM6gizQVgbjUtm4T9YqqrqPQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMsDQoNCk9uIFR1ZSwgMjAxOS0xMS0xOSBhdCAxNTo0MyArMDEwMCwgTGludXMg
V2FsbGVpaiB3cm90ZToNCj4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgNzo1OCBBTSBNYXR0aSBW
YWl0dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+
IA0KPiA+IEJ1bmNoIG9mIE1GRCBzdWItZGV2aWNlcyB3aGljaCBhcmUgaW5zdGFudGlhdGVkIGJ5
IE1GRCBkbyBub3QgaGF2ZQ0KPiA+IG93biBkZXZpY2UtdHJlZSBub2RlcyBidXQgaGF2ZSAoZm9y
IGV4YW1wbGUpIHRoZSBHUElPIGNvbnN1bWVyDQo+ID4gaW5mb3JtYXRpb24gaW4gcGFyZW50IGRl
dmljZSdzIERUIG5vZGUuIEFkZCByZXNvdXJjZSBtYW5hZ2VkDQo+ID4gZGV2bV9ncGlvZF9nZXRf
YXJyYXkoKSBmb3Igc3VjaCBkZXZpY2VzIHNvIHRoYXQgdGhleSBjYW4gZ2V0IHRoZQ0KPiA+IGNv
bnN1bWVyIGluZm9ybWF0aW9uIGZyb20gcGFyZW50IERUIHdoaWxlIHN0aWxsIGJpbmRpbmcgdGhl
IEdQSU8NCj4gPiByZXNlcnZhdGlvbiBsaWZlLXRpbWUgdG8gdGhpcyBzdWItZGV2aWNlIGxpZmUg
dGltZS4NCj4gPiANCj4gPiBJZiBkZXZtX2dwaW9kX2dldF9hcnJheSBpcyB1c2VkIGFzIHN1Y2gg
LSB0aGVuIHVubG9hZGluZyBhbmQgdGhlbg0KPiA+IHJlLWxvYWRpbmcgdGhlIGNoaWxkIGRldmlj
ZSBmYWlscyBhcyB0aGUgR1BJT3MgcmVzZXJ2ZWQgZHVyaW5nDQo+ID4gZmlyc3QNCj4gPiBsb2Fk
IGFyZSBub3QgZnJlZWQgd2hlbiBkcml2ZXIgZm9yIHN1Yi1kZXZpY2UgaXMgdW5sb2FkIChpZiBw
YXJlbnQNCj4gPiBzdGF5cyB0aGVyZSkuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkg
VmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ICguLi4pDQo+
ID4gK3N0YXRpYyBzdHJ1Y3QgZ3Bpb19kZXNjcyAqX19tdXN0X2NoZWNrDQo+ID4gK19fZGV2bV9n
cGlvZF9nZXRfYXJyYXkoc3RydWN0IGRldmljZSAqZ3Bpb2RldiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkZXZpY2UgKm1hbmFnZWQsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpjb25faWQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBlbnVt
IGdwaW9kX2ZsYWdzIGZsYWdzKQ0KPiANCj4gSSdtIG9wcG9zZWQgdG8gZnVuY3Rpb25zIG5hbWVk
IF9fdW5kZXJzY29yZV9zb21ldGhpbmcoKQ0KPiBzbyBmaW5kIGEgcHJvcGVyIG5hbWUgZm9yIHRo
aXMgZnVuY3Rpb24uDQo+IGRldm1fZ3Bpb2RfZ2V0X2FycmF5X2NvbW1vbigpIHdvcmtzIGlmIG5v
dGhpbmcgZWxzZS4NCg0KT2suIFdlIGFsbCBoYXZlIG91ciBvd24gcGVjdWxhcml0aWUuLi4gSSBt
ZWFuIHByZWZlcmVuY2VzIDopIEJ1dCBhcw0KdGhpcyBpcyBkZWZpbml0ZWx5IHlvdXIgdGVycml0
b3J5IC0gSSdsbCBjaGFuZ2UgdGhlIG5hbWUgOikgTm8gcHJvYmxlbS4NCg0KPiANCj4gPiBAQCAt
MjkyLDE5ICsyODQsNjIgQEAgc3RydWN0IGdwaW9fZGVzY3MgKl9fbXVzdF9jaGVjaw0KPiA+IGRl
dm1fZ3Bpb2RfZ2V0X2FycmF5KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiAgICAgICAgIGlmICgh
ZHIpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+IA0K
PiA+IC0gICAgICAgZGVzY3MgPSBncGlvZF9nZXRfYXJyYXkoZGV2LCBjb25faWQsIGZsYWdzKTsN
Cj4gPiArICAgICAgIGRlc2NzID0gZ3Bpb2RfZ2V0X2FycmF5KGdwaW9kZXYsIGNvbl9pZCwgZmxh
Z3MpOw0KPiA+ICAgICAgICAgaWYgKElTX0VSUihkZXNjcykpIHsNCj4gPiAgICAgICAgICAgICAg
ICAgZGV2cmVzX2ZyZWUoZHIpOw0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZGVzY3M7DQo+
ID4gICAgICAgICB9DQo+ID4gDQo+ID4gICAgICAgICAqZHIgPSBkZXNjczsNCj4gPiAtICAgICAg
IGRldnJlc19hZGQoZGV2LCBkcik7DQo+ID4gKyAgICAgICBpZiAobWFuYWdlZCkNCj4gPiArICAg
ICAgICAgICAgICAgZGV2cmVzX2FkZChtYW5hZ2VkLCBkcik7DQo+ID4gKyAgICAgICBlbHNlDQo+
ID4gKyAgICAgICAgICAgICAgIGRldnJlc19hZGQoZ3Bpb2RldiwgZHIpOw0KPiANCj4gU28gd2Ug
b25seSBnZXQgbWFuYWdlZCByZXNvdXJjZXMgaWYgdGhlICJtYW5hZ2VkIiBkZXZpY2UgaXMNCj4g
cGFzc2VkIGluLg0KDQpIbW0uIEFjdHVhbGx5LCBubyBpZiBJIGFtIG5vdCBtaXNyZWFkaW5nIHRo
aXMuIFdlIGdldCBtYW5hZ2VkIGRldmljZXMNCmluIGFueSBjYXNlLCBidXQgdGhlIGxpZmV0aW1l
IGlzIGVpdGhlciBib3VuZCB0byBleGl0ZW5jZSBvZiB0aGUgZ3Bpbw0KY29uc3VtZXIgZGV2aWNl
ICh3aGljaCBpcyBzdGFuZGFyZCB3YXkpIC0gb3IgZXhpc3RlbmNlIG9mIHNwZWNpZmljDQonbWFu
YWdlZCcgZGV2aWNlLg0KDQpJbiBjYXNlIG9mIE1GRCBzdWItZGV2aWNlIChsaWtlIEJENzE4Mjgg
cmVndWxhdG9yIHN1YmRldikgd2hpY2ggaGFzDQpHUElPIGNvbnN1bWVyIHByb3BlcnRpZXMgaW4g
TUZEIG5vZGUgLSB0aGUgR1BJTyBjb25zdW1lciBpbmZvcm1hdGlvbiBpcw0KaW4gcGFyZW50IGRl
dmljZSdzIChCRDcxODI4IE1GRCBkZXZpY2UpIGRhdGEgLSBidXQgdGhlIGxpZmV0aW1lIHNob3Vs
ZA0KYmUgYm91bmQgdG8gc3ViLWRldmljZXMgKEJENzE4MjggcmVndWxhdG9yIGRldmljZSkgbGlm
ZXRpbWUuIFRodXMgd2UNCm5lZWQgdHdvIGRpZmZlcmVudCBkZXZpY2VzIGhlcmUuDQoNCj4gDQo+
ID4gKy8qKg0KPiA+ICsgKiBkZXZtX2dwaW9kX2dldF9hcnJheSAtIFJlc291cmNlLW1hbmFnZWQg
Z3Bpb2RfZ2V0X2FycmF5KCkNCj4gDQo+IEFuZCB0aGlzIGZ1bmN0aW9uIGlzIHN1cHBvc2VkIHRv
IGJlIHJlc291cmNlIG1hbmFnZWQgZm9yIHN1cmUuDQoNClllcy4gVGhpcyBpcyB0aGUgc3RhbmRh
cmQgY2FzZSB3aGVyZSBkZXZpY2Ugd2hpY2ggaGFzIHRoZSBjb25zdW1lciBkYXRhDQppcyBhbHNv
IHRoZSBvbmUgd2hvICdtYW5hZ2VzJyB0aGUgR1BJTy4NCg0KPiANCj4gPiArICogQGRldjogICAg
ICAgR1BJTyBjb25zdW1lcg0KPiA+ICsgKiBAY29uX2lkOiAgICBmdW5jdGlvbiB3aXRoaW4gdGhl
IEdQSU8gY29uc3VtZXINCj4gPiArICogQGZsYWdzOiAgICAgb3B0aW9uYWwgR1BJTyBpbml0aWFs
aXphdGlvbiBmbGFncw0KPiA+ICsgKg0KPiA+ICsgKiBNYW5hZ2VkIGdwaW9kX2dldF9hcnJheSgp
LiBHUElPIGRlc2NyaXB0b3JzIHJldHVybmVkIGZyb20gdGhpcw0KPiA+IGZ1bmN0aW9uIGFyZQ0K
PiA+ICsgKiBhdXRvbWF0aWNhbGx5IGRpc3Bvc2VkIG9uIGRyaXZlciBkZXRhY2guIFNlZSBncGlv
ZF9nZXRfYXJyYXkoKQ0KPiA+IGZvciBkZXRhaWxlZA0KPiA+ICsgKiBpbmZvcm1hdGlvbiBhYm91
dCBiZWhhdmlvciBhbmQgcmV0dXJuIHZhbHVlcy4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBncGlv
X2Rlc2NzICpfX211c3RfY2hlY2sgZGV2bV9ncGlvZF9nZXRfYXJyYXkoc3RydWN0IGRldmljZQ0K
PiA+ICpkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBjaGFyDQo+ID4gKmNvbl9pZCwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0NCj4gPiBncGlvZF9mbGFn
cyBmbGFncykNCj4gPiArew0KPiA+ICsgICAgICAgcmV0dXJuIF9fZGV2bV9ncGlvZF9nZXRfYXJy
YXkoZGV2LCBOVUxMLCBjb25faWQsIGZsYWdzKTsNCj4gDQo+IFNvIHdoYXQgaXMgdGhpcz8gTlVM
TD8NCg0KSGVyZSB3ZSBkb24ndCBoYXZlIHNlcGFyYXRlIG1hbmFnZXIgZGV2aWNlIC0gdGh1cyB0
aGUgbWFuYWdlciBpcyBOVUxMDQotYW5kIHRoZSBjb25zdW1lciBkZXZpY2UgKCJkZXYiIGhlcmUp
IGlzIHdoYXQgd2UgdXNlIHRvIG1hbmFnZSBHUElPLg0KDQo+IA0KPiBEb2Vzbid0IHRoYXQgbWVh
biB5b3UganVzdCByZW1vdmVkIGFsbCByZXNvdXJjZSBtYW5hZ2VtZW50IGZvciB0aGlzDQo+IGNh
bGw/DQoNCk5vIDopDQoNCj4gDQo+IE9yIGFtIEkgcmVhZGluZyBpdCB3cm9uZz8NCg0KRWl0aGVy
IHlvdSBhcmUgcmVhZGluZyBpdCB3cm9uZyBvciBJIGFtIHdyaXRpbmcgaXQgd3JvbmcgeEQuIElu
IGFueQ0KY2FzZSB0aGlzIG1lYW5zIEkgbmVlZCB0byBkcm9wIGZldyBjb21tZW50cyBpbiBjb2Rl
IDopIFRoYW5rcy4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQoNCg==
