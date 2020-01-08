Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47916133D31
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 09:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgAHIeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 03:34:11 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:43788 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgAHIeL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 03:34:11 -0500
X-AuditID: c0a8fbf4-199ff70000001fa6-ca-5e15940082c1
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id FE.81.08102.004951E5; Wed,  8 Jan 2020 09:34:08 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 8 Jan 2020 09:34:03 +0100
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
Subject: Re: [PATCH v8 08/12] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Thread-Topic: [PATCH v8 08/12] regulator: bd718x7: Split driver to common
 and bd718x7 specific parts
Thread-Index: AQHVvvUCH6xbXbWt3UKhkzpPOHFEqKffIN0AgAFNNwA=
Date:   Wed, 8 Jan 2020 08:34:03 +0000
Message-ID: <32f8fa4201ae99df64e7a39c6a69be2bef179f7b.camel@fi.rohmeurope.com>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <20200107124124.GI14821@dell>
In-Reply-To: <20200107124124.GI14821@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BF30F43844DB441AED1208EBFECDE36@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TXUwTWRiGPTPT6aEwONRWjqBEJxoj/iBxI2cNMVysyRg3G40JF0TAQQZK
        LC2ZFgPsDclCgLoXIKy7NrQYLEpqI1oxggHFWgSqYgj4FwRFQcUfNhtZCJGgM44KN2fe873f
        c97v4htI6j/QMTDPYhcli2DmaB3V1fzJv3VZnTFj+72+zdgz8ECLK6bOavG0K0Thv8bGadwQ
        7Nfg43daNXj4ykUKP/u/G+CZoUoC182fI/B/f45q8OWGeYAHr9XT+Mr7CwDfPj9E46ZHAwSu
        b+ql8EBoDx4JddO4vDOoxQsPL1EpRt7n9gH+38flWt7t+51vd45oeb+3iuafPuyg+Z7HVwn+
        b/ccwTefn9XyH/1x+3Vp4clZgv3YwbxcS8Luw+GmNvd9oqAtrqimq5YuBUNrHCAMIvYn5Au+
        0ziADurZBwA9H7lFq5cegKrKbpMOACHNJiPHE60CGNhE5OmdoJQekvVAVBsaBUrPClZEwzM5
        ak8Oqpy6Qat6F/K+CJGKptj16NnZ2q91hv0NVY4Pk2pWEKCZ6hZKMcLYeHT95ByhaMCuQVWl
        U181yUYj/6tZjTo1izwd90lVG9Hky4VvdQ51zo1Ryjwkuwm1XEtQ0RQ0VTlNqnodqjs+plVn
        iEJ9p8aparDSuSTBuUg7l9DOJbRzCX0aaLwA5Qt55lzBLiZuk8TCbZLVlC9/jljz/UBdmek2
        8DmwNwAICAJgFSQ4IzN4y5Chj8yyZhebBJspUyo0i7YAQJDkDEz8FtljsoXiElGyfrdiIcVF
        MxvHatL1rJJ1VBQLROm7uxpCDjFpNcYMfZQk5opFOXlm+6JNwDDlcV2MwSZaskVJKLSbMpX9
        yLTJC6JYEXLusRMyztgKhHy5qqIhkASrJ12NJGzvdstnn9cjn0FXUyOppyxWixgTzUwoqayC
        mQotP0LfgmgIuBXMllrZjZD/oR9vvpXjCDlO9yZKibMLi1ZMKSizZbgOtAwl+G5uv7v7Rarh
        j9m+huS1rsFdSa3/RKSBidTl6RGG+Z3C6eTAqru5kWnpRURwdWp4vSF1+ZHGsI8jsVdju2r6
        K16XNLUv64/dQVu65uP9rZELo2YuqyTuxIaKX0cdxWU9v1zvvbdvb+edkz93JHE7zxgn13vL
        DzWn+AmOspmExHhSsglfAEuyw94ABAAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBUdWUsIDIwMjAtMDEtMDcgYXQgMTI6NDEgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gTW9uLCAzMCBEZWMgMjAxOSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBGZXcgUk9ITSBQTUlDcyBhbGxvdyBzZXR0aW5nIHRoZSB2b2x0YWdlIHN0YXRlcyBm
