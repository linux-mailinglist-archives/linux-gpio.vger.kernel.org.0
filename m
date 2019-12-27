Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A906D12B454
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 12:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfL0LvQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Dec 2019 06:51:16 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:56324 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfL0LvQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Dec 2019 06:51:16 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-2e-5e05f03118ce
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 90.F8.08102.130F50E5; Fri, 27 Dec 2019 12:51:13 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Fri, 27 Dec 2019 12:51:08 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "pavel@ucw.cz" <pavel@ucw.cz>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
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
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v7 11/12] leds: Add common LED binding parsing support
 to LED class/core
Thread-Topic: [PATCH v7 11/12] leds: Add common LED binding parsing support
 to LED class/core
Thread-Index: AQHVtlJMyatI9ieot0i0jk0Qmtw3YKfE7uMAgAjrkIA=
Date:   Fri, 27 Dec 2019 11:51:07 +0000
Message-ID: <4f5c3d6b5e10936b3bae672021aec375c2880bf2.camel@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <c7abf8d15ea54fee504fbec5666d013c26d3b62a.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <20191221193758.GJ32732@amd>
In-Reply-To: <20191221193758.GJ32732@amd>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <35D7AE440FBBEF4692D77DA8C8D1C20F@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0wTWRTHc2emM7fowFhed+sjUjVm1yxKQuJdl6gflIxGjYkaEqN0Bxhb
        Ip3itBjdJYomPlqQYHyFhhajIqgEtMpiiW4QwQXWFyKoEVSEKBAXMSBqxMdMR4VPc+b8/7/z
        Px/OhaThGW2E6ZJTlCUhw0SHULVlH/2/xg3qkuf1dfyGT7W0MXjfwGkGD3ubKXykq4fGxfW3
        dTj3v0s6/LjqPIWfvm0AeOT+fgIfHi0l8Ju8Jzp8sXgU4NaaIhpXvaoA+Ma5+zQuedBC4KKS
        Rgq3NC/Fnc0NNN5ztZ7Bn9svUIsj+XJfOeBfP9zD8L7yv/iAp5Ph/WddNN/RfoXm/31YTfDH
        fB8IvuzcO4Yf8k9bHbJ+QkKK4Ny6Jt0izV34xwTrLXcvlVkWuu3u00oqB7xn3UAPEReP8ttP
        Um4QAg1cG0C9TaWM9tMI0K6XhYoCIc0lIPcjRgUiuBh0Mc9Fqx6S+xuiwIs2QvWEc8mounSm
        5jGjit5iQqsXoKZbd4MWipuFjnrXqm2WW4UqCw8SWtR1gHx5PUG/nvsZXQ90BLMANxW5cgaC
        fZKLRv4X73Ta0hw6deUOqdWRqK/787e+CV390BVcmVTmVNbM1dDF6PlgDdDqGHQ4t4vRdpiE
        mgp7qAIQ5RmX4BmjPeNozzjaM44+DnRnAbIJ6RkWwSnGxcpiVqxst9qUT6rd5gfaxQxfBl/q
        ltUBAoI68BMkTJHsvRJdsiE0xZ623So4rGY5K0N01AEESVMEK1kUjU0Ttv8pyvbv0mRImaLZ
        2V0HNxo4NWuzKGaK8nd1CoQmxDpeK+AkWbSI2zalZzjHZALq1eEhxgiHKKWJspDltJrV8zA7
        lPtQpYlK7kIVZx2Zgk3pamgzmAML+rwnSFjvLTlBGijJLonGaHa6auVUqzVL+hHUD6IhMIWz
        n/5X1InKs/kxp1+JIJSINwZCjXAKY5IxB+x9+7t++fIRy6qk6uczhPhrW6MoGLbrZuz8hmWZ
        N7a0hl3ObnQNDWcL7opB8okxsPbjy8TUbH+VfI/IExOiksJz9ZSUvzLM3DN6ZtAf+0/K7oii
        fG+ifVO2r3DdY3rBtc5ZO2rnxM/bMPvQ0EBijM01ElgUtT90b/fO1iUHOpL6V5goh1WI+4WU
        HcJX+zfP7PMDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBTYXQsIDIwMTktMTItMjEgYXQgMjA6MzcgKzAxMDAsIFBhdmVsIE1hY2hlayB3cm90ZToN
