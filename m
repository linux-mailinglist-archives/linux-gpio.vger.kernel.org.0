Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFCC11AA35
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 12:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfLKLtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 06:49:05 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49254 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbfLKLtF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 06:49:05 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-9a-5df0d7ae1537
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 34.B2.08102.EA7D0FD5; Wed, 11 Dec 2019 12:49:02 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 11 Dec 2019 12:48:56 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
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
Subject: Re: [PATCH v6 12/15] rtc: bd70528 add BD71828 support
Thread-Topic: [PATCH v6 12/15] rtc: bd70528 add BD71828 support
Thread-Index: AQHVsAgtLDOE1gVnBUinFPzstDImkqe0vi8AgAAC8oA=
Date:   Wed, 11 Dec 2019 11:48:56 +0000
Message-ID: <830dad816b6d7f375e7c821e8e435931d1cd4afa.camel@fi.rohmeurope.com>
References: <cover.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <16a2492d4c70a80628dbf1a64a85c5b554c7f6e4.1576054779.git.matti.vaittinen@fi.rohmeurope.com>
         <20191211113828.GW1463890@piout.net>
In-Reply-To: <20191211113828.GW1463890@piout.net>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A0135D61D3D4542ABB9B3608955BE32@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxjfuff23gN49VBwHOo08266OSOORJOTxTkX5nb5ZzHRZK8QvI47
        SoS2uS0bbv/gCNWiM+jAzQaq1qIMG6sFHyMwXcOzGpQOCmaiKyKJOis6wfkY7t4Whb/Od77f
        63zJdyCtr+MMsMBkkxWTVCiwicy5+icnlh0bGMt5u/GHBcTT28+RbdHDHPlvTwdHHtQGGVId
        GWHJyLltgOxv69GRHeebdKTskI8lf548zpBr4+2ATPRtp0jV0yMUubfzqo4ctHsY0rj/KSB/
        NNew5OTfxwDpONrHkrqBXorU1HUx5O59B0V6g2tJdTDKkaFgO0vKegdpUt7axpHJ8AmG7Or5
        aM180evyAvHJ4z1AvDtYzoku73fir84hTvQ3OFjxSriFFc/Wejnx0K4fdeLEhd2MOHrQx4id
        g6cp8SfXI0r07WwDYv3Rh5z4j3/BOvR50qpNku3r9QX5puWrNyYZw6eyLMN0yeVLIaoU9NEV
        IAFitAKHIj9zFSAR6lE/wK7AMzZ+6QK4vO+6ikDIolW44jKnCVJRFnZdtDMah0a/JeEbVQdi
        TiloNf634fYU6T0cqqli4vU7+N54S4zDoEXYPzAc8+TRx7ijZyr4PMB3fLcpjZOAMnHpmJ/V
        aoDmY0dpNNanURr2jz7UxV+NsKfl4tQEc/HN65NTfQG3Poowmj+NlmBf8/K4dA3eXjPMxeuF
        uGpHJFbzKBl37xthKsHLzhkJzmm1c4baOUPtnKE+AHQNABdJBYX5kk3OzFDk4gzFbCxSjy/N
        RX4QX7sHZ8CzQHYAUBAEQDqkhLk83T2Wo5+9yZy3xShZjblKcaFsDQAMaSGV77RHc/R8nrTl
        W1kxP4fmQUZI49+I7M7RIy1rsyxbZOU5+gqEAua5ftU0WZHz5ZKvCgpt0zAFEzTzREOqVTbl
        yYpUbDPmauuRa1X3Q4NmqbmWsCrnrRapSO3GpUGwFFberHXTsK22zk3rGZPZJBvSeLuWhDSq
        sdj0IugWSINASOHdmtEs9e+98LmlRlBqhCNPG81qk6YhQylo8Fa+u6G1uvnS1tnu9O55uGRF
        lhC6L7c8HvZcG+0SGqO/eyLuiGWyiZQ3dW6YsL/efuRKwgdnK7t/Wfm9dOGzJVdXfug3LD3z
        ycDE0J2y9GV0fcberW9mfTMJx19ljKHjn4b3/WXI/uKlU4eT39+4+DXY5ECG7M1z8N4bGYtS
        sGMtLTBWo5T5Fq1Ypf8B6qHyojgEAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gQWxleGFuZHJlLA0KDQpPbiBXZWQsIDIwMTktMTItMTEgYXQgMTI6MzggKzAxMDAsIEFs
ZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBIaSwNCj4gDQo+IEkganVzdCByZWFsaXNlZCB0aGUg
c3ViamVjdCBpcyBtaXNzaW5nIGEgY29sb24sIGl0IHNob3VsZCBiZToNCj4gDQo+IHJ0YzogYmQ3
MDUyODogYWRkIEJENzE4Mjggc3VwcG9ydA0KDQpSaWdodC4gVGhhbmtzIGZvciBwb2ludGluZyBp
dCBvdXQgOikNCg0KPiBQbGVhc2UgZml4IGl0IGluIGNhc2UgeW91IGV2ZXIgaGF2ZSB0byByZXNl
bmQgZm9yIGFub3RoZXIgcmVhc29uLg0KDQpXaWxsIGRvIDopDQoNCkJyLA0KCU1hdHRpIFZhaXR0
aW5lbg0KDQo=
