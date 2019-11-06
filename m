Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB59EF1692
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 14:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfKFNFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 08:05:15 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:61590 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730530AbfKFNFP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 08:05:15 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-05-5dc2c507663f
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id A4.FC.08102.705C2CD5; Wed,  6 Nov 2019 14:05:11 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 14:05:06 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [RFC PATCH v3 04/15] dt-bindings: leds: ROHM BD71282 PMIC LED
 driver
Thread-Topic: [RFC PATCH v3 04/15] dt-bindings: leds: ROHM BD71282 PMIC LED
 driver
Thread-Index: AQHVkKgPi9BQDVNbQEqWWkMqaKUihqd86G+AgAErIAA=
Date:   Wed, 6 Nov 2019 13:05:05 +0000
Message-ID: <113d20653c41a311b0c5227eb5bbc6ad43d24c2c.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
         <37d85b2d-8fca-a998-95ae-61f0c049054d@ti.com>
In-Reply-To: <37d85b2d-8fca-a998-95ae-61f0c049054d@ti.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D11D9541D7CF324FBB493C0718F49F08@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEJsWRmVeSWpSXmKPExsVyYMXvTbrsRw/FGhy8amyx5OJVdov2d8vY
        Lb7MPcViMfXhEzaL+UfOsVp0n97CanF76wYWi/tfjzJafLvSwWQx5c9yJouPPfdYLTbP/8No
        cXnXHDaLrW/WMVocW32FzWLp9YtMFnOWnmCxuHjK1eLuqaNsFq17j7Bb/Lu2kcVB1GPNvDWM
        Hu9vtLJ7zFtT7bFz1l12j02rOtk87lzbw+Zx/MZ2Jo/p834yeaxY/Z3d4/MmuQCuKG6bpMSS
        suDM9Dx9uwTujHeTJjIW/NKu2NvWwN7A+EKri5GTQ0LARGJ3x2+2LkYuDiGBq4wSy1e8Z4Rw
        jjNKTJv+nrmLkYODTcBGousmO0iDiECcxLKLB8EamAW+s0t8vdjBCpIQFgiWeN33hwmiKERi
        3ok/UA1WEnNfzgOzWQRUJBZcmw1m8wr4Sdzf+IgJYtkVRonpP26wgCQ4gRreP+wGsxkFZCU6
        G96BDWUWEJfY9Ow7K8TZAhJL9pxnhrBFJV4+/gcVV5LY+/MhC8jRzAKaEut36UO0OkjsftPG
        DGErSkzpfgh1g6DEyZlPWCYwis1CsmEWQvcsJN2zkHTPQtK9gJF1FaNEbmJmTnpiSaqhXlFq
        qV5RfkYukErOz93ECEkzX3Yw/j/keYiRiYPxEKMkB5OSKK/xoUOxQnxJ+SmVGYnFGfFFpTmp
        xYcYJTiYlUR4Y/oOxgrxpiRWVqUW5cOkpDlYlMR51R9OjBUSANmVnZpakFoEk5Xh4FCS4FUE
        GSpYlJqeWpGWmVOCkGbi4AQZziUlUpyal5JalFhakhEPSiDxxcAUApLiAdrbBtLOW1yQmAsU
        hWg9xajNMeHl3EXMHEfmLl3ELMSSl5+XKiXOe2wrUKkASGlGaR7coleM4hyMSsK8/SCDeIAZ
        B27OK6AVTEArfB7vA1lRkoiQkmpg5Nh/qt9DQa7M3P/Br4SbLNFWHaaKYhp7XzWfXstc0K93
        S/f2fR3d1ZNPCk1ZPeF0Z2LaJZnaTFdZte3T5zaenr2+6q6C4D+3o/HH/r2aMX8rb8LZrK44
        s9lW5+oVdUwuzvVlDY3qib22RL4sfv+yloVMXGZLL/NnbQlbebN6P4vzCxvLmjmLlViKMxIN
        tZiLihMBXTiQxfUDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gRGFuLA0KDQpUaGFua3MgZm9yIHRoZSBjaGVjayBvbmNlIGFnYWluIQ0KDQpPbiBUdWUs
