Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0AA7E8978
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 14:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730112AbfJ2N3X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 09:29:23 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:63942 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJ2N3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 09:29:22 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-b7-5db83eafca71
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id C5.1D.08102.FAE38BD5; Tue, 29 Oct 2019 14:29:19 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 29 Oct 2019 14:29:13 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "broonie@kernel.org" <broonie@kernel.org>,
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
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Topic: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Index: AQHVhNDGb/Fi3H2tI0CugiKcGY+PyKdevIMAgAXjkICAALrQAIABJcIAgABTx4CAAPqlgIAA3/yAgACsP4CAAOdsAIAAl9oAgABpOACAABSIgIAAE6mAgAYzUwA=
Date:   Tue, 29 Oct 2019 13:29:13 +0000
Message-ID: <81291f685a52002352b68bfc3749e2ed09c03ca0.camel@fi.rohmeurope.com>
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
         <4fcea7213ae9b3c0de775d1854f8e160ea0b178a.camel@fi.rohmeurope.com>
         <CAL_Jsq+_4SaVHqZFXhF_J+yqqcjuzEZpxFvxJfzsNpL1xBQijw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+_4SaVHqZFXhF_J+yqqcjuzEZpxFvxJfzsNpL1xBQijw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B85D79C2B076E5449EBF988F361BF65A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TW0xTWRTNuc8DevVaYXqoiHATY9QBNOHjaMDHh3pNUDFqNCZNvciFEukj
        t2Wi8iHzYRyqMWAwaoFiFJgGGYH6AAn4QEDoGJXIo4poGhknOIwEAQkzDE4vReHrrLPXWnvt
        k+wDSY2f0cFMs11WzFKWwIRSD93/1sZWb6rXr/syiHBZZzeLz3yqYPFYiZfCF/0DDC5teUbj
        s7/fpnHfnRoKvxtvBfhL1y8ELpz6lcAj597S+FbpFMAvG4oZfGfoJsBtN7oYXN7bSeDi8nYK
        d3q34X5vK4NPN7WweLqnltoSLla5qoA47DvNiq6qHPGes58VPZV5jPimp5ERn/jqCPGSa5IQ
        3TcmWHHUE5USenhBYqpk/2lfZoY5ftORBUb3byOMtTLmeFPRQzoXNEY7AISIT0BFdYkOEAo1
        fDdAHXnDZPDSDtD9fBehihg+ETlesQ4QAsP4WPTg8QChYpJ3Q+QpilDxUv4gGnUOz2oOobaa
        8zN9wngHQOMdPTMGil+Jelt9lIo5fjdqKviDCYb5WFT8+sWMKITfi26OTTMqBvxylJf7aTZN
        izwfJmgVI55HZY3PySAOR4Pvp2frAmqa9FPq0CS/GlU3xAetW1DJeDsVxDGo8KyfDc6wBHVc
        GaDywQ/OeQnOObdznts5z+2c574K6EqATFJmVoZkl9fHKXJ2nGIxmgLHUYvJA4IrM1YPvjbv
        bAYEBM0gAhJCODfVVqfXLEq1pJ0wSjajQcnOkm3NAEFSCOM6n97Va7g06cRJWbF8o5ZBStBy
        q/wFeg2vZh2TZausfGMjIRQQ9zWpXq9ZosgZ8vH0zCz7HE3AELV5qC7MJpvTZEXKthsN6n4Y
        bIEFUamFgdynqp2zWSVToBq0esFamD9Yco2ELSXl10gNZbaYZZ2Wq1alvCo1Zpu/B30EWgiE
        pdw/Krsw8G++9/kYiCACET9Oqk+z2aU5SpcLNvw52d9euHvFOY35SsPfdPT+1BxjdfIE7nC9
        j5StPRUJ9FH6r6hT735eB5MKkt1TOZ/TbxeduXiqK8R7feNIa69hFesuHbPu8wkR6ckflg1G
        nIzuM21OitRHOXZt3zsydECX8nhP7AXt4svRo+XaNxkJKff/2/HIsDVm6+eygpQhi0DZjNL6
        NaRik/4HP72LO/QDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gUm9iLA0KT24gRnJpLCAyMDE5LTEwLTI1IGF0IDEwOjQ3IC0wNTAwLCBSb2IgSGVycmlu
