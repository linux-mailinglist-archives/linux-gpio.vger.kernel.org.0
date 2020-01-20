Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8ED3142B09
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 13:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgATMla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 07:41:30 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:43708 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 07:41:30 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-ca-5e259ff60110
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 0A.AA.08102.6FF952E5; Mon, 20 Jan 2020 13:41:26 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 20 Jan 2020 13:41:14 +0100
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
Thread-Index: AQHVz3GxRarqEI+FJkC62zSkifitkKfzbi0A
Date:   Mon, 20 Jan 2020 12:41:14 +0000
Message-ID: <ecc8ab43dfdb78c7bcab82311f608f6d4e12dc5c.camel@fi.rohmeurope.com>
References: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1579511114.git.matti.vaittinen@fi.rohmeurope.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A3D109FBE7D05489C91039926E23B72@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1AUZRjH593d211+bPNygryRNrUjUo1CNEav5TQ2Sb415Thj9YcVuMbK
        kcfdzd7RgNZEMGicDAr4A0/uTpJTwPPQC4b4NTGEhKdjHYLglDAow4yMgoXiGGrtcir88+73
        fZ7n8/3uH8/L0/p6Lo7PMtlkxSQZRTac6ayd9a+cccenvTpctxrXBAc4vHvyOIcflvdw+I4z
        wOADo2MsHuvcDbC7+6IO7znfqMOFxxpY/GfTaQaP3D0L8Ez/DxTe/+AEhf8uGdbh6l01DP7J
        /QDgS61VLG666QO452Q/iz2DQQpXeXoZPPVPMYWDgVR8IDDJ4auBsywuDA7RuKijm8OPLp9h
        cOnF9WuXEq/LC8jsv+WATA0VccTl3UlaHFc54q8vZslfl9tZ8ovTy5FjpRU6MnOhjCHj1Q0M
        +W2omSKHXPcp0lDSDUjtyXscmfY/vxFujlizVbJ9vSkr05T09pYIw/G+vZylUsi9Nn2LzQc3
        I+0gjEdwFbpV8StlB+G8Hg4A1FjeyoQuvQD11p9m7YDnWbgG2a9wmoyGq9GZYJQ2QsNABHLV
        lnCa0SKI0aFL93Sa1mb+OFhFhfRraLjaSWssA+NRUbNFKwtwA5qqu05rWg/Xoba+ibnxMJiK
        2tsCcxrApag4f3JO0zAW+cdD9ghCVNP+Ox3SMejG9UeP6yLquD/KaFE0fBk1tCaF0LWoxd34
        2OZFtH/PKBf6hSh07vAYsw8sdixIcMzTjgW0YwHtWEAfBbp6gLKlLGOmZJOTExU5J1ExG7LV
        z5fmbD8Ibd2dn8F/Xe93AYoHXeBZnhJjBO4rMU3/zFZzRp5BshrSlRyjbO0CiKfFaOFoQXya
        XsiQ8nbIivlJ6zmeEWOFhNGyL/RQy9ouyxZZedJdwvMiEh5WqWCUImfKuduyjLb5NsWHaebh
        cdFW2ZQhK1KOzZCubUe6VV0PrRWp5h5xablWi5StVkNoACTz+244f6T5bqdHPQenOjy0njGZ
        TXJcrIDfVAGoAYYc09O4CRDLA3GRoGh2keoDfOo2oQZRatDAG6IWZJPmW3H5YPHns4c/u3Aq
        pfluQeLrlh353m+b6FP2IwWZ68Dg8iUp7/R/2PlCwvrAyJaVm26/+1EeO1KTK99mIs5t3vVB
        4rLKl86n9u28EvQVruK2rYjXfeLbnlrstV8rrfv4LdDigx6j8N7y8aS9ZfwKQ8KyysH2PvJd
        64m2b3qmY6Yrv3f7Pk2pEBmrQUp+hVas0v+4eIqdPQQAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8sDQoNCkRvIHlvdSBrbm93IHRob3NlIGRheXMgd2hlbiBub3RoaW5nLCBfbm90aGluZ18g
