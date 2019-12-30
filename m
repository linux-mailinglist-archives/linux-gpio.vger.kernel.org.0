Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82AEA12CD5C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 08:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfL3Hgd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 02:36:33 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:62412 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbfL3Hgd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 02:36:33 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-38-5e09a8fedbab
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 28.83.08102.EF8A90E5; Mon, 30 Dec 2019 08:36:30 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 30 Dec 2019 08:36:19 +0100
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
Thread-Index: AQHVtlJMyatI9ieot0i0jk0Qmtw3YKfE7uMAgA1bZYA=
Date:   Mon, 30 Dec 2019 07:36:17 +0000
Message-ID: <8359b8365f6c86fe4acb9c35c2c6be55091b45a3.camel@fi.rohmeurope.com>
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
Content-ID: <A634DDBC66D8E242A516C99F83209630@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0wTWRTH986rt8VZhwpyrfgaH/iIiBvjXg1ZNdFklPiIJn4wWBxllhL7
        INNiQN2EfRAE2YhGRSoPo7xEAlpEpZGEFHDdEtcQRXxCGhtUsmHDiiKRrTvTUeHTPfec/+/8
        z4dzIGkMMCaYbndJsl208oyBaqv96FkeqtWbEy718biyu0eH84aqdXikzE/hM4Eggys6/qLx
        8a7rNH7WfJXC/e86AX7/8BiBT4/XEHi4sI/GTRXjAD/wljK4+e8GgO9cecjgqt5uApdW3aVw
        t38TfuHvZHBua4cOhx5do9ZHC/Xl9UD453GuTiivPyK0uF/oBE9dPiM8f3SbEf54fJMQisvH
        CKH2yqhOeOuZvcOwJyJxv+g6tCs9zb7ih30RlluXjzEZQUNW28ApOge0GQqAHiJuFaoeOUsU
        AAM0cj0ABWu9jPa5C1Dd8CXlAyHDJaKCJzoViOLmoabC/LCG5G5A1DLQQ6iaaZwZ3axZoGlS
        UMPrCkKL16Lm9l5ajSluIQoWd4X7sNw21Dh+j9a82gEqLwyGAT23BLW3PA+LADcL5ecMhfMk
        F4M8A6O0NjWHKm/fJ7U4Gr15Gfqc51HrWIBS5yGVPo3eFRq6Hp37eZDW4nno9PHA5xki0Z8l
        QaoITHdPcnBP0O5JtHsS7Z5EXwB0HUA2Md2aJrqklfGylBkvOyw25TngsHmAtjIjt8An32Yf
        ICDwgRmQ4KPZihPQbPx2vyM12yI6LSlyplVy+gCCJB/FrkrWm41sqph9WJIdX0ozIcXHsHGB
        k3uNnOp1UJIyJPlLNRZCHrG2agWMlKU0KevHdKtrokxAvdrcYIpySvZUSRYzXZYUdT9SnMqC
        qKUpii+j4qwzQ7QpWQ31g2Ww6E3ZRRJ2lFVdJI2U3WGXTDGst0aRcqrUkmn/ajQIYiDgp7Gt
        yoEYpyh387XPoGJBKBZbIKNauMSJkikHSP/O2ChGjrhCv+3ezmctjN0QUZjUlDQat3h136He
        6LiE8wd3bl36U3zay5C35l2pU0ye2bimv/j+kH95zyKU2FX0a/v2BPm/DZ3Ws/MTXv/ecCpH
        yi1Oih1L/nTv1YV1eZGzj8aNbcs7+d0vWZWXP8wp+GZB6vc7S/qfTs/wTR1eYjZlz+Upp0Vc
        uZSUneL/+jCsR/QDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWdhaW4gUGF2ZWwsDQoNCk9uIFNhdCwgMjAxOS0xMi0yMSBhdCAyMDozNyArMDEwMCwg
UGF2ZWwgTWFjaGVrIHdyb3RlOg0KPiA+ICtzdGF0aWMgdm9pZCBsZWRfYWRkX3Byb3BzKHN0cnVj
dCBsZWRfY2xhc3NkZXYgKmxkLCBzdHJ1Y3QNCj4gPiBsZWRfcHJvcGVydGllcyAqcHJvcHMpDQo+
ID4gK3sNCj4gPiArCWlmIChwcm9wcy0+ZGVmYXVsdF90cmlnZ2VyKQ0KPiA+ICsJCWxkLT5kZWZh
dWx0X3RyaWdnZXIgPSBwcm9wcy0+ZGVmYXVsdF90cmlnZ2VyOw0KPiA+ICsJLyoNCj4gPiArCSAq
IEFjY29yZGluZyB0byBiaW5kaW5nIGRvY3MgdGhlIExFRCBpcyBieS1kZWZhdWx0IHR1cm5lZCBP
RkYNCj4gPiB1bmxlc3MNCj4gPiArCSAqIGRlZmF1bHRfc3RhdGUgaXMgdXNlZCB0byBpbmRpY2F0
ZSBpdCBzaG91bGQgYmUgT04gb3IgdGhhdA0KPiA+IHN0YXRlDQo+ID4gKwkgKiBzaG91bGQgYmUg
a2VwdCBhcyBpcw0KPiA+ICsJICovDQo+ID4gKwlpZiAocHJvcHMtPmRlZmF1bHRfc3RhdGUpIHsN
Cj4gPiArCQlsZC0+YnJpZ2h0bmVzcyA9IExFRF9PRkY7DQo+ID4gKwkJaWYgKCFzdHJjbXAocHJv
cHMtPmRlZmF1bHRfc3RhdGUsICJvbiIpKQ0KPiA+ICsJCQlsZC0+YnJpZ2h0bmVzcyA9IExFRF9G
VUxMOw0KPiANCj4gTWF4IGJyaWdodG5lc3MgaXMgbm90IGFsd2F5cyA9PSBMRURfRlVMTCB0aGVz
ZSBkYXlzLg0KDQpJIHRvb2sgYW5vdGhlciBsb29rIGF0IHRoaXMgYW5kIGNoYW5nZWQgdGhpcyB0
bzoNCg0KaWYgKCFzdHJjbXAocHJvcHMtPmRlZmF1bHRfc3RhdGUsICJvbiIpKSB7DQoJaWYgKCFs
ZC0+bWF4X2JyaWdodG5lc3MpDQoJCWxkLT5icmlnaHRuZXNzID0gTEVEX0ZVTEw7DQoJZWxzZQ0K
CQlsZC0+YnJpZ2h0bmVzcyA9IGxkLT5tYXhfYnJpZ2h0bmVzczsNCn0NCg0KSSBob3BlIHRoaXMg
aXMgd2hhdCB5b3Ugd2VyZSBzdWdnZXN0aW5nLiBJJ2xsIHNlbmQgdGhlIHY4IChob3BlZnVsbHkp
DQpzb29uKGlzaCkuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpDQo=
