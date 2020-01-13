Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24EBC139064
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 12:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgAMLtn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 06:49:43 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:62732 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgAMLtn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 06:49:43 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-ba-5e1c595373c1
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id 16.5F.08102.3595C1E5; Mon, 13 Jan 2020 12:49:39 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Mon, 13 Jan 2020 12:49:27 +0100
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "dmurphy@ti.com" <dmurphy@ti.com>,
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
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v8 08/12] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Thread-Topic: [PATCH v8 08/12] regulator: bd718x7: Split driver to common
 and bd718x7 specific parts
Thread-Index: AQHVvvUCH6xbXbWt3UKhkzpPOHFEqKffIN0AgAFNNwCACAJ9gIAAD8yA
Date:   Mon, 13 Jan 2020 11:49:26 +0000
Message-ID: <ab72ce13d008a0d5e9cd753b87fe397953210f70.camel@fi.rohmeurope.com>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <20200107124124.GI14821@dell>
         <32f8fa4201ae99df64e7a39c6a69be2bef179f7b.camel@fi.rohmeurope.com>
         <20200113105301.GF5414@dell>
In-Reply-To: <20200113105301.GF5414@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <558A385D28CECC4E84770D5C5B7DB969@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUwTSRjHM7vb7VBdXSvItKLGPY0viS8kGsYc5/FFXGNiVCLnaQRXWWgV
        WrJtDWjuwkU5oWiCr2gjVUkRgpxIhaAG1FTQWowGabGKqMSXqJhyFz2NuR6666LwZeaZ+c/v
        +f8/PANJ/QBthGaLXZQsQi5H66hrtf81zkv7NSFj4d6WH7GnK6TFeyNntPh9ZYDCR/qf0/hk
        +x0NLuts0uDe5vMUfvJvB8AfgiUEPhytIfA/+x5r8IWTUYC7L5+gcfPbcwDfOBukcfX9LgKf
        qPZTuCuwDPcFOmhc3NauxUM9jVRKHF/vrgf8YLhYy7vrd/GXXH1a3ltXSvOPelpp/ma4heAr
        3J8IvvbsRy3/zjt1tW7DmOQtgn1HmjnHsmDp5jGmob/va/MjhgLXwSVF4JjBCWIgYhehe6Fz
        GifQQT0bAuhVZ9nwwQ9QSThIOwGENJuMnA+0ChDLJiKP/wWl1CTrgaj5j23Kk4msiHo/ZKtP
        slFJ5Cqt1qmobXf715piZ6KmaPBrG4ZdhW7/v59UreoI5Pf1AUWIYeeglkAFodSAnYJKiyKE
        6hWPvC8/atTQLPK03iXVOg69fjY0fM+htk/9lJKHlPs0XF6goinoyJ/u4cjT0eGy/uEME9Ct
        48+pcjDJNcrBNUK7RtGuUbRrFH0KaOoAyhPMuTmCXUycL4mO+ZLVlCdvW615XqAOzPuL4LNv
        hQ8QEPiAARJcHNOzbnKGftwWa1ahSbCZMiVHrmjzAQRJLpbx3jFm6JksoXCnKFm/SZMhxcUz
        s/oPbNKzitd2UcwXpW9qAoQcYgZ+ScjQT5DEHLEg25xrH5EJGKM01xljbaIlS5QEh92UqUxH
        pk0eD0UaK/u+XC/jjC1fyJNvVTQAkmD568oqEl7qcMvrrTqPvLZXVleRespitYjGeOZuuoyx
        CmZyWL6bvgHxEHATmdlKprHyD/re841sR8h2um6DYmcXRiRjERAetEz7yWH/a62w9uGTow3p
        L7rO3DiwcuPq07Rw2otaHaHOigZz0wrNHsn1w3iLYOr2NQ4M9nqjS2rvpf4Wty/VyS186pkG
        3pH+YEgTuR4GNcYavjCltWTTMcPu6OJxVxwMLF5z6NRgUkHlLgBnEOW/b+eelS7fmZT8c/pK
        W5ijbCYhcS4p2YQvO4W4lP4DAAA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBNb24sIDIwMjAtMDEtMTMgYXQgMTA6NTMgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gV2VkLCAwOCBKYW4gMjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToN
Cj4gDQo+ID4gSGVsbG8gTGVlLA0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyMC0wMS0wNyBhdCAxMjo0
MSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOg0KPiA+ID4gT24gTW9uLCAzMCBEZWMgMjAxOSwgTWF0
dGkgVmFpdHRpbmVuIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiA+IEZldyBST0hNIFBNSUNzIGFsbG93
IHNldHRpbmcgdGhlIHZvbHRhZ2Ugc3RhdGVzIGZvciBkaWZmZXJlbnQNCj4gPiA+ID4gc3lzdGVt
IHN0YXRlcw0KPiA+ID4gPiBsaWtlIFJVTiwgSURMRSwgU1VTUEVORCBhbmQgTFBTUi4gU3RhdGVz
IGFyZSB0aGVuIGNoYW5nZWQgdmlhDQo+ID4gPiA+IFNvQw0KPiA+ID4gPiBzcGVjaWZpYw0KPiA+
ID4gPiBtZWNoYW5pc21zLiBiZDcxOHg3IGRyaXZlciBpbXBsZW1lbnRlZCBkZXZpY2UtdHJlZSBw
YXJzaW5nDQo+ID4gPiA+IGZ1bmN0aW9ucyBmb3INCj4gPiA+ID4gdGhlc2Ugc3RhdGUgc3BlY2lm
aWMgdm9sdGFnZXMuIFRoZSBwYXJzaW5nIGZ1bmN0aW9ucyBjYW4gYmUgcmUtDQo+ID4gPiA+IHVz
ZWQgDQo+ID4gPiA+IGJ5DQo+ID4gPiA+IG90aGVyIFJPSE0gY2hpcCBkcml2ZXJzIGxpa2UgYmQ3
MTgyOC4gU3BsaXQgdGhlIGdlbmVyaWMNCj4gPiA+ID4gZnVuY3Rpb25zDQo+ID4gPiA+IGZyb20N
Cj4gPiA+ID4gYmQ3MTh4Ny1yZWd1bGF0b3IuYyB0byByb2htLXJlZ3VsYXRvci5jIGFuZCBleHBv
cnQgdGhlbSBmb3INCj4gPiA+ID4gb3RoZXINCj4gPiA+ID4gbW9kdWxlcw0KPiA+ID4gPiB0byB1
c2UuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPA0K
PiA+ID4gPiBtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gPiA+IEFja2Vk
LWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQo+ID4gPiA+IC0tLQ0KPiANCj4g
Wy4uLl0NCj4gDQo+ID4gPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfUkVHVUxBVE9SX1JPSE0p
DQo+ID4gPiA+ICtpbnQgcm9obV9yZWd1bGF0b3Jfc2V0X2R2c19sZXZlbHMoY29uc3Qgc3RydWN0
IHJvaG1fZHZzX2NvbmZpZw0KPiA+ID4gPiAqZHZzLA0KPiA+ID4gPiArCQkJCSAgc3RydWN0IGRl
dmljZV9ub2RlICpucCwNCj4gPiA+ID4gKwkJCQkgIGNvbnN0IHN0cnVjdCByZWd1bGF0b3JfZGVz
Yw0KPiA+ID4gPiAqZGVzYywNCj4gPiA+ID4gKwkJCQkgIHN0cnVjdCByZWdtYXAgKnJlZ21hcCk7
DQo+ID4gPiANCj4gPiA+IERvZXMgdGhlc2UgcmVhbGx5IG5lZWQgdG8gbGl2ZSBpbiB0aGUgcGFy
ZW50J3MgaGVhZGVyIGZpbGU/DQo+ID4gDQo+ID4gSSBkb24ndCBrbm93IHdoYXQgd291bGQgYmUg
YSBiZXR0ZXIgcGxhY2U/DQo+IA0KPiBZb3UgZG9uJ3QgaGF2ZSBhIHJlZ3VsYXRvciBoZWFkZXIg
ZmlsZT8NCj4gDQo+IEl0IHNlZW1zIG92ZXIta2lsbCB0byBjcmVhdGUgb25lIGZvciB0aGlzLCBz
byBsZWF2ZSBpdCBhcyBpcy4NCj4gDQo+ID4gPiBXaGF0IG90aGVyIGNhbGwtc2l0ZXMgYXJlIHRo
ZXJlPw0KPiA+IA0KPiA+IEFmdGVyIHRoaXMgc2VyaWVzIHRoZSBiZDcxOHg3LXJlZ3VsYXRvci5j
IGFuZCBiZDcxODI4LXJlZ3VsYXRvci5jDQo+ID4gYXJlDQo+ID4gdGhlIGluLXRyZWUgZHJpdmVy
cyB1c2luZyB0aGVzZS4gcm9obS1yZWd1bGF0b3IuYyBpcyBpbXBsZW1lbnRpbmcNCj4gPiB0aGVt
Lg0KPiA+IEFuZCBJIGhvcGUgd2Ugc2VlIHlldCBhbm90aGVyIGRyaXZlciBsYW5kaW5nIGluIGxh
dGVyIHRoaXMgeWVhci4gDQo+ID4gDQo+ID4gQW55d2F5cywgSSB3aWxsIGludmVzdGlnYXRlIGlm
IEkgY2FuIHN3aXRjaCB0aGlzIHRvIHNvbWUgY29tbW9uDQo+ID4gKG5vdA0KPiA+IHJvaG0gc3Bl
Y2lmaWMpIERUIGJpbmRpbmdzIGF0IHNvbWUgcG9pbnQgKEkndmUgc2NoZWR1bGVkIHRoaXMgc3R1
ZHkNCj4gPiB0bw0KPiA+IE1hcmNoKSAtIElmIEkgY2FuIHRoZW4gdGhleSBzaG91bGQgbGl2ZSBp
biByZWd1bGF0b3IgY29yZSBoZWFkZXJzLg0KPiA+IA0KPiA+IEJ1dCBjaGFuZ2luZyB0aGUgZXhp
c3RpbmcgcHJvcGVydGllcyBzaG91bGQgYWdhaW4gYmUgb3duIHNldCBvZg0KPiA+IHBhdGNoZXMN
Cj4gPiBhbmQgSSdkIHByZWZlciBkb2luZyB0aGF0IHdvcmsgaW5kZXBlbmRlbnRseSBvZiB0aGlz
IHNlcmllcyBhbmQgbm90DQo+ID4gZGVsYXlpbmcgdGhlIEJENzE4MjggZHVlIHRvIG5vdC15ZXQt
ZXZhbHVhdGVkIGJkNzE4eDcgcHJvcGVydHkNCj4gPiBjaGFuZ2VzLg0KPiANCj4gVGhhdCdzIGZp
bmUuDQoNCg0KR2xhZCB0byBoZWFyIDopIEJ5IHRoZSB3YXksIEkgYWxyZWFkeSBzZW50IHRoZSB2
OSA7KQ0KDQpCciwNCglNYXR0aQ0KDQo=
