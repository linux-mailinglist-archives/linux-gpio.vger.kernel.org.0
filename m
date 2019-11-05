Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8050AEFF6D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 15:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389470AbfKEOHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 09:07:41 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:45124 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389405AbfKEOHk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 09:07:40 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-50-5dc1822ae9e4
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 79.A6.08102.A2281CD5; Tue,  5 Nov 2019 15:07:38 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 15:07:32 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
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
Thread-Index: AQHVkKmUb1A5TsbkA0WleApZHP5SaKd5+YkAgACQyoCAAfw5gIAADBgA
Date:   Tue, 5 Nov 2019 14:07:32 +0000
Message-ID: <ff6085af2b949d43571b61c7d4d69743cb175850.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <2a8fa03308b08b2a15019d9b457d9bff7aafce94.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdZYw3QQcQ4h5y_C0UD6+4Wz9AdmQ0qSrrjfUweuJj8hyQ@mail.gmail.com>
         <1550472ac1e105bd38da25803358cfbc0404bf38.camel@fi.rohmeurope.com>
         <CACRpkdYkgEg=4H9tQQrVcvx1xtETYD_cHxhqd-BW6g67jpEeEg@mail.gmail.com>
In-Reply-To: <CACRpkdYkgEg=4H9tQQrVcvx1xtETYD_cHxhqd-BW6g67jpEeEg@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <000865F25A7D6443B4A44E4BF0D5C8D9@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJsWRmVeSWpSXmKPExsVyYMXvjbpaTQdjDQ7PV7VYcvEqu0X7u2Xs
        Fl/mnmKxmPrwCZvF/CPnWC26T29htbi9dQOLxf2vRxktvl3pYLKY8mc5k8XHnnusFpvn/2G0
        uLxrDpvF1jfrGC2Orb7CZrH0+kUmizlLT7BYXDzlanH31FE2i9a9R9gt/l3byOIg6rFm3hpG
        j/c3Wtk95q2p9tg56y67x6ZVnWwed67tYfM4fmM7k8f0eT+ZPFas/s7u8XmTXABXFLdNUmJJ
        WXBmep6+XQJ3Rsua64wF/zgrTrzsZ2xgvMPZxcjJISFgIvFzyh/mLkYuDiGBq4wSLQ9fsoEk
        hASOM0o8m2bRxcjBwSZgI9F1kx0kLCJgKXH4xBwWEJtZYA6HROONSBBbWCBdYlrLRDaImgyJ
        r8d7oerdJI5t+8kMYrMIqEisbZwGZvMK+En0L/vLBLH3J5PE6xdNYM2cAoESL/6eYAKxGQVk
        JTob3jFBLBOX2PTsOyvE0QISS/acZ4awRSVePv4HFVeS2PvzIQvIzcwCmhLrd+lDmA4Saz5V
        Q0xRlJjS/ZAd4gRBiZMzn7BMYBSbhWTBLITmWQjNs5A0z0LSvICRdRWjRG5iZk56YkmqoV5R
        aqleUX5GLpBKzs/dxAhJL192MP4/5HmIkYmD8RCjJAeTkiivV+bBWCG+pPyUyozE4oz4otKc
        1OJDjBIczEoivBdn7I0V4k1JrKxKLcqHSUlzsCiJ86o/nBgrJACyKzs1tSC1CCYrw8GhJMEb
        3gA0VLAoNT21Ii0zpwQhzcTBCTKcS0qkODUvJbUosbQkIx6UOOKLgakDJMUDtPcYSDtvcUFi
        LlAUovUUozbHhJdzFzFzHJm7dBGzEEtefl6qlDjvP5BSAZDSjNI8uEWvGMU5GJWEeYMbgbI8
        wEwDN+cV0AomoBU+j/eBrChJREhJNTDqmX4yM6n/71sactti7xl5hzDZcKl0DSGLxix355YJ
        H0/FqQaFSlkkH7uffd9rkuPZN8mn4gxefpufmMqd4hipsud79ZICrn9Syy8kWxz82pq35Ke1
        jPD0NwzLw36ukLb3Cn1fes6hX/VbySrW9ws0V9m+373g/53VZ/fk2hYI9h9OKbi1yESJpTgj
        0VCLuag4EQAAOyb/8QMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTQ6MjQgKzAxMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQgODowNSBBTSBWYWl0dGluZW4sIE1hdHRpDQo+IDxN
YXR0aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IE9uIFN1biwgMjAx
OS0xMS0wMyBhdCAyMzoyNyArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToNCj4gPiA+IEkgZG8g
bm90IHVuZGVyc3RhbmQgdGhlIHJlZ3VsYXRvciBwYXJ0cyBvZiB0aGUgcGF0Y2guDQo+ID4gDQo+
ID4gSSdtIHNvcnJ5LiBUaGUgcGF0Y2ggaXMgbm90IGNsZWFyZXN0IG9uZSB3aGF0IGNvbWVzIHRv
IHRoZQ0KPiA+IHJlZ3VsYXRvcg0KPiA+IHN0dWZmLiBJIGNhbiB0cnkgc3BsaXR0aW5nIGl0IHRv
IHNtYWxsZXIgYW5kIG1vcmUgbG9naWNhbCBjaGFuZ2VzDQo+ID4gaWYNCj4gPiB5b3UsIE1hcmsg
b3Igb3RoZXIgaW50ZXJlc3RlZCBwZW9wbGUgaG9wZSB0byBnZXQgaXQgc3BsaXR0ZWQuIE9yDQo+
ID4gcGVyaGFwcyBpdCB3b3VsZCBiZSBzaW1wbGVzdCB0byByZXZpZXcgaWYgaXQgd2FzIGFsbCBp
biBvbmUgcGF0Y2g/DQo+IA0KPiBBcyBsb25nIGFzIHRoZSByZWd1bGF0b3IgZXhwZXJ0cyBhcmUg
aGFwcHkgd2l0aCB0aGUgZm9ybWF0LA0KPiBzdGF5IHdpdGggdGhhdC4gSSBhbSBqdXN0IGEgZHJp
dmUtYnkgY29kZXIgd2hlbiBpdCBjb21lcyB0bw0KPiByZWd1bGF0b3JzLg0KDQoiRHJpdmUtYnkg
Y29kZXIiIC0gSSBkbyBkZWZpbml0ZWx5IGxpa2UgaG93IHRoYXQgc291bmRzIDpdIE1heWJlIEkg
Y2FuDQpib3Jyb3cgdGhhdC4gQnV0IGV2ZW4gdGhlICJkcml2ZS1ieSIgcmV2aWV3aW5nIGlzIGhh
cmQuIEFuZCBJIGd1ZXNzIGl0DQpzaG91bGQgYmUgbWFkZSBhcyBlYXN5IGFzIGl0IGNhbi4uLg0K
DQpCciwNCglNYXR0aQ0KDQoNCg==
