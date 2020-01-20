Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FFE14267A
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 10:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgATI7x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 03:59:53 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:60150 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbgATI7w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 03:59:52 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-52-5e256c0684b1
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 87.69.08102.60C652E5; Mon, 20 Jan 2020 09:59:50 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 20 Jan 2020 09:59:38 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v11 06/13] mfd: input: bd71828: Add power-key support
Thread-Topic: [PATCH v11 06/13] mfd: input: bd71828: Add power-key support
Thread-Index: AQHVz1wGrQEGyJ5fD0SaA4XlttGe5qfzLygAgAABRYA=
Date:   Mon, 20 Jan 2020 08:59:37 +0000
Message-ID: <ad1d57cd3025cf9205240f23a3558728087d7c6b.camel@fi.rohmeurope.com>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
         <aa965067acfbdaa862f5f5de8b66e2c161f276a0.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
         <20200120085510.GB15507@dell>
In-Reply-To: <20200120085510.GB15507@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DE9CF02669805478756659A339F3AAD@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxzG995d715+dDlbXN/VscXL0PhjImYZ75Q4k4XsNGqWQPxjZmXn
        erbF0pK2bLIfxkSBUcAIQ4mVFkWYCA0dnUbsSiBYGNZFg5PKAmiYSAbbYHMiYzrc3W4Kf71P
        3ud5vp+75PtCUtPK6KHF5hIdNsHK0fFUV9Ojttdoa4ph/dmrCbihf4DBJVNfMfifql4GP/BG
        KXxsdIzGY10lANdFrqlw2dXzKnzoTIDGQxe+pvCdmR6AH978gsDVj88S+I/y2yp8uriBwt/U
        PQb4h1AtjS/82gpwb8tNGjfe6idwbWMfhafvlxK4P5qJj0WnGDwS7aHxof5BEhd1RBg8H2uj
        8JFr72xJ5v0+P+Af/V0F+OnBIob3+T/lL3lGGD7YXErzw7EwzXd6/Qx/5siXKv7h95UUP346
        QPHfDV4k+BrfHMEHyiOAb2qZZfg/gy+/y76XkLFHcH2UZTHZUjd/kGB+MnEgPwL3T3bFyIOg
        CbpBHETs6+jb38sIWWvYAYCCLQfcIF7SfQBNXbmjcgMIaTYDuX9k5EwSm4Ya+u5RsibZUxBV
        hlk5/xwbJNHF+WGVbGjZraio+D6lFLahmYpZUtEb0b1AjJY1xaag1lg7kLWa3YlmPBFGAUcA
        OtlW/x84jl2NJnzpcgawyaj04BShgHUoOD6rUn6ARQ3h66Sil6KJu/P/33OoY26UkseQ7CoU
        CKUqcgvyVWcpU5aj6rJRRvmCJejKiTHqKNB5FgE8C2XPQtmzqOxZVD4FVM0A5QkWq0lwiWnr
        HGLBOofdnCcdH9rzgkDZvwft4En31m5AQNANXoQEt1TN5HIGzfN77MZCs+A05zgKrKKzGyBI
        cknqkYrlBo3aKBR+IjrsT61lkOJ06pWjle9rWJm1TxTzRcdT9yUIOaTeti/FoFniEE3i/r0W
        q2vBJmCcPDxen+QUbUbRIRS4zDnynuQ4pUWRrUSJWyHX1c58IU+6VapRsAYenfDWkzDibawn
        NZTNbhP1OjXeKEVZOWousD0DTQIdBJxWvTZXchOlR/hszqSEICTEQDonI1zCgqWX9vKFt9j4
        G4dXdhizY5//tOFunc+2I+WchdK/8ar21todw9m/+UvCQ4bQ9ln3yPTxmozAX1WbQjBrYHNn
        sy9k8v4894vx3PXdYznZQ7XFexNrzjcWpq6Y77t88m1VyY2du+qz1u/6eFWu781L48vKfZ2b
        tr9yODm9/bid6w1rez7LzNSaOMppFtJWkw6n8C8q2mnkQQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBNb24sIDIwMjAtMDEtMjAgYXQgMDg6NTUgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gTW9uLCAyMCBKYW4gMjAyMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBVc2UgZ3Bpb19rZXlzIHRvIHNlbmQgcG93ZXIgaW5wdXQtZXZlbnQgdG8gdXNlci1z
cGFjZSB3aGVuIHBvd2VyDQo+ID4gYnV0dG9uIChzaG9ydCkgcHJlc3MgaXMgZGV0ZWN0ZWQuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5A
Zmkucm9obWV1cm9wZS5jb20+DQo+ID4gQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiBObyBjaGFuZ2VzIHNpbmNlIHYxMA0KPiA+
IA0KPiA+ICBkcml2ZXJzL21mZC9yb2htLWJkNzE4MjguYyB8IDI2ICsrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspDQo+IA0KPiBE
cm9wIHRoZSAiaW5wdXQ6IiB0YWcgZnJvbSB0aGUgc3ViamVjdCBsaW5lIHBsZWFzZS4NCj4gDQpJ
J2xsIGRvLiBBbmQgSSdsbCBhbHNvIGRyb3AgdGhlIExFRCBwYXRjaGVzICgxMiBhbmQgMTMpIGFz
IEkgbm90aWNlZA0KdGhlIHBhdGNoIDEyIGhhcyBzb21lIGlzc3VlcyAoYmVzaWRlcyBMRURzIC0g
b3RoZXIgdGhhbiBiaW5kaW5ncyAtDQpzdGlsbCBsYWNrIGFjayBmcm9tIFBhdmVsKS4NCg0KSSds
bCBzZW5kIHYxMiBhZnRlciBhIHdoaWxlLg0KDQpCciwNCiAgICBNYXR0aSBWYWl0dGluZW4NCg==
