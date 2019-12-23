Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE64C129444
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Dec 2019 11:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLWKgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Dec 2019 05:36:06 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:53894 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfLWKgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Dec 2019 05:36:06 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-f0-5e009893a6a7
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 48.78.08102.398900E5; Mon, 23 Dec 2019 11:36:03 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 23 Dec 2019 11:35:51 +0100
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
Thread-Index: AQHVtlJMyatI9ieot0i0jk0Qmtw3YKfE7uMAgAKNQAA=
Date:   Mon, 23 Dec 2019 10:35:51 +0000
Message-ID: <c5988a961ede536114d1f9eff449fd8f91edb49b.camel@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <c7abf8d15ea54fee504fbec5666d013c26d3b62a.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <20191221193758.GJ32732@amd>
In-Reply-To: <20191221193758.GJ32732@amd>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.203.188.194]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2B81C7D1190894B9384DB2CDA3B1ED2@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0gUURjFuzOzs1drYtw0b9uDHHrQy5KMLiFR0GOC6EEIIeU25uRauisz
        a1hSSCW1JmVUZIuuZlpharVluWmPNbds7SWlFdlDEkuLJDKlLG1mp9J/Zs7c8/3OmYFvIGlo
        pY0w0WITJYuQxNGB1O1zfa5ZR3OHxc45dXcmLm5s0uP9X87ocXe+j8LHW9toXFD3SIcPNlzR
        4VeVFyn89rsX4J5nBwh87NdZAn/NfqPDlwt+Afz0eh6NKz9XAHz3/DMalzxvJHBeST2FG31L
        8Wufl8aZN+r0uL/5ErUohC9zlgG+60WmnneWpfNux2s97yq103xLcw3N33txjeBPOH8Q/Lnz
        vXr+m2vCmsCY4VFxgm37usQEy+yFm4abPZkxKS1BadWePl0GKAzKAgEQsZHI+/kBmQUCoYFt
        AuhWz6G/D/UADeT6qCwAIc1GoayXehUIZsPQ5Ww7rc6Q7FWI3O1NhDozio1F185O0mZMqOJj
        AaHpBSi/q8gfQ7GTUce7Zapk2FWoYv96rekOQM7sNv94ADsN3XG3+KsAOx7ZM774z0k2FLna
        e3XaO7OouOYxqekQ1PG+X6dmIpZDNwciVUkqMReuz9bkIuSuMmohYejYwVZ/OMMGofsn26gc
        MNoxJN8xCDsGYccQ2DEELgS6UoCShcSkBMEmRoRLYmq4ZDUnK7fN1mQX0JaluwoM1K6oBQQE
        tWAMJLgQhlsyLNYwMs4av8MsyGaTlJokyrUAQZILZqp3/d5oYOKFHTtFyfrPGgspLpSZ2npk
        o4FVu7aJYooo/XPHQcghJu2EEhokiQli2pbEJNugTcAANTzQGCyLlnhRElJtZpO6GSZZWQ3V
        GqH0HlFxRk4RkpVTDfWBCJjTkV9Ewrr8EuWac7TrNGmgLFaLaAxl5qoAqwLmVMv/uk4QCgE3
        ipmnuiOU/+Z/WqdSRChFD8f3Kx8o24RBy5gBFnSXi1s7PUUR375+aonyVs03Rds9OWRae2TV
        WtqT/qS5ptf9YfHbyac/Oqr3pe9p3At326yHV+yTtl8omvFg4KcMY35XVhDLnWvzttrbN/Ty
        fZ6esIsNxQnZE6I355aejDZPqo+eNuPS05UPG8oXR3rdDEl3H189pXhX+PS4ibico2SzEDGd
        lGThD86Ow1b0AwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gUGF2ZWwsDQoNCk9uIFNhdCwgMjAxOS0xMi0yMSBhdCAyMDozNyArMDEwMCwgUGF2ZWwg
