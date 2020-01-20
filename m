Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E7E14240F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 08:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgATHGb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 02:06:31 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:56428 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgATHGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 02:06:30 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-fc-5e25517479ff
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id C9.B8.08102.471552E5; Mon, 20 Jan 2020 08:06:28 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 20 Jan 2020 08:06:17 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
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
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 08/13] regulator: bd718x7: Split driver to common
 and bd718x7 specific parts
Thread-Topic: [PATCH v10 08/13] regulator: bd718x7: Split driver to common
 and bd718x7 specific parts
Thread-Index: AQHVzRntgaf9+M1fgkumSvjxkUTUjqfult4AgAAELYCAADFWAIAESOoA
Date:   Mon, 20 Jan 2020 07:06:16 +0000
Message-ID: <11054d0ec82b0dc0fd07970db86c596ba137c0ef.camel@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <def409ab024717e6cd917c488e62fe04ad66bd52.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <20200117102854.GF15507@dell>
         <4bd035fb2c78e96f18006f06c5d8d9d2f1a1b70d.camel@fi.rohmeurope.com>
         <20200117134026.GM15507@dell>
In-Reply-To: <20200117134026.GM15507@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE3AB21D709C864C99B2324519915313@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGJsWRmVeSWpSXmKPExsVyYMXvjbolgapxBm2zOC2WXLzKbtH+bhm7
        xZe5p1gspj58wmYx/8g5Vovu01tYLW5v3cBicf/rUUaLb1c6mCym/FnOZPGx5x6rxeb5fxgt
        Lu+aw2ax9c06Rotjq6+wWSy9fpHJYs7SEywWF0+5Wtw9dZTNonXvEXaLf9c2sjiIeqyZt4bR
        4/2NVnaPeWuqPXbOusvusWlVJ5vHnWt72DyO39jO5DF93k8mjxWrv7N7fN4kF8AVxW2TlFhS
        FpyZnqdvl8CdsXtnJ1PBCYGKVYufszUwThDoYuTgkBAwkXi0N76LkYtDSOAqo8SNX8cZIZwT
        jBJLJq9hAiliE7CR6LrJ3sXIySEiYCix5MRTFhCbWWAJh8TWxiwQW1ggTeL/jUVMEDXpEh9b
        lrFA2G4Se793MILYLAKqEtuaboDN4RXwk7j07DcLxK7VTBLtbXvAijgFtCQuPv8GVsQoICvR
        2fCOCWKZuMSmZ99ZQWwJAQGJJXvOM0PYohIvH/+DiitJ7P35kAXkZmYBTYn1u/QhWh0kLt2f
        yAZhK0pM6X4IdYOgxMmZT1gmMIrNQrJhFkL3LCTds5B0z0LSvYCRdRWjRG5iZk56YkmqoV5R
        aqleUX5GLpBKzs/dxAhJMV92MP4/5HmIkYmD8RCjJAeTkigve5ZSnBBfUn5KZUZicUZ8UWlO
        avEhRgkOZiUR3ru9inFCvCmJlVWpRfkwKWkOFiVxXvWHE2OFBEB2ZaemFqQWwWRlODiUJHiv
        +avGCQkWpaanVqRl5pQgpJk4OEGGc0mJFKfmpaQWJZaWZMSDkkd8MTB9gKR4gPa6BQC18xYX
        JOYCRSFaTzEackx4OXcRM8fOo/OA5JG5SxcxC7Hk5eelSonzWlgBNQiANGSU5sGte8UozsGo
        JMxbDjKOB5h54Ka9AlrEBLToqrkSyKKSRISUVAOj5krDvdMT5tgpHy3gTa96HbHn7oyjs10m
        LtjA0/EqY9LDn+tEasSC8xWufxD50v6XRT6msvSMX996+YlmN24v1pMMf3X/zy4L6+hcs319
        t4s2t/jXNHDNXDc/W+PfwuctLzbUnEn79nBdqyaPxmQ+1/J6x+hXq31Whz6arO/uclpln1nt
        d7P7SizFGYmGWsxFxYkAq2Caz/kDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8sDQoNCk9uIEZyaSwgMjAyMC0wMS0xNyBhdCAxMzo0MCArMDAwMCwgTGVlIEpvbmVzIHdy
