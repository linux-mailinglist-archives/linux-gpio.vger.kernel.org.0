Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1954712007B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 10:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLPI73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:59:29 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:53562 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfLPI73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:59:29 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-1b-5df7476d9f32
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 5B.FD.08102.D6747FD5; Mon, 16 Dec 2019 09:59:26 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 16 Dec 2019 09:59:14 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v6 10/15] gpio: devres: Add devm_gpiod_get_parent_array
Thread-Topic: [PATCH v6 10/15] gpio: devres: Add devm_gpiod_get_parent_array
Thread-Index: AQHVsAgD2gnib6iDu0CtY9qHC9JPxqe8ZSSAgAAIPIA=
Date:   Mon, 16 Dec 2019 08:59:14 +0000
Message-ID: <812acba9df70c4bb6975580c7965b61e923a3a13.camel@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <f34765b5cb4e949c2e85415ded3d0ee7736cc97b.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdbUS7WeQ7OoTtjGnB7L=uhYncwwcHxkJ1Uj6GqYCGNGJA@mail.gmail.com>
In-Reply-To: <CACRpkdbUS7WeQ7OoTtjGnB7L=uhYncwwcHxkJ1Uj6GqYCGNGJA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <43C53F21BE36E2478B2439D9C76E2F2B@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tb0wTZxzee3e9u4JnjoLruyrLvMQs4qhzW7J3izF8mHqLhrlooi4hcIwb
        JcCVXFsn7MM6mSJgGGrVWQuIUiSCQjvYGNGNIP8sWwUVVtl060bIAAPBuRKR4e44FT69T37P
        8/ye58PvpXGDlzLRWZJdlCUhhyOjiPa6x75EaetMyuvTlwGqGRikUNFkLYX+O9ZNoYcVAQKd
        CI+QaKS9CKCqzqAOlfY161Dh+UYS/drSRKDf/+0CKHL7MIZccxcwNH3kng5VH6oh0DdVcwDd
        avOQqOW+srm7/jaJvL8MYMjj7SXQ1INiDA0ENqMTgUkK3Q10kahwIISjg1c7KTQ/5CNQWXBr
        UjzfUNkA+MezxwA/FTpI8ZUNn/Hfu+9SvP9iMcn/NnSF5H+saKD482XHdXzkp6MEP1rdSPA9
        oe8w/lTlI4xvPNIJ+Lr6GYr/x//yDvaj6I3pgn3fzqxMaf2mtGjLz3PHybwDK/ef8spOUGcq
        AXoasm/BUHktpmIDOwjgpdPWEhCl4F4AZ4ddCkHTJLsRltyhVE0c+w681ushVA3O9kbDs8Ew
        UIlYdhu81TxLaKLt8GYoiGv4Xej0RxbMBLsGBvo8C3OGTYYTQx5SC5sAsOWPCZ1K6NkPYbP/
        24VGgI2Hxc7JBYyzRugfndFprVlYc+UGruEVcOyv+adzDl59FCbU0ji7Fja2rdesSbC07x7Q
        8GroKg1TWocYeP30CFEOXnQvSXAvut1L3O4lbvcS91mguwhgrpCVkynYxQ1mWXSYZaslV3k+
        tub6gXZ2D1vBk473OwBGgw7wEo1xK5hddyIphuXp1ox8i2CzpMqOHNHWASCNc3FM6yszKQYm
        Q8gvEGXrM2olTXBG5tXw0RQDq2Zli2KeKD9jV9E0B5n8LYoxRhYzxf2fZOXYF2mM1qvLo0xx
        NlHKEGXBYbekqueRalPuQ6WWKbku1c7Y8oRcZapZA2AdXT5WcQ6nOyu853ADIVkl0WRkLm1W
        pKwqtTik50HjwEgDLpYJqIuWKX/v+Z5xJQJTIt5IjqgRdmGRMjnBvvu6np6JdU0O7vPXajL7
        h7/62ydVtvYXvrma/DL7vfiE9jM248ntadhgUpvxWqg+OHwgb9Aylrimu7Tgi9pNiVumpk17
        fReuJ7bNv1Ck7/c8iPF98ENV+qg5ZPz0UFxC/dobrvyTyy/vPlxmHi8wJ++5Wf3nE33Xbpi9
        I+3rt5uc22I5wmYRNiTgsk34H70bqoo4BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpIaSBkZWUgSG8gcGVlcHMhIChMaW51cyAmIExlZSArIG90aGVyIGludGVyZXN0ZWQpLA0KDQpP
