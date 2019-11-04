Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF62CEE429
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbfKDPsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:48:33 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49486 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfKDPsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:48:32 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-92-5dc0484eb3ae
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DB.5F.08102.E4840CD5; Mon,  4 Nov 2019 16:48:30 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 4 Nov 2019 16:48:17 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
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
Thread-Index: AQHVkKp+hdqKw9vEbUql9O/haZZyiad5+mgAgAEiGoA=
Date:   Mon, 4 Nov 2019 15:48:17 +0000
Message-ID: <411ac5e107cd2a6c628d1fb46e7d284c8f594768.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <f08d265c12ebf185c0e1dbbfe0a3f86de4907194.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdYhasTEQq2btQ_3GSo=hMJetp128jFo-6hE=JMeX4MJSA@mail.gmail.com>
In-Reply-To: <CACRpkdYhasTEQq2btQ_3GSo=hMJetp128jFo-6hE=JMeX4MJSA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.93.201.147]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFD78040917F6B49BA61C44DADDD2B28@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta1BMYRzGvee2p9bh2Mq+FuGMcScZH14m5ANODY3LjHGZJoeOdml3c3ZD
        jJkdMw1tzGQmyU4Xk80lTSlChLValzWDnbbUqIiGKU2NEYZWnNOiPp1n/s/z/H/nw/+lcc0b
        SkcbTFZRMgmpHBVKuC4NVM1P4F2JCx82RCOnr1GFjvVeUKH+Qi+BTnd0Uqi4/jmJsp9dJ9Hr
        mqsEevPVA9A3/3EM5QYuYujziXYSXSsOANRwu4BCNT0VAD264qdQ6SsfhgpKnxDI512F2rwe
        CmXerVehwaYqIjaCLy8qB3xfc6aKLyo/zNc62lR8dVkWxbc21VH84+abGH+m6AfGX7ryXcV/
        qY5cH7pNHbNTsO7fZEgxRS3fodb7jwbItHvqg80v8oAN5KvtgKYhuxja8yU7CKE1bCOAg2cN
        dhAq68cA9g4OkEqGYmOgvUWlZMLZJfDhkwJCyeBsAQ0vtz8nFSOMjYP3A96/oXiYe86FB/VS
        +LP4BqXsIdjpsKomUhkzbAJ0dvWQQdYnAD1f3w11Q9gN8PJbN6ZowE6GWbbeIY2zWlj94fsQ
        C7IsdNa9wIM6Ana9H/w752Ddj/OYwsLZ2bDydlSwGgt/nSoDQT0N5mZ3qIL/MA4+PdtJ5IDx
        jhEEx3DbMaLtGNF2jGifA2QZgEbBkJoiWMXoBZKYvkAy643yZ5fZWA2CB9N/C/x2x7kBRgM3
        mEBjXAQzb6krUTNmpzk5Qy9Y9ElSeqpocQNI41w448u/m6hhkoWMQ6Jk/mdNpAlOy8zsOJWo
        YRXWXlFME6V/7iSa5iAjrJGXjpPEFPHgbkOqddjG6BBleagu3CKakkVJSLfqk5TrSLLI56FY
        o2Xuy9VynbGkCUZ5Gqx6wVw6p6uwBKfrC0tLcA1hMptEnZaZrZBYJapPN/0HdQMtDbgwhpCf
        h2a0/Gr+7+mWEZiMWPv+noKwCsOWzgYyMm2v26+POuI/U7KnJeBRG1p1TVvIGyVgirZ1c9TJ
        FdbAjMw7O/zTKxbFGwce9FMr76w5IOZE5rU4Y27647K291QkVNZGSfatz7oLN66bld3ZV3Ts
        wthArWNCw4x9bpfN53I3ZuX9Mve5yp0NVxM8c8LamM9Tr3H3Y8d+7KvULuMIi16InoNLFuEP
        d930ovIDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWxsLA0KDQpPbiBTdW4sIDIwMTktMTEtMDMgYXQgMjM6MzAgKzAxMDAsIExpbnVzIFdh
bGxlaWogd3JvdGU6DQo+IEhpIE1hdHRpIQ0KPiANCj4gR29vZCBpbml0aWF0aXZlIChhbmQgSSB3
aWxsIHNlZSBhIHRvbiBvZiBqYW5pdG9yaWFsIHBhdGNoZXMgYXMgYQ0KPiByZXN1bHQgb2YgdGhp
cy4uLikNCg0KSSBoYXZlIHNvbWV3aGVyZSBuZWFyIDYyIHBhdGNoZXMgd2FpdGluZyB0byBiZSBz
ZW50ID0pIFRoZXkncmUgcHJldHR5DQpzbWFsbCBidXQgSSdkIGFwcHJlY2lhdGUgdGhvcm91Z2gg
cmV2aWV3IGFzIHRoZXkncmUgbW9zdGx5IHVudGVzdGVkLi4uDQpEbyB5b3UgbWluZCByZWNlaXZp
bmcgdGhlbSBhbGwgaW4gb25lIGdvPyBPciBkbyB5b3UgdGhpbmsgSSBzaG91bGQgc2VuZA0KdGhl
IHNlcmllcyBpbiBzbWFsbGVyIGNodW5ja3M/DQoNCj4gT24gRnJpLCBOb3YgMSwgMjAxOSBhdCAx
Mjo1MCBQTSBNYXR0aSBWYWl0dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3Bl
LmNvbT4gd3JvdGU6DQo+IA0KPiA+IEF0IGxlYXN0IGZvciBtZSBpdCBpcyBkaWZmaWN1bHQgdG8g
cmVtZW1iZXIgdGhlIG1lYW5pbmcgb2YgR1BJTw0KPiA+IGRpcmVjdGlvbiB2YWx1ZXMuIERlZmlu
ZSBHUElPX0lOIGFuZCBHUElPX09VVCBzbyB0aGF0IG9jY2FzaW9uYWwNCj4gPiBHUElPIGNvbnRy
aWJ1dG9ycyB3b3VsZCBub3QgbmVlZCB0byBhbHdheXMgY2hlY2sgdGhlIG1lYW5pbmcgb2YNCj4g
PiBoYXJkIGNvZGVkIHZhbHVlcyAxIGFuZCAwLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1h
dHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiAoLi4u
KQ0KPiA+ICsjZGVmaW5lIEdQSU9fSU4gICAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIEdQ
SU9fT1VUICAgICAgIDANCj4gDQo+IFBsZWFzZSBzcGVsbCBpdCBvdXQgb3IgcGVvcGxlIHdpbGwg
YmUgY29uZnVzZWQ6DQo+IA0KPiBHUElPX0xJTkVfRElSRUNUSU9OX0lODQo+IEdQSU9fTElORV9E
SVJFQ1RJT05fT1VUDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0KDQo=
