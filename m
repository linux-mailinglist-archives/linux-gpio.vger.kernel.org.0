Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6C8E4F49
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 16:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439916AbfJYOhk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 10:37:40 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:56808 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439508AbfJYOhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 10:37:39 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-1b-5db308b122c2
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 02.EA.08102.1B803BD5; Fri, 25 Oct 2019 16:37:37 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 25 Oct 2019 16:37:30 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Topic: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Index: AQHVhNDGb/Fi3H2tI0CugiKcGY+PyKdevIMAgAXjkICAALrQAIABJcIAgABTx4CAAPqlgIAA3/yAgACsP4CAAOdsAIAAl9oAgABpOACAABSIgA==
Date:   Fri, 25 Oct 2019 14:37:30 +0000
Message-ID: <4fcea7213ae9b3c0de775d1854f8e160ea0b178a.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
         <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
         <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com>
         <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
         <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com>
         <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
         <e9d1c529-90ef-34bf-d893-02a109ba19ba@gmail.com>
         <c35a2bca83c711bd7b19c8a99798374388705bfc.camel@fi.rohmeurope.com>
         <06b3909a-b3ff-2c0e-d1df-a475a69951ed@gmail.com>
         <d43d06dbaa0df204fff0194be57d6cd3b832addd.camel@fi.rohmeurope.com>
         <CAL_JsqK7fYYdobOrgxFaMOy+uONCV-i0aOiBQ9oOc4OOPLR8cw@mail.gmail.com>
In-Reply-To: <CAL_JsqK7fYYdobOrgxFaMOy+uONCV-i0aOiBQ9oOc4OOPLR8cw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.203.156.211]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA5C3A162071AB4FA78890EE420BF634@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJsWRmVeSWpSXmKPExsVyYMXvjbobOTbHGvTc4bVYcvEqu0X7u2Xs
        Fl/mnmKxmPrwCZvF/CPnWC26T29htbi9dQOLxf2vRxktvl3pYLKY8mc5k8XHnnusFpvn/2G0
        uLxrDpvF1jfrGC2Orb7CZrH0+kUmizlLT7BYXDzlanH31FE2i9a9R9gt/l3byOIg6rFm3hpG
        j/c3Wtk95q2p9tg56y67x6ZVnWwed67tYfM4fmM7k8f0eT+ZPFas/s7u8XmTXABXFLdNUmJJ
        WXBmep6+XQJ3xoEnX5gK5jlXrJjVw97AeMCxi5GTQ0LAROJ1+zXmLkYuDiGBa4wSJ279YIVw
        TjBKTN+znqWLkYODTcBGousmO0iDiICuxP7DT5hAbGaBFRwSS5qrQGxhgXCJz7PeQ9VESBzb
        0McMYddJfHvYCWazCKhK/Lr8kwXE5hXwk5i8egvU4lNsEq8Wz2MH2cUpEChx5XgeSA2jgKxE
        Z8M7qF3iEpuefWeFOFpAYsme88wQtqjEy8f/oOJKEvsX/WQGGcMsoCmxfpc+RKuDxIZFr6HG
        KEpM6X7IDnGCoMTJmU9YJjCKzUKyYRZC9ywk3bOQdM9C0r2AkXUVo0RuYmZOemJJqqFeUWqp
        XlF+Ri6QSs7P3cQISTFfdjD+P+R5iJGJg/EQoyQHk5Iob/vHTbFCfEn5KZUZicUZ8UWlOanF
        hxglOJiVRHi1TwDleFMSK6tSi/JhUtIcLErivOoPJ8YKCYDsyk5NLUgtgsnKcHAoSfAmsG+O
        FRIsSk1PrUjLzClBSDNxcIIM55ISKU7NS0ktSiwtyYgHJY/4YmD6AEnxAO09CtLOW1yQmAsU
        hWg9xajNMeHl3EXMHEfmLl3ELMSSl5+XKiXOK7gK6EQBkNKM0jy4Ra8YxTkYlYR577MBDeIB
        Zhu4Oa+AVjABreBnAVtRkoiQkmpgrPRpCU5aOkWlfu7nzpO9WfdXHL2vk7NcUPBxFcODa6tt
        Gud97/z7gU2164LBg8CYOsVMK5FjpnqBfpOVRaWezX7z5vD1yzXh30teZlUtmmWsdnfa0WB3
        7u3KzY16CtM7eF176/yWvD1ctpr5e+q7Nva3h9wXfffRLCld1LPiiHayWfVP038lSizFGYmG
        WsxFxYkAhWi+T/MDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gUGVlcHMsDQoNCk9uIEZyaSwgMjAxOS0xMC0yNSBhdCAwODoyNCAtMDUwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6DQo+IE9uIEZyaSwgT2N0IDI1LCAyMDE5IGF0IDI6MDcgQU0gVmFpdHRpbmVu
