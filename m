Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75145101A46
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 08:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKSHVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 02:21:22 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:62432 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKSHVV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 02:21:21 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-0e-5dd397ee769f
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 27.BB.08102.EE793DD5; Tue, 19 Nov 2019 08:21:18 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 19 Nov 2019 08:21:14 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 15/16] leds: Add common LED binding parsing support
 to LED class/core
Thread-Topic: [PATCH v5 15/16] leds: Add common LED binding parsing support
 to LED class/core
Thread-Index: AQHVnd45T/Y1eQ/PZ0CqzoQf+9hag6eRaS8AgACeLQA=
Date:   Tue, 19 Nov 2019 07:21:13 +0000
Message-ID: <4c03b7cec4d4417ba3c60b9d8a333ddd4cfa79ac.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <258b5c9934e2b31a5f433a7dbb908dfe5da3d30c.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <745e427d-819e-12d7-5c94-7a8d1a414956@gmail.com>
In-Reply-To: <745e427d-819e-12d7-5c94-7a8d1a414956@gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF07C97937417C41A44CA2C1096336D9@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxjHc+7rAbzLpeA44mbcTdRoMhmJH06ILmr2ciXGmbDEuAzrRS4t
        G7TstjWUfViVOCkQApMXrYAvwEAElYJuc3QRVgdUx+xQXqJMuqEBROpLxZkRt3tXFb6c85zz
        f37///nwHEjqzrHxMNNklRWTlCUwkdSlpn/cb89UDaS+81OPgOv9N1h8cOZbFodqfBSuCIwz
        ePzSQYCPeftpXHSlg8Yng4dp7HQW0Pjm+XMU7m2/DfDtJ5cBnr1eQODyuUYCPyz+g8Ynvq6n
        cPuxOYAHLlYz+Pz0GYB/OX2dwa3eURY3DPkJXN3QS+HgIyeB/b738ajvMoPz/cMkPuDxsvj5
        YBuFS/o/3LhMbKltAWJw+AAr1rZ8Kf7gGmXFus5JQnQ3Oxnx1mAnI9aVHKLFieKfKXH2ahkl
        lnQ0A/HuibOU2DP8HSFW1T4jxKbTT1nxsXvZdv6TqPVpknVvSqbBlPDu7ijjzSM7cko/yM0f
        6aMcoOm9QhABEb8OlZ5xgEIQCXX8DYCm7oeY8KEXoH7/KbYQQMjw61HhCKsBsfxelD/WRWo9
        JH8tCk3PDTOaEMPvQqPTXUy4SY+qO/teAEmoqMJNaTXFr0D32goIzZPjt6GjUx+Fs4bU4EdH
        Sa0ngt+ADl8I0FoN+DeR0zFDaDXJxyH33ad0+NU8qu/8jQzXi9HkX89f3AvI8yxAaf4kvxqd
        vZgQRjciR8EDMly/hcqLAv8/jeOjUd+RcaoUvO5akOCap10LaNcC2rWAPg7oZoCypcwsg2SV
        E9cqsm2tYjZmq9sec7YbhGcv9D34t3tLNyAg6AZLICEs5sZyB1J1r6WZ0+1GyWLUK7Ys2dIN
        ECSFWG7bn9dSdVy6ZM+TFfNLaSmkhDhuVaAsVcdrWZ/Lco6svFTfgFBAXESlahqtyAY5NyMz
        yzovEzBCM4+Mj7XIpnRZkWxWo14bD71FnQ9NWqTmjmk4Z8mRstXbMOoDibB0suYkCb01Deo6
        FPQ0kDrKZDbJ8XGc3agCvAYYbaZXcVMgDgIhhiPU/6ZbpH7DV25TahChBrW1/q4FWaV5Kd4B
        vvpm4lfv5r+31iWXrTYkPLBX3WklRtY4oww/bh9sKvYRj30r90Gb6eoYXJm0BfKVyftmDu0P
        7bwyUfGwkYsU0nbu+KJjV0zy8nV3Kj0S05/vab+fd2ED81n08k/vbarIWLpqayiDnq0rD1o8
        yV15sfb9KTkrPk6y95Q0RqfsvtWiFyiLUUpcQyoW6T9/ilQxQwQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gSmFjZWssDQoNCk9uIE1vbiwgMjAxOS0xMS0xOCBhdCAyMjo1NSArMDEwMCwgSmFjZWsg