Cj4gSGkhDQo+IA0KPiA+IFF1Y2lrIGdyZXAgZm9yICdmb3JfZWFjaCcgb3IgJ2xpbnV4LGRlZmF1
bHQtdHJpZ2dlcicgb3INCj4gDQo+IHF1aWNrLg0KPiANCj4gPiBJZiBpbml0X2RhdGEgaXMgZ292
ZW4gYnV0IG5vIHN0YXJ0aW5nIHBvaW50IGZvciBub2RlIGxvb2t1cCAtIHRoZW4NCj4gDQo+IGlz
IGdpdmVuLg0KPiANCj4gPiAocGFyZW50KSBkZXZpY2UncyBvd24gRFQgbm9kZSBpcyB1c2VkLiBJ
ZiBubyBsZWQtY29tcGF0aWJsZSBpcw0KPiA+IGdpdmVuLA0KPiA+IHRoZW4gb2ZfbWF0Y2ggaXMg
c2VhcmNoZWQgZm9yLiBJZiBuZWl0aGVyIGxlZC1jb21wYXRpYmxlIG5vdA0KPiA+IG9mX21hdGNo
DQo+IA0KPiBub3Igb2ZfbWF0Y2guDQo+IA0KPiA+IGlzIGdpdmVuIHRoZW4gZGV2aWNlJ3Mgb3du
IG5vZGUgb3IgcGFzc2VkIHN0YXJ0aW5nIHBvaW50IGFyZSB1c2VkDQo+ID4gYXMNCj4gPiBzdWNo
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRp
bmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+IC0tLQ0KPiA+IA0KDQovL3NuaXANCg0KPiA+IEBA
IC0zMjIsNiArMzk4LDEwIEBAIGludCBsZWRfY2xhc3NkZXZfcmVnaXN0ZXJfZXh0KHN0cnVjdCBk
ZXZpY2UNCj4gPiAqcGFyZW50LA0KPiA+ICAJCQlsZWRfY2Rldi0+bmFtZSk7DQo+ID4gIA0KPiA+
ICAJcmV0dXJuIDA7DQo+ID4gK2Vycl9vdXQ6DQo+ID4gKwlpZiAobGVkX2NkZXYtPmZ3bm9kZV9v
d25lZCkNCj4gPiArCQlmd25vZGVfaGFuZGxlX3B1dChmdyk7DQo+ID4gKwlyZXR1cm4gcmV0Ow0K
PiA+ICB9DQo+IA0KPiBsZWRfY2Rldi0+Zndub2RlX293bmVkID0gZmFsc2UgaGVyZT8NCg0KSSBh
ZGRlZCB0aGlzIGFsdGhvdWdoIHdpdGggdGhlIGN1cnJlbnQgcGF0Y2ggaXQgc2hvdWxkIG5vdCBi
ZSByZXF1aXJlZC4NClRoZSBsZWRfY2Rldi0+Zndub2RlX293bmVkIGlzIGFueXdheXMgcmUtaW5p
dGlhbGl6ZWQgYXQgdGhlIGJlZ2lubmluZw0Kb2YgdGhlICdsZWRfY2xhc3NkZXZfcmVnaXN0ZXJf
ZXh0Jy4gSXQgd29uJ3QgZWF0IG1hbnkgY3ljbGVzIHRvIHplcm8gaXQNCmhlcmUgdGhvdWdoIHNv
IHBlcmhhcHMgaXQncyBzYWZlciB0byBqdXN0IGRvIGl0Lg0KDQpJIGFtIG5vdCBzdXJlIEkgY2Fu
IGZpbmlzaCBhbmQgdGVzdCB0aGUgcGF0Y2ggdjcgdG9kYXkuIFNvIGl0IG1heSBiZQ0KbmV4dCB5
ZWFyIHdoZW4gSSBhbSBhYmxlIHRvIHNlbmQgaXQuLi4gU29ycnkgZm9yIHRoZSBkZWxheSENCg0K
DQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg==
