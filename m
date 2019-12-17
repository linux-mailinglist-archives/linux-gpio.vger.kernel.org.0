Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F6C1227C6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 10:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLQJkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 04:40:01 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:51374 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQJkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 04:40:01 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-21-5df8a26d82b6
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 52.A5.08102.D62A8FD5; Tue, 17 Dec 2019 10:39:57 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 17 Dec 2019 10:39:52 +0100
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
Subject: Re: [PATCH v6 05/15] mfd: bd71828: Support ROHM BD71828 PMIC - core
Thread-Topic: [PATCH v6 05/15] mfd: bd71828: Support ROHM BD71828 PMIC - core
Thread-Index: AQHVsAdUq9cAZXeTxE+pdQm1dVrUwKe87/aAgAEbEgA=
Date:   Tue, 17 Dec 2019 09:39:51 +0000
Message-ID: <5593db6b3328c0a1a7069d839f5c777b4b3822b6.camel@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <252de5646fedfec7c575269843a47091fe199c79.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <20191216164641.GC18955@dell>
In-Reply-To: <20191216164641.GC18955@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BDD41CC073047438B16BC7322087B90@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wbZRjHee+udwfjlqMU+9oJ0VvMZIubGDPfGaaLwexMdC7xR6KG4E1O
        SqQtuba64Y9gGEygIWN0GivlZ9EJFbZjuMlAlqYwVtwMymjHD00dY4IbBMTCYDJ7lA3+er95
        vu/n+T5v8rw0rpYpHZ1ttIiSUcjhyBji/Ikl+XFD3UL6E5M2HXL1X6HQkalvKPTfsR4KzTl9
        BDoeHCPR2PkjAFV7L6tQad9pFSqobyHRcNtJAv3xbzdAoYHPMWS/8y2GZmy/q1BtkYtArdV3
        APqtvZJEbTebAeppGiBRg78fQ5UNvQSani3GUL/vBXTcN0WhUV83iQr6Azgq7PRSaHnwFIHK
        Lu/dk8i7q9yAX1o8BvjpQCHFV7k/4n90jFK83FhM8iODHSTf5XRTfH1ZhYoP/VxO8OO1LQR/
        IXAG47+suo3xLTYv4E80zVP8P3LSfvatDakHBMsHr2ZnGXc8+84Gvc11Q5U7lHawaGgEzwcL
        z5eAaBqyT8EZ2zAoATG0mr0C4PdjhZhiqNleAAfmHigBNE2yqbDkKqWUNWwKdPVeJxSNszU0
        LO9gFTaKlXF4ZnlEpRjx7Evw0vXRVeBlWOlvxSL6GXhzeBpXNME+Coua3St3GHYf/Lumh4wM
        4QWw73DFChDNboVdFW0rTQGbCIvzp7BIshbK4/OqyAtY6Or4BY/oBDhxbXm1zsHO20FCeQDO
        JsOW9h0RdA9cWvaQEf0ItJcGV2eIgxe/GiOOAq1jXYJjjXasox3raMc6ugaoGgE0CNk5WYJF
        TNkuidbtkklvCB/vmgwyiOzg3Flw1/OiB2A08IAHaYxLYGL3LqSrNx4wZR7SC2Z9hmTNEc0e
        AGmc0zBnH55PVzOZwqE8UTLdszbRBKdltgTL09WskvW+KOaK0j33IZrmIJNcG24aJ4lZ4sH3
        snMsazZGRyvNY3Qas2jMFCXBatFnKLuSYQ4vi2LFhnM31oRxxpwrGMLVCOoD2+ijE846nPY6
        G+pwNWE0GUWdltmmJLHKVb3VeD9oEmhpwMUzuxU3NvwR7/eZDEdg4Ygn94WUCIuwZunyQfvV
        am1X3i5/89u3mAvuppm8gP9u2Wnvub8ak3dH7frCz3GfBd7Y2R069+ZQmnV802Kns0C+tv+7
        U3Nph3c+V1r2Ot86fPGTkx/an076+Gt5S9wr3tkfoip7P91c3qepT7SbFn9N2uwI0rM3Jh7z
        vXarLcaeUZhqaUwYDP2pufRTxSCI5wizXkjZiktm4X+fgVNhRQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBNb24sIDIwMTktMTItMTYgYXQgMTY6NDYgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gV2VkLCAxMSBEZWMgMjAxOSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBCRDcxODI4R1cgaXMgYSBzaW5nbGUtY2hpcCBwb3dlciBtYW5hZ2VtZW50IElDIGZv
