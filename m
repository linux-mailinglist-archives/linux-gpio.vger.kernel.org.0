Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E37CEC255
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbfKALyB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:54:01 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:47546 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKALyB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:54:01 -0400
X-AuditID: c0a8fbf4-183ff70000001fa6-3e-5dbc1cd6536b
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id F8.F0.08102.6DC1CBD5; Fri,  1 Nov 2019 12:53:58 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Fri, 1 Nov 2019 12:53:52 +0100
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
Subject: Re: [RFC PATCH v3 00/15] Support ROHM BD71828 PMIC
Thread-Topic: [RFC PATCH v3 00/15] Support ROHM BD71828 PMIC
Thread-Index: AQHVkKd1qqGVhOMLPkqepz477sbTR6d2JAEA
Date:   Fri, 1 Nov 2019 11:53:51 +0000
Message-ID: <a973baf96b7379c80c4a3af28338ec4ca7481cb5.camel@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A650176DD30E7641B12D7EBB4994D427@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUwTSRjHM9vt7hRcs1S4zhU1spqol0gPYuKYMydGjasmRmM0xoTURVaK
        R1uybQVRI5oYpfoBI8bY8GIIKBFEqfiGrUoPtKDi9aAtni+EO84ED0FFJeQIusuq8GXmP89/
        fvN/PjwDNfp/KSPMtjlFySbkcFQMea/m/4ZFkZm+9J8v/ZmAq0JhGh8dPE/jD2XtJD7d20fh
        ipYOLT7+sFGLn127QuKej60Af+o6RuCSsQsEfnfipRZfrRgDuLOplMLXBuoBvl/bReHqaIjA
        pdVBEofaV+MX7a0UPuJvofF4pIFMS+DryusAP9R9hObL6/bxtzwvaN57sYjin0d8FP+g+wbB
        nykfJfia2hGaH/bO3hizPXZZhuDcszk7y2b6dUes5Y/RKJXbSOZ3nmykC0EV6QY6iNjFqD98
        QesGMVDPhgFyNzQT6uEBQH+f8VNuACHFLkPup7Qi49mlqCEUp7AathSi8WMFip7B/oKKn48C
        RcfLt+/2BUhVp6Jg7Tta0SQ7D1VEwhN1ht2ADp2qpRStZ1eh4p6hCa1jV6NX170TdwA7CxUV
        DhJqlgF5X41o1Z5ZVOV7olF1Aur/Z/xrnUP+0V5SaVPDLkSXm0wqmoZqnt6iVZ2ESo730moL
        cajtbB9ZDH7wTEnwTNKeKbRnCu2ZQp8D2osAWYXsnCzBKaYkS6IrWbJbrPK20271AnVgPtwE
        nwNrA4CAIAB+hASXwOwJ3k7XT8+wZ+61CA6LWXLliI4AQFDDxTM36mWPyRT2FoiS/ZuVCEnO
        wMzvPZmuZ5Ws30QxV5S+uTMh5BDTafSl6+MkMUvM35Wd45y0CahTHo8xxjtEW6YoCS6nxaxM
        h9khj4diTZNzBxWcceQKVrmqou0gBRb3l1VqYEtZtbxGh/zVGj1ps9tEo4ExKgCrABaX7Xvc
        a2CAgJvBzE2U3Wny3/n+2ms5iJCDtg42KUFOYdIyFoL8RytX1T1M22CtNG+pfLyN/33JmpHd
        RXmJ2PRm3nr6ajC6hFtx6fEC351Q3CHLnGeH/4r1D/O7ku7nLf+YxKe2bc5LMpgzOsZju5vN
        HRC8fT/UGjmY0cXahQGXrmfL8Lrksf/2t5Wm4sWmLF30QHPw8KwTBcGBTVUvy+tLasKfTBzp
        sAgpP2kkh/AFtSgFg/gDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMTktMTEtMDEgYXQgMTM6MjggKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gUGF0Y2ggc2VyaWVzIGludHJvZHVjaW5nIHN1cHBvcnQgZm9yIFJPSE0gQkQ3MTgyOCBQ
TUlDDQo+IA0KLi4uDQo+IA0KPiBQYXRjaCAxNDoNCj4gICAgICAgICBBZGQgZ2VuZXJpYyBHUElP
IGRpcmVjdGlvbiBkZWZpbmVzDQo+IFBhdGNoIDE1Og0KPiAgICAgICAgIEFsbG93IGNvbnRyb2wg
b2YgR1AoSSlPIHBpbnMgb24gQkQ3MTgyOCB2aWEgR1BJTyBzdWJzeXN0ZW0NCj4gUGF0Y2ggMTY6
DQo+ICAgICAgICAgU3VwcG9ydCB0b2dnbGluZyB0aGUgTEVEcw0KDQpTb3JyeSBGb2xrcyAtIHRo
aXMgaXMgYSBsZWZ0IG92ZXIuIEkgZHJvcHBlZCB0aGUgTEVEIGRyaXZlcmZyb20gdGhlIHNlcmll
cyBmb3Igbm93Lg0K
