Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD8BDAA89
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 12:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409092AbfJQKvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 06:51:55 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:42446 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730498AbfJQKvz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 06:51:55 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Oct 2019 06:51:53 EDT
X-AuditID: c0a8fbf4-199ff70000001fa6-ab-5da844423d90
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 3C.E8.08102.24448AD5; Thu, 17 Oct 2019 12:36:50 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Thu, 17 Oct 2019 12:36:45 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 09/13] mfd: rtc: support RTC on ROHM BD71828 with
 BD70528 driver
Thread-Topic: [RFC PATCH 09/13] mfd: rtc: support RTC on ROHM BD71828 with
 BD70528 driver
Thread-Index: AQHVhNCZAuXq65juYU207wWeSYVtU6dee5aAgAAGywA=
Date:   Thu, 17 Oct 2019 10:36:44 +0000
Message-ID: <a1aa91f74b41033fed4a7106247f48f9b9f78bd9.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <20191017101225.GB3125@piout.net>
In-Reply-To: <20191017101225.GB3125@piout.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D169F61A87AB4D42B380287D302510DF@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAJsWRmVeSWpSXmKPExsVyYMXvTbpOLitiDaZ+07JYcvEqu0X7u2Xs
        Fl/mnmKxmPrwCZvF/CPnWC26T29htbi9dQOLxf2vRxktvl3pYLKY8mc5k8XHnnusFpvn/2G0
        uLxrDpvF1jfrGC2Orb7CZrH0+kUmizlLT7BYXDzlanH31FE2i9a9R9gt/l3byOIg6rFm3hpG
        j/c3Wtk95q2p9tg56y67x6ZVnWwed67tYfM4fmM7k8f0eT+ZPFas/s7u8XmTXABXFLdNUmJJ
        WXBmep6+XQJ3xpd5K1kLXvFW9N5oZG5g3MPbxcjJISFgItG58SpbFyMXh5DANUaJ5c8fs4Ik
        hAROMEocvq7fxcjBwSZgI9F1kx0kLCLgLDHvfBsLSD2zwCQOiSuzzjCDJIQFoiT6mp8wQxRF
        S9ycMokVwraSOLLuFhuIzSKgKrH6Ux8TiM0r4CfRcmsyK8RioF2LZjYygyzjFNCTWL0gGaSG
        UUBWorPhHVg9s4C4xKZn31khjhaQWLLnPDOELSrx8vE/qLiSxN6fD1lAxjALaEqs36UP0eog
        0dt1jQXCVpSY0v2QHeIEQYmTM5+wTGAUm4VkwyyE7llIumch6Z6FpHsBI+sqRoncxMyc9MSS
        VEO9otRSvaL8jFwglZyfu4kRkmK+7GD8f8jzECMTB+MhRkkOJiVR3s/rlscK8SXlp1RmJBZn
        xBeV5qQWH2KU4GBWEuGd37IkVog3JbGyKrUoHyYlzcGiJM6r/nBirJAAyK7s1NSC1CKYrAwH
        h5IE7yqHFbFCgkWp6akVaZk5JQhpJg5OkOFcUiLFqXkpqUWJpSUZ8aDkEV8MTB8gKR6gveLO
        QO28xQWJuUBRiNZTjNocE17OXcTMcWTu0kXMQix5+XmpUuK8RxyBSgVASjNK8+AWvWIU52BU
        EuZtBBnEA8w2cHNeAa1gAlrxXnk5yIqSRISUVANjW+PKQJcf8kf3mcZt3Ddj3V6GnXfPOHJ2
        xXOVFB+W+fSgU2kG8/m4A7cml3W67m+pcFZ818jDsZbb2Kc4QsDY6fS+H8X1BdrB3kIGnrZn
        WA/Ypuk8uNt48jvHuiuu/S4qF5bL3Bd+75e0NPplwpttES189+sMtd1qow9W70vOYiuLXnDv
        5FQlluKMREMt5qLiRADrac888wMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWxleGFuZHJlLA0KDQpUaGFua3MgZm9yIHF1aWNrIGNoZWNrISBJJ2xsIGJlIG9mZiBm
b3IgdGhlIHJlc3Qgb2YgdGhlIHdlZWsgYnV0IEkgd2lsbA0KcmUtd29yayB0aGlzIHBhdGNoIGF0
IG5leHQgd2VlayA6KSBJIGFncmVlIHdpdGggeW91IHJlZ2FyZGluZyBtb3N0IG9mDQp0aGUgY29t
bWVudHMuDQoNCj4gPiArDQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBSVEMgZGVmaW5pdGlvbnMg
c2hhcmVkIGJldHdlZW4NCj4gPiArICoNCj4gPiArICogQkQ3MDUyOA0KPiA+ICsgKiBhbmQgQkQ3
MTgyOA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNkZWZpbmUgUk9ITV9CRDFfTUFTS19SVENfU0VD
CQkweDdmDQo+ID4gKyNkZWZpbmUgUk9ITV9CRDFfTUFTS19SVENfTUlOVVRFCTB4N2YNCj4gPiAr
I2RlZmluZSBST0hNX0JEMV9NQVNLX1JUQ19IT1VSXzI0SAkweDgwDQo+ID4gKyNkZWZpbmUgUk9I
TV9CRDFfTUFTS19SVENfSE9VUl9QTQkweDIwDQo+ID4gKyNkZWZpbmUgUk9ITV9CRDFfTUFTS19S
VENfSE9VUgkJMHgzZg0KPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX0RBWQkJMHgzZg0K
PiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX1dFRUsJCTB4MDcNCj4gPiArI2RlZmluZSBS
T0hNX0JEMV9NQVNLX1JUQ19NT05USAkJMHgxZg0KPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tf
UlRDX1lFQVIJCTB4ZmYNCj4gPiArI2RlZmluZSBST0hNX0JEMV9NQVNLX0FMTV9FTgkJMHg3DQo+
ID4gKw0KPiANCj4gQWxsIHRoYXQgcmVuYW1pbmcgaXMgZGlzdHJhY3RpbmcgYW5kIHVzZWxlc3Mu
IFBsZWFzZSByZXN1Ym1pdCB3aXRob3V0DQo+IHJlbmFtaW5nIGRlZmluZXMsIHN0cnVjdHMgYW5k
IGZ1bmN0aW9ucyB0byBtYWtlIGl0IGVhc2llciB0byByZXZpZXcuDQoNCkkgd291bGQgcHJlZmVy
IHJlbmFtaW5nIGJlY2F1c2UgaXQgbWFrZXMgaXQgY2xlYXJseSB2aXNpYmxlIHdoaWNoDQpkZWZp
bmVzL3N0cnVjdHMvZnVuY3Rpb25zIGFyZSBjb21tb24gZm9yIGJvdGggUE1JQ3MgYW5kIHdoaWNo
IGFyZSBQTUlDDQpzcGVjaWZpYy4gQnV0IEkgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIHByb2JsZW0g
b2Ygc3BvdHRpbmcgcmVhbCBjaGFuZ2VzLg0KV291bGQgaXQgYmUgT2sgaWYgSSBkaWQgcmVuYW1p
bmcgaW4gc2VwYXJhdGUgcGF0Y2ggd2hpY2ggZG9lcyBub3QgYnJpbmcNCmluIGFueSBvdGhlciBj
aGFuZ2VzIC0gYW5kIHRoZW4gdGhlIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbiBzZXBhcmF0ZQ0KcGF0
Y2g/DQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0K