ciBiYXR0ZXJ5LXBvd2VyZWQNCj4gPiBwb3J0YWJsZQ0KPiA+IGRldmljZXMuIFRoZSBJQyBpbnRl
Z3JhdGVzIDcgYnVjayBjb252ZXJ0ZXJzLCA3IExET3MsIGFuZCBhIDE1MDAgbUENCj4gPiBzaW5n
bGUtY2VsbCBsaW5lYXIgY2hhcmdlci4gQWxzbyBpbmNsdWRlZCBpcyBhIENvdWxvbWIgY291bnRl
ciwgYQ0KPiA+IHJlYWwtdGltZQ0KPiA+IGNsb2NrIChSVEMpLCAzIEdQTy9yZWd1bGF0b3IgY29u
dHJvbCBwaW5zLCBIQUxMIGlucHV0IGFuZCBhIDMyLjc2OA0KPiA+IGtIeg0KPiA+IGNsb2NrIGdh
dGUuDQo+ID4gDQo+ID4gQWRkIE1GRCBjb3JlIGRyaXZlciBwcm92aWRpbmcgaW50ZXJydXB0IGNv
bnRyb2xsZXIgZmFjaWxpdGllcyBhbmQNCj4gPiBpMmMNCj4gPiBhY2Nlc3MgdG8gc3ViIGRldmlj
ZSBkcml2ZXJzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0
dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+IENoYW5n
ZXMgc2luY2UgdjU6DQo+ID4gLSBObyBjaGFuZ2VzDQo+ID4gDQo+ID4gIGRyaXZlcnMvbWZkL0tj
b25maWcgICAgICAgICAgICAgIHwgIDE1ICsrDQo+ID4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAg
ICAgICAgICAgIHwgICAyICstDQo+ID4gIGRyaXZlcnMvbWZkL3JvaG0tYmQ3MTgyOC5jICAgICAg
IHwgMzE5ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgvbWZkL3Jv
aG0tYmQ3MTgyOC5oIHwgNDI1DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ICBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaCB8ICAgMSArDQo+ID4gIDUgZmls
ZXMgY2hhbmdlZCwgNzYxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3JvaG0tYmQ3MTgyOC5jDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9yb2htLWJkNzE4MjguaA0KPiANCj4gQ291cGxlIG9m
IHNtYWxsIG5pdHMuICBPbmNlIGZpeGVkLCBwbGVhc2UgYXBwbHkgbXk6DQo+IA0KPiBGb3IgbXkg
b3duIHJlZmVyZW5jZToNCj4gICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBi
L2RyaXZlcnMvbWZkL0tjb25maWcNCj4gPiBpbmRleCA0MjA5MDA4NTIxNjYuLmMzYzk0MzJlZjUx
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21mZC9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVy
cy9tZmQvS2NvbmZpZw0KPiA+IEBAIC0xOTA2LDYgKzE5MDYsMjEgQEAgY29uZmlnIE1GRF9ST0hN
X0JENzA1MjgNCj4gPiAgCSAgMTAgYml0cyBTQVIgQURDIGZvciBiYXR0ZXJ5IHRlbXBlcmF0dXJl
IG1vbml0b3IgYW5kIDFTDQo+ID4gYmF0dGVyeQ0KPiA+ICAJICBjaGFyZ2VyLg0KPiA+ICANCj4g
PiArY29uZmlnIE1GRF9ST0hNX0JENzE4MjgNCj4gPiArCXRyaXN0YXRlICJST0hNIEJENzE4Mjgg
UG93ZXIgTWFuYWdlbWVudCBJQyINCj4gPiArCWRlcGVuZHMgb24gSTJDPXkNCj4gPiArCWRlcGVu
ZHMgb24gT0YNCj4gPiArCXNlbGVjdCBSRUdNQVBfSTJDDQo+ID4gKwlzZWxlY3QgUkVHTUFQX0lS
UQ0KPiA+ICsJc2VsZWN0IE1GRF9DT1JFDQo+ID4gKwloZWxwDQo+ID4gKwkgIFNlbGVjdCB0aGlz
IG9wdGlvbiB0byBnZXQgc3VwcG9ydCBmb3IgdGhlIFJPSE0gQkQ3MTgyOCBQb3dlcg0KPiA+ICsJ
ICBNYW5hZ2VtZW50IElDLiBCRDcxODI4R1cgaXMgYSBzaW5nbGUtY2hpcCBwb3dlciBtYW5hZ2Vt
ZW50IElDDQo+ID4gZm9yDQo+ID4gKwkgIGJhdHRlcnktcG93ZXJlZCBwb3J0YWJsZSBkZXZpY2Vz
LiBUaGUgSUMgaW50ZWdyYXRlcyA3IGJ1Y2sNCj4gPiArCSAgY29udmVydGVycywgNyBMRE9zLCBh
bmQgYSAxNTAwIG1BIHNpbmdsZS1jZWxsIGxpbmVhciBjaGFyZ2VyLg0KPiA+ICsJICBBbHNvIGlu
Y2x1ZGVkIGlzIGEgQ291bG9tYiBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAoUlRDKSwNCj4g
PiBhbmQNCj4gPiArCSAgYSAzMi43Njgga0h6IGNsb2NrIGdhdGUuDQo+ID4gKw0KPiA+ICBjb25m
aWcgTUZEX1NUTTMyX0xQVElNRVINCj4gPiAgCXRyaXN0YXRlICJTdXBwb3J0IGZvciBTVE0zMiBM
b3ctUG93ZXIgVGltZXIiDQo+ID4gIAlkZXBlbmRzIG9uIChBUkNIX1NUTTMyICYmIE9GKSB8fCBD
T01QSUxFX1RFU1QNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvTWFrZWZpbGUgYi9kcml2
ZXJzL21mZC9NYWtlZmlsZQ0KPiA+IGluZGV4IGFlZDk5ZjA4NzM5Zi4uY2EyZDU1YzY3OWM1IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWZkL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9t
ZmQvTWFrZWZpbGUNCj4gPiBAQCAtMjUyLDYgKzI1Miw2IEBAIG9iai0kKENPTkZJR19NRkRfTVhT
X0xSQURDKSAgICAgKz0gbXhzLWxyYWRjLm8NCj4gPiAgb2JqLSQoQ09ORklHX01GRF9TQzI3WFhf
UE1JQykJKz0gc3ByZC1zYzI3eHgtc3BpLm8NCj4gPiAgb2JqLSQoQ09ORklHX1JBVkVfU1BfQ09S
RSkJKz0gcmF2ZS1zcC5vDQo+ID4gIG9iai0kKENPTkZJR19NRkRfUk9ITV9CRDcwNTI4KQkrPSBy
b2htLWJkNzA1Mjgubw0KPiA+ICtvYmotJChDT05GSUdfTUZEX1JPSE1fQkQ3MTgyOCkJKz0gcm9o
bS1iZDcxODI4Lm8NCj4gPiAgb2JqLSQoQ09ORklHX01GRF9ST0hNX0JENzE4WFgpCSs9IHJvaG0t
YmQ3MTh4Ny5vDQo+ID4gIG9iai0kKENPTkZJR19NRkRfU1RNRlgpIAkrPSBzdG1meC5vDQo+ID4g
LQ0KPiANCj4gTml0OiBUaGlzIGlzIGFuIHVucmVsYXRlZCBjaGFuZ2UgYW5kIHNob3VsZCBub3Qg
cmVhbGx5IGJlIGluIHRoaXMNCj4gcGF0Y2guDQoNCk9rLiBXaWxsIGdldCByaWQgb2YgaXQuDQoN
Cj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3JvaG0tYmQ3MTgyOC5jIGIvZHJpdmVy
cy9tZmQvcm9obS0NCj4gPiBiZDcxODI4LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uN2Y0NDVkNjk5ZmQ5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL2RyaXZlcnMvbWZkL3JvaG0tYmQ3MTgyOC5jDQo+ID4gQEAgLTAsMCArMSwzMTkgQEAN
Cj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsvLw0K
PiA+ICsvLyBDb3B5cmlnaHQgKEMpIDIwMTkgUk9ITSBTZW1pY29uZHVjdG9ycw0KPiA+ICsvLw0K
PiA+ICsvLyBST0hNIEJENzE4MjggUE1JQyBkcml2ZXINCj4gPiArDQoNCi8vc25pcA0KDQo+ID4g
Kw0KPiA+ICtzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgYmQ3MTgyOF9kcnYgPSB7DQo+ID4gKwku
ZHJpdmVyID0gew0KPiA+ICsJCS5uYW1lID0gInJvaG0tYmQ3MTgyOCIsDQo+ID4gKwkJLm9mX21h
dGNoX3RhYmxlID0gYmQ3MTgyOF9vZl9tYXRjaCwNCj4gPiArCX0sDQo+ID4gKwkucHJvYmVfbmV3
ID0gJmJkNzE4MjhfaTJjX3Byb2JlLA0KPiA+ICt9Ow0KPiA+ICsNCj4gDQo+IE5pdDogWW91IGNh
biByZW1vdmUgdGhpcyBsaW5lLg0KDQpXaWxsIGRvLg0KDQo+IA0KPiA+ICttb2R1bGVfaTJjX2Ry
aXZlcihiZDcxODI4X2Rydik7DQo+ID4gKw0KPiA+ICtNT0RVTEVfQVVUSE9SKCJNYXR0aSBWYWl0
dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gPiAiKTsNCj4gPiAr
TU9EVUxFX0RFU0NSSVBUSU9OKCJST0hNIEJENzE4MjggUG93ZXIgTWFuYWdlbWVudCBJQyBkcml2
ZXIiKTsNCj4gPiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiANCj4gVGhpcyBkb2VzIG5vdCBt
YXRjaCB0aGUgaGVhZGVyLg0KDQpIb3cgaXMgdGhhdD8gVGhpcyBpcyB3aGF0IGlzIHN0YXRlZCBp
biBtb2R1bGUuaCBmb3IgdGhlIA0KTU9EVUxFX0xJQ0VOU0U6DQoNCi8qDQogKiBUaGUgZm9sbG93
aW5nIGxpY2Vuc2UgaWRlbnRzIGFyZSBjdXJyZW50bHkgYWNjZXB0ZWQgYXMgaW5kaWNhdGluZw0K
ZnJlZQ0KICogc29mdHdhcmUgbW9kdWxlcw0KICoNCiAqCSJHUEwiCQkJCVtHTlUgUHVibGljIExp
Y2Vuc2UgdjJdDQogKgkiR1BMIHYyIgkJCVtHTlUgUHVibGljIExpY2Vuc2UgdjJdDQogKgkiR1BM
IGFuZCBhZGRpdGlvbmFsIHJpZ2h0cyIJW0dOVSBQdWJsaWMgTGljZW5zZSB2MiByaWdodHMNCmFu
ZCBtb3JlXQ0KICoJIkR1YWwgQlNEL0dQTCIJCQlbR05VIFB1YmxpYyBMaWNlbnNlIHYyDQogKgkJ
CQkJIG9yIEJTRCBsaWNlbnNlIGNob2ljZV0NCiAqCSJEdWFsIE1JVC9HUEwiCQkJW0dOVSBQdWJs
aWMgTGljZW5zZSB2Mg0KICoJCQkJCSBvciBNSVQgbGljZW5zZSBjaG9pY2VdDQogKgkiRHVhbCBN
UEwvR1BMIgkJCVtHTlUgUHVibGljIExpY2Vuc2UgdjINCiAqCQkJCQkgb3IgTW96aWxsYSBsaWNl
bnNlIGNob2ljZV0NCiAqDQogKiBUaGUgZm9sbG93aW5nIG90aGVyIGlkZW50cyBhcmUgYXZhaWxh
YmxlDQogKg0KICoJIlByb3ByaWV0YXJ5IgkJCVtOb24gZnJlZSBwcm9kdWN0c10NCiAqDQogKiBC
b3RoICJHUEwgdjIiIGFuZCAiR1BMIiAodGhlIGxhdHRlciBhbHNvIGluIGR1YWwgbGljZW5zZWQg
c3RyaW5ncykNCmFyZQ0KICogbWVyZWx5IHN0YXRpbmcgdGhhdCB0aGUgbW9kdWxlIGlzIGxpY2Vu
c2VkIHVuZGVyIHRoZSBHUEwgdjIsIGJ1dCBhcmUNCm5vdA0KICogdGVsbGluZyB3aGV0aGVyICJH
UEwgdjIgb25seSIgb3IgIkdQTCB2MiBvciBsYXRlciIuIFRoZSByZWFzb24gd2h5DQp0aGVyZQ0K
ICogYXJlIHR3byB2YXJpYW50cyBpcyBhIGhpc3RvcmljIGFuZCBmYWlsZWQgYXR0ZW1wdCB0byBj
b252ZXkgbW9yZQ0KICogaW5mb3JtYXRpb24gaW4gdGhlIE1PRFVMRV9MSUNFTlNFIHN0cmluZy4g
Rm9yIG1vZHVsZSBsb2FkaW5nIHRoZQ0KICogIm9ubHkvb3IgbGF0ZXIiIGRpc3RpbmN0aW9uIGlz
IGNvbXBsZXRlbHkgaXJyZWxldmFudCBhbmQgZG9lcw0KbmVpdGhlcg0KICogcmVwbGFjZSB0aGUg
cHJvcGVyIGxpY2Vuc2UgaWRlbnRpZmllcnMgaW4gdGhlIGNvcnJlc3BvbmRpbmcgc291cmNlDQpm
aWxlDQogKiBub3IgYW1lbmRzIHRoZW0gaW4gYW55IHdheS4gVGhlIHNvbGUgcHVycG9zZSBpcyB0
byBtYWtlIHRoZQ0KICogJ1Byb3ByaWV0YXJ5JyBmbGFnZ2luZyB3b3JrIGFuZCB0byByZWZ1c2Ug
dG8gYmluZCBzeW1ib2xzIHdoaWNoIGFyZQ0KICogZXhwb3J0ZWQgd2l0aCBFWFBPUlRfU1lNQk9M
X0dQTCB3aGVuIGEgbm9uIGZyZWUgbW9kdWxlIGlzIGxvYWRlZC4NCiAqDQogKiBJbiB0aGUgc2Ft
ZSB3YXkgIkJTRCIgaXMgbm90IGEgY2xlYXIgbGljZW5zZSBpbmZvcm1hdGlvbi4gSXQgbWVyZWx5
DQogKiBzdGF0ZXMsIHRoYXQgdGhlIG1vZHVsZSBpcyBsaWNlbnNlZCB1bmRlciBvbmUgb2YgdGhl
IGNvbXBhdGlibGUgQlNEDQogKiBsaWNlbnNlIHZhcmlhbnRzLiBUaGUgZGV0YWlsZWQgYW5kIGNv
cnJlY3QgbGljZW5zZSBpbmZvcm1hdGlvbiBpcw0KYWdhaW4NCiAqIHRvIGJlIGZvdW5kIGluIHRo
ZSBjb3JyZXNwb25kaW5nIHNvdXJjZSBmaWxlcy4NCiAqDQogKiBUaGVyZSBhcmUgZHVhbCBsaWNl
bnNlZCBjb21wb25lbnRzLCBidXQgd2hlbiBydW5uaW5nIHdpdGggTGludXggaXQNCmlzIHRoZQ0K
ICogR1BMIHRoYXQgaXMgcmVsZXZhbnQgc28gdGhpcyBpcyBhIG5vbiBpc3N1ZS4gU2ltaWxhcmx5
IExHUEwgbGlua2VkDQp3aXRoIEdQTA0KICogaXMgYSBHUEwgY29tYmluZWQgd29yay4NCiAqDQog
KiBUaGlzIGV4aXN0cyBmb3Igc2V2ZXJhbCByZWFzb25zDQogKiAxLglTbyBtb2RpbmZvIGNhbiBz
aG93IGxpY2Vuc2UgaW5mbyBmb3IgdXNlcnMgd2FudGluZyB0byB2ZXQgdGhlaXINCnNldHVwDQog
KglpcyBmcmVlDQogKiAyLglTbyB0aGUgY29tbXVuaXR5IGNhbiBpZ25vcmUgYnVnIHJlcG9ydHMg
aW5jbHVkaW5nIHByb3ByaWV0YXJ5DQptb2R1bGVzDQogKiAzLglTbyB2ZW5kb3JzIGNhbiBkbyBs
aWtld2lzZSBiYXNlZCBvbiB0aGVpciBvd24gcG9saWNpZXMNCiAqLw0KI2RlZmluZSBNT0RVTEVf
TElDRU5TRShfbGljZW5zZSkgTU9EVUxFX0lORk8obGljZW5zZSwgX2xpY2Vuc2UpDQoNCkkgaGF2
ZSBubyBvYmplY3Rpb25zIG9uIGNoYW5naW5nIHRoZSBsaWNlbnNlIGlmIG5lZWRlZCBidXQgY2Fu
IHlvdQ0KcGxlYXNlIHRlbGwgbWUgd2hhdCBpcyBPayBjb21ib3MgdGhlbiAtIEkgYW0gaGF2aW5n
IGhhcmQgdGltZSB3aGVuDQp0cnlpbmcgdG8gc2VsZWN0IGxpY2Vuc2VzIHdoaWNoIGFyZSBhY2Nl
cHRhYmxlIGZvciBhbGwuDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0K