QW5hc3pld3NraSB3cm90ZToNCj4gSGkgTWF0dGksDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4gSWYgeW91ciBkcml2ZXIgZG9lcyBub3QgZGVwZW5kDQo+IG9uIGl0IHRoZW4gcGxlYXNl
IHNlbmQgaXMgc2VwYXJhdGVseS4NCg0KVGhlIEJENzE4MjggZGVwZW5kcyBvbiBkZXZpY2UtdHJl
ZSBub2RlIGxvb2stdXAuIEl0IGRvZXMgbm90IHV0aWxpemUNCnRoZSBjb21tb24gcHJvcGVydHkg
cGFyc2luZy4gSSBjb3VsZCBvZiBjb3Vyc2UgZG8gdGhlIGNoaWxkIGR0LW5vZGUNCndhbGtpbmcg
aW4gQkQ3MTgyOCBkcml2ZXIgLSBidXQgaXQga2luZCBvZiBicmVha3MgbXkgbW90aXZhdGlvbiB0
byBkbw0KdGhlIExFRCBjb3JlIGltcHJvdmVtZW50IGlmIEkgYW55d2F5cyBuZWVkIHRvIGRvIHRo
ZSBwYXJzaW5nIGluIEJENzE4MjgNCmRyaXZlciA7KQ0KDQo+ICBCZXNpZGVzLCB3ZSB3b3VsZCBy
ZXF1aXJlDQo+IHRvIGNvbnZlcnQgbWFueSBvZiBjdXJyZW50IExFRCBkcml2ZXJzIHRvIHZlcmlm
eSBob3cgdGhlDQo+IHByb3Bvc2VkIHBhcnNpbmcgbWVjaGFuaXNtIHdpbGwgd29yayB3aXRoIHRo
ZW0uDQoNCkkgc2VlIHRoZSByaXNrIHlvdSBhcmUgcG9pbnRpbmcgb3V0LiBBbmQgSSBhY3R1YWxs
eSB0aGluayB3ZSBjb3VsZA0KZGVmYXVsdCB0byBvbGQgbWVjaGFuaXNtIGlmIG9mX21hdGNoIG9y
IG1hdGNoX3Byb3BlcnR5IGlzIG5vdCBnaXZlbg0KKGZvciBub3cpLiBJIGNvdWxkIHRoZW4gc2Vl
IHRoZSBleGlzdGluZyBkcml2ZXJzIHdobyB1c2UgaW5pdF9kYXRhIC0NCmFuZCBlbnN1cmUgdGhv
c2UgYXJlIGluaXRpYWxpemluZyB0aGUgbmV3IG1hdGNoX3Byb3BlcnR5IGFuZCBvZl9tYXRjaA0K
aW4gaW5pdF9kYXRhIHdpdGggMC4gVGhhdCB3b3VsZCBiZSBxdWl0ZSB0cml2aWFsIHRhc2suDQoN
ClRoYXQgd291bGQgYWxsb3cgdXMgdG8gY29udmVydCBhbmQgdGVzdCBleGlzdGluZyBkcml2ZXJz
IG9uZS1ieS1vbmUNCndoaWxlIGFsbG93aW5nIG5ldyBkcml2ZXJzIHRvIG9mZmxvYWQgdGhlIExF
RCBub2RlIGxvb2stdXAgYW5kIGNvbW1vbg0KcHJvcGVydHkgcGFyc2luZyB0byBMRUQgY29yZS4g
Tm8gcmlzaywgYnV0IGxlc3MgZHJpdmVycyB0byBjb252ZXJ0IGluDQp0aGUgZnV0dXJlIC0gYW5k
IHNpbXBsZXIgZHJpdmVycyB0byBtYWludGFpbiB3aGVuIGFsbCBvZiB0aGVtIGRvIG5vdA0KbmVl
ZCB0byBkdXBsaWNhdGUgbm9kZSBsb29rLXVwIG9yIGJhc2ljIHByb3BlcnR5IHBhcnNpbmcgOykN
Cg0KVG8gbWFrZSB0aGlzIG1vcmUgY29uY3JldGU6DQoNCldlIGNhbiBvbmx5IGRvIHRoZSBuZXcg
RFQgbm9kZSBsb29rLXVwIGlmIGVpdGhlcg0KaWYgKGluaXRfZGF0YS0+bWF0Y2hfcHJvcGVydHku
bmFtZSAmJiBpbml0X2RhdGEtPm1hdGNoX3Byb3BlcnR5LnNpemUpDQpvcg0KaWYgKGluaXRfZGF0
YS0+b2ZfbWF0Y2gpDQpUaGF0IHdvdWxkIGtlZXAgdGhlIG5vZGUtbG9va3VwIHNhbWUgZm9yIGFs
bCBleGlzdGluZyBkcml2ZXJzLg0KDQpFZywgDQpsZWRfZmluZF9md25vZGUgY291bGQgZm9yIG5v
dyBqdXN0IGRvOg0KDQpzdHJ1Y3QgZndub2RlX2hhbmRsZSAqbGVkX2ZpbmRfZndub2RlKHN0cnVj
dCBkZXZpY2UgKnBhcmVudCwNCgkJCQkgICAgICBzdHJ1Y3QgbGVkX2luaXRfZGF0YSAqaW5pdF9k
YXRhKQ0Kew0KCS8qDQogICAgICAgICogVGhpcyBzaG91bGQgbmV2ZXIgYmUgY2FsbGVkIFcvTyBp
bml0IGRhdGEuDQoJKi8NCglpZiAoIWluaXRfZGF0YSkNCgkJcmV0dXJuIE5VTEw7DQoNCgkvKg0K
CSAqIEZvciBvbGQgZHJpdmVycyB3aGljaCBkbyBub3QgcG9wdWxhdGUgbmV3IG1hdGNoIGluZm9y
bWF0aW9uDQoJICoganVzdCBkaXJlY3RseSB1c2UgdGhlIGdpdmVuIGluaXRfZGF0YS0+Zndub2Rl
IG5vIG1hdHRlciBpZg0KCSAqIGl0IGlzIE5VTEwgb3Igbm90LiAtIGFzIG9sZCBmdW5jdGlvbmFs
aXR5IGRpZC4NCgkgKi8NCglpZiAoICghaW5pdF9kYXRhLT5tYXRjaF9wcm9wZXJ0eS5uYW1lIHx8
DQoJICAgICAgIWluaXRfZGF0YS0+bWF0Y2hfcHJvcGVydHkuc2l6ZSkgJiYgIWluaXRfZGF0YS0+
b2ZfbWF0Y2gpDQoJCXJldHVybiBpbml0X2RhdGEtPmZ3bm9kZTsNCg0KCS8qIG1hdGNoIGluZm9y
bWF0aW9uIHdhcyBnaXZlbiAtIGRvIG5vZGUgbG9vay11cCAqLw0KCS4uLg0KfQ0KDQpGdXJ0aGVy
bW9yZSwgdGhlIGNvbW1vbiBwcm9wZXJ0eSBwYXJzaW5nIGNvdWxkIGFsc28gYmUgKGZvciBub3cp
IGRvbmUNCm9ubHkgaWYgbWF0Y2ggZGF0YSBpcyBnaXZlbjoNCg0KCS8qDQoJICogRm9yIG5vdyBv
bmx5IGFsbG93IGNvcmUgdG8gcGFyc2UgRFQgcHJvcGVydGllcyBpZg0KCSAqIHBhcnNpbmcgaXMg
ZXhwbGljaXRseSByZXF1ZXN0ZWQgYnkgZHJpdmVyIG9yIGlmIGNvcmUgaGFzDQoJICogZm91bmQg
bmV3IG1hdGNoIGRhdGEgZnJvbSBpbml0X2RhdGEgYW5kIHRoZW4gc2V0IHRoZSBmbGFnDQoJICov
DQoJaWYgKElOVkVOVF9BX0NPT0xfTkVXX0ZMQUdfTkFNRV9IRVJFKQ0KCQlsZWRfYWRkX3Byb3Bz
KGxlZF9jZGV2LCAmcHJvcHMpOw0KDQpvciBqdXN0IHNpbXBseTogDQoJaWYgKChpbml0X2RhdGEt
Pm1hdGNoX3Byb3BlcnR5Lm5hbWUgJiYNCgkgICAgaW5pdF9kYXRhLT5tYXRjaF9wcm9wZXJ0eS5z
aXplKSB8fCBpbml0X2RhdGEtPm9mX21hdGNoKQ0KCQlsZWRfYWRkX3Byb3BzKGxlZF9jZGV2LCAm
cHJvcHMpOw0KDQooYnV0IHRoaXMgd29uJ3QgYWxsb3cgZHJpdmVyIHRvIGFzayBmb3IgY29tbW9u
IHBhcnNpbmcgZXZlbiBpZiBpdCB3YXMNCnZlcmlmaWVkIGZvciB0aGlzIGRydiB0byB3b3JrIC0g
aGVuY2UgSSBsaWtlIHRoZSBmbGFnIGJldHRlcikNCg0KQW5kIGlmIHlvdSBkb24ndCBmZWVsIGNv
bmZpZGVudCBJIGNhbiBldmVuIGRyb3AgdGhlICJjb21tb24gcHJvcGVydHkNCnBhcnNpbmciIGZy
b20gdGhlIHNlcmllcyBhbmQgbGVhdmUgb25seSB0aGUgIm5vZGUgbG9vay11cCBpZiBtYXRjaC1k
YXRhIA0Kd2FzIGdpdmVuIiB0byBpdC4NCg0KQW55d2F5cywgSSB3b3VsZCBsaWtlIHRvIGludHJv
ZHVjZSB0aGlzIHN1cHBvcnQgd2hpbGUgSSBhbSB3b3JraW5nIHdpdGgNCnRoZSBCRDcxODI4IGRy
aXZlciB3aGljaCByZWFsbHkgaGFzIHRoZSBMRURzIC0gYnV0IEkgY2FuIG1vZGlmeSB0aGUNCnBh
dGNoIHNlcmllcyBzbyB0aGF0IGl0IG9ubHkgaW1wYWN0cyB0byBkcml2ZXJzIHdoaWNoIGltcGxl
bWVudCB0aGUgbmV3DQptYXRjaCBkYXRhIGluIGluaXRfZGF0YSBhbmQgbGVhdmUgb2xkIGRyaXZl
cnMgdG8gYmUgY29udmVydGVkIG9uZS1ieS0NCm9uZSB3aGVuIHRoZXkgY2FuIGJlIHRlc3RlZC4N
Cg0KPiAgSSd2ZSBiZWVuIHRlc3RpbmcNCj4gbXkgTEVEIG5hbWUgY29tcG9zaXRpb24gc2VyaWVz
IHVzaW5nIFFFTVUgYW5kIHN0dWJiaW5nIHRoaW5ncyBpbg0KPiBkcml2ZXJzIHdoZXJlIG5lY2Vz
c2FyeSBhbmQgSSBwcm9wb3NlIHRvIHVzZSB0aGUgc2FtZSBhcHByb2FjaA0KPiBpbiB0aGlzIGNh
c2UuDQoNCkkgZG9uJ3QgcGxhbiB0byBkbyBhbnkgbWFzcy1jb252ZXJzaW9uIGFzIGl0IGlzIHNv
bWV3aGF0IHJpc2t5LiBJIGNhbg0KZG8gY29udmVyc2lvbiB0byBzb21lIG9mIHRoZSBkcml2ZXJz
IChzaW1wbGUgb25lcyB3aGljaCBJIGNhbg0KdW5kZXJzdGFuZCB3aXRob3V0IHRvbyBtdWNoIG9m
IHBhaW4pIC0gYW5kIGFzayBpZiBhbnlvbmUgaGF2aW5nIGFjY2Vzcw0KdG8gYWN0dWFsIEhXIHdp
dGggTEVEcyBjb3VsZCBiZSBraW5kIGVub3VnaCB0byB0ZXN0IHRoZSBwYXRjaCBmb3IgdGhlDQpk
ZXZpY2UuIFRlc3RlZCBkcml2ZXJzIGNhbiB0aGVuIGJlIHRha2VuIGluLXRyZWUgYXMgZXhhbXBs
ZXMuIEFuZCB3aG8NCmtub3dzLCBtYXliZSB0aGVyZSBpcyBzb21lIGRldmVsb3BlcnMgbG9va2lu
ZyBmb3IgYSBob2JieSBwcm9qZWN0IHdpdGgNCmFjY2VzcyB0byBMRUQgY29udHJvbGxlciB0byBo
ZWxwIHdpdGggdGhlIHJlc3QgOykgSSBkb24ndCBoYXZlIHRoZQ0KYW1iaXRpb24gdG8gY2hhbmdl
IGFsbCBvZiB0aGUgTEVEIGRyaXZlcnMgYnV0IEkgdGhpbmsgSSBjYW4gZ2l2ZSBteSAxMA0KY2Vu
dHMgYnkgY29udHJpYnV0aW5nIHRoZSBtZWNoYW5pc20gYW5kIGRvaW5nIGZldyBleGFtcGxlcyA6
KQ0KDQpBbnl3YXlzLCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHRoaW5rIHlvdSBjb3VsZCBh
Y2NlcHQgcGF0Y2ggd2hpY2gNCndvbid0IGNoYW5nZSBleGlzdGluZyBkcml2ZXIgZnVuY3Rpb25h
bGl0eSAtIGJ1dCBhbGxvd3MgbmV3IGRyaXZlcnMgdG8NCm5vdCBkdXBsaWNhdGUgdGhlIGNvZGUu
IEVsc2UgSSdsbCBqdXN0IGR1cGxpY2F0ZSB0aGUgbG9va3VwIGNvZGUgaW4gb25lDQptb3JlIGRy
aXZlciBhbmQgaG9wZSBJIGRvbid0IGhhdmUgYW5vdGhlciBQTUlDIHdpdGggTEVEIGNvbnRyb2xs
ZXIgb24NCm15IHRhYmxlIHRvbyBzb29uLi4uDQoNCihJIGFtIGhhdmluZyAic29tZSIgcHJlc3N1
cmUgdG8gZG8gZmV3IG90aGVyIHRhc2tzIEkgcmVjZW50bHkgZ290LiBTbyBJDQphbSBhZnJhaWQg
SSB3b24ndCBoYXZlIHRvbyBtdWNoIHRpbWUgdG8gaW52ZXN0IG9uIExFRHMgdGhpcyB5ZWFyIDoo
DQpUaHVzIHNldHRpbmcgdXAgdGhlIHFlbXUgYW5kIHN0YXJ0aW5nIHdpdGggc3R1YmJpbmcgaXMg
cmVhbGx5IG5vdCBhbg0Kb3B0aW9uIGZvciBtZSBhdCB0aGlzIHBoYXNlKS4NCg0KQnIsDQoJTWF0
dGkgVmFpdHRpbmVuDQoNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBKYWNlayBBbmFzemV3c2tp
DQo+IA0KPiBPbiAxMS8xOC8xOSA4OjAzIEFNLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4g
UXVjaWsgZ3JlcCBmb3IgJ2Zvcl9lYWNoJyBvciAnbGludXgsZGVmYXVsdC10cmlnZ2VyJyBvcg0K
PiA+ICdkZWZhdWx0LXN0YXRlJyB1bmRlciBkcml2ZXJzL2xlZHMgY2FuIHRlbGwgcXVpdGUgYSBs
b3QuIEl0IHNlZW1zDQo+ID4gbXVsdGlwbGUgTEVEIGNvbnRyb2xsZXIgZHJpdmVycyBpbXBsZW1l
bnQgdGhlIHZlcnkgc2ltaWxhciBsb29waW5nDQo+ID4gdGhyb3VnaCB0aGUgY2hpbGQgbm9kZXMg
aW4gb3JkZXIgdG8gbG9jYXRlIHRoZSBMRUQgbm9kZXMgYW5kIHJlYWQNCj4gPiBhbmQgc3VwcG9y
dCB0aGUgY29tbW9uIExFRCBkdCBiaW5kaW5ncy4gSW1wbGVtZW50aW5nIHRoaXMgc2FtZQ0KPiA+
IHN0dWZmIGZvciBhbGwgTEVEIGNvbnRyb2xsZXJzIGdldHMgb2xkIHByZXR0eSBmYXN0Lg0KPiA+
IA0KPiA+IFRoaXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgbG9jYXRpbmcgdGhlIExFRCBub2Rl
IChiYXNlZCBvbiBrbm93bg0KPiA+IG5vZGUgbmFtZXMgLSBvciBsaW51eCxsZWQtY29tcGF0aWJs
ZSBwcm9wZXJ0eSkgYW5kIGhhbmRsaW5nIG9mDQo+ID4gZmV3IGNvbW1vbiBMRUQgcHJvcGVydGll
cy4NCj4gPiANCj4gPiBsaW51eCxkZWZhdWx0LXRyaWdnZXIsDQo+ID4gZGVmYXVsdC1zdGF0ZSAo
d2l0aCB0aGUgZXhjZXB0aW9uIG9mIGtlZXApLA0KPiA+IA0KPiA+IChpbiBhZGRpdGlvbiB0byBh
bHJlYWR5IGhhbmRsZWQNCj4gPiBmdW5jdGlvbi1lbnVtZXJhdG9yLA0KPiA+IGZ1bmN0aW9uLA0K
PiA+IGNvbG9yDQo+ID4gYW5kIGxhYmVsKS4NCj4gPiANCj4gPiBSZWdhcmRpbmcgdGhlIG5vZGUg
bG9vay11cDogSWYgbm8gaW5pdF9kYXRhIGlzIGdpdmVuLCB0aGVuIG5vDQo+ID4gbm9kZS1sb29r
dXAgaXMgZG9uZSBhbmQgY2RldiBuYW1lIGlzIHVzZWQgYXMgc3VjaC4NCj4gPiANCj4gPiBJZiBp
bml0X2RhdGEgaXMgZ292ZW4gYnV0IG5vIHN0YXJ0aW5nIHBvaW50IGZvciBub2RlIGxvb2t1cCAt
IHRoZW4NCj4gPiAocGFyZW50KSBkZXZpY2UncyBvd24gRFQgbm9kZSBpcyB1c2VkLiBJZiBubyBs
ZWQtY29tcGF0aWJsZSBpcw0KPiA+IGdpdmVuLA0KPiA+IHRoZW4gb2ZfbWF0Y2ggaXMgc2VhcmNo
ZWQgZm9yLiBJZiBuZWl0aGVyIGxlZC1jb21wYXRpYmxlIG5vdA0KPiA+IG9mX21hdGNoDQo+ID4g
aXMgZ2l2ZW4gdGhlbiBkZXZpY2UncyBvd24gbm9kZSBvciBwYXNzZWQgc3RhcnRpbmcgcG9pbnQg
YXJlIHVzZWQNCj4gPiBhcw0KPiA+IHN1Y2guDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0
dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gLS0t
DQo+ID4gDQo+ID4gQ2hhbmdlcyBmcm9tIHY0Og0KPiA+IEZpeGVkIGlzc3VlcyByZXBvcnRlZCBi
eSBEYW4gQ2FycGVudGVyIGFuZCBrYnVpbGQtYm90Lg0KPiA+IChsZWZ0b3ZlciBrZnJlZSBhbmQg
dW5pbml0aWFsaXplZCByZXR1cm4gdmFsdWUpDQo+ID4gDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWQt
Y2xhc3MuYyB8ICA4OCArKysrKysrKysrKystLQ0KPiA+ICBkcml2ZXJzL2xlZHMvbGVkLWNvcmUu
YyAgfCAyNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ID4gLS0tLS0tDQo+
ID4gIGluY2x1ZGUvbGludXgvbGVkcy5oICAgICB8ICA5MCArKysrKysrKysrKystLQ0KPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDM1OSBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkNCj4gPiAN
Cg0K
