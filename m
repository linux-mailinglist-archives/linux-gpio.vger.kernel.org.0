Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37CC2A2958
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 12:28:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgKBL2C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 06:28:02 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:38911 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728703AbgKBL2B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 06:28:01 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-121-Fb5DaFw8N3OQLi3rvlAzmw-1; Mon, 02 Nov 2020 11:27:58 +0000
X-MC-Unique: Fb5DaFw8N3OQLi3rvlAzmw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 2 Nov 2020 11:27:57 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 2 Nov 2020 11:27:57 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Andy Shevchenko' <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: [RFT PATCH 5/7] gpio: exar: unduplicate address and offset
 computation
Thread-Topic: [RFT PATCH 5/7] gpio: exar: unduplicate address and offset
 computation
Thread-Index: AQHWsQcDZJyTqVFuY0eBWd5K3Yt5z6m0sIKQ
Date:   Mon, 2 Nov 2020 11:27:57 +0000
Message-ID: <18a4358cfb0d427abed523fc2c8ec8f0@AcuMS.aculab.com>
References: <20201026141839.28536-1-brgl@bgdev.pl>
 <20201026141839.28536-6-brgl@bgdev.pl>
 <CAHp75VfNy4j73nFd2nGSsuGdn0Yat_ENGaaARP_8R9CQKHnnZg@mail.gmail.com>
In-Reply-To: <CAHp75VfNy4j73nFd2nGSsuGdn0Yat_ENGaaARP_8R9CQKHnnZg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogQW5keSBTaGV2Y2hlbmtvDQo+IFNlbnQ6IDAyIE5vdmVtYmVyIDIwMjAgMTA6NTkNCj4g
DQo+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDQ6MjMgUE0gQmFydG9zeiBHb2xhc3pld3NraSA8
YnJnbEBiZ2Rldi5wbD4gd3JvdGU6DQo+IA0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyB1bnNpZ25l
ZCBpbnQNCj4gPiArZXhhcl9vZmZzZXRfdG9fc2VsX2FkZHIoc3RydWN0IGV4YXJfZ3Bpb19jaGlw
ICpleGFyX2dwaW8sIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ID4gK3sNCj4gPiArICAgICAgIHJl
dHVybiAob2Zmc2V0ICsgZXhhcl9ncGlvLT5maXJzdF9waW4pIC8gOCA/IEVYQVJfT0ZGU0VUX01Q
SU9TRUxfSEkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA6IEVYQVJfT0ZGU0VUX01QSU9TRUxfTE87DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0
YXRpYyB1bnNpZ25lZCBpbnQNCj4gPiArZXhhcl9vZmZzZXRfdG9fbHZsX2FkZHIoc3RydWN0IGV4
YXJfZ3Bpb19jaGlwICpleGFyX2dwaW8sIHVuc2lnbmVkIGludCBvZmZzZXQpDQo+ID4gK3sNCj4g
PiArICAgICAgIHJldHVybiAob2Zmc2V0ICsgZXhhcl9ncGlvLT5maXJzdF9waW4pIC8gOCA/IEVY
QVJfT0ZGU0VUX01QSU9MVkxfSEkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA6IEVYQVJfT0ZGU0VUX01QSU9MVkxfTE87DQo+ID4gK30NCj4g
PiArDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQNCj4gPiArZXhhcl9vZmZzZXRfdG9fYml0KHN0
cnVjdCBleGFyX2dwaW9fY2hpcCAqZXhhcl9ncGlvLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPiA+
ICt7DQo+ID4gKyAgICAgICByZXR1cm4gKG9mZnNldCArIGV4YXJfZ3Bpby0+Zmlyc3RfcGluKSAl
IDg7DQo+ID4gK30NCj4gDQo+IEFuc3dlcmluZyB0byB5b3VyIHF1ZXN0aW9uLi4uDQo+IA0KPiBJ
dCBjYW4gYmUgZG9uZSBsaW5lIHRoaXM6DQo+IA0KPiBzdGF0aWMgdW5zaWduZWQgaW50IGV4YXJf
b2Zmc2V0X3RvX2JhbmtfYW5kX2JpdCguLi4sICpiaXQpDQo+IHsNCj4gICAgICAgICpiaXQgPSAo
b2Zmc2V0ICsgZXhhcl9ncGlvLT5maXJzdF9waW4pICUgODsNCj4gICAgICAgIHJldHVybiAob2Zm
c2V0ICsgZXhhcl9ncGlvLT5maXJzdF9waW4pIC8gODsNCj4gfQ0KDQpUaGF0IGlzIGxpa2VseSB0
byByZXF1aXJlIHRoZSBjb21waWxlciByZWxvYWQgZXhhcl9ncGlvLT5maXJzdF9waW4NCmFmdGVy
IHRoZSB3cml0ZSB0byAqYml0Lg0KDQo+IHN0YXRpYyB1bnNpZ25lZCBpbnQgZXhhcl9vZmZzZXRf
dG9fbHZsX2FkZHJfYW5kX2JpdCgsICpiaXQpDQo+IHsNCj4gICAgIHJldHVybiBleGFyX29mZnNl
dF90b19iYW5rX2FuZF9iaXQoLi4uLCBiaXQpID8NCj4gICAgICAgICBFWEFSX09GRlNFVF9NUElP
TFZMX0hJIDogRVhBUl9PRkZTRVRfTVBJT0xWTF9MTzsNCj4gfQ0KDQpHYWggd2h5IGlzIGl0IHVz
aW5nIGRpdmlkZSB0aGVuID86ID8NCkFGQUlDVCAoZnJvbSB0aGUgYWJvdmUpIHRoZXJlIGFyZSBh
dCBtb3N0IDE2IHBpbnMuDQoNCk11Y2ggYmV0dGVyIHdvdWxkIGJlIHVzaW5nOg0KCXRtcCA9CW9m
ZnNldCArIGV4YXJfZ3Bpby0+Zmlyc3RfcGluOw0KCSpiaXQgPSB0bXAgJiA3Ow0KCXJldHVybiB0
bXAgJiA4Ow0KDQpJbmxpbmVkIHRoZSBjb21waWxlciBtYXkgd2VsbCBjb21wdXRlOg0KCWV4YXJf
b2Zmc2V0X3RvX2JhbmtfYW5kX2JpdCgpID8gSEkgOiBMTzsNCmFzOg0KCUxPICsgKEhJIC0gTE8p
ICogZXhhcl9vZmZzZXRfdG9fYmFua19hbmRfYml0KCkuDQpUaGUgbGF0dGVyIHRlcm0gaXMgbGlr
ZWx5IHRvIGJlIGp1c3QgKHRtcCAmIDgpID4+IG4uDQoNCkkgYWxzbyBiZXQgdGhlIGNvZGUgYWN0
dWFsbHkgd2FudHMgKDEgPDwgYml0KS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVz
cyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEg
MVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

