Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56808ED9C2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 08:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbfKDHFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 02:05:20 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:55086 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDHFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 02:05:20 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-c3-5dbfcdad7647
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id E7.DB.08102.DADCFBD5; Mon,  4 Nov 2019 08:05:17 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 4 Nov 2019 08:05:07 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [RFC PATCH v3 10/15] regulator: bd71828: Add GPIO based
 run-level control for regulators
Thread-Topic: [RFC PATCH v3 10/15] regulator: bd71828: Add GPIO based
 run-level control for regulators
Thread-Index: AQHVkKmUb1A5TsbkA0WleApZHP5SaKd5+YkAgACQyoA=
Date:   Mon, 4 Nov 2019 07:05:06 +0000
Message-ID: <1550472ac1e105bd38da25803358cfbc0404bf38.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <2a8fa03308b08b2a15019d9b457d9bff7aafce94.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdZYw3QQcQ4h5y_C0UD6+4Wz9AdmQ0qSrrjfUweuJj8hyQ@mail.gmail.com>
In-Reply-To: <CACRpkdZYw3QQcQ4h5y_C0UD6+4Wz9AdmQ0qSrrjfUweuJj8hyQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E431E9F5DA350547A5D0E307336A633F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TXUwcVRjNnd+7244MwyJXqiauJgZFamM1t6YxfbBxqkSrPDRp3OCsjAxh
        f8jMYsDWlgerlmpCG8S6XagS2NYCLT+tKELRlT8pYNaWdhssZEOjgdIaWihiN+Bcpy083XPP
        +c459+G7kJbGuXRY4Auouk/xODk789PxOy3PNA13u54NlT+P66KjPP7kRpjHc9WDDP4ifpXD
        R3tGWHzg3GkWj51pZvDEfC/Aty98SuHKxDEKz342zuK2owmAz3eEOHxm5iTAfQ0XOFx/KUrh
        UP0Ag6ODW/GVwV4O7+vq4fHSxRZmS6rcWNMI5L9j+3i5pnGX/EPwCi+3ntjPyX9c7OTk/lg7
        JX9Zs0jJxxsWePlW66Pb7TvXbHYrgfdzCvJ96196Z422PNFCF910lNya6WTLQKOjHNggEjei
        lsU+thzYoSSOAjTbMMxZl36AmiILpgIhJ25G5Zd5YnCIm9AvAyGGzNBiCKJvx0dYIqSI+ajq
        o4OcNaSh+f7P7xpeRP9W/cyTHEZ8AtWGPyS0IL6O2r85TxMsidcAiiVUgm3imyg8Fv6fB+Ij
        aH/ZDYpgWkxDrX8usNajRVTX+Rtt4VQ0Nbl0l3eirsU4Q6poMQOd6lhvwS2o/fcdVspjqPJA
        nLdekIx+/eoqUwEeDK4qCK6Ygyvm4CpzcJX5a8CeAMirFHjylYC6IUtXi7N0v+Y1j3f93lZg
        7cvc92A5si0CKAgi4CFIOVOF2ktnXdIDbn9eqaYYWq5e7FGNCECQdjqE6OEulyTkKaUfqLr/
        nrQOMs404cn4QZckkq5CVS1S9XvqwxA6kZA41+2SknU1Xy15r8ATWJEpaCPh9nSHofryVF0p
        Dmi5ZDlyDXM7iLTW7G0bMu2CUaR4TdayDoKnYcVUdS0Ne6rra2mJ8fl9anqasIeMimRUK/bd
        L5oGaRA4U4TbRF1rfpr7OdNmBWVWZE+eJRUBZUVKLwM9iVfdGUZSfN3yx6evpxzaNFJzBNwc
        n5MrS2KvJScVJoWnMp472Zzz8uFJ98JS804h8xWbu+uFY3tnLu94S/ird3F6I3vqzmzd0Nbp
        Cmk053HvkfneKiMp274rdu3HzGyjdDkHJjfb/uloKHvDU9T09rZqh9aR6Ti0fWziu8K23VHO
        yRiasuEpWjeU/wDZVjMd8QMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMsDQoNCk9uIFN1biwgMjAxOS0xMS0wMyBhdCAyMzoyNyArMDEwMCwgTGludXMg