b3IgZGlmZmVyZW50DQo+ID4gc3lzdGVtIHN0YXRlcw0KPiA+IGxpa2UgUlVOLCBJRExFLCBTVVNQ
RU5EIGFuZCBMUFNSLiBTdGF0ZXMgYXJlIHRoZW4gY2hhbmdlZCB2aWEgU29DDQo+ID4gc3BlY2lm
aWMNCj4gPiBtZWNoYW5pc21zLiBiZDcxOHg3IGRyaXZlciBpbXBsZW1lbnRlZCBkZXZpY2UtdHJl
ZSBwYXJzaW5nDQo+ID4gZnVuY3Rpb25zIGZvcg0KPiA+IHRoZXNlIHN0YXRlIHNwZWNpZmljIHZv
bHRhZ2VzLiBUaGUgcGFyc2luZyBmdW5jdGlvbnMgY2FuIGJlIHJlLXVzZWQgDQo+ID4gYnkNCj4g
PiBvdGhlciBST0hNIGNoaXAgZHJpdmVycyBsaWtlIGJkNzE4MjguIFNwbGl0IHRoZSBnZW5lcmlj
IGZ1bmN0aW9ucw0KPiA+IGZyb20NCj4gPiBiZDcxOHg3LXJlZ3VsYXRvci5jIHRvIHJvaG0tcmVn
dWxhdG9yLmMgYW5kIGV4cG9ydCB0aGVtIGZvciBvdGhlcg0KPiA+IG1vZHVsZXMNCj4gPiB0byB1
c2UuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0
dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiANCj4gPiArDQo+ID4gK3N0cnVjdCByb2htX2R2
c19jb25maWcgew0KPiA+ICsJdWludDY0X3QgbGV2ZWxfbWFwOw0KPiA+ICsJdW5zaWduZWQgaW50
IHJ1bl9yZWc7DQo+ID4gKwl1bnNpZ25lZCBpbnQgcnVuX21hc2s7DQo+ID4gKwl1bnNpZ25lZCBp
bnQgcnVuX29uX21hc2s7DQo+ID4gKwl1bnNpZ25lZCBpbnQgaWRsZV9yZWc7DQo+ID4gKwl1bnNp
Z25lZCBpbnQgaWRsZV9tYXNrOw0KPiA+ICsJdW5zaWduZWQgaW50IGlkbGVfb25fbWFzazsNCj4g
PiArCXVuc2lnbmVkIGludCBzdXNwZW5kX3JlZzsNCj4gPiArCXVuc2lnbmVkIGludCBzdXNwZW5k
X21hc2s7DQo+ID4gKwl1bnNpZ25lZCBpbnQgc3VzcGVuZF9vbl9tYXNrOw0KPiA+ICsJdW5zaWdu
ZWQgaW50IGxwc3JfcmVnOw0KPiA+ICsJdW5zaWduZWQgaW50IGxwc3JfbWFzazsNCj4gPiArCXVu
c2lnbmVkIGludCBscHNyX29uX21hc2s7DQo+ID4gK307DQo+IA0KPiBJIHRoaW5rIHRoaXMgZGVz
ZXJ2ZXMgYSBrZXJuZWwtZG9jIGhlYWRlci4NCk9oLCB0aGUgc3RydWN0IGhlcmU/IEhtbS4gWW91
IG1pZ2h0IGJlIGNvcnJlY3QuIEkgY2FuIGFkZCBzb21lLg0KDQo+IA0KPiA+ICsjaWYgSVNfRU5B
QkxFRChDT05GSUdfUkVHVUxBVE9SX1JPSE0pDQo+ID4gK2ludCByb2htX3JlZ3VsYXRvcl9zZXRf
ZHZzX2xldmVscyhjb25zdCBzdHJ1Y3Qgcm9obV9kdnNfY29uZmlnDQo+ID4gKmR2cywNCj4gPiAr
CQkJCSAgc3RydWN0IGRldmljZV9ub2RlICpucCwNCj4gPiArCQkJCSAgY29uc3Qgc3RydWN0IHJl
Z3VsYXRvcl9kZXNjICpkZXNjLA0KPiA+ICsJCQkJICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXApOw0K
PiANCj4gRG9lcyB0aGVzZSByZWFsbHkgbmVlZCB0byBsaXZlIGluIHRoZSBwYXJlbnQncyBoZWFk
ZXIgZmlsZT8NCg0KSSBkb24ndCBrbm93IHdoYXQgd291bGQgYmUgYSBiZXR0ZXIgcGxhY2U/DQoN
Cj4gV2hhdCBvdGhlciBjYWxsLXNpdGVzIGFyZSB0aGVyZT8NCg0KQWZ0ZXIgdGhpcyBzZXJpZXMg
dGhlIGJkNzE4eDctcmVndWxhdG9yLmMgYW5kIGJkNzE4MjgtcmVndWxhdG9yLmMgYXJlDQp0aGUg
aW4tdHJlZSBkcml2ZXJzIHVzaW5nIHRoZXNlLiByb2htLXJlZ3VsYXRvci5jIGlzIGltcGxlbWVu
dGluZyB0aGVtLg0KQW5kIEkgaG9wZSB3ZSBzZWUgeWV0IGFub3RoZXIgZHJpdmVyIGxhbmRpbmcg
aW4gbGF0ZXIgdGhpcyB5ZWFyLiANCg0KQW55d2F5cywgSSB3aWxsIGludmVzdGlnYXRlIGlmIEkg
Y2FuIHN3aXRjaCB0aGlzIHRvIHNvbWUgY29tbW9uIChub3QNCnJvaG0gc3BlY2lmaWMpIERUIGJp
bmRpbmdzIGF0IHNvbWUgcG9pbnQgKEkndmUgc2NoZWR1bGVkIHRoaXMgc3R1ZHkgdG8NCk1hcmNo
KSAtIElmIEkgY2FuIHRoZW4gdGhleSBzaG91bGQgbGl2ZSBpbiByZWd1bGF0b3IgY29yZSBoZWFk
ZXJzLg0KDQpCdXQgY2hhbmdpbmcgdGhlIGV4aXN0aW5nIHByb3BlcnRpZXMgc2hvdWxkIGFnYWlu
IGJlIG93biBzZXQgb2YgcGF0Y2hlcw0KYW5kIEknZCBwcmVmZXIgZG9pbmcgdGhhdCB3b3JrIGlu
ZGVwZW5kZW50bHkgb2YgdGhpcyBzZXJpZXMgYW5kIG5vdA0KZGVsYXlpbmcgdGhlIEJENzE4Mjgg
ZHVlIHRvIG5vdC15ZXQtZXZhbHVhdGVkIGJkNzE4eDcgcHJvcGVydHkgY2hhbmdlcy4NCg0KPiAN
Cj4gPiArI2Vsc2UNCj4gPiArc3RhdGljIGlubGluZSBpbnQgcm9obV9yZWd1bGF0b3Jfc2V0X2R2
c19sZXZlbHMoY29uc3Qgc3RydWN0DQo+ID4gcm9obV9kdnNfY29uZmlnICpkdnMsDQo+ID4gKwkJ
CQkJCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ID4gKwkJCQkJCWNvbnN0IHN0cnVjdA0KPiA+
IHJlZ3VsYXRvcl9kZXNjICpkZXNjLA0KPiA+ICsJCQkJCQlzdHJ1Y3QgcmVnbWFwICpyZWdtYXAp
DQo+ID4gK3sNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKyNlbmRpZiAvL0lTX0VOQUJM
RUQoQ09ORklHX1JFR1VMQVRPUl9ST0hNKQ0KPiANCj4gYSkgVGhpcyBjb21tZW50IGlzIG5vdCBy
ZWFsbHkgcmVxdWlyZWQNCj4gYikgWW91IHNob3VsZG4ndCBiZSB1c2luZyBDKysgY29tbWVudHMN
Cg0KVGhhbmtzLCBJJ2xsIHJlbW92ZSBpdC4NCg0KQmVzdCBSZWdhcmRzDQoJTWF0dGkNCg==