IDIwMTktMTEtMDUgYXQgMTM6MTQgLTA2MDAsIERhbiBNdXJwaHkgd3JvdGU6DQo+IE1hdHRpDQo+
IA0KPiBPbiAxMS8xLzE5IDY6MzIgQU0sIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBEb2N1
bWVudCBST0hNIEJENzE4MjggUE1JQyBMRUQgZHJpdmVyIGRldmljZSB0cmVlIGJpbmRpbmdzLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVu
QGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+IENoYW5nZXMgZnJvbSB2MiAt
IG5ldyBwYXRjaA0KPiA+IA0KPiA+ICAgLi4uL2JpbmRpbmdzL2xlZHMvcm9obSxsZWRzLWJkNzE4
MjgueWFtbCAgICAgIHwgNDYNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvcm9obSxsZWRzLWJkNzE4Mjgu
eWFtbA0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbGVkcy9yb2htLGxlZHMtDQo+ID4gYmQ3MTgyOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvcm9obSxsZWRzLQ0KPiA+IGJkNzE4MjgueWFtbA0KPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5kOGFlYWM5OTEx
ZWYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2xlZHMvcm9obSxsZWRzLWJkNzE4MjgueWFtbA0KPiA+IEBAIC0wLDAgKzEsNDYg
QEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICslWUFNTCAx
LjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbGVk
cy9yb2htLGxlZHMtYmQ3MTgyOC55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBST0hNIEJE
NzE4MjggUG93ZXIgTWFuYWdlbWVudCBJbnRlZ3JhdGVkIENpcmN1aXQgTEVEIGRyaXZlcg0KPiA+
ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBKYWNlayBBbmFzemV3c2tpIDxqYWNlay5h
bmFzemV3c2tpQGdtYWlsLmNvbT4NCj4gPiArICAtIFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6
Pg0KPiA+ICsgIC0gRGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+DQo+ID4gKyAgLSBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiA+ICsgIC0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1
dGxhbmRAYXJtLmNvbT4NCj4gSSBiZWxpZXZlIHlvdSBhcmUgdGhlIG1haW50YWluZXIgb2YgdGhp
cyBkcml2ZXIgbm90IHRoZSBtYWludGFpbmVycw0KDQpSaWdodC4gVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGF0IG91dC4NCg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwNCj4gPiArICBUaGlzIG1v
ZHVsZSBpcyBwYXJ0IG9mIHRoZSBST0hNIEJENzE4MjggTUZEIGRldmljZS4gRm9yIG1vcmUNCj4g
PiBkZXRhaWxzDQo+ID4gKyAgc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvcm9obSxiZDcxODI4LQ0KPiA+IHBtaWMueWFtbC4NCj4gPiArDQo+ID4gKyAgVGhlIExFRCBj
b250cm9sbGVyIGlzIHJlcHJlc2VudGVkIGFzIGEgc3ViLW5vZGUgb2YgdGhlIFBNSUMgbm9kZQ0K
PiA+IG9uIHRoZSBkZXZpY2UNCj4gPiArICB0cmVlLg0KPiA+ICsNCj4gPiArICBUaGUgZGV2aWNl
IGhhcyB0d28gTEVEIG91dHB1dHMgcmVmZXJyZWQgYXMgR1JOTEVEIGFuZCBBTUJMRUQgaW4NCj4g
PiBkYXRhLXNoZWV0Lg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgY29uc3Q6IHJvaG0sYmQ3MTgyOC1sZWQNCj4gPiArDQo+ID4gK3BhdHRlcm5Q
cm9wZXJ0aWVzOg0KPiA+ICsgICJebGVkLVsxLTJdJCI6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBQcm9wZXJ0aWVzIGZvciBhIHNpbmds
ZSBMRUQuIE5vZGVzIG11c3QgYmUgbmFtZWQgYXMgbGVkLTENCj4gPiBhbmQgbGVkLTIuDQo+IA0K
PiBXaHkgaXMgdGhpcyByZXF1aXJlZD8gIENhbid0IHdlIHVzZSB0aGUgcmVnIGFzIHRoZSBudW1i
ZXIgYW5kIHRoZW4NCj4gd2UgDQo+IGNhbiB1c2Ugc3RhbmRhcmQgbm9kZSBsYWJlbHMNCg0KVGhp
cyB3YXMgcmVsYXRlZCB0byBteSBpZGVhIG9mIHVzaW5nIHRoZSBub2RlLW5hbWVzIGFzIHVuaXF1
ZSBrZXlzLg0KUGxlYXNlIHNlZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvY292ZXIu
MTU3MjM1MTc3NC5naXQubWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tLw0KDQpXaGF0
IHdvdWxkIHlvdSBleHBlY3QgdGhlIHJlZyA9IDw+OyB0byBkZXNjcmliZSBmcm9tIEhXPw0KDQo+
IGxpa2UgbGVkQDxyZWcgdmFsdWU+LiAgVGhlbiB3ZSBjYW4gY2hlY2sgaW4gdGhlIGNvZGUgdG8g
bWFrZSBzdXJlDQo+IHRoYXQgDQo+IHRoZSBvdXRwdXQgaXMgbm90IG91dCBvZiBib3VuZHMuDQo+
IA0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgIyRyZWY6ICJjb21tb24ueWFtbCMi
DQo+ID4gKyAgICAgIGZ1bmN0aW9uOg0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsg
ICAgICAgICAgUHVycG9zZSBvZiBMRUQgYXMgZGVmaW5lZCBpbiBkdC1iaW5kaW5ncy9sZWRzL2Nv
bW1vbi5oDQo+ID4gKyAgICAgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3N0cmluZyINCj4gPiArICAgICAgY29sb3I6DQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246
DQo+ID4gKyAgICAgICAgICBMRUQgY29sb3VyIGFzIGRlZmluZWQgaW4gZHQtYmluZGluZ3MvbGVk
cy9jb21tb24uaA0KPiANCj4gcy9jb2xvdXIvY29sb3INCg0KVGhhdCBkZXBlbmRzIG9uIHlvdXIg
bG9jYXRpb24gOikNCg0KPiBCdXQgYWdhaW4gSSBiZWxpZXZlIGl0IGlzIGluZGljYXRlZCBhYm92
ZSB0aGF0IHRoZSBMRURzIGFyZSBlaXRoZXINCj4gZ29pbmcgDQo+IHRvIGJlIGdyZWVuIG9yIGFt
YmVyLiAgVW5sZXNzIHRoZXkgY2FuIGJlIGFueSBjb2xvci4NCg0KVGhpcyB3YXMgbXkgb3JpZ2lu
YWwgcmVhc29uIGZvciBvbWl0dGluZyB0aGUgRFQgZm9yIEJENzE4MjggTEVEcw0KYWx0b2dldGhl
ci4gTEVEcyBhcmUgZXhwZWN0ZWQgdG8gYmUgZ3JlZW4gYW5kIGFtYmVyIC0gYnV0IGl0IGlzIHRy
dWUNCnRoYXQgUE1JQyBjYW4gbm90IGVuc3VyZSB0aGVyZSB3aWxsIGJlIG5vIG90aGVyIGNvbG91
cnMuDQoNCj4gQXJlIHRoZXJlIHBsYW5zIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBjb2xvciBpcyBl
aXRoZXIgZ3JlZW4gb3IgYW1iZXINCj4gaW4gDQo+IHRoZSBjb2RlPyAgSSBkb24ndCBzZWUgYSBw
YXRjaCBmb3IgdGhlIGNvZGUgaW4gdGhpcyBzZXJpZXMNCg0KWWVzLiBBcyBJIHdyb3RlIGluIGNv
dmVyLWxldHRlciwgdGhlIExFRCBkcml2ZXIgaXMgcGVuZGluZyB1bnRpbCBJIHNlZQ0KaG93IHRo
ZSBSRkMgZm9yIGFkZGluZyBMRUQgbm9kZSBmaW5kaW5nIGFuZCBzb21lIG1vcmUgY29tbW9uIHBy
b3BlcnR5DQpwYXJzaW5nIHRvIExFRCBjb3JlIGlzIHJlY2VpdmVkIGJ5IG90aGVycy4gKEFsdGhv
dWdoIEkgZG8gdW5kZXJzdGFuZCBpZg0KeW91IGRpZG4ndCByZWFkIHRoZSBjb3Zlci1sZXR0ZXIu
IEl0J3MgcXVpdGUgYSBidW5jaCBvZiB0ZXh0IGFuZA0KcmVhZGluZyBpdCBvdmVyIGFuZCBvdmVy
IGFnYWluIGlzIG5vIGZ1bikuDQoNCj4gDQo+ID4gKyAgICAgICAgJHJlZjogIi9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+
ICsgIC0gY29tcGF0aWJsZQ0KPiANCj4gSXMgdGhlcmUgYW4gZXhhbXBsZSBvZiB0aGUgbm9kZSBh
bmQgcHJvcGVydGllcz8NCg0KWWVzLCBpbiBNRkQgZG9jLg0KDQpCciwNCglNYXR0aSBWYWl0dGlu
ZW4NCg==