V2FsbGVpaiB3cm90ZToNCj4gT24gRnJpLCBOb3YgMSwgMjAxOSBhdCAxMjo0MyBQTSBNYXR0aSBW
YWl0dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+
IA0KPiA+IEJ1Y2tzIDEsMiw2IGFuZCA3IG9uIFJPSE0gQkQ3MTgyOCBjYW4gYmUgZWl0aGVyIGNv
bnRyb2xsZWQgYXMNCj4gPiBpbmRpdmlkdWFsIHJlZ3VsYXJ0b3JzIC0gb3IgdGhleSBjYW4gYmUg
Z3JvdXBlZCB0byBhIGdyb3VwIG9mDQo+ID4gcmVndWxhdG9ycyB0aGF0IGFyZSBjb250cm9sbGVk
IGJ5ICdydW4gbGV2ZWxzJy4gVGhpcyBjYW4gYmUNCj4gPiBkb25lIHZpYSBJMkMuIEVhY2ggcmVn
dWxhdG9yIGNhbiBiZSBhc3NpZ25lZCBhIHZvbHRhZ2UgYW5kDQo+ID4gZW5hYmxlL2Rpc2FibGUg
c3RhdHVzIGZvciBlYWNoIHJ1bi1sZXZlbC4gVGhlc2Ugc3RhdHVzZXMgYXJlDQo+ID4gYWxzbyBj
aGFuZ2VhYmxlIHZpYSBJMkMuDQo+ID4gDQo+ID4gUnVuLWxldmVscyBjYW4gdGhlbiBiZSBjaGFu
Z2VkIGVpdGhlciBieSBJMkMgb3IgR1BJTy4gVGhpcw0KPiA+IGNvbnRyb2wgbWVjaGFuaXNtIGlz
IHNlbGVjdGVkIGJ5IGRhdGEgaW4gb25lIHRpbWUgcHJvZ3JhbW1hYmxlDQo+ID4gYXJlYSAoZHVy
aW5nIHByb2R1Y3Rpb24pIGFuZCBjYW4ndCBiZSBjaGFuZ2VkIGxhdGVyLg0KPiA+IA0KPiA+IEFs
bG93IHJlZ3VsYXRvcnMgdG8gYmUgY29udHJvbGxlZCB2aWEgcnVuLWxldmVscyBhbmQgYWxsb3cN
Cj4gPiBnZXR0aW5nL3NldHRpbmcgdGhlIGN1cnJlbnQgcnVuLWxldmVsIGFsc28gdmlhIEdQSU8u
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGlu
ZW5AZmkucm9obWV1cm9wZS5jb20+DQo+IA0KPiBJIGxpa2UgdGhlIHdheSB5b3UgdXNlIHRoZSBn
cGlvIEFQSSBzbyBGV0lXOg0KPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPg0KDQpUaGFua3MuIEFuZCBJIGxpa2UgdGhlIEdQSU8gc2V0IG11bHRp
cGxlIC0gdGhhdCdzIHJlcXVpcmVkIGluIG9yZGVyIHRvDQpkbyBzb21lIG9mIHRoZSBydW4tbGV2
ZWwgY2hhbmdlcyB3aXRob3V0IGludGVybWVkaWF0ZSBzdGF0ZXMuIChFZy4gYm90aA0KRFZTIEdQ
SU9zIG5lZWQgdG8gYmUgdG9nZ2xlZCB2aWEgc2luZ2xlIHJlZ2lzdGVyIHdyaXRlKS4NCg0KPiBJ
IGRvIG5vdCB1bmRlcnN0YW5kIHRoZSByZWd1bGF0b3IgcGFydHMgb2YgdGhlIHBhdGNoLg0KDQpJ
J20gc29ycnkuIFRoZSBwYXRjaCBpcyBub3QgY2xlYXJlc3Qgb25lIHdoYXQgY29tZXMgdG8gdGhl
IHJlZ3VsYXRvcg0Kc3R1ZmYuIEkgY2FuIHRyeSBzcGxpdHRpbmcgaXQgdG8gc21hbGxlciBhbmQg
bW9yZSBsb2dpY2FsIGNoYW5nZXMgaWYNCnlvdSwgTWFyayBvciBvdGhlciBpbnRlcmVzdGVkIHBl
b3BsZSBob3BlIHRvIGdldCBpdCBzcGxpdHRlZC4gT3INCnBlcmhhcHMgaXQgd291bGQgYmUgc2lt
cGxlc3QgdG8gcmV2aWV3IGlmIGl0IHdhcyBhbGwgaW4gb25lIHBhdGNoPyANCg0KUmF0aW9uYWxl
IGZvciBzcGxpdHRpbmcgaXQgaW4gZmlyc3QgcGxhY2Ugd2FzIHRoYXQgSSBob3BlZCB0aGUgYmFz
aWMNCnN1cHBvcnQgKGZpcnN0IHR3byByZWd1bGF0b3IgcGF0Y2hlcykgdG8gYmUgYWNjZXB0YWJs
ZSB3aXRob3V0IGh1Z2UNCmNoYW5nZXMgLSB3aGVyZWFzIHRoZSBmb2xsb3cgdXAgcGF0Y2hlcyBh
cmUgbW9yZSBsaWtlIHF1ZXN0aW9uIHRoYXQgaG93DQp0aGUgaGVjayBzaG91bGQgSSBpbXBsZW1l
bnQgdGhpcyA6XSBJJ3ZlIG5vdCBoaXQgc2ltaWxhciAnY2hhbmdlIGJ1bmNoDQpvZiByZWd1bGF0
b3Igc3RhdGVzIGF0IG9uZSBnbycgZHJpdmVycy9oYXJkd2FyZSBiZWZvcmUuDQoNCkJyLA0KCU1h
dHRpIFZhaXR0aW5lbg0K
