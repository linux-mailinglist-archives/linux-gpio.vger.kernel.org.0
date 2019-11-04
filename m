Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E407ED94A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 07:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKDG5O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 01:57:14 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54832 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbfKDG5N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 01:57:13 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-74-5dbfcbc69d05
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id AD.CB.08102.6CBCFBD5; Mon,  4 Nov 2019 07:57:11 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 4 Nov 2019 07:57:00 +0100
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
Subject: Re: [RFC PATCH v3 14/15] gpio: Add definition for GPIO direction
Thread-Topic: [RFC PATCH v3 14/15] gpio: Add definition for GPIO direction
Thread-Index: AQHVkKp+hdqKw9vEbUql9O/haZZyiad5+mgAgACNpoA=
Date:   Mon, 4 Nov 2019 06:57:00 +0000
Message-ID: <c06725c3dd34118a324907137758d8b85b3d4043.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <f08d265c12ebf185c0e1dbbfe0a3f86de4907194.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdYhasTEQq2btQ_3GSo=hMJetp128jFo-6hE=JMeX4MJSA@mail.gmail.com>
In-Reply-To: <CACRpkdYhasTEQq2btQ_3GSo=hMJetp128jFo-6hE=JMeX4MJSA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <419502E125313145ACFAD76CDE83E291@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0wUVxjNnZmduayOGRcoV2qNTnwE26IkNlyFGBNpMjSmEeWXcYODO2UJ
        7C6dWQzQxPJHLIi6TSHIymOD8pQo4BtFyPKSoaHdgoLtKl2htD6iaRQMldruMCr8uiffOec7
        58d3IWkK0JEw3e6UZLuYydNGqqvhdeun/YOd5s0F9SQ+67vD4KPP6hj8slKlcGlgksbVPUMG
        fGzwkgH/drmFwuPTvQDPjHxH4JK5egL/XfzAgC9WzwE83F5B48tPzwPcd26ExrWjPgJX1N6m
        sE/9HN9Xe2l8pKOHwW/utlI7woXmqmYgPB87wghVzd8I1933GaGtqZAW/Hdv0kL/2FVCKKua
        JYSGc68Y4UXbqt3GfUviU0Xnob3pafZN2w8ssT7sOw6yipflBBpuMPnAzxaBEIi4LehXVQVF
        wAhN3B2AWvwFhEaYuH6AOmbyigCENBePiu4x2jiM24q6b1dQmp7kKiBqfDBk0IhQLhF1zqlv
        RV+gEk8XqeNtSO1W5zUUtxaNuM5QGma5L1Hd8BWDHvwEoN7ph/PmEC4JNf7unS8BuI9QYf6z
        eUxyEaht6pVBb82hszd/InUcjh5NvHk751HHbIDSSpNcFLrQvkm37kCnu0cpHa9BJccCjN5h
        ORoon6Rc4AP3ogT3gtu9yO1e5HYvcnuAoQkgm5iemSY6pZhoWcqOlh1WW/A56LC1Af1kXl4D
        /3kTvYCAwAtWQIIPZ2tGb5lNy1IdllyrqFhT5OxMSfECBEk+jPWd6jCbWIuYmyfJjnfUh5Di
        I9gNge/NJk7LypCkLEl+x66EkEesonaaTctlKU3K+So907lAEzBEW26MDFMku0WSxWynNUW7
        jxQleCAatTSYS2h2VskSbcGpblXBx9D1qLKGhD2VtTWkibI77FJkBBs3EJRymtSabX8f9BhE
        QMCHsp9oi5YG/837PY+DEUQwYtfELS3CKS5QkflgZ3npIeu4ZW7gQOEPSY1xM4lI2fPLOOWr
        N/4VW7AqZ7jYE1s2W12+cd3zg56xPKl0d/lqT8LACcG/5h/zU//s0YQ/YpJ2Ev/GJmecOvlZ
        wuHkqKZd0/u76n5+zZ+I3uJyRZ3+er1turjvR/XP8bLDGXHb/K6ShikiVUz+drUSZ1kbz1OK
        VYzZSMqK+D9zqzqy9AMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMsDQoNCk9uIFN1biwgMjAxOS0xMS0wMyBhdCAyMzozMCArMDEwMCwgTGludXMg
