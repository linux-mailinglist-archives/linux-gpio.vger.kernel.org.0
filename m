Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C00D9E17E2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 12:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404375AbfJWK1y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 06:27:54 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:58660 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403831AbfJWK1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 06:27:53 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-81-5db02b257c8e
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 88.3C.08102.52B20BD5; Wed, 23 Oct 2019 12:27:49 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 23 Oct 2019 12:27:44 +0200
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
Thread-Index: AQHVhNCZAuXq65juYU207wWeSYVtU6dee5aAgAAGywCAAANsgIAJaAyA
Date:   Wed, 23 Oct 2019 10:27:43 +0000
Message-ID: <bf7a8ce661277aca3c4dede5fb17ef4163a56027.camel@fi.rohmeurope.com>
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
Content-ID: <010E24F802C4034F91829371010E81DE@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxzG8969vb6gt73WIq9VmKuSTRGQbH+8RrKQbJrbxGXJ/liCadhp
        T0osLbkWozOZzRhT62IYY1EaKGrAaWEDKwQxNmNNcVASTBUYZf4AQRN/BGfGjxGJesep8M/d
        k+/zfp7nveR7iDXc40yoyOGWZIdoN3OJsPPcs2BGWnqLZZPnjw9ofWxATw9PnNXTydoopL+M
        jnO0LtKno8d6W3X0n7YWSO9MdQE63X+EoVVzvzL06Y+3dfRi3RygNy7XcLTt8e+AXm3s52jD
        3zGG1jR0QxqLbqW3ol0cLQ9F9PT54AWYmyQ0+ZuA8GSoXC/4mw4KHb5beiEYOMoJNwevcMJf
        Q+2McMI/ywjnGmf0wn/B1C8S85fk7BLd+74sKnRkffT1Elu0Z5wt6Vu3v202ynlA/1ovSEAE
        f0ii3kboBYnIgAcB+f/7mF41DLgbkOG6TC9AiMM5xBufHxvxx8R/7Yf58yyuRMR/fgiqxnKc
        T46XjbPaoZ0kXlWp0/Q2Er8+BVQNcRo5P9TKqpk8/pwMP2K1qosMKbvLqToBZ5LT/vr5SIBT
        yFHPBKNqFieT4P0ZnXZnTOqvXGM1nUQejD1/NTeT0OwoVONZvJ40X87S0FwSjnRxmn6XVB0b
        nf8UHi8jPdXjsAKs8C1q8C3QvkW0bxHtW0SfAroAIMVikb1QdEvZmbJUmik7bcXKa7ezOAi0
        hZm8BF6EPw0DBoEwWIkYcxIvRZsthrd2Oa0HbKLLViCX2iVXGBDEmo38zU2/WQy8VTzwjSQ7
        X1urEDQn8++N/mQxYLVrrySVSPJrdzVCZsKH3m+xGJbJUqG0f0+R3b1gMyhBDU80GV2SwyrJ
        YqnbVqBuR4FLWQ/VWqr0ihsUnHeViMXKVEOjIBtVPKg9w6KeQL3yjNQ2nGEN0OF0SKZkfqsK
        YBWwlTre1D0EyQiYl/Od6xV3qfLvvEl7qBQxSlHq281qkVtcsEweUM2FY8T02UAv3V2WDue2
        PMtqi321+WR+O/dY3BjnTwwYmR7binI4cnx7yp+d0/GM9IzhkcbNM9sDnty56um+Q5XtI8zV
        6TRnR/ehne1caA20sisnja2wYqx37Ns8e+XPkdvuHXmrT31XaM1JCUy90/EJ/rf7jj9UVZO6
        cdVEnhm6bGL2BlZ2iS8Bxt9KQPgDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gYWdhaW4gQWxleGFuZHJlLA0KDQpPbiBUaHUsIDIwMTktMTAtMTcgYXQgMTI6NDggKzAy
MDAsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBPbiAxNy8xMC8yMDE5IDEwOjM2OjQ0KzAw
MDAsIFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+ID4gSGVsbG8gQWxleGFuZHJlLA0KPiA+IA0K
PiA+IFRoYW5rcyBmb3IgcXVpY2sgY2hlY2shIEknbGwgYmUgb2ZmIGZvciB0aGUgcmVzdCBvZiB0
aGUgd2VlayBidXQgSQ0KPiA+IHdpbGwNCj4gPiByZS13b3JrIHRoaXMgcGF0Y2ggYXQgbmV4dCB3
ZWVrIDopIEkgYWdyZWUgd2l0aCB5b3UgcmVnYXJkaW5nIG1vc3QNCj4gPiBvZg0KPiA+IHRoZSBj
b21tZW50cy4NCj4gPiANCj4gPiA+ID4gKw0KPiA+ID4gPiArDQo+ID4gPiA+ICsvKg0KPiA+ID4g
PiArICogUlRDIGRlZmluaXRpb25zIHNoYXJlZCBiZXR3ZWVuDQo+ID4gPiA+ICsgKg0KPiA+ID4g
PiArICogQkQ3MDUyOA0KPiA+ID4gPiArICogYW5kIEJENzE4MjgNCj4gPiA+ID4gKyAqLw0KPiA+
ID4gPiArDQo+ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX1NFQwkJMHg3Zg0KPiA+
ID4gPiArI2RlZmluZSBST0hNX0JEMV9NQVNLX1JUQ19NSU5VVEUJMHg3Zg0KPiA+ID4gPiArI2Rl
ZmluZSBST0hNX0JEMV9NQVNLX1JUQ19IT1VSXzI0SAkweDgwDQo+ID4gPiA+ICsjZGVmaW5lIFJP
SE1fQkQxX01BU0tfUlRDX0hPVVJfUE0JMHgyMA0KPiA+ID4gPiArI2RlZmluZSBST0hNX0JEMV9N
QVNLX1JUQ19IT1VSCQkweDNmDQo+ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX0RB
WQkJMHgzZg0KPiA+ID4gPiArI2RlZmluZSBST0hNX0JEMV9NQVNLX1JUQ19XRUVLCQkweDA3DQo+
ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX01PTlRICQkweDFmDQo+ID4gPiA+ICsj
ZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX1lFQVIJCTB4ZmYNCj4gPiA+ID4gKyNkZWZpbmUgUk9I
TV9CRDFfTUFTS19BTE1fRU4JCTB4Nw0KPiA+ID4gPiArDQo+ID4gPiANCj4gPiA+IEFsbCB0aGF0
IHJlbmFtaW5nIGlzIGRpc3RyYWN0aW5nIGFuZCB1c2VsZXNzLiBQbGVhc2UgcmVzdWJtaXQNCj4g
PiA+IHdpdGhvdXQNCj4gPiA+IHJlbmFtaW5nIGRlZmluZXMsIHN0cnVjdHMgYW5kIGZ1bmN0aW9u
cyB0byBtYWtlIGl0IGVhc2llciB0bw0KPiA+ID4gcmV2aWV3Lg0KPiA+IA0KPiA+IEkgd291bGQg
cHJlZmVyIHJlbmFtaW5nIGJlY2F1c2UgaXQgbWFrZXMgaXQgY2xlYXJseSB2aXNpYmxlIHdoaWNo
DQo+ID4gZGVmaW5lcy9zdHJ1Y3RzL2Z1bmN0aW9ucyBhcmUgY29tbW9uIGZvciBib3RoIFBNSUNz
IGFuZCB3aGljaCBhcmUNCj4gPiBQTUlDDQo+ID4gc3BlY2lmaWMuIEJ1dCBJIHJlYWxseSB1bmRl
cnN0YW5kIHRoZSBwcm9ibGVtIG9mIHNwb3R0aW5nIHJlYWwNCj4gPiBjaGFuZ2VzLg0KPiA+IFdv
dWxkIGl0IGJlIE9rIGlmIEkgZGlkIHJlbmFtaW5nIGluIHNlcGFyYXRlIHBhdGNoIHdoaWNoIGRv
ZXMgbm90DQo+ID4gYnJpbmcNCj4gPiBpbiBhbnkgb3RoZXIgY2hhbmdlcyAtIGFuZCB0aGVuIHRo
ZSBmdW5jdGlvbmFsIGNoYW5nZXMgaW4gc2VwYXJhdGUNCj4gPiBwYXRjaD8NCj4gPiANCj4gDQo+
IE5vLCB1bmxlc3MgeW91IGNhbiBndWFyYW50ZWUgdGhhdCBhbGwgZnV0dXJlIFBNSUNzIGZyb20g
cm9obSBtYXRjaGluZw0KPiB0aGUgd2lsZGNhcmQgd2lsbCB1c2UgdGhpcyBkcml2ZXIuDQo+IA0K
SSBzdGFydGVkIHJlLXdvcmtpbmcgdGhpcyBwYXRjaCBhbmQgcmVtZW1iZXJlZCBteSBvcmlnaW5h
bCBpZGVhDQpyZWdhcmRpbmcgdGhlIG5hbWluZyA6KSBJIHNob3VsZCBoYXZlIGNvbW1lbnRlZCBp
dCBhcyBJIGhhZCBhbHJlYWR5DQpmb3Jnb3R0ZW4gaXQuIFlvdSBhcmUgY29ycmVjdCB3aGF0IGNv
bWVzIHRvIHRoZSBkaWZmaWN1bHR5IG9mIHVzaW5nDQpjb3JyZWN0IHdpbGQtY2FyZHMuIEFuZCBJ
IGFncmVlIHdpdGggeW91IHdoYXQgY29tZXMgdG8gZnVuY3Rpb24gYW5kDQpzdHJ1Y3QgbmFtZXMg
bGlrZSBiZDd4eDI4IC0gdGhvc2UgYXJlIHNvbWV3aGF0IGZyYWdpbGUgYXMgbmV4dCBQTUlDDQp3
aGljaCB3ZSB3YW50IHRvIHN1cHBvcnQgd2l0aCB0aGlzIGRyaXZlciBtYXkgYmUgQkQxMjM0NSAt
IHlpZWxkaW5nIG91cg0Kd2lsZC1jYXJkIHVzZWxlc3MuDQoNCkJ1dCBpZiB3ZSB0YWtlIGEgbG9v
ayBvZiBjb21tb24gZGVmaW5pdGlvbnMgaW4gaGVhZGVyIHJvaG0tc2hhcmVkLmgNCndoaWNoIEkg
YWRkZWQgLSB0aG9zZSBhcmUgcHJlZml4ZWQgYXMgUk9ITV9CRDEuIE15IGlkZWEgd2FzIGludHJv
ZHVjaW5nDQp0aGlzIGNvbW1vbiBSVEMgZGVmaW5lIGdyb3VwIDEgLSB3aGljaCB3b3VsZCBiZSBj
b21tb24gZGVmaW5lIGdyb3VwIGZvcg0KYWxsIGRldmljZXMgd2hpY2ggYmVsb25nIHRvIEJEMSBn
cm91cC4gQ3VycmVudGx5IHRoYXQgd291bGQgYmUgQkQ3MTgyOA0KYW5kIEJENzA1MjguIFdoYXQg
d2FzIG1pc3NpbmcgaXMgdGhlIGNvbW1lbnQgZXhwbGFpbmluZyB0aGlzIChhbmQgbGFjaw0Kb2Yg
Y29tbWVudCBtYWRlIHRoaXMgdXNlbGVzcyBhcyBldmVuIEkgZm9yZ290IGl0IGFscmVhZHkpLg0K
DQpJIGFscmVhZHkgcmV2ZXJ0ZWQgdGhpcyBuYW1pbmcgY2hhbmdlIGFuZCBhbGwgQkQ3MDUyOCBz
cGVjaWZpYyBhbmQNCmNvbW1vbiBkZWZpbmVzL2Z1bmN0aW9ucy9lbnVtcyBhcmUgcHJlZml4ZWQg
d2l0aCB0aGUgZ29vZCBvbGQgQkQ3MDUyOC4NCk9ubHkgbmV3IGRlZmluaXRpb25zIHdoaWNoIEkg
YWRkZWQgZm9yIEJENzE4MjggYXJlIHByZWZpeGVkIHdpdGgNCkJENzE4MjguIEJ1dCBob3cgZG8g
eW91IHNlZSB0aGUgZ3JvdXBpbmcgdGhlIGNvbW1vbiBkZWZpbmVzIHRvIGZvcm1hdA0KUk9ITV9C
RDxncm91cCBudW1iZXI+X0ZPT19CQVIgaW4gdGhlIHJvaG0tc2hhcmVkLmggLSB3aXRoIGNvbW1l
bnQgdGhhdA0KZ3JvdXAgQkQxIGNvbnNpc3RzIG9mIGRlZmluaXRpb25zIHdoaWNoIGFyZSBjb21t
b24gZm9yIEJENzA1MjggYW5kDQpCRDcxODI4Pw0KDQpNeSBvbmx5IGZlYXIgd2hlbiB1c2luZyBw
cmVmaXggQkQ3MDUyOCBmb3IgY29tbW9uIGRlZmluZXMgaXMgdGhhdA0Kc29tZW9uZSBjaGFuZ2Vz
IHNvbWUgZGVmaW5lcyB0byBtYXRjaCB0aGUgQkQ3MDUyOCBkYXRhLXNoZWV0IHdpdGhvdXQNCmV2
YWx1YXRpbmcgaWYgdGhpcyBpbXBhY3RzIHRvIG90aGVyIFBNSUNzLiBJdCBtYXkgYmUgdXNlbGVz
cyBwYXJhbm9pYQ0KdGhvdWdoIC0gaGVuY2UgSSBhbSBhc2tpbmcgZm9yIHlvdXIgb3BpbmlvbiBh
dCB0aGlzIHBoYXNlLiBJIGNhbiBkbw0KdGhpcyBncm91cGluZyBpbiBvd24gcGF0Y2ggLSBvciBq
dXN0IGxlYXZlIGl0IGFzIGl0IGlzIG5vdyBpbiBteSBsb2NhbA0KcmVwbyAtIHdpdGggdGhlIG9s
ZCBCRDcwNTI4IGJlaW5nIGNvbW1vbiBwcmVmaXguDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
DQo=
