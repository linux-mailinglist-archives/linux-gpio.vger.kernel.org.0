Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C70F4E981E
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 09:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfJ3I06 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 04:26:58 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49354 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbfJ3I06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 04:26:58 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-94-5db94950733f
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 57.F1.08102.05949BD5; Wed, 30 Oct 2019 09:26:56 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 30 Oct 2019 09:26:51 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Topic: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Index: AQHVimAFYId2ZTjVIEaonX+EqNqiYKdqDi6AgACrYYCAB0C9AIAA18IA
Date:   Wed, 30 Oct 2019 08:26:50 +0000
Message-ID: <3e0f0943cd599cae544bd7a7a49dded46d57a604.camel@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
         <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
         <20191029193440.GA1812@bogus>
In-Reply-To: <20191029193440.GA1812@bogus>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E489925A5D7E499CECB6477F5FBCFC@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxzGee+udy/VM0ct4xWV4S3GiEo1YeHN1iz+IePMFmJEl2iCeMhB
        G0pLrmXDqQvZskwqbBB1hEuBDS0wYP6oPyiKok1BxESDiGgmYh0x0SBmwR8hEtidh8Jf99z7
        PJ/3+f7xfSFpekzHQ7vTI8lO0cHTRupK89vT67Zs7sha3+Vbjo/3DzL4l/FGBr+s7aPw0cgo
        jevDNw340I2zBvzPuVMUHnnVDfDrOwcJfGSqicD/lT804DP1UwAPXPDR+NzYCYB7Wu/Q2D/U
        T2Cfv5fC/X1peLivm8YznUEGT989TW2MFdrq2oDw4t7PjFDXtk/oUIYZIdBSRgsP7nbSwrV7
        7YRQXTdJCM2tbxhhIpCwxbhzgTVH9Hybac93Wr7YvcD2V4WfKApbSs5U1oBS0JzsBdEQcSno
        /MBV4AVGaOIGAfIOts/+9AKkPK+ivQBCmrMi731GA8zcKvRna4TUMiTXAlFX/SNCMxZz21D4
        5O9AD21Hl38tn9VfopHuKVrTFLcSdXW3vsuzXAYKVh8k9bKLBJqeGDNoRjSXhAbGdQ245ais
        dPwdQHJxKPDkjUEfm0PHO2+Ruo5FT/+dnj3n0aXJCKUNTXKr0ckLFh3diCqUYUrXK9CRQxFG
        nyEGXa8ZpSrBR8q8BmWOVubRyjxamUf/AQwtABWKdke+6JE2JMtScbLsshWqnz2uwgDQd+Zl
        EMyENocAAUEILIEEH8u2pwezTItyXLl7baLbli0XOyR3CCBI8mb2tbUjy8Tminu/l2TXe2sp
        pPg4dlWkKsvEaV0FklQkye/dZRDyiF0kqGCMLOVLJXl2h2fOJmC0drkx3uyWnLmSLBZ7bNna
        gmS71Q3RrIVq7ycazrqLxEL1VEf7wBpY+bS2gYThWn8DaaKcLqcUH8dmalFOi9qKnR+KnoE4
        CPjF7Nt01V2oPpwP9zxTKwi1Yu3kea3CI85Z8aUg6r41L/9Y5+G/l8Tc+rG6USjwfXWjPJFf
        hvp3lfmDS3/4Li/9eg/BzFSNZcT4QRORZD0bNm8dSkj1bHJEPfGFhILkhk9TJqiPt2UMWVL3
        3P46sSRqZWPab/tTdpTZjwY6Ptt/yW10/XR4OPjN50pvtXXTjvbUfebYizkHLExGUw/PU26b
        uCGJlN3i/8jDhXD1AwAA
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMTktMTAtMjkgYXQgMTQ6MzQgLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0K
PiBPbiBGcmksIE9jdCAyNSwgMjAxOSBhdCAwNTo0OToxN0FNICswMDAwLCBWYWl0dGluZW4sIE1h
dHRpIHdyb3RlOg0KPiA+IEhlbGxvIERhbiwNCj4gPiANCj4gPiBUaGFua3MgYWdhaW4gZm9yIGNo
ZWNraW5nIHRoaXMgOikNCj4gPiANCj4gPiBPbiBUaHUsIDIwMTktMTAtMjQgYXQgMTQ6MzUgLTA1
MDAsIERhbiBNdXJwaHkgd3JvdGU6DQo+ID4gPiBNYXR0aQ0KPiA+ID4gDQo+ID4gPiBPbiAxMC8y
NC8xOSA2OjQxIEFNLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+ID4gPiA+IFJPSE0gQkQ3MTgy
OCBQb3dlciBtYW5hZ2VtZW50IElDIGludGVncmF0ZXMgNyBidWNrIGNvbnZlcnRlcnMsDQo+ID4g
PiA+IDcNCj4gPiA+ID4gTERPcywNCj4gPiA+ID4gYSByZWFsLXRpbWUgY2xvY2sgKFJUQyksIDMg
R1BPL3JlZ3VsYXRvciBjb250cm9sIHBpbnMsIEhBTEwNCj4gPiA+ID4gaW5wdXQNCj4gPiA+ID4g
YW5kIGEgMzIuNzY4IGtIeiBjbG9jayBnYXRlLg0KPiA+ID4gPiANCj4gPiA+ID4gRG9jdW1lbnQg
dGhlIGR0IGJpbmRpbmdzIGRyaXZlcnMgYXJlIHVzaW5nLg0KPiA+ID4gPiANCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDwNCj4gPiA+ID4gbWF0dGkudmFpdHRpbmVuQGZp
LnJvaG1ldXJvcGUuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gDQo+ID4gPiA+IE5vIGNoYW5n
ZXMgc2luY2UgdjENCj4gPiA+ID4gDQo+ID4gPiA+ICAgLi4uL2JpbmRpbmdzL21mZC9yb2htLGJk
NzE4MjgtcG1pYy50eHQgICAgICAgIHwgMTgwDQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKw0K
PiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxODAgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3JvaG0sYmQ3MTgyOC1wbWljLnR4dA0KPiA+ID4gDQo+ID4gPiBJIHdpbGwgbGV0IG1h
aW50YWluZXJzIHdlaWdoIGluIGhlcmUgYnV0IGlmIHRoaXMgaXMgbmV3IHRoaXMNCj4gPiA+IHNo
b3VsZCANCj4gPiA+IHByb2JhYmx5IGJlIGluIHRoZSB5YW1sIGZvcm1hdCB0byBhdm9pZCBjb252
ZXJzaW9uIGluIHRoZSBmdXR1cmUNCj4gPiANCj4gPiBPaC4uLiBUaGlzIGlzIG5ldyB0byBtZS4g
SSBndWVzcyB0aGVyZSBhcmUgcmVhc29ucyBmb3IgdGhpcyAtIGJ1dCBJDQo+ID4gbXVzdCBzYXkg
SSBhbSBub3QgZXhjaXRlZCBhcyBJIGhhdmUgbmV2ZXIgdXNlZCB5YW1sIGZvciBhbnl0aGluZy4N
Cj4gPiBJJ2xsDQo+ID4gZG8gYXMgeW91IHN1Z2dlc3QgYW5kIHdhaXQgZm9yIHdoYXQgb3RoZXJz
IGhhdmUgdG8gc2F5IDopIFRoYW5rcw0KPiA+IGZvcg0KPiA+IHBvaW50aW5nIHRoaXMgb3V0IHRo
b3VnaC4NCj4gDQo+IFNvcnJ5IGZvciB5b3VyIGxhY2sgb2YgZXhjaXRlbWVudC4gSXQgY291bGQg
YmUgWE1MLi4uDQoNClRoYW5rcywgSSBhcHByZWNpYXRlIHRoYXQsIGFwb2xvZ3kgYWNjZXB0ZWQg
WC1EDQoNCj4gVGhlcmUgYXJlbid0IG1hbnkgTUZEIGV4YW1wbGVzIHlldCwgYnV0IHRoZXJlIGlz
IG1heDc3NjUwIGluIG15IHRyZWUNCj4gYW5kIA0KPiBsaW51eC1uZXh0Lg0KDQpJIGxvb2tlZCBh
dCB0aGUgbWF4Nzc2NTAgTUZEIGJpbmRpbmcgZnJvbSBsaW51eC1uZXh0LiBBZnRlciB0aGF0IEkg
YWxzbw0KbG9va2VkIHNvbWUgb2YgdGhlIGdlbmVyaWMgZG9jdW1lbnRzIGZvciBEVCBiaW5kaW5n
cyAoSSBrbm93IC0gSSBzaG91bGQNCmhhdmUgZG9uZSB0aGF0IGVhcmxpZXIgYW5kIHlvdXIgam9i
IGhhZCBiZWVuIGVhc2llcikuIEJ1dCBhbGwgdGhhdCBsZWZ0DQptZSAic2xpZ2h0bHkiIHB1enps
ZWQuIEFmdGVyIHNvbWUgZnVydGhlciB3YW5kZXJpbmcgaW4gdGhlIHZpcnR1YWwNCndvcmxkIEkg
c3BvdHRlZCB0aGlzOg0KaHR0cHM6Ly9lbGludXgub3JnL2ltYWdlcy82LzZiL0xQQzIwMThfanNv
bi1zY2hlbWFfZm9yX0RldmljZXRyZWUucGRmDQoNCkkgdGhpbmsgdGhpcyBsaW5rIGluIHNvbWUg
ZHQteWFtbC1iaW5kaW5nLXJlYWRtZSBtaWdodCBiZSBoZWxwZnVsLg0KDQpTbyBpZiBJIHVuZGVy
c3RhbmQgdGhpcyBjb3JyZWN0bHksIGlkZWEgaXMgdG8gY29udmVydCB0aGUgZHRzIHNvdXJjZXMN
CnRvIHVzZSB5YW1sIChyaWdodD8pLiBUaGlzIGlzIHNlZW4gYmV0dGVyIGJlY2F1c2UgbW9yZSBw
ZW9wbGUga25vdw0KSlNPTi9ZQU1MIHRoYW4gZHRzIGZvcm1hdCg/KSBGYWlyIGVub3VnaC4gQWx0
aG91Z2ggc29tZSBvZiB1cyBrbm93IGR0cw0KZm9ybWF0IGRlY2VudGx5IHdlbGwgYnV0IGhhdmUg
bmV2ZXIgdXNlZCBKU09OIG9yIHlhbWwuIEkgZ3Vlc3MgZHRzDQpzdXBwb3J0IGlzIG5vdCBnb2lu
ZyBhd2F5IHRob3VnaCBhbmQgeWFtbCBleGFtcGxlcyBkbyBub3Qgc2VlbSB0ZXJyaWJseQ0KaGFy
ZCBhdCBmaXJzdCBzaWdodC4NCg0KV2hhdCBjb21lcyB0byBiaW5kaW5nIGRvY3MgLSB3ZWxsLCBp
biBteSBleWVzICh3aGljaCBtYXkgYmUgYmlhc2VkKQ0Kd3JpdGluZyBkb2N1bWVudGF0aW9uIGlu
IGFueXRoaW5nIGludGVuZGVkIHRvIGJlIGludGVycHJldGVkIGJ5IGENCm1hY2hpbmUgaXMgc3Rp
bGwgYSBzdGVwIGJhY2t3YXJkcyBmb3IgYSBodW1hbiBkb2N1bWVudCByZWFkZXIuIFN1cmUNCnN5
bnRheCB2YWxpZGF0aW9uIG9yIHJldmlld2luZyBpcyBlYXNpZXIgaWYgZm9ybWF0IGlzIG1hY2hp
bmUgcmVhZGFibGUNCi0gYnV0IGZyZWUgdGV4dCBpbmZvIGlzIG1vcmUsIHdlbGwsIGluZm9ybWF0
aXZlIChmb3JtIG1lIGF0IGxlYXN0KS4gSQ0KZm9yIGV4YW1wbGUgd291bGRuJ3QgbGlrZSByZWFk
aW5nIGEgYm9vayB3cml0dGVuIGluIGFueSBzY3JpcHQgb3INCm1hcmt1cCBsYW5ndWFnZS4gTm9y
IHdyaXRpbmcgb25lLiBJdCBpcyBkaWZmaWN1bHQgZm9yIG1lIHRvIHVuZGVyc3RhbmQNCnRoZSBk
b2N1bWVudGF0aW9uIGNoYW5nZSB0byB5YW1sLCBtYXliZSBiZWNhdXNlIEkgYW0gbW9yZSBvZnRl
biB1c2luZw0KdGhlIGJpbmRpbmcgZG9jcyBmb3IgY29tcG9zaW5nIERUIGZvciBhIGRldmljZSB0
aGFuIHJldmlld2luZyB0aGVtIDspDQoNCkFueXdheXMsIEkgZ3Vlc3MgSSdkIGJldHRlciBlaXRo
ZXIgdHJ5IGxlYXJuaW5nIHRoZSB5YW1sLCBmaWd1cmUgb3V0DQp3aGF0IGFyZSBzY2hlbWFzIGFu
ZCBzZWUgaG93IHRvIGNvbnZlcnQgeWFtbCBkb2NzIHRvIHRleHQgZm9yIG5pY2VyDQpyZWFkaW5n
IChJIGFzc3VtZSB0aGlzIGlzIGRvYWJsZSkgYW5kIGhvdyB0byB2ZXJpZnkgeWFtbCBiaW5kaW5n
IGRvY3MNCmFyZSBPayAtIG9yIHF1aXQgY29udHJpYnV0aW5nLiBObyBvbmUgaXMgZm9yY2luZyBt
ZSB0byBkbyB0aGlzLg0KQ29udGludWluZyBjb21wbGFpbmluZyBvbiB0aGlzIGlzIHByb2JhYmx5
IG5vdCBnZXR0aW5nIHVzIGFueXdoZXJlIHNvIEkNCm1pZ2h0IGFzIHdlbGwgc2h1dCB1cCBub3cg
Oi8NCg0KQW5kIFNvcnJ5IFJvYi4gSSBhbSBzZWVpbmcgeW91IGhhdmUgYmVlbiByZWFsbHkgY2xv
c2UgdG8gdGhpcyB5YW1sL0pTT04NCmNoYW5nZSBzbyBteSB3b25kZXJpbmcgbWF5IGJlIGZydXN0
cmF0aW5nLiBJIGRvbid0IGludGVuZCB0byBiZQ0KZGlzcmVzcGVjdGZ1bCAtIEkgc2VlIHRoYXQg
eW91IGhhdmUgZG9uZSBodWdlIHdvcmsgd2l0aCB0aGlzLiBJIGFtDQpqdXN0Li4uIC4uLlNsaWdo
dGx5IHNldCBpbiBteSB3YXlzLiBMaXR0bGUgYml0IHBpZy1oZWFkZWQgYW5kIHNvbWV3aGF0DQph
IHNtYXJ0LWFyc2UgLSBzbyBJIGNvdWxkbid0IGp1c3QgbGV0IGl0IGdvIHdpdGhvdXQgZ2l2aW5n
IG91dCBhbg0Kb3Bpbmlvbi4NCg0KPiA+ID4gaTJjIHsNCj4gPiA+IA0KPiA+ID4gICAgICAgICAg
cG1pY0A0YiB7DQo+ID4gPiANCj4gPiA+ICAgICAgICAgICAgICAgICAgWy4uLl0NCj4gPiA+IA0K
PiA+ID4gICAgICAgICAgfTsNCj4gPiA+IA0KPiA+ID4gfTsNCj4gPiANCj4gPiBJIGRvbid0IHRo
aW5rIHRoZSBJMkMgbm9kZSBpcyBuZWVkZWQgaW4gZXhhbXBsZS4gSXQgaXMgbm90IHBhcnQgb2YN
Cj4gPiB0aGUNCj4gPiBQTUlDIC0gYW5kIEkgZG9uJ3Qgc2VlIHRoZSBjb250YWluaW5nIGJ1cyBp
biBvdGhlciBleGFtcGxlcyBJIGp1c3QNCj4gPiBvcGVuZWQuICh0aGUgdHdvIG90aGVyIHJvaG0s
eHh4IFBNSUMgZG9jcyAtIHdlbGwsIGJpYXNlZCBhcyBJIHdyb3RlDQo+ID4gdGhlbSksIGRhOTE1
MC50eHQsIGxwMzk0My50eHQsIG1heDc3Njg2LnR4dCwgdHBzNjUwN3gudHh0LA0KPiA+IHRwczY1
OTEwLnR4dA0KPiANCj4gSXQgd2lsbCBiZSBuZWVkZWQgZm9yIHRoZSBzY2hlbWEgYmVjYXVzZSB0
aGUgZXhhbXBsZXMgYXJlIGNvbXBpbGVkDQo+IGFuZCANCj4gdmFsaWRhdGVkLg0KDQpUaGFua3Mg
Zm9yIGV4cGxhaW5pbmcgdGhlIHJlYXNvbi4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQoNCg==
