Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7FA8F0F51
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 07:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731386AbfKFGwH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 01:52:07 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:48286 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731330AbfKFGwG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 01:52:06 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-76-5dc26d945d76
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 4D.4A.08102.49D62CD5; Wed,  6 Nov 2019 07:52:04 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 07:52:00 +0100
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
Subject: Re: [RFC PATCH v3 14/15] gpio: Add definition for GPIO direction
Thread-Topic: [RFC PATCH v3 14/15] gpio: Add definition for GPIO direction
Thread-Index: AQHVkKp+hdqKw9vEbUql9O/haZZyiad5+mgAgAEiGoCAAYY1gIABCI2A
Date:   Wed, 6 Nov 2019 06:51:59 +0000
Message-ID: <c4a2462cf810c4468638522d901b6416d1a770a4.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <f08d265c12ebf185c0e1dbbfe0a3f86de4907194.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdYhasTEQq2btQ_3GSo=hMJetp128jFo-6hE=JMeX4MJSA@mail.gmail.com>
         <411ac5e107cd2a6c628d1fb46e7d284c8f594768.camel@fi.rohmeurope.com>
         <CACRpkdaRt3Du4y_Yhv39d7KoQ=hOkPR-RqXYjPukxb7JG_yymQ@mail.gmail.com>
In-Reply-To: <CACRpkdaRt3Du4y_Yhv39d7KoQ=hOkPR-RqXYjPukxb7JG_yymQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <25065393F3209F438FDBAA6CC3CC6B53@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0gUaxjHeWdmZ16tkWnSfM9mlzMEUVEmRL5FSF+sKSK60nWxKUd3ay8y
        u0pWkN0w1+iGUS3rJU+W6NJlLTIp01HL9pwKy8yoFE/SSbtxyDLJLjOOpZ/eP8//+T+/58Pz
        QpJvp83Q5vTIilOyC3Q4VVP69fL0PIdqmfmlTcBnmx4zOPv9OQb35IcofKKjk8aF9fdNOPfv
        Kyb87OolCrd/agD4c/NBAuf1nyfw/4faTLiisB/gR1V+Gl99ewHg2+XNNC550kRgf0kjhZtC
        ifhFqIHGB27WM/h7y2VqfpQYKAgA8UPrAUYsCOwUr/teMGKwLIcWn7fcoMU7rdcI8WRBHyGW
        lvcy4sfg+GXh60fM2yx5MlbaUp2xCZtGWGtadqVVRmx/F+o2ZYGDEV4QBhE3Cx327yO8IBzy
        3GOA/gpVULrBc3cACn5a5QUQ0tw85H3K6OVIbg6qa/QPtJCcH6I9ret0PZpbhG71hwZ7FqO8
        ohrS0AvQq95OQtcUNwn1qW9oXbPcUlT5bzkwuH0E6ipqGBgaxi1H7Q/eDYQBNw7lZL0nDFg0
        Cr7qNRlLc+jsjQekoaNQ18vvg3UB3ezroPSdSW4KulgVa0Tno7YnewZ3/hPl5XYwxg6j0N3T
        ndRRMMY3jOAbSvuGpX3D0r5h6SJgKgPIIdnsqZJHjpuhyOkzFJfVoT1bXI4gMA6mpxL8UBep
        gIBABX9AQohiF9tqLXzEZldyplVyW5OUdLvsVgGCpBDJbjyseWyylLlDVly/rLGQEqLZyR3H
        LDyns7bJcpqs/HJjIBQQW2VXLfwoRU6Vt6fY7J4hm4Bh+vBwc6RbdibLipTusSbp15Hk1s5D
        t0Zq3MZtWpx1p0kOrWpEQ2AaPNqVX0zC+vySYpKnnC6nbI5mP+skTm+1pjt/g7pBNATCaHat
        7o7Ufs3vOd0agtAQS15W6wiPNGSZs8Dse7nAc/zEDnqqhz/utQfiV2TfSlxtCfTsXLv3dft/
        Unn/qurbcZnNlT27fyT5shLWnVIz1qhr6ipMMdPHJr651lu0oWl1c1kbX1z9ZcKHbwtex5vX
        f3yUuDUlPiclNmZvRm1pXVnC0piF1jNXJs6Ws5lAq7i/di6Ye+SflpJLUvVDgXJbpbippOKW
        fgLtDG6o8gMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMsDQoNCk9uIFR1ZSwgMjAxOS0xMS0wNSBhdCAxNjowNSArMDEwMCwgTGludXMg