V2FsbGVpaiB3cm90ZToNCj4gSGkgTWF0dGkhDQo+IA0KPiBHb29kIGluaXRpYXRpdmUgKGFuZCBJ
IHdpbGwgc2VlIGEgdG9uIG9mIGphbml0b3JpYWwgcGF0Y2hlcyBhcyBhDQo+IHJlc3VsdCBvZiB0
aGlzLi4uKQ0KDQpZZXAuIEkgdGhpbmsgSSBtaWdodCBwdWxsIHRoaXMgY2hhbmdlIG91dCBvZiB0
aGUgUkZDIGFuZCBzZW5kIGl0DQpzZXBhcmF0ZWx5LiBJIGNhbiBhbHNvIGRvIHNvbWUgY29udmVy
c2lvbnMgZm9yIGV4aXN0aW5nIGRyaXZlcnMgLSBidXQgSQ0Kd29uJ3QgcHJvYmFibHkgYmUgYWJs
ZSB0byBkbyBhbGwgb2YgdGhlIGRyaXZlcnMuIEkgc2VlIG5vIHdheSBvZiBkb2luZw0KYW55IHNl
YXJjaCBhbmQgcmVwbGFjZSBzY3JpcHRpbmcgaGVyZSAtIHRoaXMgY29udmVyc2lvbiBpcyBnb2lu
ZyB0byBiZQ0KbWFudWFsIHdvcmsgOi8NCg0KPiANCj4gT24gRnJpLCBOb3YgMSwgMjAxOSBhdCAx
Mjo1MCBQTSBNYXR0aSBWYWl0dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3Bl
LmNvbT4gd3JvdGU6DQo+IA0KPiA+IEF0IGxlYXN0IGZvciBtZSBpdCBpcyBkaWZmaWN1bHQgdG8g
cmVtZW1iZXIgdGhlIG1lYW5pbmcgb2YgR1BJTw0KPiA+IGRpcmVjdGlvbiB2YWx1ZXMuIERlZmlu
ZSBHUElPX0lOIGFuZCBHUElPX09VVCBzbyB0aGF0IG9jY2FzaW9uYWwNCj4gPiBHUElPIGNvbnRy
aWJ1dG9ycyB3b3VsZCBub3QgbmVlZCB0byBhbHdheXMgY2hlY2sgdGhlIG1lYW5pbmcgb2YNCj4g
PiBoYXJkIGNvZGVkIHZhbHVlcyAxIGFuZCAwLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1h
dHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiAoLi4u
KQ0KPiA+ICsjZGVmaW5lIEdQSU9fSU4gICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEdQ
SU9fT1VUICAgICAgIDANCj4gDQo+IFBsZWFzZSBzcGVsbCBpdCBvdXQgb3IgcGVvcGxlIHdpbGwg
YmUgY29uZnVzZWQ6DQo+IA0KPiBHUElPX0xJTkVfRElSRUNUSU9OX0lODQo+IEdQSU9fTElORV9E
SVJFQ1RJT05fT1VUDQoNClJpZ2h0LiBCZXNpZGVzIHRoZSAwRGF5IHRlc3Qgc3VpdGUgZGlkIGFs
cmVhZHkgc3BvdCBhIGZldyByZWRlZmluaXRpb24NCnByb2JsZW1zIHdoZW4gc29tZSBkcml2ZXJz
IGRvIGRlZmluZSBHUElPX0lOIGFuZC9vciBHUElPX09VVC4uLiBTbyBJJ2xsDQpjaGFuZ2UgdGhl
IGRlZmluZXMgdG8gd2hhdCB5b3Ugc3VnZ2VzdCBoZXJlLg0KDQpCciwNCglNYXR0aSBWYWl0dGlu
ZW4NCg==
