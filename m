Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B738313BB33
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 09:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgAOIfG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 03:35:06 -0500
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:48838 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgAOIfG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 03:35:06 -0500
X-AuditID: c0a8fbf4-183ff70000001fa6-00-5e1eceb791bd
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DE.2C.08102.7BECE1E5; Wed, 15 Jan 2020 09:35:03 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 15 Jan 2020 09:34:58 +0100
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
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
Thread-Index: AQHVvvUCH6xbXbWt3UKhkzpPOHFEqKffIN0AgAFNNwCACAJ9gIAAD8yAgAAGCYCAAubEgIAAAYKA
Date:   Wed, 15 Jan 2020 08:34:57 +0000
Message-ID: <dfd1b22bdee5544bf0704936805716ad4f34b44f.camel@fi.rohmeurope.com>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <d247d71e183b388dd7f211aee1235965cff979b4.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
         <20200107124124.GI14821@dell>
         <32f8fa4201ae99df64e7a39c6a69be2bef179f7b.camel@fi.rohmeurope.com>
         <20200113105301.GF5414@dell>
         <ab72ce13d008a0d5e9cd753b87fe397953210f70.camel@fi.rohmeurope.com>
         <20200113121109.GG5414@dell> <20200115082937.GD325@dell>
In-Reply-To: <20200115082937.GD325@dell>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB56717A3B92FB448660CE8B6BAC118A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0gUaRjHeWdmZ17XJqZVb980jVYt6yqTol4iIhJhKrqigkA6vSlH18vd
        ldm17OJoIazUIAMjW9a1ul0Tk8qtzfxZinZqXZeV5p2pt5xFSaxEpkSmzTiV/vO+3/f9Pp/n
        +/7xvJDUvaXDYabZJkpmIctAa6l7FZ+qV9Q8ikpZdfdBBHZ3dTP4ZKCcwaOlnRQ+5x+icVnr
        Iw0ufHBLg/t8Nyg8+KEN4LFnpwhcPHGFwO9OD2jwzbIJgJ/WOWnse3sN4PtXn9HY87yLwE5P
        O4W7OpNwf2cbjfMaWxk82VNNbQrjq1xVgB/pzWN4V9VRvtbRz/Deynyaf9HTQPN/9tYQ/HnX
        R4KvuDrO8O+9UTu1ycEb9gu2Q7szM8zxG38JNt5uaiayS2Jyi5s/U3ZwMboABEHErUHHnXay
        AGihjusGaKTeT6iHdoAKS6rlA4Q0twEV/MMoQCiXgNztLymlhuTKITp7vJ9RakI4EfWNpas1
        6ehU4C6t6mT0wv5+mqW4WDR457FG0Sz3E3L5mmk1q4pEZ0ZLp7OCuDj0sjlRqQFcJMq3BwhF
        k5weeV+Na9RHc8jd8Dep6jD05v/Jr/cG1PjRTyltSG4pul4Xr6KbUFNBgFL1IlRc6GfUJ8xD
        HReGqCLwg2NWgmOGdsyiHbNoxyz6ItBUAmQSMrMyBJuYsFISc1ZKFqNJ3g5YTF6gTszoHTDV
        sqUFEBC0gPmQMISxoQ2RKbq5+y1pR4yC1Zgq5WSJ1haAIGkIZTtKZI9NE478JkqWb1YEpAx6
        don/7M86Tsk6KIrZovTNXQChAbHFf0Wl6OZJYoaYm56ZZZuxCRikNNeGh1pFc5ooCTk2Y6oy
        HqlWeT4Ua46cG6fgrDVbMMm3KtoJ1sGiN6WXSVjb5pLXjkq3vLaWei6TOspsMYvhejahQ8Y4
        BTPmmL+HDgM9BIYQdp3SdI78hb73HJbjCDmuKHE6zibMWOF24Fy8IzL/tN43lTjgKzPZshdM
        DAZGytfgyb5jzlTv4Nr1a4MPvY6NPuE6t7lnJKboR0/urvGQ0frlv0c/iY0Z+6/WffvGpbFj
        FRG9Sd1ty1HfsD156x7tUNMqNtq/N153b+m/2/IWPtwXlrSd8iS9WrL7D/3A0cOfHpef0K1e
        8WvNw/tTBspqFBKWkZJV+ALxdBJc/wMAAA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMDEtMTUgYXQgMDg6MjkgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4g
