Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613FEDE402
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 07:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfJUFou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 01:44:50 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:55702 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfJUFou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 01:44:50 -0400
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 01:44:49 EDT
X-AuditID: c0a8fbf4-183ff70000001fa6-a2-5dad424a3803
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id BE.3D.08102.A424DAD5; Mon, 21 Oct 2019 07:29:46 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 21 Oct 2019 07:29:36 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
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
Thread-Index: AQHVhNCZAuXq65juYU207wWeSYVtU6dee5aAgAAGywCAAANsgIAF8BwA
Date:   Mon, 21 Oct 2019 05:29:35 +0000
Message-ID: <ba7453a51bebb2ff4dbb7a3406f1dda511f5f8fa.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <20191017101225.GB3125@piout.net>
         <a1aa91f74b41033fed4a7106247f48f9b9f78bd9.camel@fi.rohmeurope.com>
         <20191017104859.GC3125@piout.net>
In-Reply-To: <20191017104859.GC3125@piout.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CEC8A4B1B583E42B344FF3C65B0531F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0wUVxjtnedlcZrLAHLZVpOu8a2ASZtcE22h2maqRo3GmKIrju6URWEX
        Z3cbqX9ojK0CIYoY4wrrIyAIixRkFRUikkVhjUUQEV8ghZCKrdZHNaZUO8NU4dc933fO+c73
        47uQFh9wZpjmcCuqQ063cCamqfyfmrlLvqyyJrR3JpCSjps8+fnxCZ68KA4x5ED/IEeOBH9l
        Se7VOpbcDfzCkL6/WwB52bWbIoUjZRR5mtfLktNHRgC5cb6II4E/TgFyubKLI6W3OihSVNrK
        kI7QV+R+qIUjuxqDPHnTXcMkRkt+nx9IT3p28ZLPv0M6573PS7UVezjpXncDJ13pOUtJB32v
        Kam88hUvPa+dvNKUHL5gk+z+fnVaqiP+843h9kB9G8jMjtzedzDAZoMmMQeEQYw+xWeutbE5
        wARF1A3wg4sdjFG0AnyxoUwrIOTQApxzm9cNUWgR9rX/NKqhUQHEvpM9jE5EomScv3OQNkTr
        8O3CAtbAX+Oc0kFKn8OgqfhOyza9LaDl+G5v8ahERKcpvPM3TsdhKA4f85WMjgRoEt6T/ZjS
        MY1icO3QK9ZYGuGShnbawNH44cCb//sW3Pi6f3RlGs3E1efjDWsibu29wBr4E1yY288bK0Tg
        tkODzF4w0TsuwTvm9o5ze8e5vePcRwFbAXCGnJaeKruVeXGq4olTnfYM7dnszKgFxsW8qAdv
        m79pBhQEzSAWUpZowRHvt4ofbnLasuyyy56ietIVVzPAkLZECfcSqqyiYJOzflBU5zvqI8hY
        YoTp/fusItKztipKpqK+Yz+G0IKFO19oxghVSVW2f5eW7h6jKRimDzeZo1yKw6aossdtT9HP
        I8Wl3YdOTdBynybqua5MOUPrGtYQmA33Piw+TsNgcelxWmQcTodijhFu6FKkS+0ex/ugYRAD
        gSVSWJyksRO0b/N+zrAWQWkRlbGVeoRbHqPM2SA88Je/Yk1fUvLN/U2mrvVk2tsUpXMtNVTv
        2f0yd6Bm2azqoSRb1/wfn4mZEQnI1nhi42pz/tSsgbrrwSfCjPa4pPytoc/K/lw4+dHySdUF
        zI79neW/XxoZXhE4HLxaZM+7fnnfhVPDE//NowuWegLbpnwQ8WxDFb8q/lqPNTp2y7dz6iyM
        yy7Pm0WrLvk/kST/8vMDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWxleGFuZHJlLA0KDQpPbiBUaHUsIDIwMTktMTAtMTcgYXQgMTI6NDggKzAyMDAsIEFs
ZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBPbiAxNy8xMC8yMDE5IDEwOjM2OjQ0KzAwMDAsIFZh
aXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+ID4gSGVsbG8gQWxleGFuZHJlLA0KPiA+IA0KPiA+IFRo
YW5rcyBmb3IgcXVpY2sgY2hlY2shIEknbGwgYmUgb2ZmIGZvciB0aGUgcmVzdCBvZiB0aGUgd2Vl
ayBidXQgSQ0KPiA+IHdpbGwNCj4gPiByZS13b3JrIHRoaXMgcGF0Y2ggYXQgbmV4dCB3ZWVrIDop
IEkgYWdyZWUgd2l0aCB5b3UgcmVnYXJkaW5nIG1vc3QNCj4gPiBvZg0KPiA+IHRoZSBjb21tZW50
cy4NCj4gPiANCj4gPiA+ID4gKw0KPiA+ID4gPiArDQo+ID4gPiA+ICsvKg0KPiA+ID4gPiArICog
UlRDIGRlZmluaXRpb25zIHNoYXJlZCBiZXR3ZWVuDQo+ID4gPiA+ICsgKg0KPiA+ID4gPiArICog
QkQ3MDUyOA0KPiA+ID4gPiArICogYW5kIEJENzE4MjgNCj4gPiA+ID4gKyAqLw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX1NFQwkJMHg3Zg0KPiA+ID4gPiAr
I2RlZmluZSBST0hNX0JEMV9NQVNLX1JUQ19NSU5VVEUJMHg3Zg0KPiA+ID4gPiArI2RlZmluZSBS
T0hNX0JEMV9NQVNLX1JUQ19IT1VSXzI0SAkweDgwDQo+ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQx
X01BU0tfUlRDX0hPVVJfUE0JMHgyMA0KPiA+ID4gPiArI2RlZmluZSBST0hNX0JEMV9NQVNLX1JU
Q19IT1VSCQkweDNmDQo+ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX0RBWQkJMHgz
Zg0KPiA+ID4gPiArI2RlZmluZSBST0hNX0JEMV9NQVNLX1JUQ19XRUVLCQkweDA3DQo+ID4gPiA+
ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX01PTlRICQkweDFmDQo+ID4gPiA+ICsjZGVmaW5l
IFJPSE1fQkQxX01BU0tfUlRDX1lFQVIJCTB4ZmYNCj4gPiA+ID4gKyNkZWZpbmUgUk9ITV9CRDFf
TUFTS19BTE1fRU4JCTB4Nw0KPiA+ID4gPiArDQo+ID4gPiANCj4gPiA+IEFsbCB0aGF0IHJlbmFt
aW5nIGlzIGRpc3RyYWN0aW5nIGFuZCB1c2VsZXNzLiBQbGVhc2UgcmVzdWJtaXQNCj4gPiA+IHdp
dGhvdXQNCj4gPiA+IHJlbmFtaW5nIGRlZmluZXMsIHN0cnVjdHMgYW5kIGZ1bmN0aW9ucyB0byBt
YWtlIGl0IGVhc2llciB0bw0KPiA+ID4gcmV2aWV3Lg0KPiA+IA0KPiA+IEkgd291bGQgcHJlZmVy
IHJlbmFtaW5nIGJlY2F1c2UgaXQgbWFrZXMgaXQgY2xlYXJseSB2aXNpYmxlIHdoaWNoDQo+ID4g
ZGVmaW5lcy9zdHJ1Y3RzL2Z1bmN0aW9ucyBhcmUgY29tbW9uIGZvciBib3RoIFBNSUNzIGFuZCB3
aGljaCBhcmUNCj4gPiBQTUlDDQo+ID4gc3BlY2lmaWMuIEJ1dCBJIHJlYWxseSB1bmRlcnN0YW5k
IHRoZSBwcm9ibGVtIG9mIHNwb3R0aW5nIHJlYWwNCj4gPiBjaGFuZ2VzLg0KPiA+IFdvdWxkIGl0
IGJlIE9rIGlmIEkgZGlkIHJlbmFtaW5nIGluIHNlcGFyYXRlIHBhdGNoIHdoaWNoIGRvZXMgbm90
DQo+ID4gYnJpbmcNCj4gPiBpbiBhbnkgb3RoZXIgY2hhbmdlcyAtIGFuZCB0aGVuIHRoZSBmdW5j
dGlvbmFsIGNoYW5nZXMgaW4gc2VwYXJhdGUNCj4gPiBwYXRjaD8NCj4gPiANCj4gDQo+IE5vLCB1
bmxlc3MgeW91IGNhbiBndWFyYW50ZWUgdGhhdCBhbGwgZnV0dXJlIFBNSUNzIGZyb20gcm9obSBt
YXRjaGluZw0KPiB0aGUgd2lsZGNhcmQgd2lsbCB1c2UgdGhpcyBkcml2ZXIuDQoNCkFsbHJpZ2h0
LiBJJ2xsIGF2b2lkIHJlbmFtaW5nIGluIG5leHQgdmVyc2lvbi4NCg0KQnIsDQoJTWF0dGkgVmFp
dHRpbmVuDQo=
