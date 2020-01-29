Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A80D14CCF3
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 16:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgA2PGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 10:06:38 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:62296 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgA2PGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 10:06:38 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-b3-5e319f7cc725
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 09.B1.08102.C7F913E5; Wed, 29 Jan 2020 16:06:36 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 29 Jan 2020 16:06:30 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "axel.lin@ingics.com" <axel.lin@ingics.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: bd71828: Remove unneeded defines for
 GPIO_LINE_DIRECTION_IN/OUT
Thread-Topic: [PATCH] gpio: bd71828: Remove unneeded defines for
 GPIO_LINE_DIRECTION_IN/OUT
Thread-Index: AQHV1p/jX3p7ayVbYkiYZZSqwgrgHqgBrWAA
Date:   Wed, 29 Jan 2020 15:06:29 +0000
Message-ID: <ff66b882b9eba908d3293854ac1535b13b0b4c51.camel@fi.rohmeurope.com>
References: <20200129123021.26200-1-axel.lin@ingics.com>
In-Reply-To: <20200129123021.26200-1-axel.lin@ingics.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-Type: text/plain; charset="utf-8"
Content-ID: <73376F426636D245BC2C11812378194F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTURzn7N7NO+eN45x6MjMciWilTiJmSIk9mB/KoBALH13dzQ3dg7tp
        WkJKZWgfMhtJS1M0SdK0Zg9zYrpEUiTrQ6VglmTJhDTREk1m97h8fLq/+3t+OH+KkE4KAyit
        3sxyeiZHLvIkuxv/2vYU1ijSolo7gpW9Vb8J5Xz1AKm0LD8QKNtqlkEcqZoZvuqhKlnMU41+
        7BSp5mxBJ8gzktgMxpx3UpuljzxwVqJ5VtkkNLrE+c6qT2QRGBWXAYpCcC8aLQ4qA56UFH4A
        6MvPJYH75w1AXcWLQmwSwVhUNuKBoQxq0LydKQNiioD5qKe2SYixD0xBdc8rCLclFc2O6TEt
        g9Hotf29CNMkDEF35sIwpOFx1DPrgR1SqESVVc0ijMUwBjVOWVZ5ALej0qJpgXvIH9l+LKwO
        IQjR/c4hwo19kfOb6z8fjF4stJC4noBhqLUj0g3jkHNwv7slGFmuj6+209Ab9d+ZIMuBn3XT
        gHUjbN0IWzeFrZvCtUD4ECAdo83JYsysIoJjcyM4g0bHfzINOhtwP9x8O1hxJDiAgAIOsJUS
        yH3paK0iTbolw6Au0DAmTTqXm8OaHABRhFxG+x7hNVrNFFxgOcOatI0i5f506PjNVCnEW9ks
        a2S5NTWQouSIHr7HB705NovNP6fNMW/IAkqMyz0DZCZWr2Y5JtesScd3kW7iDwNLXvxuEo7T
        JiOj41l3dADsosqd1XUE1VvdUEdISb1Bzwb409ewFWKrJle/PjQF/Ckg96EXq3nVi7/e9Z4p
        fkLAT/xhovCEmdmQAopAycH2J9P1zSEJxorJ/sdMy9KrUzMWNjBZlWjf5wyvyP760pakM+70
        sAuejigiJmzHvh8111+56Bpr7ksxevYldP1akPm9a7icagw5fLutdOXz5NvMWzeSD6mHJPZH
        Y5bQ7tL4HUx8dHlhYkJMr658uOH04NRuR7qsVuI6r7h0t1ROmjSMIpzgTMw/KzItnXoDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMDEtMjkgYXQgMjA6MzAgKzA4MDAsIEF4ZWwgTGluIHdyb3RlOg0KPiBU
aGV5IGFyZSBkZWZpbmVkIGluIGdwaW8vZHJpdmVyLmggbm93Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQXhlbCBMaW4gPGF4ZWwubGluQGluZ2ljcy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlv
L2dwaW8tYmQ3MTgyOC5jIHwgMTAgLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLWJkNzE4Mjgu
YyBiL2RyaXZlcnMvZ3Bpby9ncGlvLQ0KPiBiZDcxODI4LmMNCj4gaW5kZXggMDRhYWRlOWUwYTRk
Li4zZGJiYzYzOGU5YTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLWJkNzE4Mjgu
Yw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1iZDcxODI4LmMNCj4gQEAgLTEwLDE2ICsxMCw2
IEBADQo+ICAjZGVmaW5lIEdQSU9fT1VUX1JFRyhvZmYpIChCRDcxODI4X1JFR19HUElPX0NUUkwx
ICsgKG9mZikpDQo+ICAjZGVmaW5lIEhBTExfR1BJT19PRkZTRVQgMw0KPiAgDQo+IC0vKg0KPiAt
ICogVGhlc2UgZGVmaW5lcyBjYW4gYmUgcmVtb3ZlZCB3aGVuDQo+IC0gKiAiZ3BpbzogQWRkIGRl
ZmluaXRpb24gZm9yIEdQSU8gZGlyZWN0aW9uIg0KPiAtICogKDkyMDhiMWU3N2Q2ZThlOTc3NmYz
NGY0NmVmNDA3OWVjYWM5YzNjMjUgaW4gR1BJTyB0cmVlKSBnZXRzDQo+IG1lcmdlZCwNCj4gLSAq
Lw0KPiAtI2lmbmRlZiBHUElPX0xJTkVfRElSRUNUSU9OX0lODQo+IC0JI2RlZmluZSBHUElPX0xJ
TkVfRElSRUNUSU9OX0lOIDENCj4gLQkjZGVmaW5lIEdQSU9fTElORV9ESVJFQ1RJT05fT1VUIDAN
Cj4gLSNlbmRpZg0KPiANCg0KVGhhbmtzIG9uY2UgYWdhaW4gZm9yIGRvaW5nIHRoZSBjbGVhbnVw
ISA6KQ0KDQpCciwNCglNYXR0aQ0K
