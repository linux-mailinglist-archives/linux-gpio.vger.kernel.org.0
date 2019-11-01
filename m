Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC89EC33B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 13:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfKAMw4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 08:52:56 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:49036 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfKAMw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 08:52:56 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-d2-5dbc2aa53110
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com [192.168.251.178])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id C5.21.08102.5AA2CBD5; Fri,  1 Nov 2019 13:52:53 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Fri, 1 Nov 2019 13:52:47 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "broonie@kernel.org" <broonie@kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: Re: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Topic: [RFC PATCH v2 02/13] dt-bindings: mfd: Document ROHM BD71828
 bindings
Thread-Index: AQHVimAFYId2ZTjVIEaonX+EqNqiYKdqDi6AgACrYYCAB0C9AIAA18IAgAC3QYCAASXjgIAAUsuAgAE/BIA=
Date:   Fri, 1 Nov 2019 12:52:47 +0000
Message-ID: <a8acd74fa9c6abc8c2daea9f016d035a1ef87b02.camel@fi.rohmeurope.com>
References: <cover.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <0182df3c49c6c804ee20ef32fc4b85b50ff45fca.1571915550.git.matti.vaittinen@fi.rohmeurope.com>
         <ed0b2aa8-8a70-0341-4ecf-8959f37c53bd@ti.com>
         <5c793f1308ccc6e787260b64fe6a875a8d0eb9d0.camel@fi.rohmeurope.com>
         <20191029193440.GA1812@bogus>
         <3e0f0943cd599cae544bd7a7a49dded46d57a604.camel@fi.rohmeurope.com>
         <CAL_JsqJgnYqv1q=wf++5FOX-niRWQ=H9wWYgUKy+z=H933Qraw@mail.gmail.com>
         <1e3901d1c7c26f4dbbc1de78b607b92bf9ddc098.camel@fi.rohmeurope.com>
         <CAL_JsqJ6kmZyfXtZy_gz_6sxgK2CTXKTcpARkaf462QiwJXYZA@mail.gmail.com>
In-Reply-To: <CAL_JsqJ6kmZyfXtZy_gz_6sxgK2CTXKTcpARkaf462QiwJXYZA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1B100E89854D443B41E0D8A2EE8345A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0gUURTHuTOzs9fH1Li6edUKXQJT6CFF3SjCDwUThfQmos3GnHatdddm
        d6WsD2JUuklmlNqi9nLL1LS2wrLtgWjmFoXkk7LaTMkIK3pa4jbjVPrl3nPP//zO/3w4F5Ka
        fjoSppltgmjmTTo6kLpf+ds9yxXv0c8d9kXjirYONT48dEGNv5Z5KXzS95bGp5ueqPCRR9dV
        +PmNKxR+9a0Z4O/tuQQ+MXKRwJ/zX6rwtdMjAD9rKKXxjQ+1AD+obqexq6uNwKWuhxRu8y7H
        vd5mGvs9N9V4tPMqlajlasprAPex+6CaK6/Zx91y9qo5d1Uezb3o9NBcS3c9wRWXDxNcZfUP
        NffFPX114OagJSm8LXNdmsE8Z+m2IOP37JCMoUV7il+9VmWDK9gBAiBi56PanlzCAQKhhu0A
        qLeoHSiPFoDuv/GTDgAhzS5Bjh61DISxsehstY+Ua0i2EqKRYichC6HsetRUVwSUog3o7tH8
        v3EKKjhUMgZT7Az0+3gnKccMm4QKnn2mFLMuCl3K89KyEMCuQf7SwbEiwE5DedlDYwYkG47c
        Az9UytgsqvA8JZVYiwb7Rv/mdejOsI+ShybZOFTXMEcJE1F5VYzSJQadOOJTKyOEoNZTb6lj
        YIpzgoFzHHaOw84JsHMCfAaoqgBK59NMBt4mJMwWBfts0WJMl67tlnQ3UBbm603gb1zRCAgI
        GkEEJHRaJvPhbb1mUoolda+RtxqTRbtJsDYCBEldGFNfK2lMKr83SxAt/6QoSOnCmVhfoV7D
        yl67BCFDEP+pUyHUISZnpkevCREFg7BnR5rJNi4TMEBuHhgZZhXMqYLI223GZHk7kq3SeshS
        sOSbKOOMNYNPl7IK6gUJ8Nhg2TkStlZVSGdTmescqaHMFrMQGc44ZICVAaPd/N/uPQiHQBfK
        tMVJarD0d/53ey8ZEZLRxqEG2cjGj0uR2WBxbu2UyymHdg/Edqx983j/r6zYkeX5Bf6S83nR
        zUkzc+LmLdDvWjWq3dSfay4q/LTshccwP8K3NqenPjrreEnd5c6oPlXlQFdU0MLD8ZN2/lpp
        N13ferC1O2YB9EVp77X0b3GIA6Cp8OeXYNdHU2bogXcnIya/e7SlPcswejdpX3DfRh1lNfIJ
        8aRo5f8Aql9TvfgDAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUaHUsIDIwMTktMTAtMzEgYXQgMTI6NTAgLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAzMSwgMjAxOSBhdCA3OjU0IEFNIFZhaXR0aW5lbiwgTWF0dGkNCj4gPE1h
dHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gT24gV2Vk
LCAyMDE5LTEwLTMwIGF0IDE0OjIyIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+IE9u
IFdlZCwgT2N0IDMwLCAyMDE5IGF0IDM6MjcgQU0gVmFpdHRpbmVuLCBNYXR0aQ0KPiA+ID4gPE1h
dHRpLlZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwg
MjAxOS0xMC0yOSBhdCAxNDozNCAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiA+ID4g
T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDU6NDk6MTdBTSArMDAwMCwgVmFpdHRpbmVuLCBNYXR0
aSANCj4gPiAuLi53aGljaCBicmluZ3MgbWUgaGVyZS4gSSBsb29rZWQgYXQgdGhlDQo+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzIGZvbGRlciBhbmQgZGlkIHJlYWQgdGhlICd3
cml0aW5nLQ0KPiA+IGJpbmRpbmdzLnR4dCcgYW5kICdzdWJtaXR0aW5nLXBhdGNoZXMudHh0JyBm
cm9tIHRoZXJlLiBUaGVuIEkgYWxzbw0KPiA+IGNoZWNrZWQgdGhlIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS91c2FnZS1tb2RlbC50eHQgTm9uZSBvZiB3aGljaA0KPiA+IGhlbHBlZCBtZSBvdXQu
IEkgZGlkIGFsc28gb3BlbiB0aGUgJ3dyaXRpbmctc2NoZW1hLnJzdCcgYnV0IEkNCj4gPiBkaWRu
J3QNCj4gPiByZWFkIGl0IGNhcmVmdWxseSBlbm91Z2guIFByb2JhYmx5IGJlY2F1c2UgSSB0aG91
Z2h0IGFmdGVyIHJlYWRpbmcNCj4gPiB0aGUNCj4gPiBvcGVuaW5nIGNoYXB0ZXIgdGhhdCB0aGlz
IGRlc2NyaWJlZCBob3cgdG8gZG8gYWN0dWFsIGR0cyBpbiB5YW1sLg0KPiANCj4gVGhpbmdzIGFy
ZSBhIGJpdCBzY2F0dGVyZWQgYXJvdW5kIEknbGwgYWRtaXQuIEkgZmVlbCBsaWtlIHdlIG5lZWQg
YQ0KPiAnc3RhcnQgaGVyZScsIGJ1dCB0aGUgY2hhbGxlbmdlIGlzIHBlb3BsZSBoYXZlIGRpZmZl
cmVudCBzdGFydGluZw0KPiBwb2ludHMuDQoNCmNyb3NzLXJlZmVyZW5jaW5nPyA9KQ0KDQpJIGd1
ZXNzIHRoYXQgaWYgeWFtbCBpcyB3aGF0IGlzIGV4cGVjdGVkIHRvIGJlIHVzZWQgYXMgcGF0Y2gg
Zm9ybWF0LA0KdGhlbiB3ZSBzaG91bGQgcHJvYmFibHkgbWVudGlvbiB0aGlzIGluIHN1Ym1pdHRp
bmctcGF0Y2hlcy50eHQgYW5kDQp3cml0aW5nLWJpbmRpbmdzLnR4dC4gQWN0eXVhbGx5LCBJIHRo
aW5rIHRoYXQgd3JpdGluZy1iaW5kaW5ncy50eHQNCmNvdWxkIGJlIGNvbWJpbmVkIHdpdGggd3Jp
dGluZy1zY2hlbWEucnN0IC0gdGhleSBhcmUgYWJvdXQgdGhlIHNhbWUNCnRoaW5nLCByaWdodD8N
Cg0KPiA+ID4gVGhlcmUgaXMgc29tZSBub3Rpb24gdG8gY29udmVydCB0aGUgRFQgc3BlYyB0byBz
Y2hlbWEgYW5kIHRoZW4NCj4gPiA+IGdlbmVyYXRlIHRoZSBzcGVjIGZyb20gdGhlIHNjaGVtYS4g
VGFrZSBwcm9wZXJ0aWVzLCB0aGVpciB0eXBlLA0KPiA+ID4gYW5kDQo+ID4gPiBkZXNjcmlwdGlv
bnMgYW5kIHB1dCB0aGF0IGJhY2sgaW50byB0YWJsZXMgZm9yIGV4YW1wbGUuIFdvdWxkDQo+ID4g
PiBsb3ZlIHRvDQo+ID4gPiBoYXZlIHNvbWVvbmUgd29yayBvbiB0aGF0LiA6KQ0KPiA+IA0KPiA+
IEkgYW0gZ2xhZCB0byBoZWFyIHlvdSBoYXZlIGRldmVsb3BlZCAvIGFyZSBkZXZlbG9waW5nIHN1
Y2ggdG9vbGluZy4NCj4gDQo+IFRCQywgSSBoYXZlIG5vdCBhbmQgYW0gbm90LiBJdCdzIGp1c3Qg
YW4gaWRlYS4gVGhlcmUncyBiZWVuIG5vdGhpbmcNCj4gZG9uZSBiZXlvbmQgZXhwZXJpbWVudGlu
ZyBpZiByU1QgY291bGQgYmUgZW1iZWRkZWQgaW50byB5YW1sLg0KPiANCj4gPiBJDQo+ID4gcmVh
bGx5IGFwcHJlY2lhdGUgaXQuIFdoYXQgY29tZXMgdG8gZ2l2aW5nIGEgaGVscGluZyBoYW5kIC0g
SSdkDQo+ID4gYmV0dGVyDQo+ID4gdG8gc3RpY2sgdGhlIHNpbXBsZSBDIGRyaXZlcnMgZm9yIG5v
dyA7KSBCdXQgaWYgSSBldmVyIGdldCB0aGUNCj4gPiBmZWVsaW5nDQo+ID4gdGhhdCBJIGRvbid0
IGtub3cgd2hhdCB0byBkbyBJJ2xsIGtlZXAgdGhpcyBpbiBtaW5kIDpdIExldCBtZSBkbw0KPiA+
IHNvbWUNCj4gPiBjYWxjdWx1cy4uLiBPbmx5IDExIHllYXJzIGFuZCBteSB5b3VuZ2VzdCBzb24g
d2lsbCBwcm9iYWJseSBsZWF2ZQ0KPiA+IG91cg0KPiA+IGhvdXNlIC0gZG8geW91IHRoaW5rIDIw
MzAgaXMgYSBiaXQgdG9vIGxhdGU/IEp1c3QgbGV0IG1lIGtub3cgaWYNCj4gPiB0aGlzDQo+ID4g
aXMgc3RpbGwgcmVsZXZhbnQgdGhlbiAtIGFuZCBJJ2xsIGJ1eSB5b3UgYSBiZWVyIG9yIHdyaXRl
IGEgdG9vbA0KPiA+IChvZg0KPiA+IHNvbWUga2luZCkgeEQNCj4gDQo+IEkndmUgc2NoZWR1bGVk
IHlvdSBpbiBmb3IgMjAzMC4gOikNCg0KRmluZS4gTGV0J3Mgc2VlIGlmIGl0IGlzIGEgYmVlciBv
ciBhIHRvb2wgdGhlbiA6XQ0KDQo+ID4gTWVhbndoaWxlLi4uIEkgaGF2ZSB0cmllZCB0byBjb252
ZXJ0IHRoZSBCRDcxODI4IERUIGRvYyBmcm9tIHRoZQ0KPiA+IFJGQw0KPiA+IHBhdGNoIHRvIHlh
bWwgLSBhbmQgSSBhbSBoYXZpbmcgaGFyZCB0aW1lLiBFc3BlY2lhbGx5IHdpdGggdGhlDQo+ID4g
cmVndWxhdG9ycyBub2RlIC0gd2hpY2ggSSB3b3VsZCBsaWtlIHRvIHBsYWNlIGluDQo+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9yb2htLGJkNzE4MjgtDQo+
ID4gcmVndWxhdG9yLnlhbWwNCj4gPiANCj4gPiBNeSBwcm9ibGVtIGlzIHRoZQ0KPiA+IHJlZ3Vs
YXRvcnMgew0KPiA+IGJ1Y2sxOiBCVUNLMSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICByZWd1
bGF0b3ItbmFtZSA9ICJidWNrMSI7DQo+ID4gICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCA9IDw1MDAwMDA+Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSA8MjAwMDAwMD47DQo+ID4gICAgICAgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItcmFtcC1kZWxheSA9IDwyNTAwPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgIHJv
aG0sZHZzLXJ1bmx2bC1jdHJsOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgcm9obSxkdnMtcnVu
bGV2ZWwwLXZvbHRhZ2UgPSA8NTAwMDAwPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgIHJvaG0s
ZHZzLXJ1bmxldmVsMS12b2x0YWdlID0gPDUwNjI1MD47DQo+ID4gICAgICAgICAgICAgICAgICAg
ICByb2htLGR2cy1ydW5sZXZlbDItdm9sdGFnZSA9IDw1MTI1MDA+Ow0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgcm9obSxkdnMtcnVubGV2ZWwzLXZvbHRhZ2UgPSA8NTE4NzUwPjsNCj4gPiAgICAg
ICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOw0KPiA+ICAgICB9Ow0KPiA+ICAgICAu
Li4NCj4gPiB9Ow0KPiA+IG5vZGUgd2hpY2ggb25seSBjb250YWlucyBCVUNLWCBhbmQgTERPWCBz
dWItbm9kZXMuIEl0IGhhcyBubyBvd24NCj4gPiBwcm9wZXJ0aWVzLg0KPiA+IA0KPiA+IEZyb20g
TUZEIHlhbWwgSSBkaWQgdHJ5Og0KPiA+IA0KPiA+ICAgcmVndWxhdG9yczoNCj4gPiAgICAgJHJl
ZjogLi4vcmVndWxhdG9yL3JvaG0sYmQ3MTgyOC1yZWd1bGF0b3IueWFtbA0KPiA+ICAgICBkZXNj
cmlwdGlvbjoNCj4gPiAgICAgICBMaXN0IG9mIGNoaWxkIG5vZGVzIHRoYXQgc3BlY2lmeSB0aGUg
cmVndWxhdG9ycy4NCj4gPiANCj4gPiBhbmQgaW4gcm9obSxiZDcxODI4LXJlZ3VsYXRvci55YW1s
DQo+ID4gDQo+ID4gSSB0cmllZCBkb2luZzoNCj4gPiANCj4gPiBwYXR0ZXJuUHJvcGVydGllczoN
Cj4gPiAgICJeQlVDS1sxLTddJCI6DQo+ID4gICAgIHR5cGU6IG9iamVjdA0KPiA+ICAgICBkZXNj
cmlwdGlvbjoNCj4gPiAgICAgICBQcm9wZXJ0aWVzIGZvciBzaW5nbGUgcmVndWxhdG9yLg0KPiA+
ICAgICBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgLi4uDQo+ID4gDQo+ID4gYnV0IHRoaXMgZmFp
bHMgdmFsaWRhdGlvbiBhcyBwcm9wZXJ0aWVzOiBpcyBub3QgZ2l2ZW4uDQo+ID4gDQo+ID4gW212
YWl0dGluQGxvY2FsaG9zdCBsaW51eF0kIGR0LWRvYy12YWxpZGF0ZQ0KPiA+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Ivcm9obSxiZDcxODI4LQ0KPiA+IHJlZ3Vs
YXRvci55YW1sDQo+ID4gL2hvbWUvbXZhaXR0aW4vdG9ydmFsZHMvbGludXgvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZw0KPiA+IHVsYXQNCj4gPiBvci9yb2htLGJkNzE4Mjgt
cmVndWxhdG9yLnlhbWw6ICdwcm9wZXJ0aWVzJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5DQo+ID4g
DQo+ID4gSWYgSSB0cnkgYW5kIGFkZDoNCj4gPiANCj4gPiBwcm9wZXJ0aWVzOg0KPiA+ICAgZm9v
OiB0cnVlDQo+ID4gDQo+ID4gcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gICAgICJeQlVDS1sxLTdd
JCI6DQo+ID4gICAgICAgdHlwZTogb2JqZWN0DQo+ID4gICAgICAgZGVzY3JpcHRpb246DQo+ID4g
ICAgICAgICBQcm9wZXJ0aWVzIGZvciBzaW5nbGUgcmVndWxhdG9yLg0KPiA+ICAgICAgIHByb3Bl
cnRpZXM6DQo+ID4gICAgICAgICAuLi4NCj4gDQo+IFRoYXQncyBhIGNhc2Ugb2YgbmVlZGluZyB0
byBhZGp1c3QgdGhlIG1ldGEtc2NoZW1hICh0aGUgc2NoZW1hIHRoYXQNCj4gY2hlY2tzIHRoZSBz
Y2hlbWFzKS4gSXQncyBhIGJpdCBvdmVybHkgcmVzdHJpY3RpdmUganVzdCB0byB0cnkgdG8NCj4g
Y29udGFpbiB3aGF0J3MgYWxsb3dlZC4gSSd2ZSBmaXhlZCBpdCBub3cuIFVwZGF0ZSBkdHNjaGVt
YSBhbmQgaXQNCj4gc2hvdWxkIHdvcmsgbm93Lg0KDQpUaGFua3MuIEF0IGxlYXN0IHRoZSBtYWtl
IGR0X2JpbmRpbmdfY2hlY2sgcGFzc2VkIG5vdy4gZHQtZG9jLXZhbGlkYXRlDQppcyBub3QgYWJs
ZSB0byBsb2NhdGUgdGhlIHJlZ3VsYXRvci55YW1sIGFuZCBlcnJvcnMgb3V0IC0gYnV0IGl0IGRv
ZXMNCm5vIGxvbmdlciBjb21wbGFpbiBhYm91dCBtaXNzaW5nICdwcm9wZXJ0aWVzOicuDQoNCj4g
QlRXLCB3aGF0IHlvdSB3aWxsIGFsc28gbmVlZCBpcyB0byByZWZlcmVuY2UgdGhlIGNvbW1vbiBz
Y2hlbWE6DQo+IA0KPiAiXkJVQ0tbMS03XSQiOg0KPiAgIHR5cGU6IG9iamVjdA0KPiAgIGFsbE9m
Og0KPiAgICAgLSAkcmVmOiByZWd1bGF0b3IueWFtbCMNCj4gICBwcm9wZXJ0aWVzOg0KPiAgICBy
b2htLGR2cy1ydW5sdmwtY3RybDoNCj4gICAgICB0eXBlOiBib29sZWFuDQo+ICAgICAgZGVzY3Jp
cHRpb246IC4uLg0KPiAgICAuLi4NCg0KVGhhbmtzIGZvciB0aGUgcG9pbnRlcnMgOykgSSBqdXN0
IHN1Ym1pdHRlZCB0aGUgUkZDIHYzIDopDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
