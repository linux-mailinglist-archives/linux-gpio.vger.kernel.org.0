Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C67A100B0C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 19:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbfKRSDr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 13:03:47 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:65376 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfKRSDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 13:03:47 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-59-5dd2dd006027
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 38.49.08102.00DD2DD5; Mon, 18 Nov 2019 19:03:44 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Mon, 18 Nov 2019 19:03:43 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "jeffrey.t.kirsher@intel.com" <jeffrey.t.kirsher@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "hofrat@osadl.org" <hofrat@osadl.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Topic: [PATCH v5 01/16] dt-bindings: regulator: Document ROHM BD71282
 regulator bindings
Thread-Index: AQHVndzxthsd4Y8wKkm7W/92Uslk+KeRDPcAgAAbkIA=
Date:   Mon, 18 Nov 2019 18:03:42 +0000
Message-ID: <fd1e4e652840346bd990c769eabe2f966bda4ed6.camel@fi.rohmeurope.com>
References: <cover.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <d29e0eb587b764f3ea77647392e45fac67bbd757.1574059625.git.matti.vaittinen@fi.rohmeurope.com>
         <20191118162502.GJ9761@sirena.org.uk>
In-Reply-To: <20191118162502.GJ9761@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.203.185.189]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C4A6AAF0465DE4A9847D36F93A87E22@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxjH995d7w7klpcK8o6pkVuWxS3iWPbHqyGTf4jnshiTzWRhIXiM
        G22gLbm2m7gsQRfUVoe4aaYNv+THYFAQKmboysBCN6iss4iui3YMqG6gATcZOEXdHafCX+/3
        fb/P5/k+fzwvS+rdTDJrNNsk2SwW8nQs1dv0wLPhuchw9uveCIvrQ1cYfGD6GwbPVgYofHws
        SuNo7wGAq/uDOnzoYqcO186c0GGH46AOXzvbTuGBM6MAj/7rB3hu5CCBjy00Evjvw7/r8Kn9
        9RQ+U70A8OXzFTQ+e7sN4B9bRmjc2h9hcMOvIQJXNAxQeOYfB4FDgUwcCfhp/HkoTOLS7n4G
        P7raQeGy4NaMtYK7yg2EmXApI1S5PxXOuSKMUOedJARPs4MWrl/10kJd2Vc64a/DfZQwN3SU
        Eso6m4Fw89RpSvgp/B0hfF31HyE0tcwzwl3P2h0wa0V6rmj7+F1jvnnjW7tWGCIj43RRFb+7
        +uIRugS4U5wghkXwTXRk4Q/aCWJZPbwCUJu/nNEuAwDVtX8LnIBlaZiOnL8xKpAAN6Dj9+sW
        ARKejEM/BL8nVGMl3IU6b01QWpGIauYeEJrejO4MjtCqpuDL6IRvEKiag9uRt6P3SfIQQBWN
        5xaNGPgGut3VSqoawDXIUTK92IiESchzc16njQ1RvfcXUtOJaHLi0ZN3HvX4g6Q6NAnXo9Pn
        N2poBrrX1kVpOgUdOzTGaDPEo8GTUaocrHItS3At0a5ltGsZ7VpG1wBdM0Am0ViYL9qktFRZ
        sqfKFoNJOT60mDxA277ZLvDYt80HCBb4wAsswSdy2zzD2frncy15xQbRasiR7YWS1QcQS/IJ
        3PbxS9l6Lk8s3iPJlqfWiyzFJ3GvjB3N1kM1q0CSiiT5qbuaZXnE3b2mNI2XpXxp90fGQtuS
        TbAxavPY5ASrZM6TZNFuM+SoC5JjVTZEteKU3H0qzlmLRJPyqqEB8BpbPllZS7L9lQ21pJ4y
        W8xSchKXsV4phWqpwW5+FjQFkljAr+Sy1EZxyhd81mdKiSCUiI7WxQibuGQll4DYTf6fP+m+
        Y9yybmiHs2Xzffhe3/7QhaLRWcflW2vebqLXNRZsXR2F1QXh9ogb5mWm0NNf+Df5Al25L6XO
        vV+60yRRkT3X/6RL5y/05oQ/2+vt2VLTeS/THj+c5R9/OBG5tM/zQXpP8Y1oWnll994bfUHw
        ztSXuSn8quHEloLxIT1PWQ1i2qukbBX/BxjTQ6o/BAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTWFyaywNCg0KSXQncyBuaWNlIHRvIGhlYXIgZnJvbSB5b3UgYWdhaW4gOikgSSBob3Bl
