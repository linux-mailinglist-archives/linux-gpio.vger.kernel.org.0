Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA09124105
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 09:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfLRIGN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 03:06:13 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:45684 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRIGM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 03:06:12 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-bb-5df9ddf133de
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 9E.8C.08102.1FDD9FD5; Wed, 18 Dec 2019 09:06:09 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 18 Dec 2019 09:06:05 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>
Subject: Re: Applied "regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators" to the regulator tree
Thread-Topic: Applied "regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators" to the regulator tree
Thread-Index: AQHVtNcCPO+Kt0OMfE2l+CzrBWADfqe/eY8A
Date:   Wed, 18 Dec 2019 08:06:04 +0000
Message-ID: <de7424126e285d9bbd21a70945415d78203c2ba7.camel@fi.rohmeurope.com>
References: <applied-5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <applied-5b1c4a22c7945e97ff2a7924abfeb3239043f8eb.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AFCB8A8827600419DE3AEDCAF90D462@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf2wTZRzGfe+ud7dupy9ls68dE20kZBpACIkvBA3/oGdMFgkxUZM6buxY
        q/0xr51haOLMZGzjh4yuQes62NaNCg0d7VCYMMcsEwvBNLZzMIYum0s2tXP82FIYw7udsP11
        z73P87yf7x/flyV1rYyBtdhdomQXrEZaS3UH7oVXTA6mTS/G/8jD/niSwbtTbQy+f7CXwbd9
        MQp7hkZoPNK9G+DD0SsavOdShwZXtoRoPHCqncK/37kA8FSimsD1M0cJPLn3hgY3VfkpHDk8
        A/CvnQ00PvX3CYB7jydo3PpbnMANrRcpPHGzhsDx2CbsiaUYPBi7QOPKeD+Jd52LMni27ySF
        9195bWMeH2wMAv7e3YOAn+jfxfCNwY/5M95Bhg8fq6H5631naf4HX5DhW/a7NfzU5TqKH20K
        UfxP/d8R/KHGNMGH9kYBHzg+zfC3wk+/Cd/N3FAkuD7aYimxr3pla6b5s8hJTelszo7zo89V
        gI6cWpDBIrgWfRGoI2qBltXBJECXOxKU+nMRIO/pCKgFLEvDDaj2KqMUsuEK5LnbQisZEiYy
        UVtLFVCMxfBDtC8SI9WQhK7dH6NUvQYFKofnNAWXoSPp1JzmYAGa7uqiFa2DDtTUeWYOkAFL
        0dXuSULRAOahmorUnCahHoVHpzXq1BD5z/5CqjoHjQ3P/n9uROfSQ5QyMwnzUahzlVrdiIIR
        NULCZ1H9niFGHWER+vmrEeoAeNK7gOCdb3sXtL0L2t4F7SNAcwwgm2CxlggucfVKSSxbKTnM
        NvmzzWELA3Xtbp8GD3pe7wEEC3rAUyxhzOGM5rRJ93iRo7jcLDjNhVKZVXT2AMSSxmxuoFr2
        uGKhfKcoOR5auSxl1HPLh+pMOqiwPhDFUlF66C5hWSPifkzKxUWSWCLu2G6xuuZtgs1QLtca
        sp2ivViUhDKXuVBZj0KnvB+KlSVz1w8qXGepYJNP1WoMvMAeGPM1k2zU19pM6ii7wy4a9Byt
        RKESNZfZH4HGgZ4FxsXct9dlN0t+e4/uGZcRhIxYUzClIFzCvGWoANufYMpP/MMn1rqzDDuD
        pnVb4lLxJ83awET/1rf8BZuWtQdTyJcxcykW9j/40qbn1r/9qfS1qcbgrrAe2pcf7xuv6q0e
        zj1qec/S9epEvZsEnhu3QunN7S+VfPNGvufzxxLX3m8Y+D761/msd3KTd5Y6/yxvE90v31xX
        pF3C9P77TNJIOc3C6udJySn8B2u2+V44BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyaywNCg0KT24gVHVlLCAyMDE5LTEyLTE3IGF0IDEyOjM5ICswMDAwLCBNYXJrIEJy
