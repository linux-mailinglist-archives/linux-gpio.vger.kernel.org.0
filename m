Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32589E8A49
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 15:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388864AbfJ2OJI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 10:09:08 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:65300 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ2OJI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 10:09:08 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-a4-5db84801c4c7
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id E7.5D.08102.10848BD5; Tue, 29 Oct 2019 15:09:05 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Tue, 29 Oct 2019 15:08:59 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH 09/13] mfd: rtc: support RTC on ROHM BD71828 with
 BD70528 driver
Thread-Topic: [RFC PATCH 09/13] mfd: rtc: support RTC on ROHM BD71828 with
 BD70528 driver
Thread-Index: AQHVhNCZAuXq65juYU207wWeSYVtU6dee5aAgAAGywCAAANsgIAJaAyAgAm3XoCAAAU6gA==
Date:   Tue, 29 Oct 2019 14:08:58 +0000
Message-ID: <144bc58e8fbb350e3a1810654dea9427a86460be.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <9ccc83f3dfd0fd0dc8178adf41b52115f960c45a.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <20191017101225.GB3125@piout.net>
         <a1aa91f74b41033fed4a7106247f48f9b9f78bd9.camel@fi.rohmeurope.com>
         <20191017104859.GC3125@piout.net>
         <bf7a8ce661277aca3c4dede5fb17ef4163a56027.camel@fi.rohmeurope.com>
         <20191029135021.GC11234@piout.net>
In-Reply-To: <20191029135021.GC11234@piout.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E52E46CD5EA8FB45AB8AA44ABB6FA04A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwURxjGO7t7u8PJNusB3kC1DZtog7FQEhJHY9SomPWfpkmTRrFXXGTl
        Lt4H7h1GbGMuIqdC/QyGeoHD8mE9oH4cUO8MKLmgIDXipYKoCKJYIikSv1CUqLuuCv/sPPM+
        83ufmeRdSBqG6QRosbsk2S5aeVpPtZ54HfgGCEHTt56/knB1pJvBux8dZ/Cz8k4KHxkconFF
        21UdLv6nUYdvN52m8MDziwCPX99D4JLJPwn8+Ld+HW6omAT433NlNG76/yTAl+qu07jmRoTA
        ZTUdFI50puM7nRdpXNjSxuA3PWeo5XFCva8eCGO9hYzgq/9FCHnvMEKgdi8t9PU000J771lC
        KPVNEMKJuheM8DTw5ff6jBlLskTX1h8sOfaUpRtmmIMhP5n7+6JtjXeHGTfoW1gEoiDi0tCD
        P1pAEdBDA9cNUFXx+Q+bDoAu+FvIIgAhzS1BRTcZFYjlViJfl4dSz5DcYYh8/l5KNWK4DLS/
        YIjUDq1HN0sO6zT9I9p3rYxQ+1DcXBRsTVbLLPcd6u92U1pWBYn8d18B1YjiUtDO1wWEqgE3
        B+11P3qvSc6IAv+90Gm35lB1cxep6Tj08P6bD3UetUwMUmoWySWhU+dSNHQ5CnqrGE0nopLi
        QUa7w0x0+egQdRDM8k5L8E7R3mm0dxrtnUYfA7pagGyixZojuqTUZFnKS5YdZpuybHTYAkAb
        mWdB8Da8JgwICMIgHhJ8HDt56azJ8HmWIzvfLDrNmXKeVXKGAYIkH8tGrvxtMrDZYv52SXZ8
        tL6AFG9kvx48ZDJwatZmScqV5I/ubAh5xPLpQZNhpizlSNs2WayuKZuAUWpzfUKsU7JnS7KY
        5zJnqvOR6VQGRLWildyu1QrOOnNFm1LV0E6QCg8+LK8k4eXaauXbVl5TSRoou8MuJRjZVSsU
        gFMBc579U9wIMELAx7Ajarto5e/51G1ECSKUoAUT6gOdLnHKSnCDSuP2J8OlnzmihSOrfmp8
        eTJ9K0hbH4q5l9iXFeK5jP1rqzIbXo7G/+rRf9WT7x8btbT/PFqXtI9vf/v06PiW9Ktb1hjD
        /fFNi/YI4ws865bt2DWv8FZraWjdwrFDAwVJPR5p8e66uRGmAbvPHKs8EGVLbOowNFs3p40P
        eHQXLH03eMppFlPnk7JTfAe+2ewQ+gMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTAtMjkgYXQgMTQ6NTAgKzAxMDAsIEFsZXhhbmRyZSBCZWxsb25pIHdy