IHlvdSdyZSBlbmpveWluZyBhbGwgdGhlIG5ldw0KdGhpbmdzIDopDQoNCk9uIE1vbiwgMjAxOS0x
MS0xOCBhdCAxNjoyNSArMDAwMCwgTWFyayBCcm93biB3cm90ZToNCj4gT24gTW9uLCBOb3YgMTgs
IDIwMTkgYXQgMDg6NTM6NTdBTSArMDIwMCwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiANCj4g
PiArI1N1cHBvcnRlZCBkZWZhdWx0IERWUyBzdGF0ZXM6DQo+ID4gKyNidWNrCQl8IHJ1bgkJfCBp
ZGxlCQl8IHN1c3BlbmQJDQo+ID4gfCBscHNyDQo+ID4gKyMtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0tLS0t
LS0tDQo+ID4gKyMxLCAyLCA2LCBhbmQgNwl8IHN1cHBvcnRlZAl8IHN1cHBvcnRlZAl8IAlzdXBw
b3J0ZWQNCj4gPiAoKikNCj4gPiArIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gLS0tLS0tLS0tLS0NCj4gPiArIzMs
IDQsIGFuZCA1CXwgCQkJc3VwcG9ydGVkICgqKikNCj4gPiArIy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gLS0tLS0t
LS0tLS0NCj4gPiArIygqKSAgTFBTUiBhbmQgU1VTUEVORCBzdGF0ZXMgdXNlIHNhbWUgdm9sdGFn
ZSBidXQgYm90aCBzdGF0ZXMNCj4gPiBoYXZlIG93biBlbmFibGUgLw0KPiA+ICsjICAgICBkaXNh
YmxlIHNldHRpbmdzLiBWb2x0YWdlIDAgY2FuIGJlIHNwZWNpZmllZCBmb3IgYSBzdGF0ZSB0bw0K
PiA+IG1ha2UgcmVndWxhdG9yDQo+ID4gKyMgICAgIGRpc2FibGVkIG9uIHRoYXQgc3RhdGUuDQo+
ID4gKyMoKiopIEFsbCBzdGF0ZXMgdXNlIHNhbWUgdm9sdGFnZSBidXQgaGF2ZSBvd24gZW5hYmxl
IC8gZGlzYWJsZQ0KPiA+IHNldHRpbmdzLg0KPiA+ICsjICAgICBWb2x0YWdlIDAgY2FuIGJlIHNw
ZWNpZmllZCBmb3IgYSBzdGF0ZSB0byBtYWtlIHJlZ3VsYXRvcg0KPiA+IGRpc2FibGVkIG9uIHRo
YXQNCj4gPiArIyAgICAgc3RhdGUuDQo+ID4gKw0KPiA+ICsgICAgICByb2htLGR2cy1ydW5sdmwt
Y3RybDoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICAgICAgYnVjayBj
b250cm9sIGlzIGRvbmUgYmFzZWQgb24gcnVuLWxldmVsLiBSZWd1bGF0b3IgaXMNCj4gPiBub3QN
Cj4gPiArICAgICAgICAgIGluZGl2aWR1YWxseSBjb250cm9sbGFibGUuIFNlZSAuLi9tZmQvcm9o
bSxiZDcxODI4LQ0KPiA+IHBtaWMueWFtbCBmb3INCj4gPiArICAgICAgICAgIGhvdyB0byBzcGVj
aWZ5IHJ1bi1sZXZlbCBjb250cm9sIG1lY2hhbmlzbS4gT25seSBidWNrcw0KPiA+IDEsIDIsIDYN
Cj4gPiArICAgICAgICAgIGFuZCA3IHN1cHBvcnQgdGhpcy4NCj4gPiArICAgICAgICB0eXBlOiBi
b29sZWFuDQo+IA0KPiBJIGRvbid0IHRoaW5rIEkgc2F3IHRoaXMgaGF2aW5nIHRoZSBlZmZlY3Qg
b24gc2V0X3ZvbHRhZ2UoKSB0aGF0IEknZA0KPiBoYXZlIGV4cGVjdGVkIGluIHRoZSBkcml2ZXI/
ICANCg0KVGhlIHN1cHBvcnQgZm9yIHRoaXMgaXMgYWRkZWQgaW4gcGF0Y2ggMTIuIEkgc2hvdWxk
J3ZlIG9yZGVyZWQgdGhlDQpwYXRjaCBzZXJpZXMgc28gdGhhdCBhbGwgcmVndWxhdG9yIHBhdGNo
ZXMgd2VyZSBvbmUgYWZ0ZXIgYW5vdGhlci4NClNvcnJ5IGZvciB0aGF0Lg0KVGhlIHBhdGNoIDEy
IGFkZHMgdGhlIHJ1bi1sZXZlbCBzdXBwb3J0LiBQbGVhc2Ugc2VlIHRoZSBmdW5jdGlvbnMNCmdl
dF9ydW5jb250cm9sbGVkX2J1Y2tzX2R0KCksDQptYXJrX3JlZ3VsYXRvcl9ydW5sdmxfY29udHJv
bGxlZCgpIChzZXRzIHRoZSBnLT5ydW5sdmwpDQphbmQgc2V0X2J1Y2tfcnVubHZsX2NvbnRyb2xs
ZWQoKSAoY2FsbGVkIGJhc2VkIG9uIGctPnJ1bmx2bCkNCndoaWNoIGNoYW5nZXMgdGhlIG9wcyB0
byBkaXNhbGxvdyBzZXR0ZXJzIGFuZCB0byBnZXQgdm9sdGFnZSBiYXNlZCBvbg0KY3VycmVudCBy
dW5sZXZlbCAtIGFuZCBkaWZmZXJlbnQgb3BzIGRlcGVuZGluZyBvbiBpZiBydW5sZXZlbHMgYXJl
DQpjb250cm9sbGVkIGJ5IEdQSU8gb3IgSTJDLiBBZGRpdGlvbmFsbHkgc2V0X2J1Y2tfcnVubHZs
X2NvbnRyb2xsZWQoKQ0KYWRkcyBEVCBwYXJzaW5nIGNhbGwtYmFjayBmb3Igc2V0dGluZyB0aGUg
aW5pdGlhbCB2b2x0YWdlcy4NCg0KQ29tcGxleCwgSSBrbm93LiBJJ20gb3BlbiB0byBoaW50cyx0
aXBzIGFuZCBzdWdnZXN0aW9ucyA6KQ0KDQo+ID4gKyAgICAgIHJvaG0sZHZzLXJ1bmxldmVsLW1p
Y3Jvdm9sdHM6DQo+ID4gKyAgICAgICAgbWluaW11bTogMA0KPiA+ICsgICAgICAgIG1heGltdW06
IDIwMDAwMDANCj4gPiArICAgICAgICBtYXhJdGVtczogNA0KPiA+ICsgICAgICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICAgICAgQXJyYXkgb2Ygdm9sdGFnZXMgZm9yIHJ1bi1sZXZlbHMuIEZp
cnN0IHZhbHVlIGlzIGZvcg0KPiA+IHJ1bi1sZXZlbCAwLA0KPiA+ICsgICAgICAgICAgc2Vjb25k
IGZvciBydW4tbGV2ZWwgMSBldGMuIE1pY3Jvdm9sdHMuDQo+IA0KPiBXaGF0J3MgdGhlIG1hcHBp
bmcgZnJvbSBhcnJheSBpbmRleGVzIHRvIHRoZSBuYW1lcyB1c2VkIGVsc2V3aGVyZSB0bw0KPiBz
dXBwb3J0IHJ1bmxldmVscz8NCg0KSG1tLiBTb3JyeSBNYXJrLCBJIGRvbid0IHRoaW5rIEkgZm9s
bG93IHlvdXIgcXVlc3Rpb24uIERvIHlvdSBtZWFuDQpuYW1lcyBsaWtlIExQU1IsIFNVU1BFTkQs
IElETEUsIFJVTj8gSWYgc28sIHRoZW4gSSBtaWdodCBuZWVkIHRvDQpyZXBocmFzZSB0aGlzLiBU
aGUgcnVubGV2ZWxzIHJlZmVycmVkIGhlcmUgYXJlIGRpZmZlcmVudCBmcm9tIExQU1IsDQpTVVNQ
RU5ELCBJRExFIGV0Yy4gVGhleSBhcmUgYWN0dWFsbHkgJ3N1Yi1sZXZlbHMnIGZvciBQTUlDJ3Mg
UlVOIHN0YXRlLg0KRWcsIGtpbmQgb2YgYSAnZmFzdCB3YXknIHRvIGNoYW5nZSB2b2x0YWdlcyBm
b3IgbXVsdGlwbGUgcG93ZXIgcmFpbHMNCndoZW4gU29DIGlzIGF0IFJVTiBzdGF0ZS4gVGhlIG5h
bWVzIEkgaGF2ZSBzZWVuIGFyZSBSVU4wLCBSVU4xLCBSVU4yDQphbmQgUlVOMy4gVGhhdCBtYXBw
aW5nIGlzIGRlc2NyaWJlZCBpbiBkZXNjcmlwdGlvbiBhYm92ZS4NCg0KQnIsDQoJTWF0dGkgVmFp
dHRpbmVuDQo=