TWFjaGVrIHdyb3RlOg0KPiBIaSENCj4gDQo+ID4gUXVjaWsgZ3JlcCBmb3IgJ2Zvcl9lYWNoJyBv
ciAnbGludXgsZGVmYXVsdC10cmlnZ2VyJyBvcg0KPiANCj4gcXVpY2suDQo+IA0KPiA+IElmIGlu
aXRfZGF0YSBpcyBnb3ZlbiBidXQgbm8gc3RhcnRpbmcgcG9pbnQgZm9yIG5vZGUgbG9va3VwIC0g
dGhlbg0KPiANCj4gaXMgZ2l2ZW4uDQo+IA0KPiA+IChwYXJlbnQpIGRldmljZSdzIG93biBEVCBu
b2RlIGlzIHVzZWQuIElmIG5vIGxlZC1jb21wYXRpYmxlIGlzDQo+ID4gZ2l2ZW4sDQo+ID4gdGhl
biBvZl9tYXRjaCBpcyBzZWFyY2hlZCBmb3IuIElmIG5laXRoZXIgbGVkLWNvbXBhdGlibGUgbm90
DQo+ID4gb2ZfbWF0Y2gNCj4gDQo+IG5vciBvZl9tYXRjaC4NCj4gDQo+ID4gaXMgZ2l2ZW4gdGhl
biBkZXZpY2UncyBvd24gbm9kZSBvciBwYXNzZWQgc3RhcnRpbmcgcG9pbnQgYXJlIHVzZWQNCj4g
PiBhcw0KPiA+IHN1Y2guDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVu
IDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gLS0tDQo+ID4gDQo+ID4g
Tm8gY2hhbmdlcyBzaW5jZSB2Ng0KPiA+IA0KPiA+ICBkcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMg
fCAgOTkgKysrKysrKysrKysrKy0tDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWQtY29yZS5jICB8IDI1
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+IC0tLS0NCj4gPiAgaW5j
bHVkZS9saW51eC9sZWRzLmggICAgIHwgIDk0ICsrKysrKysrKysrKy0tDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMzg1IGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQ0KPiANCj4gUXVpdGUg
YSBsb3Qgb2YgY29kZSBhZGRlZCBoZXJlLiBDYW4gSSB0cnVzdCB5b3UgdGhhdCB3ZSB3ZSdsbCBk
ZWxldGUNCj4gMzIwIGxpbmVzIGJ5IGNvbnZlcnRpbmcgZHJpdmVyIG9yIHR3bz8NCg0KSSBiZWxp
ZXZlIHdlIGRvLiBCZXNpZGVzIGJ1bmNoIG9mIHRoZSBsaW5lcyBhcmUgY29tbWVudHMuIEkgZG9u
J3QgdGhpbmsNCkkgYWN0dWFsbHkgYWRkZWQgbXVjaCBvZiBuZXcgdGhpbmdzIGhlcmUuIEFuZCBv
bmUgdGhpbmcgd2Ugc2hvdWxkIG5vdA0Kb3Zlcmxvb2sgaXMgdGhlIGRyaXZlcnMgdG8gY29tZS4g
SSBiZWxpZXZlIGFtb3VudCBvZiBMRUQgZGV2aWNlcyB3ZQ0Kd2lsbCBiZSBnZXR0aW5nIGRyaXZl
cnMgZm9yIHdpbGwgaW5jcmVhc2UuIDMyMCBsaW5lcyBpcyBwZWFudXRzIGlmIHdlDQpnZXQgNSBu
ZXcgZHJpdmVycyBhbGwgaW1wbGVtZW50aW5nIHRoZSBzYW1lIERUIHBhcnNpbmcgbG9vcC4NCg0K
QW55d2F5cywgSSB3aWxsIGxvb2sgYWxsIG9mIHRoZSBjb21tZW50cyB0aG9yb3VnaGx5IGR1cmlu
ZyBuZXh0IEZyaWRheS4NCkkgYW0gY3VycmVudGx5IGhhdmluZyBhIHZhY2F0aW9uIGFuZCBJIG1p
Z2h0IGdldCBzdHJhbmdsZWQgYnkgbXkgZmFtaWx5DQppZiBJIHNwZW5kIGl0IHN0YXJpbmcgYXQg
dGhlIGNvbXB1dGVyIHhEDQoNClRoYW5rcyBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIGxvb2sgYXQg
dGhpcyEgSSBkbyBhcHByZWNpYXRlIHRoZSBlZmZvcnQhDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5l
bg0K
