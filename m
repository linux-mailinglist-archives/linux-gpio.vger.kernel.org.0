Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4F0FFE90
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 07:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfKRGe1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 01:34:27 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:65250 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfKRGe1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 01:34:27 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-8d-5dd23b705475
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 97.D4.08102.07B32DD5; Mon, 18 Nov 2019 07:34:24 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 18 Nov 2019 07:34:13 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "kbuild@lists.01.org" <kbuild@lists.01.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 15/16] leds: Add common LED binding parsing support
 to LED class/core
Thread-Topic: [PATCH v4 15/16] leds: Add common LED binding parsing support
 to LED class/core
Thread-Index: AQHVnLBjG8tj857VMkKX2FyhKuPqpKeQYJeAgAAJtAA=
Date:   Mon, 18 Nov 2019 06:34:12 +0000
Message-ID: <ab534cb686f94f32d8fadc2534ebbb1772b57dee.camel@fi.rohmeurope.com>
References: <20191118055941.GB1776@kadam>
In-Reply-To: <20191118055941.GB1776@kadam>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <97BFEEB19E28A64A828D1BE3C4E7F6BD@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tb0xTVxjGc+49t/fy526XUuWs20Losmwyh7I/2RFESZbF6z6YJTo/bOm6
        q9xRIm1ZWxZxWdLpEFsMw7XTrZOCWpAAGwq4MQaDVFBgCitWxBVURmGCRoYDDBnrdi+dwpdz
        3jzP+b3P++E9DKn8mVYzOUaraDYKuRpFNOyo/vvsi3npA9r1zjsc9vqv0rjoXhWNZ8t6If5y
        NKTAoY4igO+Ej0Fc3tlH4eJfmih8cvorCtvthygcPHcG4u7GmwBfLh4EuNZ2hsA357oAng8c
        IrBr8TSBZw7foPCJg16IG8sXAb7SclyBz939DuALtQEF/rZzhMaV1/wEPl7ZDfH0fTuB/b1v
        4JHeLgU+4B8icWFbJ43Dg2chLunbkpnE13nqAD89VEjznrqP+R/dIzR/qnWS4Btq7Ap+eLBV
        wRd/E4b8qRInxc+M/wb524fPQ37+0hHIlzTVAH7iRD3kLw79QPDHPAvEW8p3YjbuEqwfbc/J
        Nq7b9H6Mfq7rtbxqdm+wfQ7awGKsA0QxiHsF3W8aAw4QzSi5qwB5m/eTsqHkugH6w7bDARhG
        wW1Ejuu0LKs4PRoe89Lye5L7JxZdmi2FshHPvYfGA10w8kiH5gPllMyquDQ0VbJZliH3LKr1
        XCfkmuW2of1DN+hI1BrUcuvukh7FJaOfQiNLOuCeRnbbvSWd5BJQw8QDKjIzh7yt/WSkXoUm
        x8L/6xrUtjAK5VhS6lnfsi6CZqID/UEqUichV/EoHRkhDvV8HYKlYLV7RYJ7mXavoN0raPcK
        ugJQNQAZhJzcbMEqpqaYxfwUs0lvkK7dJkMDiGzibDP417fVBwgG+MATDKFZxSZu9muVj+0y
        ZRXoBYteZ87PFS0+gBhSo2K3/f6rVslmCQX7RLPpofUkAzUJ7HOjR7RKTs7aI4p5ovmh+xTD
        aBCbtGFAq4wzi9ni3g9ycq3LNsFEyc2j1SqLaMwSzUK+Va+Tl0NnkbZDtmKl3LdlnLXkCQZJ
        jaC9IJUpnSw7STKdZZXSed4jnUpoNBlFdQKbuUYCOBnQ5xsfxU2BBAZo4lmj3C5W+pSPuk1J
        QYQU9EJznxxkFZYttQ2Qn6b7pmDz0eEGKrlnPObKtXdTviAz2pkLOperwBN3+6B2S2hn2stO
        94aLe1663P9mdmJbxvrXB+aca3s+Tw8Wjn3/4JOKTcgTvlWx9Zmqqucbd1avVX3I1T0+mFG/
        faJlh3N3msu+0P7Z6Zmg4VXDn1gdH+hY7fAnHv2rX4ES95UWaaBFL6Qmk2aL8B/XZ/3oUQQA
        AA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWxsLA0KDQpPbiBNb24sIDIwMTktMTEtMTggYXQgMDg6NTkgKzAzMDAsIERhbiBDYXJw