ZyB3cm90ZToNCj4gT24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgOTozNyBBTSBWYWl0dGluZW4sIE1h
dHRpDQo+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IEhl
bGxvIFBlZXBzLA0KPiA+IA0KPiA+IE9uIEZyaSwgMjAxOS0xMC0yNSBhdCAwODoyNCAtMDUwMCwg
Um9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBGcmksIE9jdCAyNSwgMjAxOSBhdCAyOjA3IEFN
IFZhaXR0aW5lbiwgTWF0dGkNCj4gPiA+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5j
b20+IHdyb3RlOg0KPiA+ID4gVGhlIGNhc2VzIGZvciBub3QgaGF2aW5nIGNoaWxkIG5vZGVzIGFy
ZSB3aGVuIHlvdSBoYXZlIGNoaWxkDQo+ID4gPiBub2Rlcw0KPiA+ID4gd2l0aCBub3RoaW5nIG1v
cmUgdGhhbiBhIGNvbXBhdGlibGUgYW5kIHBvc3NpYmx5IHByb3ZpZGVyDQo+ID4gPiBwcm9wZXJ0
aWVzDQo+ID4gPiAoZS5nLiAjZ3Bpby1jZWxscyBmb3IgZ3BpbyBwcm92aWRlcnMpLiBJZiB5b3Ug
aGF2ZSBvdGhlciByZXNvdXJjZQ0KPiA+ID4gZGVwZW5kZW5jaWVzIChlLmcuIGNsb2Nrcykgb3Ig
ZGF0YSB0byBkZWZpbmUgKGUuZy4gdm9sdGFnZXMgZm9yDQo+ID4gPiByZWd1bGF0b3JzKSwgdGhl
biBjaGlsZCBub2RlcyBhYnNvbHV0ZWx5IG1ha2Ugc2Vuc2UuDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0ZWxsaW5nIHRoZSByZWFzb25pbmcgYmVoaW5kLiBNYWtlcyBzZW5zZS4NCj4gPiANCj4gPiA+
IE9uY2Ugd2UgaGF2ZQ0KPiA+ID4gY2hpbGQgbm9kZXMsIHRoZW4gZ2VuZXJhbGx5IGl0IGlzIGVh
c2llciBmb3IgZXZlcnkgZnVuY3Rpb24gdG8gYmUNCj4gPiA+IGENCj4gPiA+IGNoaWxkIG5vZGUg
YW5kIG5vdCBtaXggdGhlIHR3by4gSSdtIHN1cmUgSSBoYXZlIHRvbGQgcGVvcGxlDQo+ID4gPiBp
bmNvcnJlY3RseSB0byBub3QgZG8gY2hpbGQgbm9kZXMgYmVjYXVzZSB0aGV5IGRlZmluZSBpbmNv
bXBsZXRlDQo+ID4gPiBiaW5kaW5ncy4NCj4gPiANCj4gPiBEb2VzIHRoaXMgbWVhbiB0aGF0IGlm
IEkgYWRkIExFRCBjb250cm9sbGVkIG5vZGUgd2l0aCBMRUQgbm9kZXMNCj4gPiBpbnNpZGUNCj4g
PiAtIHRoZW4gSSBzaG91bGQgYWN0dWFsbHkgYWRkIHN1YiBub2RlcyBmb3IgY2xrIGFuZCBHUElP
IHRvbz8gSQ0KPiA+IHdvdWxkDQo+ID4gcHJlZmVyIHN0aWxsIGhhdmluZyB0aGUgY2xrIHByb3Zp
ZGVyIGluZm9ybWF0aW9uIGluIE1GRCBub2RlIGFzDQo+ID4gYWRkaW5nDQo+ID4gYSBzdWItbm9k
ZSBmb3IgY2xrIHdvdWxkIHByb2JhYmx5IHJlcXVpcmUgY2hhbmdlcyBpbiB0aGUNCj4gPiBiZDcx
OHg3X2Nsaw0KPiA+IGRyaXZlci4gKE5vdCBiaWcgb25lcyBidXQgYXZvaWRhYmxlIGlmIGNsayBw
cm92aWRlciBpbmZvcm1hdGlvbiBjYW4NCj4gPiBzdGlsbCBkd2VsbCBpbiBNRkQgbm9kZSkuDQo+
IA0KPiBQcm9iYWJseSBub3QsIGlmIHRoZXJlJ3MgYW4gZXhpc3Rpbmcgc3RydWN0dXJlIHRvIGZv
bGxvdywgdGhlbg0KPiBjb250aW51ZSBkb2luZyB0aGF0Lg0KDQpPaywgdGhhbmtzLg0KDQo+IA0K
PiA+ID4gSSB3b3VsZCBncm91cCB0aGUgbGVkIG5vZGVzIHVuZGVyIGFuIGxlZC1jb250cm9sbGVy
IG5vZGUgKHdpdGggYQ0KPiA+ID4gY29tcGF0aWJsZSkuIFRoZSBzaW1wbGUgcmVhc29uIGlzIGVh
Y2ggbGV2ZWwgb25seSBoYXMgb25lDQo+ID4gPiBudW1iZXIvYWRkcmVzcyBzcGFjZSBhbmQgeW91
IGNhbid0IG1peCBkaWZmZXJlbnQgb25lcy4gWW91J3JlIG5vdA0KPiA+ID4gbnVtYmVyaW5nIHRo
ZSBsZWRzIGhlcmUsIGJ1dCBjb3VsZCB5b3UgKHdpdGggbnVtYmVycyB0aGF0DQo+ID4gPiBjb3Jy
ZXNwb25kDQo+ID4gPiB0byBzb21ldGhpbmcgaW4gdGhlIGgvdywgbm90IGp1c3QgMC4uTik/DQo+
ID4gDQo+ID4gSSBkb24ndCBrbm93IHdoYXQgdGhhdCB3b3VsZCBiZS4gVGhlIExFRCBjb250cm9s
bGVyIHJlc2lkZXMgaW4gTUZEDQo+ID4gZGV2aWNlIGluIEkyQyBidXMgYW5kIGhhcyBubyBtZWFu
aW5nZnVsIG51bWJlcnMgSSBjYW4gdGhpbmsgb2YuIFRoZQ0KPiA+IGFjdHVhbCBMRURzIChvbiBt
eSBib2FyZCkgYXJlIGR1bW15IGRldmljZXMgYW5kIEkgcmVhbGx5IGRvbid0IGtub3cNCj4gPiBo
b3cNCj4gPiB0byBpbnZlbnQgbWVhbmluZ2Z1bGwgbnVtYmVycyBmb3IgdGhlbSBlaXRoZXIuDQo+
IA0KPiBJZiB5b3UgaGF2ZSBzb21ldGhpbmcgbGlrZSAibGVkIGNvbnRyb2wgcmVnaXN0ZXJzIDEs
IDIsIDMiIHdoZXJlDQo+IDEsMiwzDQo+IGlzIGVhY2ggTEVEIGNoYW5uZWwsIHRoZW4gdXNlIHRo
YXQuDQoNClVuZm9ydHVuYXRlbHksIG5vLiBMRUQgY29udHJvbHMgYXJlIGluIHNhbWUgcmVnaXN0
ZXIuDQoNCj4gIE9yIGlmIHRoZSBMRUQgc3VwcGxpZXMgKG9yIHN1cHBseQ0KPiBwaW5zKSBoYXZl
IHNvbWUgbnVtYmVyaW5nLCB1c2UgdGhhdC4NCg0KSSBkb24ndCBrbm93IGhvdyB0byBmb3JtYXQg
dGhlIG51bWJlcmluZyBlaXRoZXIuIEN1cnJlbnRseSBwbGFubmVkIFBNSUMNCnBhY2thZ2UgaXMg
c28gY2FsbGVkICJVQ1NQNTVNM0MiIG1lYW5pbmcgdGhlIHBpbnMgYXJlIGluIGEgbWF0cml4IC0N
CmNvbHVtbnMgaGF2aW5nIG51bWJlcnMgZnJvbSAxIHRvIDggYW5kIHJvd3MgaGF2aW5nIGxldHRl
cnMgZnJvbSBBIHRvIEouDQpJbiB0aGlzIGNhc2UgdGhlIExFRCBvdXRwdXRzIGFyZSBGNiBhbmQg
SDYuIEkgZG9uJ3Qga25vdyBpZiBkaWZmZXJlbnQNCnBhY2thZ2luZyBpcyBwbGFubmVkLiBPbmx5
ICdjb25zdGFudCcgSSBjYW4gZmluZCBpcyB0aGUgb3V0cHV0IHBpbg0KbmFtaW5nICdHUk5MRUQn
IGFuZCAnQU1CTEVEJyA6Lw0KDQo+IElmIHRoZXJlJ3Mgbm9uZSBvZiB0aGF0LCB0aGVuDQo+IGZv
bGxvd2luZyBzdGFuZGFyZCBub2RlIG5hbWVzIGtpbmQgb2YgZmFsbHMgYXBhcnQuICc8Z2VuZXJp
YyBuYW1lPi1OJw0KPiBpcyB3aGF0IEkndmUgYmVlbiBkZWZpbmluZyBmb3Igc29tZSBzY2hlbWEu
DQoNClNvIEkgY291bGQgdXNlIG5vZGUgbmFtZXMgbGVkLTEgYW5kIGxlZC0yIGluIHRoZSBleGFt
cGxlLCByaWdodD8NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQo=