b3duIHdyb3RlOg0KPiBUaGUgcGF0Y2gNCj4gDQo+ICAgIHJlZ3VsYXRvcjogYmQ3MTgyODogQmFz
aWMgc3VwcG9ydCBmb3IgUk9ITSBiZDcxODI4IFBNSUMgcmVndWxhdG9ycw0KPiANCj4gaGFzIGJl
ZW4gYXBwbGllZCB0byB0aGUgcmVndWxhdG9yIHRyZWUgYXQNCg0KSSB0aGluayB5b3UgbWlzc2Vk
IHRoZSBbUEFUQ0ggdjYgMDgvMTVdIHJlZ3VsYXRvcjogYmQ3MTh4NzogU3BsaXQNCmRyaXZlciB0
byBjb21tb24gYW5kIGJkNzE4eDcgc3BlY2lmaWMgcGFydHMNCg0Kd2hpY2ggdG9vayB0aGUgZnVu
Y3Rpb25zIHBhcnNpbmcgZmV3IHJvaG0gc3BlY2lmaWMgRFQgZW50cmllcyBvdXQgb2YNCmJkNzE4
eDcgZHJpdmVyIGFuZCBleHBvcnRlZCB0aGVtIGZvciBzaGFyZWQgdXNlLiAoRWcsIGN1cnJlbnRs
eSB0aGUNCmJkNzE4eDcgYW5kIHRoaXMgYmQ3MTgyOCBkcml2ZXIgdXNlIHNhbWUgcHJvcGVydGll
cyBhbmQgc2hhcmluZyB0aGUNCnByb3BlcnR5IHBhcnNpbmcgY29kZSBzZWVtcyBiZXR0ZXIgdGhh
biBkdWJsaWNhdGluZyBpdCkuDQoNCkFueXdheXMsIHRoaXMgcGF0Y2ggYnJlYWtzIHRoZSBjb21w
aWxhdGlvbiB3L28gUEFUQ0ggdjYgMDgvMTUuDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3JlZ3VsYXRvci9LY29uZmlnIGIvZHJpdmVycy9yZWd1bGF0b3IvS2NvbmZpZw0KPiBpbmRleCA3
NGViNWFmNzI5NWYuLjU2NTEyNzQ4YTQ3ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9yZWd1bGF0
b3IvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9LY29uZmlnDQo+IEBAIC0xOTQs
NiArMTk0LDE4IEBAIGNvbmZpZyBSRUdVTEFUT1JfQkQ3MDUyOA0KPiAgCSAgVGhpcyBkcml2ZXIg
Y2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlDQo+ICAJICB3
aWxsIGJlIGNhbGxlZCBiZDcwNTI4LXJlZ3VsYXRvci4NCj4gIA0KPiArY29uZmlnIFJFR1VMQVRP
Ul9CRDcxODI4DQo+ICsJdHJpc3RhdGUgIlJPSE0gQkQ3MTgyOCBQb3dlciBSZWd1bGF0b3IiDQo+
ICsJZGVwZW5kcyBvbiBNRkRfUk9ITV9CRDcxODI4DQo+ICsJc2VsZWN0IFJFR1VMQVRPUl9ST0hN
DQoNCkkgdGhpbmsgdGhpcyB3YXMgaW50cm9kdWNlZCBpbiBbUEFUQ0ggdjYgMDgvMTVdDQoNCj4g
KwloZWxwDQo+ICsJICBUaGlzIGRyaXZlciBzdXBwb3J0cyB2b2x0YWdlIHJlZ3VsYXRvcnMgb24g
Uk9ITSBCRDcxODI4IFBNSUMuDQo+ICsJICBUaGlzIHdpbGwgZW5hYmxlIHN1cHBvcnQgZm9yIHRo
ZSBzb2Z0d2FyZSBjb250cm9sbGFibGUgYnVjaw0KPiArCSAgYW5kIExETyByZWd1bGF0b3JzLg0K
DQovL3NuaXANCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3IvYmQ3MTgyOC1yZWd1
bGF0b3IuYw0KPiBiL2RyaXZlcnMvcmVndWxhdG9yL2JkNzE4MjgtcmVndWxhdG9yLmMNCg0KLy9z
bmlwDQoNCj4gKw0KPiArc3RhdGljIGludCBidWNrX3NldF9od19kdnNfbGV2ZWxzKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAsDQo+ICsJCQkJICBjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX2Rlc2MgKmRl
c2MsDQo+ICsJCQkJICBzdHJ1Y3QgcmVndWxhdG9yX2NvbmZpZyAqY2ZnKQ0KPiArew0KPiArCXN0
cnVjdCBiZDcxODI4X3JlZ3VsYXRvcl9kYXRhICpkYXRhOw0KPiArDQo+ICsJZGF0YSA9IGNvbnRh
aW5lcl9vZihkZXNjLCBzdHJ1Y3QgYmQ3MTgyOF9yZWd1bGF0b3JfZGF0YSwgZGVzYyk7DQo+ICsN
Cj4gKwlyZXR1cm4gcm9obV9yZWd1bGF0b3Jfc2V0X2R2c19sZXZlbHMoJmRhdGEtPmR2cywgbnAs
IGRlc2MsIGNmZy0NCj4gPnJlZ21hcCk7DQoNClNvIHdhcyB0aGlzLg0KDQpEbyB5b3UgdGhpbmsg
eW91IGNvdWxkIGFsc28gYXBwbHkgdGhlIFtQQVRDSCB2NiAwOC8xNV0gb3IgcGVyaGFwcyBkcm9w
DQp0aGlzIG9uZSB0byBhdm9pZCBicmVha2luZyB0aGUgY29tcGlsYXRpb24gd2hlbiBNRkRfUk9I
TV9CRDcxODI4IGNvbmZpZw0Kb3B0aW9uIGlzIGludHJvZHVjZWQ/DQoNCg0KQnIsDQoJTWF0dGkN
Cg==
