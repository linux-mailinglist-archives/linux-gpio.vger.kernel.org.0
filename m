Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86CC2142C64
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 14:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgATNl6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 08:41:58 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:45730 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNl6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 08:41:58 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-81-5e25ae239d7c
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 5F.FA.08102.32EA52E5; Mon, 20 Jan 2020 14:41:55 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 20 Jan 2020 14:41:42 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
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
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "noralf@tronnes.org" <noralf@tronnes.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v12 00/10] Support ROHM BD71828 PMIC
Thread-Topic: [PATCH v12 00/10] Support ROHM BD71828 PMIC
Thread-Index: AQHVz3GxRarqEI+FJkC62zSkifitkKfzbi0AgAAQ5QA=
Date:   Mon, 20 Jan 2020 13:41:41 +0000
Message-ID: <bf1ad63605a11f7d6a4e89233fbd478cb9114650.camel@fi.rohmeurope.com>
References: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
         <ecc8ab43dfdb78c7bcab82311f608f6d4e12dc5c.camel@fi.rohmeurope.com>
In-Reply-To: <ecc8ab43dfdb78c7bcab82311f608f6d4e12dc5c.camel@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <065C929F2988BA4DAC7FE848157AFD1B@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjeuff23sPHXQ612GOdy1aHc8uGI1nimTGLyWZ2SZZp4qZxQdkV
        7igbbclta9QtocE5B3QMHPjRlK9JBaWCVBmTiJKmgNbFrZEC82vrJCyYpWwOLYrT3Uun8Oec
        532f8zzP++M9kNYe5Qyw0GKXZItYZGSTmb7WGf+rS9sztr4WDehJczjCkb2xIxz5d98AR6bq
        QgypjY6xZKxvLyANwUsaUnHxlIbsPtzBkqtdJxjy651+QO4OfUWRmgctFPnbdUNDmr5sZsjJ
        hgeAXO7xsKTrz3ZABtqGWOIdCVPE4z3PkMnbZRQJh9aS2lCMI9dD/SzZHR6lyZ7eIEceDncy
        pPLSO2uWCL56HxBm7u8DwuToHk6o930mnHZf5wT/sTJWuDZ8hhXO1fk44XDltxrh7o/VjDDe
        1MEIg6PdlHCg/h4ldLiCQGhti3PCP/5n16MPU1ZvE+3bNxQWWFa8+VGK6dA3MU1xEO1wNg9S
        TuBC5SAJYvQ6Pni6iy4HyVCLIgDHZmrZRHEe4Mo77UoBIYtW4/JfOBXq0Bu4M5ymPqFRKAXX
        t7o41WgBIvjA5bhGxeqbn/d7qARehWu+P8uomEEZ+GysilYxj97DnbGrs32tMgpu25+n4iS0
        Dt+PVsz2AVqCy5yxWR8a6bF/POGPEcLNZ36iEzgdT9x8+H/fiHvvRRl1Thq9hDt6ViTgGuz8
        7YWEy/O4piLKJSZIwxcOjTFVYKF7XoB7TuyeE7vnid3zxI1Acwxgs1hYVCDapaxMWXJkylaT
        WbnyrGY/SCzd1A/gUSA7ACgIAmARpIzpvO5Ixlbt09us+TtNos2UKzuKJFsAYEgbdXxjqcLx
        +eLOXZJsfUwthoxRz78Yrd6iRWrWp5JULMmP2WcgNGLe4VOEabJUIO34uLDIPkdTMEk1Tzbo
        bJIlX5JFh92Uqy5Hrk3ZDpVKVXKfO67m2opFs9JNSEMgC1ZN1H1Hw2CdVzlHJnu9tJaxWC2S
        Qc+XqAKkCkwOy5O4W0APgXEB39+msKnK/3vidksJopSgyEqjGmQX5yiDE5x69+Smpve3V7Rc
        KElv2Lz2Ke+1/OWRsoVL418s3nVl6sSi8cFAtmFYN7kMlgqffH3j0dt/TQ98cBHEe7I3Nqbk
        bFx2PN6aanCs+n0dP+EQ0ofoP6ZHzDc9EILIWzmkr2X9tKvk87SVSSxffXtLliFzec4rV8zn
        NhR7jnb3lua5unOMjM0kZr1MyzbxPzRZ5II8BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBNb24sIDIwMjAtMDEtMjAgYXQgMTQ6NDEgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gSGVsbG8sDQo+IA0KPiBEbyB5b3Uga25vdyB0aG9zZSBkYXlzIHdoZW4gbm90aGluZywg
