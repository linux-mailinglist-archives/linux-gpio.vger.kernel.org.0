Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44A761423CD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 07:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgATGsa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 01:48:30 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:55856 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgATGs3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 01:48:29 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-71-5e254d3a9540
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 25.A8.08102.A3D452E5; Mon, 20 Jan 2020 07:48:27 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 20 Jan 2020 07:48:16 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
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
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 11/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Thread-Topic: [PATCH v10 11/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Thread-Index: AQHVzRqEzUhPKa3zcECjmnaGmPw9eafulMiAgAR7eYA=
Date:   Mon, 20 Jan 2020 06:48:15 +0000
Message-ID: <9f405dfc4c7e56e32f4eb2f9cb6e87c05aea1ac9.camel@fi.rohmeurope.com>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <c8ed62a1efa0c6fde93a8a08fe6bc74a450a34f3.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
         <20200117102127.GD15507@dell>
In-Reply-To: <20200117102127.GD15507@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <705A642178A6094F8C12E603197A316A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0wTSRx2drfb4bE4VrAjPhJW8SIGtPHBhDPGXIJZjacmRr07TnCVlaK0
        xW1RUWPIGeUsmqCi5qqAktYz0vio+EKMSKrWau6CUHyCEkUeGozii6Dcdbsq/DXf/L5XJvkN
        pHVP2ViYbbZJslnM4dlwpvZ4nyfxx5/j06d0uwFx1ge0pLD7mJa8K/UzZH/rc5aUe//RkKLb
        VRry6Nxphjx5fx2QD41/UqTk898UebOrRUPOln8GpKH6MEvOvToJyI3KRpa47tVT5LDLx5B6
        fypp9l9nyfYrXi3pbzrDzI4R3GVuILy+v10rlLk3C5cczVrBc2InKzxuqmGFm/cvUMLBsl5K
        OF75USv0eMYuCv8tYuZK0bZ+cXaWefKsFRHG8os7mNwPURsbegtBAfBG2QGEGE3DlU1T7SAc
        6lAA4LM+J6NefAB/aX8EFBGLZmL7A60dhMFoZMBOX1tIQyMnxPv8LUAhhqM0XLg3wKii3/Gp
        2qcaFafgLz13QnMGxeP6835WyeTQAlzTF6l2eQE+HailFU0YSsCdlyooBQM0Bu8s6A5hGumx
        58XHUCZGCDtr/qVVHIM7n/V/nfP4Sm8ro+TTaCI+VT1Ztc7GHe03GRXH4ZKi1tBbODQM3/rr
        OVMMRjgGNTgG3I5Bbscgt2OQ+wjQnADYJGbnZIk2yZAkS3lJssVoCh6rLCYPUDfm3UXwX93c
        OkBBUAdGQoqP4bRr+HRd1EpLZr5RtBoz5LwcyVoHMKT5aK55d1y6jssU8zdJsuUbNQoyvJ77
        oXXPch1SutZKUq4kf2NHQ8hjbvP8+HTdMFnKkjauzs6xDdAUDFPCw2OjrZI5U5LFPJsxQ1mP
        DGtwPxQqMthrVuycNVc0Baeq1Q8mweLO0goaektdFbSOMVvMUqyeIylBKVKkxjzz96IuoIeA
        H85tVYIig9/me05XsIIKVgSSeaXCJg5QsQVgzhZ5Wqp+bH8cpiYYtmwQfFmuX0hK8Yxbf6Q0
        RoxvqaaWNS2dUZKQNnJcT8m8hVVDIo7YO+c2+Do63rfBq5+OHlpwcv7Vt11LLh946QbbMn/1
        JiYXiPbRI366G5WWXLxjnElTVJW4tL1vesKT/lTD7VVtZa4bSfm5W9ftfrgs42jktaE8YzWK
        hgRator/A1AMV27zAwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8sDQoNCk9uIEZyaSwgMjAyMC0wMS0xNyBhdCAxMDoyMSArMDAwMCwgTGVlIEpvbmVzIHdy
b3RlOg0KPiBPbiBGcmksIDE3IEphbiAyMDIwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+IA0K
PiA+IFJPSE0gQkQ3MTgyOCBQTUlDIGNvbnRhaW5zIDQgcGlucyB3aGljaCBjYW4gYmUgY29uZmln
dXJlZCBieSBPVFANCj4gPiB0byBiZSB1c2VkIGZvciBnZW5lcmFsIHB1cnBvc2VzLiBGaXJzdCAz
IGNhbiBiZSB1c2VkIGFzIG91dHB1dHMNCj4gPiBhbmQgNC50aCBwaW4gY2FuIGJlIHVzZWQgYXMg
aW5wdXQuIEFsbG93IHRoZW0gdG8gYmUgY29udHJvbGxlZA0KPiA+IHZpYSBHUElPIGZyYW1ld29y
ay4NCj4gPiANCj4gPiBUaGUgZHJpdmVyIGFzc3VtZXMgYWxsIG9mIHRoZSBwaW5zIGFyZSBjb25m
aWd1cmVkIGFzIEdQSU9zIGFuZA0KPiA+IHRydXN0cyB0aGF0IHRoZSByZXNlcnZlZCBwaW5zIGlu
IG90aGVyIE9UUCBjb25maWd1cmF0aW9ucyBhcmUNCj4gPiBleGNsdWRlZCBmcm9tIGNvbnRyb2wg
dXNpbmcgImdwaW8tcmVzZXJ2ZWQtcmFuZ2VzIiBkZXZpY2UgdHJlZQ0KPiA+IHByb3BlcnR5IChv
ciBsZWZ0IHVudG91Y2hlZCBieSBHUElPIHVzZXJzKS4NCj4gPiANCj4gPiBUeXBpY2FsIHVzZSBm
b3IgNC50aCBwaW4gKGlucHV0KSBpcyB0byB1c2UgaXQgYXMgSEFMTCBzZW5zb3INCj4gPiBpbnB1
dCBzbyB0aGF0IHRoaXMgcGluIHN0YXRlIGlzIHRvZ2dsZWQgd2hlbiBIQUxMIHNlbnNvciBkZXRl
Y3RzDQo+ID4gTElEIHBvc2l0aW9uIGNoYW5nZSAoZnJvbSBjbG9zZSB0byBvcGVuIG9yIG9wZW4g
dG8gY2xvc2UpLiBQTUlDDQo+ID4gSFcgaW1wbGVtZW50cyBzb21lIGV4dHJhIGxvZ2ljIHdoaWNo
IGFsbG93cyBQTUlDIHRvIHBvd2VyLXVwIHRoZQ0KPiA+IHN5c3RlbSB3aGVuIHRoaXMgcGluIGlz
IHRvZ2dsZWQuIFBsZWFzZSBzZWUgdGhlIGRhdGEgc2hlZXQgZm9yDQo+ID4gZGV0YWlscyBvZiBH
UElPIG9wdGlvbnMgd2hpY2ggY2FuIGJlIHNlbGVjdGVkIGJ5IE9UUCBzZXR0aW5ncy4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBmaS5y
b2htZXVyb3BlLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8Ymdv
bGFzemV3c2tpQGJheWxpYnJlLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiANCj4gTGludXMsIElzIHRoYXQgYW4gQWNrPw0K
SSBoYXZlIGFsd2F5cyB0aG91Z2h0IHRoYXQgcmV2aWV3ZWQtYnkgaW1wbGllcyB0aGF0IHJldmll
d2VyIGlzIE9rIHdpdGgNCnRoZSBwYXRjaCAoaW1wbGVzIEFjaykuIE1heWJlIEkgaGF2ZSBtaXN0
YWtlbj8NCg0KQnIsDQogICAgLS1NYXR0aQ0K
