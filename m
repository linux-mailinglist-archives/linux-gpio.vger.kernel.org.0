Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C4AE3452
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 15:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502533AbfJXNeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 09:34:36 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:60428 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502516AbfJXNeg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 09:34:36 -0400
X-AuditID: c0a8fbf4-183ff70000001fa6-d3-5db1a8699e44
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 55.D3.08102.968A1BD5; Thu, 24 Oct 2019 15:34:33 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Thu, 24 Oct 2019 15:34:27 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 12/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Thread-Topic: [RFC PATCH v2 12/13] gpio: bd71828: Initial support for ROHM
 BD71828 PMIC GPIOs
Thread-Index: AQHVimFPtrmWvD61tkGGPiRCcHSxDqdpjsIAgAAad4A=
Date:   Thu, 24 Oct 2019 13:34:27 +0000
Message-ID: <588fccc0cafd01de7cb35b696a953f8a6e6937f6.camel@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <9b53139b7043572b3846a214694dbf8fe1f56f50.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdZ5CC4mtNYrurx_2M_3BN6Tu7rQ=d4-y-HOsDbRteKjjA@mail.gmail.com>
In-Reply-To: <CACRpkdZ5CC4mtNYrurx_2M_3BN6Tu7rQ=d4-y-HOsDbRteKjjA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3AD059EE561F74FB995D7AE6B6648E4@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TWUwTURSGc2emMxd0dChgrxVcmghBo6jR5LrE+KIZH0TRBxMTrKMMbRVa
        nBb3B3xApajBiFst4MJSEcFWjbIlBkGwGpXFigoqwRhxgYhVYlR0hlHh6f73fuc//3k4F5La
        17QeWqwOUbIKqQY6lLrt+eGbZfF4k+Z0npyHi1qeMPhgXwmDg/l+Cp/ofkPjwoaHGpxz/7oG
        v7hxlcKvvjYC/K39EIHzfpYS+PPhlxp8rfAnwG3Vbhrf+FgB8N3L7TQuftpCYHdxM4Vb/Mtx
        l7+Rxll1DQweCnipZZF8eUE54Ps7shi+oHwvX+XqYnhfWTbNdwZqab6p4ybBnyr4TvCey4MM
        /8U3eU3ohjFLNguOHessJmv80k1jzH2ld0H669hdR9qyqUzQGeMEIRBx89GdozWME4RCLRcA
        6MSzVlK9NANU1ZcnXyCkuSXI+YxRDBHcQnSn2U0pNSTnhqiirYJQQDi3EbmzSim1yIi8Xx5q
        VL0I3brSOKwpbjoarC2iFc1yCaipN0CrYR8AqmwoBAoI4RKR339suCngolF2Zt+wJjkd8r0d
        1Khjc6io9hGp6kjU2zP0992A6r53U8rQJBeHKqvjVbkMBT6tU7tMQ3k53Yw6Qhi6d+YNlQsm
        uEYFuEbMrhGza5TZNcp8DmjKAEoTLKkmwSHOnS2JGbMlmzlNPrbY0nxA3ZjgLfC7fmU9ICCo
        BxMhYYhkw896k7TjNtuSd5sFu9koZaSK9nqAIGmIYGtiZMYmC7v3iJLtH5oEKYOOje0+lqTl
        lKxtopguSv9oFIQGxKaUyMYwSTSJu1IsqY4RTMAQpXmoPsIuWpNFSchwmI3Kehjt8n4oaKyc
        u0axs/Z0IU1+Va1+MBPm9uZfIGFDfvEFUktZbVZRr2MfK6WcUmrOsP4Peg90EBjC2fmlMh0r
        f5v/fd7LEYQcMXl8pRLhEEaQPhM492mIs9MT9E0n419N/bpvywpxZ0x/TFTs9kszViV2RW9d
        FLX/9MqLvcF3hcESXVk6sYDJXHq/2RMX7T1+bcBx890ZZ9LODybzo+DA3rXVPl/Pg6ML1o7r
        bO0xJjzf+nIjNTihPey8KwiG+oORwQNxv6xTsm2muFw+Z2CxZ31e7epDBspuFubOICW78Ac6
        bWGa8wMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGludXMsDQoNClRoYW5rcyBhZ2FpbiBmb3IgdGhlIHJldmlldyA6KSBIaWdobHkgYXBw