T24gTW9uLCAxMyBKYW4gMjAyMCwgTGVlIEpvbmVzIHdyb3RlOg0KPiA+IE9uIE1vbiwgMTMgSmFu
IDIwMjAsIFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+ID4gPiBPbiBNb24sIDIwMjAtMDEtMTMg
YXQgMTA6NTMgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCAwOCBKYW4g
MjAyMCwgVmFpdHRpbmVuLCBNYXR0aSB3cm90ZToNCj4gPiA+ID4gPiBPbiBUdWUsIDIwMjAtMDEt
MDcgYXQgMTI6NDEgKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIE1vbiwg
MzAgRGVjIDIwMTksIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiBGZXcgUk9ITSBQTUlDcyBhbGxvdyBzZXR0aW5nIHRoZSB2b2x0YWdlIHN0YXRlcyBm
b3INCj4gPiA+ID4gPiA+ID4gZGlmZmVyZW50DQo+ID4gPiA+ID4gPiA+IHN5c3RlbSBzdGF0ZXMN
Cj4gPiA+ID4gPiA+ID4gbGlrZSBSVU4sIElETEUsIFNVU1BFTkQgYW5kIExQU1IuIFN0YXRlcyBh
cmUgdGhlbiBjaGFuZ2VkDQo+ID4gPiA+ID4gPiA+IHZpYQ0KPiA+ID4gPiA+ID4gPiBTb0MNCj4g
PiA+ID4gPiA+ID4gc3BlY2lmaWMNCj4gPiA+ID4gPiA+ID4gbWVjaGFuaXNtcy4gYmQ3MTh4NyBk
cml2ZXIgaW1wbGVtZW50ZWQgZGV2aWNlLXRyZWUNCj4gPiA+ID4gPiA+ID4gcGFyc2luZw0KPiA+
ID4gPiA+ID4gPiBmdW5jdGlvbnMgZm9yDQo+ID4gPiA+ID4gPiA+IHRoZXNlIHN0YXRlIHNwZWNp
ZmljIHZvbHRhZ2VzLiBUaGUgcGFyc2luZyBmdW5jdGlvbnMgY2FuDQo+ID4gPiA+ID4gPiA+IGJl
IHJlLQ0KPiA+ID4gPiA+ID4gPiB1c2VkIA0KPiA+ID4gPiA+ID4gPiBieQ0KPiA+ID4gPiA+ID4g
PiBvdGhlciBST0hNIGNoaXAgZHJpdmVycyBsaWtlIGJkNzE4MjguIFNwbGl0IHRoZSBnZW5lcmlj
DQo+ID4gPiA+ID4gPiA+IGZ1bmN0aW9ucw0KPiA+ID4gPiA+ID4gPiBmcm9tDQo+ID4gPiA+ID4g
PiA+IGJkNzE4eDctcmVndWxhdG9yLmMgdG8gcm9obS1yZWd1bGF0b3IuYyBhbmQgZXhwb3J0IHRo
ZW0NCj4gPiA+ID4gPiA+ID4gZm9yDQo+ID4gPiA+ID4gPiA+IG90aGVyDQo+ID4gPiA+ID4gPiA+
IG1vZHVsZXMNCj4gPiA+ID4gPiA+ID4gdG8gdXNlLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGkgVmFpdHRpbmVuIDwNCj4gPiA+ID4gPiA+ID4gbWF0
dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+ID4gPiA+ID4gPiBBY2tlZC1ieTog
TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+
ID4gDQo+ID4gPiA+IFsuLi5dDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiArI2lmIElTX0VOQUJM
RUQoQ09ORklHX1JFR1VMQVRPUl9ST0hNKQ0KPiA+ID4gPiA+ID4gPiAraW50IHJvaG1fcmVndWxh
dG9yX3NldF9kdnNfbGV2ZWxzKGNvbnN0IHN0cnVjdA0KPiA+ID4gPiA+ID4gPiByb2htX2R2c19j
b25maWcNCj4gPiA+ID4gPiA+ID4gKmR2cywNCj4gPiA+ID4gPiA+ID4gKwkJCQkgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAsDQo+ID4gPiA+ID4gPiA+ICsJCQkJICBjb25zdCBzdHJ1Y3QgcmVndWxh
dG9yX2Rlc2MNCj4gPiA+ID4gPiA+ID4gKmRlc2MsDQo+ID4gPiA+ID4gPiA+ICsJCQkJICBzdHJ1
Y3QgcmVnbWFwICpyZWdtYXApOw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBEb2VzIHRoZXNl
IHJlYWxseSBuZWVkIHRvIGxpdmUgaW4gdGhlIHBhcmVudCdzIGhlYWRlciBmaWxlPw0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IEkgZG9uJ3Qga25vdyB3aGF0IHdvdWxkIGJlIGEgYmV0dGVyIHBsYWNl
Pw0KPiA+ID4gPiANCj4gPiA+ID4gWW91IGRvbid0IGhhdmUgYSByZWd1bGF0b3IgaGVhZGVyIGZp
bGU/DQo+ID4gPiA+IA0KPiA+ID4gPiBJdCBzZWVtcyBvdmVyLWtpbGwgdG8gY3JlYXRlIG9uZSBm
b3IgdGhpcywgc28gbGVhdmUgaXQgYXMgaXMuDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gV2hhdCBv
dGhlciBjYWxsLXNpdGVzIGFyZSB0aGVyZT8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBZnRlciB0
aGlzIHNlcmllcyB0aGUgYmQ3MTh4Ny1yZWd1bGF0b3IuYyBhbmQgYmQ3MTgyOC0NCj4gPiA+ID4g
PiByZWd1bGF0b3IuYw0KPiA+ID4gPiA+IGFyZQ0KPiA+ID4gPiA+IHRoZSBpbi10cmVlIGRyaXZl
cnMgdXNpbmcgdGhlc2UuIHJvaG0tcmVndWxhdG9yLmMgaXMNCj4gPiA+ID4gPiBpbXBsZW1lbnRp
bmcNCj4gPiA+ID4gPiB0aGVtLg0KPiA+ID4gPiA+IEFuZCBJIGhvcGUgd2Ugc2VlIHlldCBhbm90
aGVyIGRyaXZlciBsYW5kaW5nIGluIGxhdGVyIHRoaXMNCj4gPiA+ID4gPiB5ZWFyLiANCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBBbnl3YXlzLCBJIHdpbGwgaW52ZXN0aWdhdGUgaWYgSSBjYW4gc3dp
dGNoIHRoaXMgdG8gc29tZQ0KPiA+ID4gPiA+IGNvbW1vbg0KPiA+ID4gPiA+IChub3QNCj4gPiA+
ID4gPiByb2htIHNwZWNpZmljKSBEVCBiaW5kaW5ncyBhdCBzb21lIHBvaW50IChJJ3ZlIHNjaGVk
dWxlZCB0aGlzDQo+ID4gPiA+ID4gc3R1ZHkNCj4gPiA+ID4gPiB0bw0KPiA+ID4gPiA+IE1hcmNo
KSAtIElmIEkgY2FuIHRoZW4gdGhleSBzaG91bGQgbGl2ZSBpbiByZWd1bGF0b3IgY29yZQ0KPiA+
ID4gPiA+IGhlYWRlcnMuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQnV0IGNoYW5naW5nIHRoZSBl
eGlzdGluZyBwcm9wZXJ0aWVzIHNob3VsZCBhZ2FpbiBiZSBvd24gc2V0DQo+ID4gPiA+ID4gb2YN
Cj4gPiA+ID4gPiBwYXRjaGVzDQo+ID4gPiA+ID4gYW5kIEknZCBwcmVmZXIgZG9pbmcgdGhhdCB3
b3JrIGluZGVwZW5kZW50bHkgb2YgdGhpcyBzZXJpZXMNCj4gPiA+ID4gPiBhbmQgbm90DQo+ID4g
PiA+ID4gZGVsYXlpbmcgdGhlIEJENzE4MjggZHVlIHRvIG5vdC15ZXQtZXZhbHVhdGVkIGJkNzE4
eDcNCj4gPiA+ID4gPiBwcm9wZXJ0eQ0KPiA+ID4gPiA+IGNoYW5nZXMuDQo+ID4gPiA+IA0KPiA+
ID4gPiBUaGF0J3MgZmluZS4NCj4gPiA+IA0KPiA+ID4gR2xhZCB0byBoZWFyIDopIEJ5IHRoZSB3
YXksIEkgYWxyZWFkeSBzZW50IHRoZSB2OSA7KQ0KPiA+IA0KPiA+IEl0J3MgaW4gbXkgcXVldWUu
DQo+IA0KPiBBbHRob3VnaCB5b3UgZGlkbid0IHN1Ym1pdCB0aGUgd2hvbGUgc2V0IHRvIG1lLCBz
byBJIG9ubHkgaGF2ZSBhIGZldw0KPiBvZiB0aGUgcGF0Y2hlcy4gIFdoeSBkaWQgeW91IGNob29z
ZSB0byBkbyB0aGF0IHRoaXMgdGltZT8NCg0KU29ycnkgTGVlLiBJIGhhdmUgbm90IGRyb3BwZWQg
eW91IGludGVudGlvbmFsbHkhIEkgd2lsbCByZXNlbmQgdGhlDQpzZXJpZXMuDQoNCkJyLA0KCU1h
dHRpIFZhaXR0aW5lbg0KDQoNCg==
