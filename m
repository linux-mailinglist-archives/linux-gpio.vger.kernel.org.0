Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA612125E62
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfLSJ65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:58:57 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:45744 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfLSJ65 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 04:58:57 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-4e-5dfb49dfc7dc
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id BE.74.08102.FD94BFD5; Thu, 19 Dec 2019 10:58:55 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Thu, 19 Dec 2019 10:58:50 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
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
Subject: Re: [PATCH v7 02/12] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Topic: [PATCH v7 02/12] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Index: AQHVtlEjPJdYWhzff0OqIDcPrX4s7KfBKG6A
Date:   Thu, 19 Dec 2019 09:58:47 +0000
Message-ID: <f9b0fbb7b898691d09ed8954e8df67cf3706aa96.camel@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
         <702daeb9d8604e2feddd5f6f92b067a2d60d81ad.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <702daeb9d8604e2feddd5f6f92b067a2d60d81ad.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [84.253.217.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6C67A5C16966941A778612C207EB21C@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHPfd5QK+eVhjH+gqNBl/TsZjsaJwhKvFqssXJP2iseBlXipSW
        3Jb5wGVsSsSqEaPGWCk+ywglaqv4LMZhrdoZlYDVRZyrz2gUVHRGYbh7vSr8c87n/L7n+/ue
        P34H0sYHnAkW2F2yYpdsZi6ROVvbFfjyzpwuy1drOoaQA83XebKuvYYnr7xRhmyP3+fI7vAV
        lmz48yhLbjUcZsid1+cB+be1giLbun+nyIuNf7PkyO5uQFpOVXGk4elBQCL+Vo74bjRTpMp3
        kSHN0UxyO3qeI+WNYZ70xAJMRrJYX10PxI6b5bxYXV8qnvTc5sVg3XpObIuFOPHCzeOUuKP6
        LSXW+t/wYmdwxLzEhf2n5Uqun7IK8u2Tpi/pb41VeKnid3DF5YiXLQNt0A0gxGgy7g596waJ
        0IiuA9ywsZPTDxcBPr3zNaNd4tA07P6L1zAJTcGBZoMbJEAaVUHcU7FK48FoHo5dizMaJ6Ef
        cLxuK9D5a7x5TSWlMYNG4+qjLziNBfQ9ru98+jFqP8C7/mn/cCkBWXFZxPeBARqO15fpdRql
        4ODDN6zGGCF8IHSV1jkZP77X87Geivf6g6z2ThqNxYdOTdKtGfjwwxpe51S8bUOc199gwJd2
        3mcqwReePgmeXrenj9vTx+3p494D2DqAi6QCW77kktMnKnLJRMVhLVK3Hx1FQaAPzKsT4H3T
        nCZAQdAEhkDKnCzkTe2yGAfmOvJWWiWnNUcpscnOJoAhbU4SblW8tRiFPGnlKllxfJKGQsac
        IqTFt1iMSMsqlOViWfmkDoPQjAW/qDY1KHK+vGJpgc3VK1MwQWueaEpyyvY8WZFKXNYcbTpy
        nOp4aNIANXexZhecxVKRWtWtUZAOKx9799Ew7PWp642ORh9tZOwOu2xKEdbOVg1IM1hL7J/j
        noAUCMyDhXKt3QD173zu9kQNotQgOPadFuSSeiVTGfhj1r3vvjEUHqLbJtwNLEqL/vooNiia
        Ptt+uvhZ8uQ9GZaRhT8r/42vyWSfN87vrBVKZ/wSjtzdf2amI9JS2N7vuK0lPnr45ewFyw/+
        9t49LJ/NepT9MkRnPTCVtkbTxtDc8kHn4qFMccvczFGrN2Xnzg8YZnVPrQNt/pebY6lp4WPL
        zIzTKqWPoxWn9D/9jQrW+AMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyaywgTGVlLCBSb2INCg0KSSBqdXN0IG5vdGljZWQgd2UgaGF2ZSBhIGRlcGVuZGVu
Y3kgaGVyZS4gVGhpcyBiaW5kaW5nIGlzIHJlZmVycmluZyB0bw0KcmVndWxhdG9yIGJpbmRpbmcg
LSB3aGljaCB3YXMgYXBwbGllZCBieSBNYXJrIGFuZCBpcyB0aHVzIG1pc3NpbmcgZnJvbQ0KdGhl
IHNlcmllcy4gV2hhdCdzIHRoZSBiZXN0IHdheSBmb3J3YXJkPw0KDQpPbiBUaHUsIDIwMTktMTIt
MTkgYXQgMTE6NDYgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gUk9ITSBCRDcxODI4
IFBvd2VyIG1hbmFnZW1lbnQgSUMgaW50ZWdyYXRlcyA3IGJ1Y2sgY29udmVydGVycywgNw0KPiBM
RE9zLA0KPiBhIHJlYWwtdGltZSBjbG9jayAoUlRDKSwgMyBHUE8vcmVndWxhdG9yIGNvbnRyb2wg
cGlucywgSEFMTCBpbnB1dA0KPiBhbmQgYSAzMi43Njgga0h6IGNsb2NrIGdhdGUuDQo+IA0KPiBE
b2N1bWVudCB0aGUgZHQgYmluZGluZ3MgZHJpdmVycyBhcmUgdXNpbmcuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNv
bT4NCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IC0tLQ0K
PiANCj4gTm8gY2hhbmdlcyBzaW5jZSB2Ng0KDQovL3NuaXANCg0KPiArICByZWd1bGF0b3JzOg0K
PiArICAgICRyZWY6IC4uL3JlZ3VsYXRvci9yb2htLGJkNzE4MjgtcmVndWxhdG9yLnlhbWwNCg0K
VGhpcyBmaWxlIGlzIG1pc3NpbmcgZnJvbSB0aGUgc2VyaWVzIGFuZCBpcyBhcHBsaWVkIHRvIE1h
cmsncyB0cmVlLg0KDQpCciwNCglNYXR0aSBWYWl0dGluZW4NCg0K
