Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEC9F72C5
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2019 12:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfKKLHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Nov 2019 06:07:51 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:60974 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfKKLHv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Nov 2019 06:07:51 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-3b-5dc941036c88
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id EA.5B.08102.30149CD5; Mon, 11 Nov 2019 12:07:47 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 11 Nov 2019 12:07:35 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
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
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [RFC PATCH v3 05/15] mfd: input: bd71828: Add power-key support
Thread-Topic: [RFC PATCH v3 05/15] mfd: input: bd71828: Add power-key support
Thread-Index: AQHVkKg5v/4Zzs7MvEOvRwnttfw/rKeFzDiAgAACKwA=
Date:   Mon, 11 Nov 2019 11:07:34 +0000
Message-ID: <c28ce3e2f2fbfc26b531cea423feb0dcfbfdb8ef.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <d7be7969b9fed57e7790811ff90b9a2b4b6478bb.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <20191111105955.GG3218@dell>
In-Reply-To: <20191111105955.GG3218@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B338E0C7B6F16942848F9913FA41CE95@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0wUVxiGPTOzMwdkzLiAHAE1TkqMWi8ktp5YtWBqHIkaExITTVYcZGSJ
        7CzOLrpeflBa2rqo0aoRVy7WLIXKRnQRBeKtiLqLVxQWGlHBqlExXpAiW5V2hkHh1/nOed/3
        e74f34Gk8SEdDTNku6TIYiZPh1IXyt+fmEYm+k0zf70NsbuphcE/v/ydwT1FjRTe3/mIxiUN
        Nww4/+pJA75bfZzCD/65BHBv8y8E3vehjMBvdtw34KqSDwDfqSukcfWLYwBfrmimcWlrE4EL
        S30UbmpciO81XqJx3tkGBvcHTlAJkYKn2AOEV215jFDs2SrUuu4xgvfodlpoD5yhhSttpwnh
        QHGQEMor3jHCW+/45aGrRs5NFe0bkzPS5Rnz14w0V/mbQJY31tHRUQhyQHOME4RAxM1CBX0e
        xglCoZFrAaiju9SgX3wAlXVVAyeAkObmIudfjBaI4OKR2/eY0jwk54aoItBGakI4twS5rx0D
        umkp6jr1fjAwB53O9Q94KC4O+Z35hFaz3DLkC5wfhF0E6HWgZMAUwk1G13P3DpgANw5tz3k5
        UJNcFPI+eWfQx+aQ+8xNUq8j0bO/+wffeXQ22ElpQ5Nqn8q6GXo0AbVW9VJ6PRHty+9k9BlG
        I//BR9RuMMY1jOAaSruGpV3D0q5h6cPAcBQgi5iRmS7apfjpipQ9XbGaLeqx1mrxAn1nemrA
        f/WL6wEBQT0YCwk+kv1Y6TMZR6Va0zabRZs5RcnOlGz1AEGSj2BrHKrGpombt0iK9ZMUAyk+
        ip3Uucdk5DTWeknKkpRPaiyEPGLffus3GUcrUrrkWJeRaR+SCRiiNQ+NjrBJcpqkiNl2c4q2
        ICk2dUM0KUzlEglqnLVliRb1VY82gqlw97OiIyRsKCo9Qhop2SpL0VFsu0biNKs5W/4Meg6i
        IODD2S5NDVM/zuc+z1UEoSIuXL+sIezikBSdA3Lq/vAJm3a1e54SwZLghpO5ya+Wftd9l/4q
        2CqfS1r57zJHOP7+oXut5Zsvf4jpW9SwcsEipaCgWJrvbo01XaF/jJsXEBKDt/ocSf1GfsXF
        qb6dEyrEjR97/uzOW957SPnpi5avJ5XLqbNTe1zXRtTWrk7vf0yv2zNvxzY28beasMpknrKZ
        xfgppGIT/weaDKdo9QMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBNb24sIDIwMTktMTEtMTEgYXQgMTA6NTkgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gRnJpLCAwMSBOb3YgMjAxOSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBVc2UgZ3Bpb19rZXlzIHRvIHNlbmQgcG93ZXIgaW5wdXQtZXZlbnQgdG8gdXNlci1z
