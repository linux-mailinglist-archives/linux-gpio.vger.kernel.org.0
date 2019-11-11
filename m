Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61D0BF6F2D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 08:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfKKHoE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 02:44:04 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:52704 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfKKHoE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 02:44:04 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-2a-5dc91142f9cc
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id AE.99.08102.24119CD5; Mon, 11 Nov 2019 08:44:02 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 11 Nov 2019 08:43:51 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "thorsten.scherer@eckelmann.de" <thorsten.scherer@eckelmann.de>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 40/62] gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
Thread-Topic: [PATCH 40/62] gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVk8QgoRngmXYXw0mZFckOpTZFOKeFipWAgAAEqgA=
Date:   Mon, 11 Nov 2019 07:43:50 +0000
Message-ID: <e38b59d9c8bcf81bbd49fed2d9d17350d4dc4866.camel@fi.rohmeurope.com>
References: <cover.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
         <91a796dd2811b58f4be30875f5ef644f0e43f241.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
         <20191111072715.GB4117@ws067.eckelmann.group>
In-Reply-To: <20191111072715.GB4117@ws067.eckelmann.group>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <211694E4CEF9A842893FA40F0AB0A7C2@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUgUURzn7cyuz2P0ua7ta0ulhbCMPMAPi5mIfWiViMCgKBcbdXSlPWRm
        DZUCP5TlVUr6wUXL25RCVCIVLVlE1DxA80oNpRSVUjyiLI9mnDw+vd97v+sP7w8JebZMBRNN
        FoY10Qa1zIHsePW34XyYa4/O/3Gxl2ajpJfU1BW2kJqCrRqJpunlFtAMtxbLNMVV3aTmy0qQ
        ZjL/OQiF2pXxR3ba1g6VtsU6baedGm2TaZ9t+2vXGz2vyW45BsfQlnuRiQkmv5A7jvqmp6NE
        0oJjSufMnDQddDhmAXuIUSDO3M0EWcABytEIwPND4xLx0g3w4MYimQUglKFgnDVhJ0AFuoRX
        +8MECYEqCDz88wcQgtzQZfwif5EQsAJp8ZBt1k7EQXj03cQeJtFpvLnat6eh0FX8ZqpWKnZ9
        ArhmrGEvyJ43PHk4IRUwQB44M31ZImACKXHj/C+pODXClW2DhIjd8eLXnf/vaty+Obs3M4HO
        4vpWP9Eaimerv5MiPoULssXZKOSKe4q+kXngmPVIg/XQbT3ith5xW4+4S4G0DmAjnWhIoC1M
        gC/LJPuyZr2RP2LNxkYgfu5GM9i1hduABAIbOA4landqu75bJ3eOMcel6mlOH80mGxjOBjAk
        1AqqOYXnqDg6NY1hzfvUCUiqlZT3bL5OjoSuuwyTxLD77EkI1ZhacO7RyV1ZJoFJiU80WA5p
        CbQXwh1UCo4xxTEsnWzRRwv7Ec3xCyJQTnzva8FOcUm0kX8Vrb3gHMxbLCknYGdJVTkhJ01m
        E6NSUm9deCkSpPpk00HRElBCoHajlIhnnfgNP8hZ4iskfEVHf5dQYaEPKVU6KOzbKqm5ULhc
        HeNTYXUJGWO7Ctw+eo0biTkdJ8PRobe9yxSfPXYi9J3uQfE+tg9XIotlzbmDOa1ufyKmPXfT
        ygbe9wXOj2TkDA5MXqwMGXKIVHh3RhXd1DWNrayt1RrCqn0fRLnfDyq9ETvl8/t6PTcRUBgO
        zuTOrLdn9EVKa9Ukp6cDfAiWo/8Bh7+3Y54DAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gVGhvcnN0ZW4sDQoNCk9uIE1vbiwgMjAxOS0xMS0xMSBhdCAwODoyNyArMDEwMCwgVGhv
cnN0ZW4gU2NoZXJlciB3cm90ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiBUdWUsIE5vdiAwNSwgMjAx
OSBhdCAxMjozMDo1OFBNICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gSXQncyBo
YXJkIGZvciBvY2Nhc2lvbmFsIEdQSU8gY29kZSByZWFkZXIvd3JpdGVyIHRvIGtub3cgaWYgdmFs
dWVzDQo+ID4gMC8xDQo+ID4gZXF1YWwgdG8gSU4gb3IgT1VULiBVc2UgZGVmaW5lZCBHUElPX0xJ
TkVfRElSRUNUSU9OX0lOIGFuZA0KPiA+IEdQSU9fTElORV9ESVJFQ1RJT05fT1VUIHRvIGhlbHAg
dGhlbSBvdXQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0
aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+IA0KPiBmb3IgU0lPWCBncGlvOg0KPiAN
Cj4gQWNrZWQtYnk6IFRob3JzdGVuIFNjaGVyZXIgPHQuc2NoZXJlckBlY2tlbG1hbm4uZGU+DQo+
IA0KPiA+IFBhdGNoZXMgYXJlIGNvbXBpbGUtdGVzdGVkIG9ubHkuIEkgaGF2ZSBubyBIVyB0byBy
ZWFsbHkgdGVzdA0KPiA+IHRoZW0uICBUaHVzDQo+ID4gSSdkIGFwcHJlY2lhdGUgY2FyZWZ1bGwg
cmV2aWV3LiBUaGlzIHdvcmsgaXMgbWFpbmx5IGFib3V0DQo+ID4gY29udmVydGluZw0KPiA+IHpl
cm9zIGFuZCBvbmVzIHRvIHRoZSBuZXcgZGVmaW5lcyBidXQgaXQgd291bGRuJ3QgYmUgZmlyc3Qg
dGltZSBJDQo+ID4gZ2V0IGl0IHdyb25nIGluIG9uZSBvZiB0aGUgcGF0Y2hlcw0KPiA+IDopICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IA0KPiBB
cHBsaWVkIHRoZSBwYXRjaChlcykgYW5kIHRlc3RlZCB0aGVtIHdpdGggU0lPWCBkZXZpY2UNCj4g
DQo+IFRlc3RlZC1ieTogVGhvcnN0ZW4gU2NoZXJlciA8dC5zY2hlcmVyQGVja2VsbWFubi5kZT4N
Cj4gDQoNCkJpZyB0aGFua3MhIEl0J3MgX3JlYWxseV8gbmljZSB0aGF0IHNvbWVvbmUgdGFrZXMg
dGhlIHRpbWUgdG8gZG8gdGhlDQp0ZXN0aW5nISBIaWdobHkgYXBwcmVjaWF0ZWQhIDpdDQoNCkJy
LA0KCU1hdHRpIFZhaXR0aW5lbg0K