biBNb24sIDIwMTktMTItMTYgYXQgMDk6MjkgKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+
IE9uIFdlZCwgRGVjIDExLCAyMDE5IGF0IDEwOjQ3IEFNIE1hdHRpIFZhaXR0aW5lbg0KPiA8bWF0
dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4gDQo+ID4gQnVuY2ggb2Yg
TUZEIHN1Yi1kZXZpY2VzIHdoaWNoIGFyZSBpbnN0YW50aWF0ZWQgYnkgTUZEIGRvIG5vdCBoYXZl
DQo+ID4gb3duIGRldmljZS10cmVlIG5vZGVzIGJ1dCBoYXZlIChmb3IgZXhhbXBsZSkgdGhlIEdQ
SU8gY29uc3VtZXINCj4gPiBpbmZvcm1hdGlvbiBpbiBwYXJlbnQgZGV2aWNlJ3MgRFQgbm9kZS4g
QWRkIHJlc291cmNlIG1hbmFnZWQNCj4gPiBkZXZtX2dwaW9kX2dldF9hcnJheSgpIGZvciBzdWNo
IGRldmljZXMgc28gdGhhdCB0aGV5IGNhbiBnZXQgdGhlDQo+ID4gY29uc3VtZXIgaW5mb3JtYXRp
b24gZnJvbSBwYXJlbnQgRFQgd2hpbGUgc3RpbGwgYmluZGluZyB0aGUgR1BJTw0KPiA+IHJlc2Vy
dmF0aW9uIGxpZmUtdGltZSB0byB0aGlzIHN1Yi1kZXZpY2UgbGlmZSB0aW1lLg0KPiA+IA0KPiA+
IElmIGRldm1fZ3Bpb2RfZ2V0X2FycmF5IGlzIHVzZWQgYXMgc3VjaCAtIHRoZW4gdW5sb2FkaW5n
IGFuZCB0aGVuDQo+ID4gcmUtbG9hZGluZyB0aGUgY2hpbGQgZGV2aWNlIGZhaWxzIGFzIHRoZSBH
UElPcyByZXNlcnZlZCBkdXJpbmcNCj4gPiBmaXJzdA0KPiA+IGxvYWQgYXJlIG5vdCBmcmVlZCB3
aGVuIGRyaXZlciBmb3Igc3ViLWRldmljZSBpcyB1bmxvYWQgKGlmIHBhcmVudA0KPiA+IHN0YXlz
IHRoZXJlKS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRp
LnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAtLS0NCj4gPiANCj4gPiBDaGFuZ2Vz
IHNpbmNlIHY1Og0KPiA+IC0gcmVuYW1lZCBpbnRlcm5hbCBmdW5jdGlvbiAobm8gX18gLSBwcmVm
aXhlcyBmb3IgTGludXMgOl0gKQ0KPiANCj4gVGhhbmtzLCBhcyB0aGVyZSBhcmUgdGhpbmdzIGhh
cHBlbmluZyBpbiB0aGUgR1BJTyBzdWJzeXN0ZW0gSQ0KPiBoYXZlIHB1dCB0aGlzIG9uZSBwYXRj
aCBvbiBhbiBpbW11dGFibGUgYnJhbmNoIGhlcmU6DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1ncGlvLmdpdC9sb2cvP2g9aWIt
ZGV2bS1ncGlvZC1nZXQtcGFyZW50LWFycmF5DQo+IA0KPiBQbGVhc2UgYXNrIHRoZSBtYWludGFp
bmVyIChJIGd1ZXNzIExlZT8pIHRvIHB1bGwgdGhpcyBpbnRvIHdoZXJldmVyDQo+IHRoZSByZXN0
IG9mIHRoZSBwYXRjaGVzIHNob3VsZCBiZSBtZXJnZWQgaWYgeW91IHdhbnQgcGF0Y2hlcyBiZXlv
bmQNCj4gdGhpcyBwb2ludCB0byBiZSBhcHBsaWVkIGZvciB0aGUgbmV4dCAodjUuNikgbWVyZ2Ug
d2luZG93LCB0aGVuIHRoaXMNCj4gcGF0Y2ggaXMgbm90IG5lZWRlZCBpbiB0aGUgc2VyaWVzLg0K
DQpJIGRyb3BwZWQgdGhlIHJ1bi1sZXZlbCBzdXBwb3J0IGZyb20gcmVndWxhdG9yIHBhdGNoIChm
b3Igbm93IGF0DQpsZWFzdCkuIFRoaXMgbWVhbnMgdGhhdCBJIG5vIGxvbmdlciBoYXZlIEdQSU8g
Y29uc3VtZXJzIG5lZWRpbmcgdGhpcw0KbmV3IEFQSSBpbiB0aGUgc2VyaWVzLiBXaGljaCBtZWFu
cyB0d28gdGhpbmdzOg0KDQoxLiBUaGVyZSBpcyBubyBpbi10cmVlIHVzZXJzIG9mIHRoaXMgbmV3
IEFQSSBhcyBvZiBub3cuIFRoaXMgQVBJIGhhcw0KdmFsaWQgdXNlLWNhc2UgaW1tZWRpYXRlbHkg
d2hlbiBhbiBNRkQgc3ViLWRldmljZSB3aGljaCBoYXMgbm8gb3duDQooc3ViLWRldmljZSBzcGVj
aWZpYykgY29tcGF0aWJsZSBpbiBEVCB3YW50cyB0byBnZXQgdGhlIEdQSU8gYXJyYXkgYW5kDQp1
c2UgZGV2bSAtIGJ1dCBJIGFtIG5vdCBzdXJlIGlmIHdlIGhhdmUgYW55IGluLXRyZWUuIChJIGNo
ZWNrZWQgY3VycmVudA0KZGV2bV9ncGlvZF9nZXRfYXJyYXkoKSB1c2VycyBhbmQgZGlkbid0IHNl
ZSBhbnkgTUZEIHN1Yi1kZXZpY2VzIHdoaWNoDQp3b3VsZCBoYXZlIGVycm9ybmVvdXNseSB1c2Vk
IHRoZSBwYXJlbnQgZGV2aWNlIGZvciBtYW5hZ2VtZW50IC0gYnV0IEkNCmRpZG4ndCBjaGVjayBp
ZiB0aGVyZSBpcyBhbnkgbm9uLWRldm0gdmFyaWFudCB1c2VycyB0aGF0IG1pZ2h0IGJlbmVmaXQN
CmZyb20gdGhpcyBBUEkpDQoNCjIuIFRoZXJlIGlzIG5vIGRlcGVuZGVuY3kgZnJvbSB0aGlzIHNl
cmllcyB0byB0aGUgbmV3IEFQSS4NCg0KDQpTbywgdGhlcmUgaXMgdHdvIG90aGVyIG9wdGlvbnMg
b25lIGNhbiBjb25zaWRlcjoNCjEuIERyb3AgdGhpcyBwYXRjaCBjb21wbGV0ZWx5IGZyb20gdGhl
IHNlcmllcyBhbmQgR1BJTyB0cmVlLg0KMi4gQXBwbHkgaXQgdG8gR1BJTyB0cmVlIG9ubHkgYW5k
IGRyb3AgaXQgZnJvbSB0aGlzIHNlcmllcyAoaWYgdGhpcyBpcw0Kc3RpbGwgc2VlbiB1c2VmdWwp
Lg0KDQpCciwNCglNYXR0aQ0K