cGFjZSB3aGVuIHBvd2VyDQo+ID4gYnV0dG9uIChzaG9ydCkgcHJlc3MgaXMgZGV0ZWN0ZWQuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5A
Zmkucm9obWV1cm9wZS5jb20+DQo+ID4gLS0tDQo+ID4gDQo+ID4gQ2hhbmdlcyBmcm9tIHYyIC0g
Tm8gY2hhbmdlcw0KPiA+IA0KPiA+ICBkcml2ZXJzL21mZC9yb2htLWJkNzE4MjguYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvcm9obS1iZDcxODI4
LmMgYi9kcml2ZXJzL21mZC9yb2htLQ0KPiA+IGJkNzE4MjguYw0KPiA+IGluZGV4IGI3ZGU3OWUx
ZmNkYi4uZjc3YmExZWMzZTk5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWZkL3JvaG0tYmQ3
MTgyOC5jDQo+ID4gKysrIGIvZHJpdmVycy9tZmQvcm9obS1iZDcxODI4LmMNCj4gPiBAQCAtNCw3
ICs0LDkgQEANCj4gPiAgLy8NCj4gPiAgLy8gUk9ITSBCRDcxODI4IFBNSUMgZHJpdmVyDQo+ID4g
IA0KPiA+ICsjaW5jbHVkZSA8bGludXgvZ3Bpb19rZXlzLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51
eC9pMmMuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2lucHV0Lmg+DQo+ID4gICNpbmNsdWRlIDxs
aW51eC9pbnRlcnJ1cHQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvcG9ydC5oPg0KPiA+ICAj
aW5jbHVkZSA8bGludXgvaXJxLmg+DQo+ID4gQEAgLTE1LDYgKzE3LDE4IEBADQo+ID4gICNpbmNs
dWRlIDxsaW51eC9yZWdtYXAuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ID4g
IA0KPiA+ICtzdGF0aWMgc3RydWN0IGdwaW9fa2V5c19idXR0b24gYnV0dG9uID0gew0KPiA+ICsJ
LmNvZGUgPSBLRVlfUE9XRVIsDQo+ID4gKwkuZ3BpbyA9IC0xLA0KPiA+ICsJLnR5cGUgPSBFVl9L
RVksDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGdwaW9fa2V5c19wbGF0Zm9y
bV9kYXRhIGJkNzE4MjhfcG93ZXJrZXlfZGF0YSA9IHsNCj4gPiArCS5idXR0b25zID0gJmJ1dHRv
biwNCj4gPiArCS5uYnV0dG9ucyA9IDEsDQo+ID4gKwkubmFtZSA9ICJiZDcxODI4LXB3cmtleSIs
DQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIHJ0Y19p
cnFzW10gPSB7DQo+ID4gIAlERUZJTkVfUkVTX0lSUV9OQU1FRChCRDcxODI4X0lOVF9SVEMwLCAi
YmQ3MTgyOC1ydGMtYWxtLTAiKSwNCj4gPiAgCURFRklORV9SRVNfSVJRX05BTUVEKEJENzE4Mjhf
SU5UX1JUQzEsICJiZDcxODI4LXJ0Yy1hbG0tMSIpLA0KPiA+IEBAIC0zNiw2ICs1MCwxMCBAQCBz
dGF0aWMgc3RydWN0IG1mZF9jZWxsIGJkNzE4MjhfbWZkX2NlbGxzW10gPSB7DQo+ID4gIAkJLm5h
bWUgPSAiYmQ3MDUyOC1ydGMiLA0KPiA+ICAJCS5yZXNvdXJjZXMgPSBydGNfaXJxcywNCj4gPiAg
CQkubnVtX3Jlc291cmNlcyA9IEFSUkFZX1NJWkUocnRjX2lycXMpLA0KPiA+ICsJfSwgew0KPiA+
ICsJCS5uYW1lID0gImdwaW8ta2V5cyIsDQo+ID4gKwkJLnBsYXRmb3JtX2RhdGEgPSAmYmQ3MTgy
OF9wb3dlcmtleV9kYXRhLA0KPiA+ICsJCS5wZGF0YV9zaXplID0gc2l6ZW9mKGJkNzE4MjhfcG93
ZXJrZXlfZGF0YSksDQo+ID4gIAl9LA0KPiA+ICB9Ow0KPiA+ICANCj4gPiBAQCAtMjg4LDkgKzMw
NiwxOSBAQCBzdGF0aWMgaW50IGJkNzE4MjhfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+
ID4gKmkyYywNCj4gPiAgCQlkZXZfZXJyKCZpMmMtPmRldiwgIkZhaWxlZCB0byBhZGQgSVJRIGNo
aXBcbiIpOw0KPiA+ICAJCXJldHVybiByZXQ7DQo+ID4gIAl9DQo+ID4gKw0KPiANCj4gVGhpcyBz
aG91bGQgYmUgZml4ZWQgaW4gdGhlIGxhc3QgcGF0Y2guDQo+IA0KPiA+ICAJZGV2X2RiZygmaTJj
LT5kZXYsICJSZWdpc3RlcmVkICVkIElSUXMgZm9yIGNoaXBcbiIsDQo+ID4gIAkJYmQ3MTgyOF9p
cnFfY2hpcC5udW1faXJxcyk7DQo+ID4gIA0KPiA+ICsJcmV0ID0gcmVnbWFwX2lycV9nZXRfdmly
cShpcnFfZGF0YSwgQkQ3MTgyOF9JTlRfU0hPUlRQVVNIKTsNCj4gPiArDQo+IA0KPiBSZW1vdmUg
dGhpcyBlbXB0eSBsaW5lLg0KPiANCj4gPiArCWlmIChyZXQgPCAwKSB7DQo+ID4gKwkJZGV2X2Vy
cigmaTJjLT5kZXYsICJGYWlsZWQgdG8gZ2V0IHRoZSBwb3dlci1rZXkNCj4gPiBJUlFcbiIpOw0K
PiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJYnV0dG9uLmlycSA9IHJl
dDsNCj4gPiArDQo+IA0KPiBPbmNlIGZpeGVkLCBwbGVhc2UgYXBwbHkgbXk6DQo+IA0KPiBGb3Ig
bXkgb3duIHJlZmVyZW5jZToNCj4gICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPg0KPiANCg0KVGhhbmtzIGZvciBjaGVja2luZyB0aGlzIDopIEknbGwg
YXBwbHkgZml4ZXMgaW4gcGF0Y2ggdjQuDQoNCg0KDQo=