b3RlOg0KPiBPbiAyMy8xMC8yMDE5IDEwOjI3OjQzKzAwMDAsIFZhaXR0aW5lbiwgTWF0dGkgd3Jv
dGU6DQo+ID4gSGVsbG8gYWdhaW4gQWxleGFuZHJlLA0KPiA+IA0KPiA+IE9uIFRodSwgMjAxOS0x
MC0xNyBhdCAxMjo0OCArMDIwMCwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+ID4gPiBPbiAx
Ny8xMC8yMDE5IDEwOjM2OjQ0KzAwMDAsIFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+ID4gPiA+
IEhlbGxvIEFsZXhhbmRyZSwNCj4gPiA+ID4gDQo+ID4gPiA+IFRoYW5rcyBmb3IgcXVpY2sgY2hl
Y2shIEknbGwgYmUgb2ZmIGZvciB0aGUgcmVzdCBvZiB0aGUgd2Vlaw0KPiA+ID4gPiBidXQgSQ0K
PiA+ID4gPiB3aWxsDQo+ID4gPiA+IHJlLXdvcmsgdGhpcyBwYXRjaCBhdCBuZXh0IHdlZWsgOikg
SSBhZ3JlZSB3aXRoIHlvdSByZWdhcmRpbmcNCj4gPiA+ID4gbW9zdA0KPiA+ID4gPiBvZg0KPiA+
ID4gPiB0aGUgY29tbWVudHMuDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4g
Kw0KPiA+ID4gPiA+ID4gKy8qDQo+ID4gPiA+ID4gPiArICogUlRDIGRlZmluaXRpb25zIHNoYXJl
ZCBiZXR3ZWVuDQo+ID4gPiA+ID4gPiArICoNCj4gPiA+ID4gPiA+ICsgKiBCRDcwNTI4DQo+ID4g
PiA+ID4gPiArICogYW5kIEJENzE4MjgNCj4gPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiA+ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX1NFQwkJMHg3Zg0KPiA+ID4g
PiA+ID4gKyNkZWZpbmUgUk9ITV9CRDFfTUFTS19SVENfTUlOVVRFCTB4N2YNCj4gPiA+ID4gPiA+
ICsjZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX0hPVVJfMjRICTB4ODANCj4gPiA+ID4gPiA+ICsj
ZGVmaW5lIFJPSE1fQkQxX01BU0tfUlRDX0hPVVJfUE0JMHgyMA0KPiA+ID4gPiA+ID4gKyNkZWZp
bmUgUk9ITV9CRDFfTUFTS19SVENfSE9VUgkJMHgzZg0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgUk9I
TV9CRDFfTUFTS19SVENfREFZCQkweDNmDQo+ID4gPiA+ID4gPiArI2RlZmluZSBST0hNX0JEMV9N
QVNLX1JUQ19XRUVLCQkweDA3DQo+ID4gPiA+ID4gPiArI2RlZmluZSBST0hNX0JEMV9NQVNLX1JU
Q19NT05USAkJMHgxZg0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgUk9ITV9CRDFfTUFTS19SVENfWUVB
UgkJMHhmZg0KPiA+ID4gPiA+ID4gKyNkZWZpbmUgUk9ITV9CRDFfTUFTS19BTE1fRU4JCTB4Nw0K
PiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFsbCB0aGF0IHJlbmFtaW5nIGlz
IGRpc3RyYWN0aW5nIGFuZCB1c2VsZXNzLiBQbGVhc2UgcmVzdWJtaXQNCj4gPiA+ID4gPiB3aXRo
b3V0DQo+ID4gPiA+ID4gcmVuYW1pbmcgZGVmaW5lcywgc3RydWN0cyBhbmQgZnVuY3Rpb25zIHRv
IG1ha2UgaXQgZWFzaWVyIHRvDQo+ID4gPiA+ID4gcmV2aWV3Lg0KPiA+ID4gPiANCj4gPiA+ID4g
SSB3b3VsZCBwcmVmZXIgcmVuYW1pbmcgYmVjYXVzZSBpdCBtYWtlcyBpdCBjbGVhcmx5IHZpc2li
bGUNCj4gPiA+ID4gd2hpY2gNCj4gPiA+ID4gZGVmaW5lcy9zdHJ1Y3RzL2Z1bmN0aW9ucyBhcmUg
Y29tbW9uIGZvciBib3RoIFBNSUNzIGFuZCB3aGljaA0KPiA+ID4gPiBhcmUNCj4gPiA+ID4gUE1J
Qw0KPiA+ID4gPiBzcGVjaWZpYy4gQnV0IEkgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIHByb2JsZW0g
b2Ygc3BvdHRpbmcgcmVhbA0KPiA+ID4gPiBjaGFuZ2VzLg0KPiA+ID4gPiBXb3VsZCBpdCBiZSBP
ayBpZiBJIGRpZCByZW5hbWluZyBpbiBzZXBhcmF0ZSBwYXRjaCB3aGljaCBkb2VzDQo+ID4gPiA+
IG5vdA0KPiA+ID4gPiBicmluZw0KPiA+ID4gPiBpbiBhbnkgb3RoZXIgY2hhbmdlcyAtIGFuZCB0
aGVuIHRoZSBmdW5jdGlvbmFsIGNoYW5nZXMgaW4NCj4gPiA+ID4gc2VwYXJhdGUNCj4gPiA+ID4g
cGF0Y2g/DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBObywgdW5sZXNzIHlvdSBjYW4gZ3VhcmFu
dGVlIHRoYXQgYWxsIGZ1dHVyZSBQTUlDcyBmcm9tIHJvaG0NCj4gPiA+IG1hdGNoaW5nDQo+ID4g
PiB0aGUgd2lsZGNhcmQgd2lsbCB1c2UgdGhpcyBkcml2ZXIuDQo+ID4gPiANCj4gPiBJIHN0YXJ0
ZWQgcmUtd29ya2luZyB0aGlzIHBhdGNoIGFuZCByZW1lbWJlcmVkIG15IG9yaWdpbmFsIGlkZWEN
Cj4gPiByZWdhcmRpbmcgdGhlIG5hbWluZyA6KSBJIHNob3VsZCBoYXZlIGNvbW1lbnRlZCBpdCBh
cyBJIGhhZCBhbHJlYWR5DQo+ID4gZm9yZ290dGVuIGl0LiBZb3UgYXJlIGNvcnJlY3Qgd2hhdCBj
b21lcyB0byB0aGUgZGlmZmljdWx0eSBvZiB1c2luZw0KPiA+IGNvcnJlY3Qgd2lsZC1jYXJkcy4g
QW5kIEkgYWdyZWUgd2l0aCB5b3Ugd2hhdCBjb21lcyB0byBmdW5jdGlvbiBhbmQNCj4gPiBzdHJ1
Y3QgbmFtZXMgbGlrZSBiZDd4eDI4IC0gdGhvc2UgYXJlIHNvbWV3aGF0IGZyYWdpbGUgYXMgbmV4
dCBQTUlDDQo+ID4gd2hpY2ggd2Ugd2FudCB0byBzdXBwb3J0IHdpdGggdGhpcyBkcml2ZXIgbWF5
IGJlIEJEMTIzNDUgLSB5aWVsZGluZw0KPiA+IG91cg0KPiA+IHdpbGQtY2FyZCB1c2VsZXNzLg0K
PiA+IA0KPiA+IEJ1dCBpZiB3ZSB0YWtlIGEgbG9vayBvZiBjb21tb24gZGVmaW5pdGlvbnMgaW4g
aGVhZGVyIHJvaG0tc2hhcmVkLmgNCj4gPiB3aGljaCBJIGFkZGVkIC0gdGhvc2UgYXJlIHByZWZp
eGVkIGFzIFJPSE1fQkQxLiBNeSBpZGVhIHdhcw0KPiA+IGludHJvZHVjaW5nDQo+ID4gdGhpcyBj
b21tb24gUlRDIGRlZmluZSBncm91cCAxIC0gd2hpY2ggd291bGQgYmUgY29tbW9uIGRlZmluZSBn
cm91cA0KPiA+IGZvcg0KPiA+IGFsbCBkZXZpY2VzIHdoaWNoIGJlbG9uZyB0byBCRDEgZ3JvdXAu
IEN1cnJlbnRseSB0aGF0IHdvdWxkIGJlDQo+ID4gQkQ3MTgyOA0KPiA+IGFuZCBCRDcwNTI4LiBX
aGF0IHdhcyBtaXNzaW5nIGlzIHRoZSBjb21tZW50IGV4cGxhaW5pbmcgdGhpcyAoYW5kDQo+ID4g
bGFjaw0KPiA+IG9mIGNvbW1lbnQgbWFkZSB0aGlzIHVzZWxlc3MgYXMgZXZlbiBJIGZvcmdvdCBp
dCBhbHJlYWR5KS4NCj4gPiANCj4gPiBJIGFscmVhZHkgcmV2ZXJ0ZWQgdGhpcyBuYW1pbmcgY2hh
bmdlIGFuZCBhbGwgQkQ3MDUyOCBzcGVjaWZpYyBhbmQNCj4gPiBjb21tb24gZGVmaW5lcy9mdW5j
dGlvbnMvZW51bXMgYXJlIHByZWZpeGVkIHdpdGggdGhlIGdvb2Qgb2xkDQo+ID4gQkQ3MDUyOC4N
Cj4gPiBPbmx5IG5ldyBkZWZpbml0aW9ucyB3aGljaCBJIGFkZGVkIGZvciBCRDcxODI4IGFyZSBw
cmVmaXhlZCB3aXRoDQo+ID4gQkQ3MTgyOC4gQnV0IGhvdyBkbyB5b3Ugc2VlIHRoZSBncm91cGlu
ZyB0aGUgY29tbW9uIGRlZmluZXMgdG8NCj4gPiBmb3JtYXQNCj4gPiBST0hNX0JEPGdyb3VwIG51
bWJlcj5fRk9PX0JBUiBpbiB0aGUgcm9obS1zaGFyZWQuaCAtIHdpdGggY29tbWVudA0KPiA+IHRo
YXQNCj4gPiBncm91cCBCRDEgY29uc2lzdHMgb2YgZGVmaW5pdGlvbnMgd2hpY2ggYXJlIGNvbW1v
biBmb3IgQkQ3MDUyOCBhbmQNCj4gPiBCRDcxODI4Pw0KPiA+IA0KPiA+IE15IG9ubHkgZmVhciB3
aGVuIHVzaW5nIHByZWZpeCBCRDcwNTI4IGZvciBjb21tb24gZGVmaW5lcyBpcyB0aGF0DQo+ID4g
c29tZW9uZSBjaGFuZ2VzIHNvbWUgZGVmaW5lcyB0byBtYXRjaCB0aGUgQkQ3MDUyOCBkYXRhLXNo
ZWV0DQo+ID4gd2l0aG91dA0KPiA+IGV2YWx1YXRpbmcgaWYgdGhpcyBpbXBhY3RzIHRvIG90aGVy
IFBNSUNzLiBJdCBtYXkgYmUgdXNlbGVzcw0KPiA+IHBhcmFub2lhDQo+ID4gdGhvdWdoIC0gaGVu
Y2UgSSBhbSBhc2tpbmcgZm9yIHlvdXIgb3BpbmlvbiBhdCB0aGlzIHBoYXNlLiBJIGNhbiBkbw0K
PiA+IHRoaXMgZ3JvdXBpbmcgaW4gb3duIHBhdGNoIC0gb3IganVzdCBsZWF2ZSBpdCBhcyBpdCBp
cyBub3cgaW4gbXkNCj4gPiBsb2NhbA0KPiA+IHJlcG8gLSB3aXRoIHRoZSBvbGQgQkQ3MDUyOCBi
ZWluZyBjb21tb24gcHJlZml4Lg0KPiA+IA0KPiANCj4gSSBkb24ndCB0aGluayB0aG9zZSBtYXNr
cyB3aWxsIGV2ZXIgY2hhbmdlLCBhbGwgdGhlIEJDRCBSVENzIGFyZQ0KPiB1c2luZw0KPiB0aGUg
c2FtZS4NCg0KSSBndWVzcyB0aGlzIGlzIHZlcnkgdHJ1ZS4gQW5kIHRvIGZvbGxvdyB0aGlzIGZ1
cnRoZXIgLSBJZiB0aGVuIG5leHQNClJPSE0gUlRDIEkgd29yayB3aXRoIGlzIG5vdCB1c2luZyBC
Q0QgLSB0aGVuIEkgYW0gcHJvYmFibHkgbm90IHRyeWluZw0KdG8gc3VwcG9ydCBpdCB3aXRoIHRo
aXMgZHJpdmVyLiBTbyBJJ2Qgc2F5IHlvdSBhcmUgY29ycmVjdC4NCg0KPiBOb3RlIHRoYXQgUk9I
TV9CRDFfTUFTS19SVENfSE9VUl8yNEgsIFJPSE1fQkQxX01BU0tfUlRDX0hPVVJfUE0gYW5kDQo+
IFJPSE1fQkQxX01BU0tfQUxNX0VOIGFyZSBiaXRzIGFuZCBzaG91bGQgdXNlIEJJVCgpIHRvIG1h
a2UgdGhhdA0KPiBjbGVhci4NCg0KT2suIEknbGwgdXNlIEJJVCgpIGZvciBuZXcvbW92ZWQgb25l
IGJpdCBkZWZpbmVzIGluIG5leHQgdmVyc2lvbnMuDQoNCj4gVGhvc2UgbWF5IGNoYW5nZSBsYXRl
ciBidXQgSSBkb24ndCBzZWUgaG93IHNvbWVvbmUgbG9va2luZyBhdCB0aGUNCj4gQkQ3MDUyOCBk
YXRhc2hlZXQgd291bGQgZ2V0IHRob3NlIHdyb25nLg0KDQpJIGFkbWl0IHRoaXMgaXMgdW5saWtl
bHkgYW5kIEkgZG9uJ3Qgc2VlIHRoZSBzY2VuYXJpbyBob3cgdGhpcyBjYW4NCmJyZWFrIC0gYXNz
dW1pbmcgdGhlc2UgbWFza3MgYXJlIG5vdyBjb3JyZWN0IGZvciBCRDcwNTI4IDspIElmIHRoZXJl
DQp3YXMgYW4gZXJyb3IgdGhlbiBoYXZpbmcgcHJlZml4IEJENzA1MjggZm9yIGRlZmluZSB3aGlj
aCBpcyB1c2VkIGJ5DQpCRDcxODI4IChhbmQgcG9zc2libHkgb3RoZXJzKSBtaWdodCBiZSBlcnJv
ciBwcm9uZSBhcyBvbmUgY291bGQgZml4IHRoZQ0KZGVmaW5lIHdpdGhvdXQgY2hlY2tpbmcgdGhl
IEJENzE4MjguIFdoZW4gd2UgbGltaXQgdGhpcyB0byB0aG9zZSB0aHJlZQ0KZGVmaW5lcyBpdCBp
cyBfcmVhbGx5XyB1bmxpa2VseSAoYW5kIHByb2JhYmx5IG5vdCBhIHByb2JsZW0pIC0gYnV0IHRo
aXMNCndhcyB0aGUgcmVhc29uIHdoeSBJIHdhbnRlZCB0byBkbyB0aGUgcmVuYW1pbmcgb2YgY29t
bW9uIGRlZmluZXMuDQoNCkJ5IHRoZSB3YXksIEkgc2VudCBwYXRjaCB2MiBjb3VwbGUgb2YgZGF5
cyBhZ28gLSBhbmQgSSBrZXB0IHRoZSBCRDcwNTI4DQpwcmVmaXggYXMgeW91IHN1Z2dlc3RlZC4g
SSdsbCBkbyB0aGF0IGFsc28gaW4gbmV4dCB2ZXJzaW9ucyBzbyB3ZSBjYW4NCnByb2JhYmx5IHNh
eSB0aGlzIGNhc2UgaXMgY2xvc2VkIDpdDQoNClRoYW5rcyBmb3IgdGFraW5nIHRoZSB0aW1lIHRv
IHJlYWQgdGhlIHBhdGNoZXMhDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
