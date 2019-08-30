Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBD7A37AE
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 15:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfH3NVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 09:21:21 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:47520 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727522AbfH3NVU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Aug 2019 09:21:20 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-2-xNpIK8UVPGuOYFddx-OeKA-1;
 Fri, 30 Aug 2019 14:21:16 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 30 Aug 2019 14:21:16 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Fri, 30 Aug 2019 14:21:16 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'Enrico Weigelt, metux IT consult'" <lkml@metux.net>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: RE: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
Thread-Topic: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
Thread-Index: AQHVWtTu78Xh1ob+uECVSLeo5ivYsqcNXgwAgAZWjOA=
Date:   Fri, 30 Aug 2019 13:21:16 +0000
Message-ID: <66a5a5e1adf944f592202e5ffdf3fe9c@AcuMS.aculab.com>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
 <a5f535af-09f7-e65b-1527-7d6dd8553c1d@metux.net>
In-Reply-To: <a5f535af-09f7-e65b-1527-7d6dd8553c1d@metux.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: xNpIK8UVPGuOYFddx-OeKA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

RnJvbTogRW5yaWNvIFdlaWdlbHQsIG1ldHV4IElUIGNvbnN1bHQNCj4gU2VudDogMjYgQXVndXN0
IDIwMTkgMTQ6MjkNCj4gT24gMjUuMDguMTkgMDE6MzcsIFV3ZSBLbGVpbmUtS8ODwrZuaWcgd3Jv
dGU6DQo+IA0KPiBIaSwNCj4gDQo+ID4gK3N0YXRpYyBub2lubGluZV9mb3Jfc3RhY2sgPiArY2hh
ciAqZXJyc3RyKGNoYXIgKmJ1ZiwgY2hhciAqZW5kLCB1bnNpZ25lZCBsb25nIGxvbmcgbnVtLD4g
Kw0KPiBzdHJ1Y3QgcHJpbnRmX3NwZWMgc3BlYyk+ICt7DQo+ICMxOiB3aHkgbm90IHB1dHRpbmcg
dGhhdCBpbnRvIHNvbWUgc2VwYXJhdGUgc3RyZXJyb3IoKSBsaWIgZnVuY3Rpb24gPw0KPiAgICAg
IFRoaXMgaXMgc29tZXRoaW5nIEkndmUgYmVlbiBsb29raW5nIGZvciBxdWl0ZSBzb21lIHRpbWUg
KGFjdHVhbGx5DQo+ICAgICAgYWxyZWFkeSBoYWNrZWQgaXQgdXAgc29tZXdoZXJlLCBzb21ldGlt
ZSwgYnV0IGZvcmdvdHRlbiAuLi4pDQo+IA0KPiAjMjogd2h5IG5vdCBqdXN0IGhhdmluZyBhIGJp
ZyBjYXNlIHN0YXRlbWVudCBhbmQgbGVhdmUgdGhlIGFjdHVhbCBsb29rdXANCj4gICAgICBsb2dp
YyB0byB0aGUgY29tcGlsZXIgPyBJTUhPLCBjb3VsZCBiZSB3cml0dGVuIGluIGEgdmVyeSBjb21w
YWN0IHdheQ0KPiAgICAgIGJ5IHNvbWUgbWFjcm8gbWFnaWMNCg0KQW5kIGdlbmVyYXRlIGFuIGVu
b3Jtb3VzIGFtb3VudCBvZiBjb2RlIGFuZCBsb25nIGNoYWlucyBvZiBtaXNwcmVkaWN0ZWQgYnJh
bmNoZXMuDQoNCklzIGl0IGFsc28gd29ydGggbG9va2luZyBhdCBob3cgbG9uZyB0aGUgc3RyaW5n
cyBhcmUuDQpJZiB0aGV5IGNhbiBiZSB0cnVuY2F0ZWQgdG8gMTYgYnl0ZXMgdGhlbiBjaGFyW11b
MTZdIHdpbGwgZ2VuZXJhdGUNCm11Y2ggYmV0dGVyIGNvZGUgdGhhbiB0aGUgYXJyYXkgb2YgcG9p
bnRlcnMuDQoNCk9UT0ggSSdtIG5vdCByZWFsbHkgc3VyZSBpdCBpcyBhbGwgYSBnb29kIGlkZWEu
DQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9h
ZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBO
bzogMTM5NzM4NiAoV2FsZXMpDQo=