cmVjaWF0ZWQhDQoNCk9uIFRodSwgMjAxOS0xMC0yNCBhdCAxMzo1OSArMDIwMCwgTGludXMgV2Fs
bGVpaiB3cm90ZToNCj4gT24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMTo1MSBQTSBNYXR0aSBWYWl0
dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+IA0K
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
UElPIG9wdGlvbnMgd2hpY2ggY2FuIGJlIHNlbGN0ZWQgYnkgT1RQIHNldHRpbmdzLg0KPiANCj4g
c3BlbGxpbmcgb2Ygc2VsZWN0ZWQNCg0KUmlnaHQsIHRoYW5rcy4NCg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0K
PiANCj4gT3ZlcmFsbCBsb29rcyB2ZXJ5IGdvb2QuDQo+IA0KPiA+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiANCj4gSSB0aGluayB0aGV5IHdhbnQgeW91IHRvIHVzZSBH
UEwtMi4wLW9ubHkgdGhlc2UgZGF5cy4NCg0KSG1tLiBJcyB0aGlzIGRvY3VtZW50ZWQgc29tZXdo
ZXJlPyBUaGUgTElDRU5TRVMvcHJlZmVycmVkL0dQTC0yLjANCnN0aWxsIHN0YXRlczoNClZhbGlk
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KVmFsaWQtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkNClZhbGlkLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNClZhbGlkLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcg0KU1BEWC1VUkw6IGh0dHBzOi8vc3Bk
eC5vcmcvbGljZW5zZXMvR1BMLTIuMC5odG1sDQpVc2FnZS1HdWlkZToNCiAgVG8gdXNlIHRoaXMg
bGljZW5zZSBpbiBzb3VyY2UgY29kZSwgcHV0IG9uZSBvZiB0aGUgZm9sbG93aW5nIFNQRFgNCiAg
dGFnL3ZhbHVlIHBhaXJzIGludG8gYSBjb21tZW50IGFjY29yZGluZyB0byB0aGUgcGxhY2VtZW50
DQogIGd1aWRlbGluZXMgaW4gdGhlIGxpY2Vuc2luZyBydWxlcyBkb2N1bWVudGF0aW9uLg0KICBG
b3IgJ0dOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIChHUEwpIHZlcnNpb24gMiBvbmx5JyB1c2U6
DQogICAgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiAgb3INCiAgICBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQogIEZvciAnR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgKEdQTCkgdmVyc2lvbiAyIG9yIGFueSBsYXRlciB2ZXJzaW9uJw0KdXNlOg0KICAg
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KICBvcg0KICAgIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQoNCihhdCBsZWFzdCBmb3IgNS40LXJjMikN
Cg0KVGhpcyBsb29rcyBsaWtlICJHUEwtMi4wIiBzaG91bGQgc3RpbGwgYmUgdmFsaWQuIE5vdCB0
aGF0IEkgaGF2ZQ0KYW55dGhpbmcgYWdhaW5zdCB0aGUgIkdQTC0yLjAtb25seSIgLSBJIGFtIGp1
c3QgYSB0aW55IGJpdCBmcnVzdHJhdGVkDQp3aGF0IGNvbWVzIHRvIHBvbGlzaGluZyB0aGUgU1BE
WCBmb3JtYXQgOi8NCg0KPiA+ICsjZGVmaW5lIEJENzE4MjhfT1VUIDANCj4gPiArI2RlZmluZSBC
RDcxODI4X0lOIDENCj4gDQo+IFRoZXNlIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIEJENzE4Mjgs
IGp1c3Qgc2tpcCB0aGVzZSBkZWZpbmVzDQo+IGFuZCBoYXJkY29kZSAwLzEgaW4gdGhlIGNvZGUg
Y2FsbGVkIGZyb20gZ3Bpb2xpYi4NCg0KSSBwZXJzb25hbGx5IGRvbid0IGxpa2UgdXNpbmcgMC8x
IGFzIEkgX2Fsd2F5c18gbmVlZCB0byBjaGVjayB3aGljaCBpcw0KSU4gYW5kIHdoaWNoIGlzIE9V
VC4gSXQgbXVzdCBiZSBzb21laG93IHJlbGF0ZWQgdG8gbXkgYnJhaW4gY2hlbWlzdHJ5DQpidXQg
dGhpcyBqdXN0IGRvZXMgbm90IHN0YXkgaW4gbXkgbWluZCBvdmVyIGEgd2Vla2VuZC4uLiBCdXQg
eW91IGFyZQ0KcmlnaHQgLSBoYXZpbmcgdGhlc2UgZGVmaW5lcyBpbiBiZDcxODI4IGRyaXZlciBk
b2VzIG5vdCBoZWxwIG11Y2guIFdoZW4NCkkgc3RhcnQgd2l0aCBuZXh0IEdQSU8gY2hpcCBJIG11
c3Qgb25jZSBhZ2FpbiBkaWcgdGhlIHZhbHVlcyBmcm9tIHRoZXNlDQpkZWZpbmVzIG9yIGZyb20g
c29tZXdoZXJlIGVsc2UuIFRodXMuLi4NCg0KPiAgSWYgd2Ugd2FudCBkZWZpbmVzDQo+IGZvciB0
aGlzIHRoZXkgc2hvdWxkIGJlIGdlbmVyaWNhbGx5IG5hbWVkIGFuZCBwdXQgaW4NCj4gPGxpbnV4
L2dwaW8vZHJpdmVyLmg+DQoNCi4uLnBsYWNpbmcgdGhlIGRlZmluZXMgaW4gdGhpcyBoZWFkZXIg
d2hpY2ggaXMgdmlzaWJsZSBhbHNvIGluIG5leHQNCmRyaXZlciB3b3VsZCBiZSAidGhlIHJpZ2h0
IHRoaW5nIHRvIGRvIih0bSkuDQoNCkRvIHlvdSB0aGluayB3ZSBzaG91bGQgYWRkIHRoZSBkZWZp
bmVzIHRoZXJlIHRoZW4/IEkgd2FzIG5vdCB0cnlpbmcgdG8NCmRvIHRoYXQgYXMgSSB0aG91Z2h0
IHRoYXQgc29tZW9uZSByZWFsbHkgbG92ZXMgdGhlIHJhdyBudW1iZXJzIGFuZA0KZGlzbGlrZXMg
ZGVmaW5lcyAtIGFzIHRoZXNlIGhhcmQtY29kZWQgdmFsdWVzIDEgYW5kIDAgc2VlbSB0byBiZSB1
c2VkDQpldmVyeXdoZXJlLi4uIDpdIE1heWJlIHRoZSBwbGFpbiBudW1iZXJzIGFyZSBvbmx5IGRp
ZmZpY3VsdCBmb3IgbWU/DQoNCj4gTmljZSB1c2Ugb2YgdGhlIGNvbmZpZyBBUEkhDQoNClRoYW5r
cyA9KSBJIGFkbWl0IEkgaGF2ZSBzdG9sZW4gdGhhdCBmcm9tIHNvbWUgb3RoZXIgZHJpdmVyLiBT
byBJIGRvbid0DQpyZWFsbHkgZGVzZXJ2ZSB0aGUgY3JlZGl0cyA9KSBJdCdzIGVhc3kgdG8gYnVp
bGQgd2hlbiB0aGUgZm91bmRhdGlvbnMNCmFyZSBkb25lIHdlbGwgOykNCg0KQnIsDQoJTWF0dGkg
VmFpdHRpbmVuDQo=