anVzdCB3b3JrcyBvdXQgYXMNCmludGVuZGVkPyBUb2RheSBpcyBvbmUgb2YgdGhvc2UuDQoNCk9u
IE1vbiwgMjAyMC0wMS0yMCBhdCAxMToxMiArMDIwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiBQYXRjaCBzZXJpZXMgaW50cm9kdWNpbmcgc3VwcG9ydCBmb3IgUk9ITSBCRDcxODI4IFBNSUMN
Cj4gDQo+IFJPSE0gQkQ3MTgyOCBpcyBhIHBvd2VyIG1hbmFnZW1lbnQgSUMgY29udGFpbmluZyA3
IGJ1Y2tzIGFuZCA3IExET3MuDQo+IEFsbA0KPiByZWd1bGF0b3JzIGNhbiBiZSBjb250cm9sbGVk
IGluZGl2aWR1YWxseSB2aWEgSTJDLiBCdWNrcyAxLDIsNiBhbmQNCj4gNyBjYW4gYWxzbyBiZSBh
c3NpZ25lZCB0byBhICJyZWd1bGF0b3IgZ3JvdXAiIGNvbnRyb2xsZWQgYnkgcnVuLQ0KPiBsZXZl
bHMuDQo+IEVnLiBSdW4gbGV2ZWwgc3BlY2lmaWMgdm9sdGFnZXMgYW5kIGVuYWJsZS9kaXNhYmxl
IHN0YXR1c2VzIGZvciBlYWNoDQo+IG9mDQo+IHRoZXNlIGJ1Y2tzIGNhbiBiZSBzZXQgdmlhIHJl
Z2lzdGVyIGludGVyZmFjZS4gVGhlIGJ1Y2sgcnVuLWxldmVsDQo+IGdyb3VwDQo+IGFzc2lnbm1l
bnQgKHNlbGVjdGlvbiBpZiBidWNrIGlzIHRvIGJlIGNvbnRyb2xsZWQgaW5kaXZpZHVhbGx5IG9y
IHZpYQ0KPiBydW4tbGV2ZWxzKSBjYW4gYmUgY2hhbmdlZCBhdCBydW4tdGltZSB2aWEgSTJDLg0K
PiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgYnJpbmdzIG9ubHkgdGhlIGJhc2ljIHN1cHBvcnQgZm9y
IGNvbnRyb2xsaW5nDQo+IHJlZ3VsYXRvcnMgaW5kaXZpZHVhbGx5IHZpYSBJMkMuDQoNCi8vc25p
cA0KDQo+IFBhdGNoIDExOg0KPiAgICAgICAgIEFsbG93IGNvbnRyb2wgb2YgR1AoSSlPIHBpbnMg
b24gQkQ3MTgyOCB2aWEgR1BJTyBzdWJzeXN0ZW0NCj4gDQoNCkkgYWNjaWRlbnRhbGx5IHJlYmFz
ZWQgdG8gd3JvbmcgY29tbWl0IGFuZCBjcm9wcGVkIHRoZSBHUElPIHBhdGNoIG91dA0Kb2YgdGhl
IHNlcmllcy4gTGVlIC0gY2FuIHlvdSB0YWtlIHRoZSBHUElPIHBhcnQgZnJvbSB2MTEgKHBhdGNo
IDExLzEzDQp0aGVyZSkuIEl0IHNob3VsZCBhcHBseSBjbGVhbmx5IGFuZCBJIGhhdmUgbm8gY2hh
bmdlcyB0byBpdC4gT3Igc2hvdWxkDQpJIGp1c3QgcmVzZW5kIHRoZSB3aG9sZSBzZXJpZXMgKGFn
YWluKT8NCg0KQnIsDQogICAgTWF0dGkgVmFpdHRpbmVuDQo=
