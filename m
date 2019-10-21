Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E594DDE621
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 10:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfJUIS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 04:18:57 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:61500 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfJUIS5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 04:18:57 -0400
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 04:18:55 EDT
X-AuditID: c0a8fbf4-183ff70000001fa6-9f-5dad66691d4b
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id B0.5E.08102.9666DAD5; Mon, 21 Oct 2019 10:03:53 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 21 Oct 2019 10:03:42 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 12/13] dt-bindings: mfd: Document ROHM BD71282
 bindings
Thread-Topic: [RFC PATCH 12/13] dt-bindings: mfd: Document ROHM BD71282
 bindings
Thread-Index: AQHVhNEGlzssJjrQoU6zmYO2K0h2bqdewESAgAXgtIA=
Date:   Mon, 21 Oct 2019 08:03:42 +0000
Message-ID: <b8914c554e09c92b5a4602435fd60e314922a9c5.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <05841ff33ea166bc6934456a492adc3c67a90670.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <1d2bc596-0329-d090-2e8d-037c8cad0585@ti.com>
In-Reply-To: <1d2bc596-0329-d090-2e8d-037c8cad0585@ti.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <60A86E1DF0440C4BA4E5F28A4D53E8FA@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0gUURiGOXN3a2LatD3ahdroftnsxqnsRgRjP0INEgLTMafdLd2V2VW0
        /hhhpXYx6IJDuiLaxUvapmSmWKZmWyRL6hZpthVFkkZoiRnVjGPpr/Oe837v93w/vsPg+l4q
        hLHanKJkExKNlI54cGPUvdJ6qCJmdeHbFajY20mjUwPXaDSU7yHQJf8HCrman5Mo52k1iV7X
        VBGo93sLQD86TmPo4q/rGPp25g2J7rh+AfSi7iqFar7cAqi1rINCJT4vhq6WtBHI69mFejwt
        FMpsaKbR767bxPYgvrygHPBfX2bSfEH5Mf6e3EPz7tIsiu/uqqf4xy/vYvyVghGMv1E2TPOD
        7rkRuv1TwuIFZ+peq9lm2ho3xVLUfZJOlsm0U+26DHCazAYBDOTWwXNnvYrWMXquC8DW6x6g
        XdoAfNc3iGUDhqG4MJj9ilYDgdwBeM37kFJrcG6Yhn1yzpgxg4uEraPtpFYUBYff5FKa3gRL
        z/8hVE1wC+HH6stA1Sy3B57z5Y3DOgAc8vaPGQFK4HKna6wR4ObArIwBTNU4Z4Duj8PjY3Ow
        uL4d13QQ/Pz+9/i7ETaM+Al1aJxbCivrTJrcDluHDmtd5sOLOX5aG2E6fJL3gcgFM+VJAHki
        LE+E5UlheVK4EJClACYJ1kSz4BRDV0liyirJbklSjoP2JDfQFmaoFvxpCm8CGAOaQDCDGYNY
        m6k8Rj8t3p6QbhEcllgpJVF0NAHI4MZAtnt1RYyeTRDSj4qS/Z81iyGMBnax/0KMnlNZR0Qx
        WZT+ubMZxgjZgINKcLokmsW0Q9ZE54SNMQFqc11IoEO0JYiSkOK0xKrbEetQ1kO1pircx6LK
        dSQLScqrFvWA5Uzu5/winGnOLynC9YTNbhNDDKwrTinl1FJLiu0/qA8YGGCcwfYmKO5U5df8
        79OnIDAFURZcpiKcwoQVkgGC49IPx204O1qT2b8biRu3rDRHkFVVC5JPFIeFGr4W765nuVeG
        zX5n447IJSa7IPSYukR6IG0kevDn2+WGqNDB6HbvvJuf8NQ2Pq9zT38Gueb50eMHZFOqr3JW
        QaR3p6/wkePdttpn4Wtbsr4t2tVI4EeKXOt95poL4WtK9lXfNxIOixC6DJccwl/439tc8gMA
        AA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

VGhhbmtzIERhbiwNCg0KT24gVGh1LCAyMDE5LTEwLTE3IGF0IDA5OjE4IC0wNTAwLCBEYW4gTXVy
cGh5IHdyb3RlOg0KPiBNYXR0DQoNCkJ5IHRoZSB3YXksIGl0cyBNYXR0aSA7KQ0KDQo+IE9uIDEw
LzE3LzE5IDQ6NTUgQU0sIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBST0hNIEJENzE4Mjgg
UG93ZXIgbWFuYWdlbWVudCBJQyBpbnRlZ3JhdGVzIDcgYnVjayBjb252ZXJ0ZXJzLCA3DQo+ID4g
TERPcywNCj4gPiBhIHJlYWwtdGltZSBjbG9jayAoUlRDKSwgMyBHUE8vcmVndWxhdG9yIGNvbnRy
b2wgcGlucywgSEFMTCBpbnB1dA0KPiA+IHBpbg0KPiA+IGFuZCBhIDMyLjc2OCBrSHogY2xvY2sg
Z2F0ZS4NCj4gPiANCj4gPiBEb2N1bWVudCB0aGUgZHQgYmluZGluZ3MgZHJpdmVycyBhcmUgdXNp
bmcuDQo+IA0KPiBUaGlzIHNob3VsZCBiZSBwYXRjaCAxIG9mIFgNCg0KSSB3aWxsIHJlYmFzZSA6
KQ0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg==