ZW50ZXIgd3JvdGU6DQo+IEhpIE1hdHRpLA0KPiANCj4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5H
IG9uIDMxZjRmNWI0OTVhNjJjOWE4YjE1YjFjMzU4MWFjZDVlZmViOWFmOGNdDQo+IA0KPiB1cmw6
ICAgIA0KPiBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL01hdHRpLVZh
aXR0aW5lbi9TdXBwb3J0LVJPSE0tQkQ3MTgyOC1QTUlDLzIwMTkxMTE3LTAzMDUxNQ0KPiBiYXNl
OiAgICAzMWY0ZjViNDk1YTYyYzlhOGIxNWIxYzM1ODFhY2Q1ZWZlYjlhZjhjDQo+IA0KPiBJZiB5
b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnDQo+IFJlcG9ydGVkLWJ5
OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gUmVwb3J0ZWQtYnk6IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj4gDQo+IHNtYXRjaCB3YXJuaW5n
czoNCj4gZHJpdmVycy9sZWRzL2xlZC1jb3JlLmM6NDAwIGZ3X2lzX21hdGNoKCkgZXJyb3I6IHVu
aW5pdGlhbGl6ZWQgc3ltYm9sDQo+ICdyZXQnLg0KPiBkcml2ZXJzL2xlZHMvbGVkLWNvcmUuYzo0
NjUgbGVkX2ZpbmRfZndub2RlKCkgZXJyb3I6IGRvdWJsZSBmcmVlIG9mDQo+ICd2YWwnDQoNCk91
Y2guIFRoZSBmcmVlIGlzIGNsZWFybHkgYSBsZWZ0b3ZlciBmcm9tIG9yaWdpbmFsIGNvZGUgd2hl
cmUgdGhlDQoiaXNfbWF0Y2giIHdhcyBub3QgaXQncyBvd24gZnVuY3Rpb24uIFNvcnJ5IGZvbGtz
LiBJJ2xsIGZpeCBib3RoIGlzc3Vlcw0KYW5kIHNlbmQgbmV3IHZlcnNpb24uDQoNCkJ5IHRoZSB3
YXksIEknZCBhcHByZWNpYXRlIGlmIHNvbWVvbmUgZWxzZSB3b3VsZCBhbHNvIGNoZWNrIHRoZQ0K
cmVmZXJlbmNlLWNvdW50aW5nIGZvciBmd25vZGVzIC0gaXMgcHVtcGluZyB1cCB0aGUgcmVmY291
bnQgaW4NCmxlZF9maW5kX2Z3bm9kZSBPaz8gTXkgaWRlYSBpcyB0aGF0IHdoZW4tZXZlciB0aGUg
bGVkX2ZpbmRfZndub2RlDQpyZXR1cm5zIGFuIGZ3bm9kZSwgdGhlIExFRCBjbGFzcyBuZWVkcyB0
byBkZWNyZWFzZSByZWZjb3VudCB3aGVuIExFRCBpcw0KdW5yZWdpc3RlcmVkLiBObyBtYXR0ZXIg
aWYgZndub2RlIHdhcyBmcm9tIGRldmljZSwgZ2l2ZW4gYnkgTEVEIGRyaXZlcg0Kb3IgZm91bmQg
YnkgdGhlIExFRCBjbGFzcy4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQoNCg0K