V2FsbGVpaiB3cm90ZToNCj4gT24gTW9uLCBOb3YgNCwgMjAxOSBhdCA0OjQ4IFBNIFZhaXR0aW5l
biwgTWF0dGkNCj4gPE1hdHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+
IA0KPiA+ID4gR29vZCBpbml0aWF0aXZlIChhbmQgSSB3aWxsIHNlZSBhIHRvbiBvZiBqYW5pdG9y
aWFsIHBhdGNoZXMgYXMgYQ0KPiA+ID4gcmVzdWx0IG9mIHRoaXMuLi4pDQo+ID4gDQo+ID4gSSBo
YXZlIHNvbWV3aGVyZSBuZWFyIDYyIHBhdGNoZXMgd2FpdGluZyB0byBiZSBzZW50ID0pIFRoZXkn
cmUNCj4gPiBwcmV0dHkNCj4gPiBzbWFsbCBidXQgSSdkIGFwcHJlY2lhdGUgdGhvcm91Z2ggcmV2
aWV3IGFzIHRoZXkncmUgbW9zdGx5DQo+ID4gdW50ZXN0ZWQuLi4NCj4gPiBEbyB5b3UgbWluZCBy
ZWNlaXZpbmcgdGhlbSBhbGwgaW4gb25lIGdvPyBPciBkbyB5b3UgdGhpbmsgSSBzaG91bGQNCj4g
PiBzZW5kDQo+ID4gdGhlIHNlcmllcyBpbiBzbWFsbGVyIGNodW5ja3M/DQo+IA0KPiBJIHdvdWxk
IGJlIGZpbmUgd2l0aCBvbmUgcGF0Y2ggaW50cm9kdWNpbmcgdGhlIGRlZmluZXMgYW5kIHRoZW4N
Cj4gb25lIGJpZyBwYXRjaCBzd2l0Y2hpbmcgZXZlcnlib2R5IGFuZCB0aGVpciBkb2cgb3ZlciB0
byB1c2luZw0KPiB0aGVzZSBkZWZpbml0aW9ucy4NCj4gDQo+IEkgdXN1YWxseSBrZWVwIHRvIGEg
cGF0Y2ggYmVpbmcgIm9uZSB0ZWNobmljYWwgc3RlcCIgYW5kIGl0IGlzDQo+IGNsZWFybHkgKElN
Tykgb25lIHN0ZXAgdG8gaW50cm9kdWNlIHRoZSBkZWZpbmVzIGFuZCBvbmUgc3RlcA0KPiB0byBt
YWtlIHVzZSBvZiBpdCBpbiBhbGwgbGVnYWN5IGRyaXZlcnMuDQo+IA0KPiBJdCdzIGxhdGUgaW4g
dGhlIGtlcm5lbCBjeWNsZSBidXQgdGhpcyBwYXJ0aWN1bGFyIHBhcnQgKHRoZSBkZWZpbmVzDQo+
IGFuZCBzd2l0Y2hpbmcgb3ZlciBvbGQgZHJpdmVyIHRvIHVzZSBpdCkgSSdkIGJlIGhhcHB5DQo+
IHRvIG1lcmdlIGZvciB2NS41Lg0KDQpJJ2xsIHByZXBhcmUgb25lIHBhdGNoIGZvciBkZWZpbmVz
IGFuZCBvbmUgbGFyZ2UgcGF0Y2ggZm9yIGRyaXZlcg0KY2hhbmdlcyBvbiB0b3Agb2YgR1BJTyB0
cmVlIHRoZW4uIEknbGwgbGVhdmUgb3V0IHRoZSBsYXN0IG9uZSA2Mi82MiAtDQppdCBjYW4gYmUg
YXBwbGllZCBsYXRlciBpZiBpdCBpcyBjb25zaWRlcmVkIGEgZ29vZCBpZGVhIC0gSSdkDQphcHBy
ZWNpYXRlIGlmIHlvdSAvIEJhcnRvc3ogaGFkIHRoZSB0aW1lIHRvIGNoZWNrIGl0IHRob3VnaC4g
DQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCg==