LCBNYXR0aQ0KPiA8TWF0dGkuVmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4g
PiBIaSBBZ2FpbiBKYWNlaywNCj4gPiANCj4gPiBUaGlzIGhhcyBiZWVuIGEgbmljZSBjb252ZXJz
YXRpb24uIEkgZ3Vlc3MgSSBoYXZlIGxlYXJuZWQgc29tZXRoaW5nDQo+ID4gZnJvbSB0aGlzIGFs
bCBidXQgSSB0aGluayB0aGlzIGlzIG5vIGxvbmdlciBnb2luZyBmb3J3YXJkIHRvbyBtdWNoDQo+
ID4gOikNCj4gPiBJJ2xsIGNvb2sgdXAgc2Vjb25kIHZlcnNpb24gLSB3aGVyZSBJIGFkZCBMRURz
IHRvIERUIChldmVuIGlmIEkNCj4gPiBkb24ndA0KPiA+IHNlZSB0aGUgdmFsdWUgZm9yIGl0IG5v
dykuIEkgd29uJ3QgYWRkIG93biBjb21wYXRpYmxlIGZvciB0aGUgTEVEDQo+ID4gKGZvcg0KPiA+
IG5vdykgLSBhcyBpdCBpcyBwYXJ0IG9mIE1GRCAtIGFuZCBJJ2xsIGFkZCB0aGUgTEVEcyBhbHNv
IHRvIGJpbmRpbmcNCj4gPiBkb2NzLiBJIHRoaW5rIHRoYXQgd2lsbCBnZXQgdGhlIGF0dGVudGlv
biBmcm9tIExlZS9Sb2IgYmV0dGVyIHRoYW4NCj4gPiB0aGUNCj4gPiBMRUQgZHJpdmVyIGRpc2N1
c3Npb24uIFdlIGNhbiBjb250aW51ZSBkaXNjdXNzaW9uIHRoZXJlLiBJIGhvcGUNCj4gPiB0aGlz
IGlzDQo+ID4gT2sgdG8geW91LiAoQW5kIHRoZW4ganVzdCBmZXcgY29tcHVsc29yeSBub3RlcyBh
Ym91dCBteSB2aWV3IG9uDQo+ID4geW91cg0KPiA+IHJlcGxpZXMgLSBhZnRlciBhbGwsIEkgY2Fu
J3QgbGV0IHlvdSB0byBoYXZlIHRoZSBmaW5hbCBzYXkgeEQgLSB5b3UNCj4gPiBjYW4NCj4gPiBp
Z25vcmUgdGhlbSBvciByZXNwb25kIGp1c3QgYXMgeW91IGxpa2UpDQo+ID4gDQo+ID4gT24gRnJp
LCAyMDE5LTEwLTI1IGF0IDAwOjA0ICswMjAwLCBKYWNlayBBbmFzemV3c2tpIHdyb3RlOg0KPiA+
ID4gSGkgTWF0dGksDQo+ID4gPiANCj4gPiA+IE9uIDEwLzI0LzE5IDEwOjE1IEFNLCBWYWl0dGlu
ZW4sIE1hdHRpIHdyb3RlOg0KPiA+ID4gPiBIZWxsbyBKYWNlaywNCj4gPiA+ID4gDQo+ID4gPiA+
IE9uIFdlZCwgMjAxOS0xMC0yMyBhdCAyMzo1OSArMDIwMCwgSmFjZWsgQW5hc3pld3NraSB3cm90
ZToNCj4gPiA+ID4gPiBPbiAxMC8yMy8xOSAxMDozNyBBTSwgVmFpdHRpbmVuLCBNYXR0aSB3cm90
ZToNCj4gPiA+ID4gPiA+IE9uIFR1ZSwgMjAxOS0xMC0yMiBhdCAxOTo0MCArMDIwMCwgSmFjZWsg
QW5hc3pld3NraSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gMTAvMjIvMTkgMjo0MCBQTSwgVmFp
dHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIDIwMTktMTAtMjEg
YXQgMjE6MDkgKzAyMDAsIEphY2VrIEFuYXN6ZXdza2kNCj4gPiA+ID4gPiA+ID4gPiB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiA+IE9uIDEwLzIxLzE5IDEwOjAwIEFNLCBWYWl0dGluZW4sIE1hdHRp
IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBIZWxsbyBEYW4sDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byBj
aGVjayBteSBkcml2ZXIgOikgSQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiB0cnVseQ0KPiA+ID4gPiA+
ID4gPiA+ID4gPiBhcHByZWNpYXRlDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGFsbA0KPiA+ID4gPiA+
ID4gPiA+ID4gPiB0aGUgaGVscCENCj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IEEgImZ1bmRhbWVudGFsIHF1ZXN0aW9uIiByZWdhcmRpbmcgdGhlc2UgcmV2aWV3DQo+
ID4gPiA+ID4gPiA+ID4gPiA+IGNvbW1lbnRzIGlzDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHdoZXRo
ZXINCj4gPiA+ID4gPiA+ID4gPiA+ID4gSQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiBzaG91bGQgYWRk
IERUIGVudHJpZXMgZm9yIHRoZXNlIExFRHMgb3Igbm90LiBJDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IHRob3VnaHQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gSQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiBzaG91
bGRuJ3QNCj4gPiA+ID4gPiA+ID4gPiA+ID4gYnV0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEkgd291
bGQgbGlrZSB0byBnZXQgYSBjb21tZW50IGZyb20gUm9iIHJlZ2FyZGluZw0KPiA+ID4gPiA+ID4g
PiA+ID4gPiBpdC4NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gSWYgdGhl
IExFRCBjb250cm9sbGVyIGlzIGEgcGFydCBvZiBNRkQgZGV2aWNlIHByb2JlZA0KPiA+ID4gPiA+
ID4gPiA+ID4gZnJvbQ0KPiA+ID4gPiA+ID4gPiA+ID4gRFQNCj4gPiA+ID4gPiA+ID4gPiA+IHRo
ZW4NCj4gPiA+ID4gPiA+ID4gPiA+IHRoZXJlIGlzIG5vIGRvdWJ0IGl0IHNob3VsZCBoYXZlIGNv
cnJlc3BvbmRpbmcgRFQNCj4gPiA+ID4gPiA+ID4gPiA+IHN1Yi0NCj4gPiA+ID4gPiA+ID4gPiA+
IG5vZGUuDQo+IA0KPiBBZ3JlZWQuDQoNCk91Y2guIFRoYXQgYW5ub3lpbmcgZmVlbGluZyB3aGVu
IHlvdSBub3RpY2UgeW91IGhhdmUgYmVlbiB3cm9uZy4uLg0KDQo+IFsuLi5dDQo+IA0KPiA+ID4g
PiBSaWdodC4gT3IgYXQgZmlyc3QgaXQgbWlnaHQgYmUgZW5vdWdoIChhbmQgc2ltcGxlc3QpIHRv
IGFzc3VtZQ0KPiA+ID4gPiB0aGF0DQo+ID4gPiA+IGlmDQo+ID4gPiA+IExFRHMgYXJlIHVzZWQg
dmlhIHRoaXMgZHJpdmVyLCB0aGVuIGNvbG91ciBmb3IgYm90aCBMRURzIGlzIHNldA0KPiA+ID4g
PiBleHBsaWNpdGx5IGJ5IHVzZXItc3BhY2UuIEkgd291bGRuJ3QgdHJ5IGd1ZXNzaW5nIGlmIHNp
YmxpbmcNCj4gPiA+ID4gTEVEDQo+ID4gPiA+IHN0YXRlDQo+ID4gPiA+IGNoYW5nZXMgdG8gT0ZG
IHdoZW4gb25lIExFRCBpcyB0dXJuZWQgT04gLSBvciBpZiBMRUQgc3RhdGVzDQo+ID4gPiA+IGNo
YW5nZQ0KPiA+ID4gPiB0bw0KPiA+ID4gPiBPTiBpZiBib3RoIGFyZSB0dXJuZWQgT0ZGLiBUaGlz
IHdvdWxkIHJlcXVpcmUgZXhwb3J0aW5nDQo+ID4gPiA+IGludGVyZmFjZXMNCj4gPiA+ID4gZnJv
bQ0KPiA+ID4gPiBwb3dlci1zdXBwbHkgZHJpdmVyIC0gYW5kIGl0IHdvdWxkIHN0aWxsIGJlIHJh
Y3kuIFRoZSB0aGluZyBpcw0KPiA+ID4gPiB0aGF0DQo+ID4gPiA+IHdoZW4gYm90aCBMRURzIGFy
ZSBvbiBib2FyZCB0aGV5IGFyZSBib3RoIGVpdGhlciB1bmRlciBIVyBvciBTVw0KPiA+ID4gPiBj
b250cm9sLiBTbyBpdCBtYWtlcyBubyBzZW5zZSB0byBjb250cm9sIG9ubHkgb25lIExFRCBpbiBz
dWNoDQo+ID4gPiA+IGNhc2UuDQo+ID4gPiA+IFRodXMgSSB0aGluayBpdCBpcyBPayBpZiB0aGlz
IExFRCBkcml2ZXIgaXMgcmVnaXN0ZXJpbmcgYm90aA0KPiA+ID4gPiBjbGFzcw0KPiA+ID4gPiBk
ZXZpY2VzIGF0IG9uZSBwcm9iZS4gTm8gbmVlZCB0byBpbnN0YW50aWF0ZSBvd24gcGxhdGZvcm0N
Cj4gPiA+ID4gZGV2aWNlcw0KPiA+ID4gPiBmb3INCj4gPiA+ID4gYm90aCBvZiB0aGUgTEVEcy4N
Cj4gPiA+IA0KPiA+ID4gV2UgYWx3YXlzIHJlZ2lzdGVyIGFsbCBMRURzIG9yaWdpbmF0aW5nIGZy
b20gdGhlIHNhbWUgZGV2aWNlIGluDQo+ID4gPiBvbmUNCj4gPiA+IHByb2JlLg0KPiA+ID4gDQo+
ID4gDQo+ID4gVGhlbiBJIHNlZSBsaXR0bGUgYmVuZWZpdCBmcm9tIG9mX2NvbXBhdGlibGUgb3Ig
bGVkcyBzdWJub2RlIGZvcg0KPiA+IE1GRA0KPiA+IGRldmljZXMgd2l0aCBtYW55IExFRHMuIFRo
ZSBkcml2ZXIgb3IgY29yZSBtdXN0IGluIGFueSB3YXlzIHBhcnNlDQo+ID4gdGhlDQo+ID4gRFQg
aW4gb3JkZXIgdG8gZmluZCB0aGUgc3ViIG5vZGVzIHdpdGggaW5mb3JtYXRpb24gZm9yIGluZGl2
aWR1YWwNCj4gPiBMRURzLg0KPiA+IEkgZG9uJ3QgdGhpbmsgdGhhdCB3b3VsZCBiZSBtdWNoIGRp
ZmZlcmVudCBmcm9tIGp1c3QgdXNpbmcgdGhlIE1GRA0KPiA+IG5vZGUNCj4gPiBhcyBjb250cm9s
bGVyIG5vZGUgYW5kIHdhbGtpbmcgdGhyb3VnaCB0aGUgTUZEIGNoaWxkIG5vZGVzIHRvDQo+ID4g
bG9jYXRlDQo+ID4gTEVEIHN1YiBub2RlcyAoYXQgbGVhc3QgZm9yIE1GRHMgd2l0aCBzaW1wbGUg
TEVEIGNvbnRyb2xsZXIpLg0KPiANCj4gVGhlIGNhc2VzIGZvciBub3QgaGF2aW5nIGNoaWxkIG5v
ZGVzIGFyZSB3aGVuIHlvdSBoYXZlIGNoaWxkIG5vZGVzDQo+IHdpdGggbm90aGluZyBtb3JlIHRo
YW4gYSBjb21wYXRpYmxlIGFuZCBwb3NzaWJseSBwcm92aWRlciBwcm9wZXJ0aWVzDQo+IChlLmcu
ICNncGlvLWNlbGxzIGZvciBncGlvIHByb3ZpZGVycykuIElmIHlvdSBoYXZlIG90aGVyIHJlc291
cmNlDQo+IGRlcGVuZGVuY2llcyAoZS5nLiBjbG9ja3MpIG9yIGRhdGEgdG8gZGVmaW5lIChlLmcu
IHZvbHRhZ2VzIGZvcg0KPiByZWd1bGF0b3JzKSwgdGhlbiBjaGlsZCBub2RlcyBhYnNvbHV0ZWx5
IG1ha2Ugc2Vuc2UuDQoNClRoYW5rcyBmb3IgdGVsbGluZyB0aGUgcmVhc29uaW5nIGJlaGluZC4g
TWFrZXMgc2Vuc2UuDQoNCj4gT25jZSB3ZSBoYXZlDQo+IGNoaWxkIG5vZGVzLCB0aGVuIGdlbmVy
YWxseSBpdCBpcyBlYXNpZXIgZm9yIGV2ZXJ5IGZ1bmN0aW9uIHRvIGJlIGENCj4gY2hpbGQgbm9k
ZSBhbmQgbm90IG1peCB0aGUgdHdvLiBJJ20gc3VyZSBJIGhhdmUgdG9sZCBwZW9wbGUNCj4gaW5j
b3JyZWN0bHkgdG8gbm90IGRvIGNoaWxkIG5vZGVzIGJlY2F1c2UgdGhleSBkZWZpbmUgaW5jb21w
bGV0ZQ0KPiBiaW5kaW5ncy4NCg0KRG9lcyB0aGlzIG1lYW4gdGhhdCBpZiBJIGFkZCBMRUQgY29u
dHJvbGxlZCBub2RlIHdpdGggTEVEIG5vZGVzIGluc2lkZQ0KLSB0aGVuIEkgc2hvdWxkIGFjdHVh
bGx5IGFkZCBzdWIgbm9kZXMgZm9yIGNsayBhbmQgR1BJTyB0b28/IEkgd291bGQNCnByZWZlciBz
dGlsbCBoYXZpbmcgdGhlIGNsayBwcm92aWRlciBpbmZvcm1hdGlvbiBpbiBNRkQgbm9kZSBhcyBh
ZGRpbmcNCmEgc3ViLW5vZGUgZm9yIGNsayB3b3VsZCBwcm9iYWJseSByZXF1aXJlIGNoYW5nZXMg
aW4gdGhlIGJkNzE4eDdfY2xrDQpkcml2ZXIuIChOb3QgYmlnIG9uZXMgYnV0IGF2b2lkYWJsZSBp
ZiBjbGsgcHJvdmlkZXIgaW5mb3JtYXRpb24gY2FuDQpzdGlsbCBkd2VsbCBpbiBNRkQgbm9kZSku
DQoNCj4gSSB3b3VsZCBncm91cCB0aGUgbGVkIG5vZGVzIHVuZGVyIGFuIGxlZC1jb250cm9sbGVy
IG5vZGUgKHdpdGggYQ0KPiBjb21wYXRpYmxlKS4gVGhlIHNpbXBsZSByZWFzb24gaXMgZWFjaCBs
ZXZlbCBvbmx5IGhhcyBvbmUNCj4gbnVtYmVyL2FkZHJlc3Mgc3BhY2UgYW5kIHlvdSBjYW4ndCBt
aXggZGlmZmVyZW50IG9uZXMuIFlvdSdyZSBub3QNCj4gbnVtYmVyaW5nIHRoZSBsZWRzIGhlcmUs
IGJ1dCBjb3VsZCB5b3UgKHdpdGggbnVtYmVycyB0aGF0IGNvcnJlc3BvbmQNCj4gdG8gc29tZXRo
aW5nIGluIHRoZSBoL3csIG5vdCBqdXN0IDAuLk4pPw0KDQpJIGRvbid0IGtub3cgd2hhdCB0aGF0
IHdvdWxkIGJlLiBUaGUgTEVEIGNvbnRyb2xsZXIgcmVzaWRlcyBpbiBNRkQNCmRldmljZSBpbiBJ
MkMgYnVzIGFuZCBoYXMgbm8gbWVhbmluZ2Z1bCBudW1iZXJzIEkgY2FuIHRoaW5rIG9mLiBUaGUN
CmFjdHVhbCBMRURzIChvbiBteSBib2FyZCkgYXJlIGR1bW15IGRldmljZXMgYW5kIEkgcmVhbGx5
IGRvbid0IGtub3cgaG93DQp0byBpbnZlbnQgbWVhbmluZ2Z1bGwgbnVtYmVycyBmb3IgdGhlbSBl
aXRoZXIuDQoNCj4gIFRoZSBvdGhlciByZWFzb24gaXMgbW9kZXJuDQo+IExFRCBiaW5kaW5ncyBk
ZWZpbmUgYSBjb250cm9sbGVyIG5vZGUgZm9yIHRoZSBjb250cm9sbGVyIGFuZCBsZWQNCj4gbm9k
ZXMNCj4gZm9yIHRoZSBhY3R1YWwgbGVkIG9uIHRoZSBib2FyZC4gV2hpbGUgdGhlIE1GRCBub2Rl
IGNvdWxkIGJlIHRoZQ0KPiBjb250cm9sbGVyIG5vZGUsIHRoYXQgZ2V0cyBpbnRvIG1peGluZy4N
Cg0KTXkgaWRlYSAoaWYgd2UgdXNlIERUKSB3YXMgdG8gdXNlIHRoZSBNRkQgYXMgY29udHJvbGxl
ciAtIGJ1dCB0aGF0DQpyZWFsbHkgd291bGQgYmUgIm1peGluZyIgdGhlbi4NCg0KSSdsbCBzZWUg
d2hhdCBJIGNhbiBwcmVwYXJlIGZvciB2My4NCg0KT2gsIGFuZCBzb3JyeSBKYWNlayBmb3IgdGFr
aW5nIHRoZSB0aW1lIC0gSSBndWVzcyBpdCB3YXMgZnJ1c3RyYXRpbmcNCmZvciB5b3UgLSBJIHJl
YWxseSB0aG91Z2h0IEkga25ldyBob3cgdGhpcyBzaG91bGQgYmUgZG9uZS4gQmVpbmcgd3JvbmcN
CmlzIGhhcmQgam9iIGF0IHRpbWVzLCBidXQgc28gbXVzdCBiZSBiZWluZyByaWdodCA7KQ0KDQoN
CkJyLA0KCU1hdHRpDQoNCg0K
