Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE5E1248DF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfLROBi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:01:38 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:59018 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbfLROBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:01:36 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-87-5dfa313d1e2b
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DE.4F.08102.D313AFD5; Wed, 18 Dec 2019 15:01:33 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 18 Dec 2019 15:01:27 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: Applied "regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators" to the regulator tree
Thread-Topic: Applied "regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators" to the regulator tree
Thread-Index: AQHVtNcCPO+Kt0OMfE2l+CzrBWADfqe/eY8AgABW2wCAAAxsgA==
Date:   Wed, 18 Dec 2019 14:01:27 +0000
Message-ID: <b72cd22df0bbbb159cda08e556037f1ccf490b3d.camel@fi.rohmeurope.com>
References: <applied-5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <de7424126e285d9bbd21a70945415d78203c2ba7.camel@fi.rohmeurope.com>
         <20191218131700.GB42175@sirena.org.uk>
In-Reply-To: <20191218131700.GB42175@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EC2AB5390333649B5FA8FB87510E416@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0wUVxTGc2dmZy7gNOMK3du1mjhtbWzDK5p4E221bYhDjMTEtCaNhI7u
        lCHCLs4uKjVGjAFlwdcCtW5dWHnVCBVZBBUhpRsW7NZCiKAoPrKWkoBmadVKAB+dYarw1/3u
        +c7vfuePcyFprGXMMMPqkBSrmMnTkVTHmenG2E8Sp1ITvv9jFa7uG2DwwXAtg1+4uhj81BOk
        cFlomMbDHQcBrujsMeCi3y8Y8IGqBhoPNZ+n8P1/AwA/6z9E4NLnPxH4n+J7Bny6oJrCTRXP
        Ab7eeorGzY/OAdxV10/jmpt9BD5Vc5XC448LCdwXTMJlwTCD7wYDND7QN0ji/PZOBr+80Ujh
        Iz3r1i4S6svrgTA95QLC+GA+I5TX7xEuu+8ygu9sIS3cudFGC7946hmh6kiJQXh27TgljJxu
        oITuwYuEcKJ8khAaijuBcKZughGe+BZv5L6OWr1VdOzclJFujf/0myi5IJyQ7Yrc3dLiA3ng
        7wgniICIW4HyTnTTThAJjdwAQOdK7hn0y1WAwj/UASeAkOZWI+ctRgOiuVhUNlU1A5BcfxSq
        7C8hNWMBtwMdbgqSepOCbr8YpXT9OSryjczUKe4DVPRXKdA0y6Wgh12XgB52HyBP6yODZkRw
        y9HtWtdMGuAWocK8MKFpkjMh38iEQR+bQ9VtvaSuY9Dony//r/OofTJEaUOT3DLU0Bqvo2tR
        S8kgqeslqLQoxOgzzEe/nRymjoG33XMS3LO0ew7tnkO759BeYDgLUJaYkZkuOqTEOEXKiVNs
        cpZ6bLNl+YC+d08vgVf+ZD8gIPCDdyDBx7C8PJlqfGurzZIri3Y5TcnJlOx+gCDJR7NDh1SP
        tYi530mK7bW1EFK8if0wdDzVyGlZ2yUpW1Jeu+9CyCO2LXYq1ThfkdKl3d9mZDpmbQJGaI9H
        mqPtktUiKWKOQ07T9iPNri6IZs1Tcy3xKs7as8UstaqjQfAxPDbqqSRhp6emkjRSVptVMptY
        dqnaymmtco71TdAYMEHAL2D3J6juPPXzvXlnTI0g1Ai4bCbCIc5a5jwQPz6R25HUIl45umFs
        DdW78uTi5PdSVvUcnf7isEJXVMlG/2Pf5t73cSDmq33XU27+6vU++PLVBdeuQNM+rxFZNz+J
        cbvOr9gY8rLFS4RmJm6vybS/wBy482P79oWNQ9tqNjUnr3FeLF0/kFQ3vOXyuh3lll74cLzr
        s4H8K065+9rPPGWXxcSPSMUu/gfQRcVfOQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMTktMTItMTggYXQgMTM6MTcgKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFdlZCwgRGVjIDE4LCAyMDE5IGF0IDA4OjA2OjA0QU0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0
dGkgd3JvdGU6DQo+IA0KPiA+IEkgdGhpbmsgeW91IG1pc3NlZCB0aGUgW1BBVENIIHY2IDA4LzE1
XSByZWd1bGF0b3I6IGJkNzE4eDc6IFNwbGl0DQo+ID4gZHJpdmVyIHRvIGNvbW1vbiBhbmQgYmQ3
MTh4NyBzcGVjaWZpYyBwYXJ0cw0KPiANCj4gSSBkaWRuJ3QgbWlzcyBpdCwgaXQgd2FzIHF1ZXVl
ZCBidXQgaXQgZG9lc24ndCBhcHBseS4NClJpZ2h0LiBUaGUgcm9obS1nZW5lcmljLmggaXMgY2hh
bmdlZCBieQ0KW1BBVENIIHY2IDA0LzE1XSBtZmQ6IHJvaG0gUE1JQ3MgLSB1c2UgcGxhdGZvcm1f
ZGV2aWNlX2lkIHRvIG1hdGNoIE1GRA0Kc3ViLWRldmljZXMNCg0KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oIGIvaW5jbHVkZS9saW51eC9tZmQvcm9obS0NCmdl
bmVyaWMuaA0KaW5kZXggYmZmMTVhYzI2ZjJjLi45MjJmODgwMDgyMzIgMTAwNjQ0DQotLS0gYS9p
bmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaA0KKysrIGIvaW5jbHVkZS9saW51eC9tZmQv
cm9obS1nZW5lcmljLmgNCkBAIC00LDcgKzQsNyBAQA0KICNpZm5kZWYgX19MSU5VWF9NRkRfUk9I
TV9IX18NCiAjZGVmaW5lIF9fTElOVVhfTUZEX1JPSE1fSF9fDQogDQotZW51bSB7DQorZW51bSBy
b2htX2NoaXBfdHlwZSB7DQoNCg0KSSB0aGluayB0aGlzIGlzIHRoZSByb290IG9mIHRoZSBjb25m
bGljdCBoZXJlIGFzIFtQQVRDSCB2NiAwNC8xNV0gaXMNCm5vdCBpbiByZWd1bGF0b3IgdHJlZS4g
SG93IHNob3VsZCBJIGhhbmRsZSB0aGlzIHNvIHRoYXQgaXQgd29uJ3QNCmNvbmZsaWN0IGluIHlv
dXIgYW5kIExlZSdzIHRyZWVzPw0KDQpCciwNCglNYXR0aQ0K