X25vdGhpbmdfIGp1c3Qgd29ya3Mgb3V0IGFzDQo+IGludGVuZGVkPyBUb2RheSBpcyBvbmUgb2Yg
dGhvc2UuDQo+IA0KPiBPbiBNb24sIDIwMjAtMDEtMjAgYXQgMTE6MTIgKzAyMDAsIE1hdHRpIFZh
aXR0aW5lbiB3cm90ZToNCj4gPiBQYXRjaCBzZXJpZXMgaW50cm9kdWNpbmcgc3VwcG9ydCBmb3Ig
Uk9ITSBCRDcxODI4IFBNSUMNCj4gPiANCj4gPiBST0hNIEJENzE4MjggaXMgYSBwb3dlciBtYW5h
Z2VtZW50IElDIGNvbnRhaW5pbmcgNyBidWNrcyBhbmQgNw0KPiA+IExET3MuDQo+ID4gQWxsDQo+
ID4gcmVndWxhdG9ycyBjYW4gYmUgY29udHJvbGxlZCBpbmRpdmlkdWFsbHkgdmlhIEkyQy4gQnVj
a3MgMSwyLDYgYW5kDQo+ID4gNyBjYW4gYWxzbyBiZSBhc3NpZ25lZCB0byBhICJyZWd1bGF0b3Ig
Z3JvdXAiIGNvbnRyb2xsZWQgYnkgcnVuLQ0KPiA+IGxldmVscy4NCj4gPiBFZy4gUnVuIGxldmVs
IHNwZWNpZmljIHZvbHRhZ2VzIGFuZCBlbmFibGUvZGlzYWJsZSBzdGF0dXNlcyBmb3INCj4gPiBl
YWNoDQo+ID4gb2YNCj4gPiB0aGVzZSBidWNrcyBjYW4gYmUgc2V0IHZpYSByZWdpc3RlciBpbnRl
cmZhY2UuIFRoZSBidWNrIHJ1bi1sZXZlbA0KPiA+IGdyb3VwDQo+ID4gYXNzaWdubWVudCAoc2Vs
ZWN0aW9uIGlmIGJ1Y2sgaXMgdG8gYmUgY29udHJvbGxlZCBpbmRpdmlkdWFsbHkgb3INCj4gPiB2
aWENCj4gPiBydW4tbGV2ZWxzKSBjYW4gYmUgY2hhbmdlZCBhdCBydW4tdGltZSB2aWEgSTJDLg0K
PiA+IA0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGJyaW5ncyBvbmx5IHRoZSBiYXNpYyBzdXBwb3J0
IGZvciBjb250cm9sbGluZw0KPiA+IHJlZ3VsYXRvcnMgaW5kaXZpZHVhbGx5IHZpYSBJMkMuDQo+
IA0KPiAvL3NuaXANCj4gDQo+ID4gUGF0Y2ggMTE6DQo+ID4gICAgICAgICBBbGxvdyBjb250cm9s
IG9mIEdQKEkpTyBwaW5zIG9uIEJENzE4MjggdmlhIEdQSU8gc3Vic3lzdGVtDQo+ID4gDQo+IA0K
PiBJIGFjY2lkZW50YWxseSByZWJhc2VkIHRvIHdyb25nIGNvbW1pdCBhbmQgY3JvcHBlZCB0aGUg
R1BJTyBwYXRjaCBvdXQNCj4gb2YgdGhlIHNlcmllcy4gTGVlIC0gY2FuIHlvdSB0YWtlIHRoZSBH
UElPIHBhcnQgZnJvbSB2MTEgKHBhdGNoIDExLzEzDQo+IHRoZXJlKS4gSXQgc2hvdWxkIGFwcGx5
IGNsZWFubHkgYW5kIEkgaGF2ZSBubyBjaGFuZ2VzIHRvIGl0LiBPcg0KPiBzaG91bGQNCj4gSSBq
dXN0IHJlc2VuZCB0aGUgd2hvbGUgc2VyaWVzIChhZ2Fpbik/DQoNCk1heWJlIGl0IGlzIGNsZWFy
ZXN0IGlmIEkganVzdCBkbyByZXNlbmQuLi4gdjEzIGlzIG9uIGl0J3Mgd2F5IGJ1dCBJDQpkcm9w
cGVkIG1vc3Qgb2YgdGhlIHJlY2lwaWVudHMuIFBsZWFzZSBsZXQgbWUga25vdyBpZiBzb21lIG9m
IHlvdSB3YW50DQp0byBnZXQgaXQuDQoNCj4gDQo+IEJyLA0KPiAgICAgTWF0dGkgVmFpdHRpbmVu
DQoNCg==