b3RlOg0KPiBPbiBGcmksIDE3IEphbiAyMDIwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+
ID4gPiAgDQo+ID4gPiA+ICtlbnVtIHsNCj4gPiA+ID4gKwlST0hNX0RWU19MRVZFTF9VTktOT1dO
LA0KPiA+ID4gPiArCVJPSE1fRFZTX0xFVkVMX1JVTiwNCj4gPiA+ID4gKwlST0hNX0RWU19MRVZF
TF9JRExFLA0KPiA+ID4gPiArCVJPSE1fRFZTX0xFVkVMX1NVU1BFTkQsDQo+ID4gPiA+ICsJUk9I
TV9EVlNfTEVWRUxfTFBTUiwNCj4gPiA+ID4gKyNkZWZpbmUgUk9ITV9EVlNfTEVWRUxfTUFYIFJP
SE1fRFZTX0xFVkVMX0xQU1INCj4gPiA+IA0KPiA+ID4gSGF2ZW4ndCBzZWVuIHRoaXMgYmVmb3Jl
LiAgSXMgaXQgbGVnaXQ/DQo+ID4gPiANCj4gPiANCj4gPiBJIGRvbid0IGtub3cgd2h5IGl0IHdv
dWxkbid0IGJlIDopIEkga2luZCBvZiBncmV3IHVzZWQgdG8gdGhhdCB3aGVuDQo+ID4gSQ0KPiA+
IHN0aWxsIGRpZCBzb21lIG5ldHdvcmtpbmcgc3R1ZmYuDQo+IA0KPiBOZXR3b3JraW5nIGl0IG5v
dCBhIGdvb2QgZXhhbXBsZS4NCj4gDQo+IEl0J3MgZnVsbCBvZiBvZGQgbGl0dGxlIHF1aXJrcyB0
byB0aGUgc3RhbmRhcmQgc3R5bGluZy4NCg0KVGhhdCB3YXMgcXVpdGUgYSBzdHJvbmcgd29yZGlu
Zy4uLiBTb21lIHBlb3BsZSBtaWdodCBkaXNhZ3JlZSA6KQ0KDQpBbnl3YXlzLCBhcyBmYXIgYXMg
SSBrbm93IHRoZSBwcmVwcm9jZXNzb3IgZG9lcyBub3QgY2FyZSBhYm91dCB3aGVyZQ0KdGhlIHBy
ZXByb2Nlc3NvciBkaXJlY3RpdmVzIGFyZSBwbGFjZWQuIEl0IGp1c3QgZ29lcyB0aHJvdWdoIHRo
ZSBmaWxlDQpzZXF1ZW50aWFsbHkgYW5kIG1hY3JvIGRlZmluaXRpb25zIHRha2UgZWZmZWN0IGF0
IHRoZSBwbGFjZSB5b3Ugd3JpdGUNCnRoZW0uIEFuZCBhY3R1YWwgY29tcGlsZXIgZG9lcyBub3Qg
c2VlIHRoZSBkaXJlY3RpdmUgLSBqdXN0IGNvZGUgd2hpY2gNCmhhcyBiZWVuIHJlcGxhY2VkLiBT
byBmcm9tIEMgcG9pbnQgb2YgdmlldyBJIHNlZSBubyBwcm9ibGVtIGhlcmUuIEZyb20NCmNvZGlu
ZyBjb252ZW50aW9ucyBvciBndWlkZWxpbmVzIHBvaW50IG9mIHZpZXcgLSB3ZWxsLCB0aGF0J3Mg
bW9yZSBvZg0KeW91ciB0ZXJyaXRvcnkgOykNCg0KPiA+IFdoYXQgYWJvdXQ6DQo+ID4gPiAgICAg
IFJPSE1fRFZTX0xFVkVMX01BWCA9IFJPSE1fRFZTX0xFVkVMX0xQU1INCj4gPiANCj4gPiBBbnl3
YXlzLCBJIGRvbid0IHNlZSB3aHkgZGVmaW5lIHdvdWxkbid0IGJlIE9rIGhlcmUgLSBidXQgc3Vy
ZSBpdA0KPiA+IGNhbg0KPiA+IGJlIGNoYW5nZWQgaWYgeW91IGluc2lzdCA7KSBKdXN0IGxldCBt
ZSBrbm93IGlmIHlvdSBjYW4gYWNjZXB0IHRoZQ0KPiA+IGRlZmluZSBvciBub3QgOikNCj4gDQo+
IExldCdzIGdvIGZvciBub3QgaW4gdGhpcyBpbnN0YW5jZS4gOkQNCg0KT2suIEkgc2VudCB2MTEg
d2hlcmUgdGhpcyBoYXMgYmVlbiBjaGFuZ2VkIGFzIHlvdSBzdWdnZXN0ZWQgOikNCg0KQnIsDQoJ
LS1NYXR0aQ0K
