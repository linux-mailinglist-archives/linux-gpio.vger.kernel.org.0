Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD7F24934B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 05:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgHSDMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 23:12:47 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:45484 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgHSDMq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 23:12:46 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07J3CN4c8010285, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07J3CN4c8010285
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 19 Aug 2020 11:12:23 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 19 Aug 2020 11:12:23 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 19 Aug 2020 11:12:23 +0800
Received: from RTEXMB04.realtek.com.tw ([fe80::941:6388:7d34:5c44]) by
 RTEXMB04.realtek.com.tw ([fe80::941:6388:7d34:5c44%3]) with mapi id
 15.01.1779.005; Wed, 19 Aug 2020 11:12:23 +0800
From:   =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
To:     =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
        Rob Herring <robh@kernel.org>
CC:     "linux-realtek-soc@lists.infradead.org" 
        <linux-realtek-soc@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: RE: [PATCH v3 5/9] dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1295
Thread-Topic: [PATCH v3 5/9] dt-bindings: pinctrl: realtek: Add Realtek DHC
 SoC rtd1295
Thread-Index: AQHWcUZJlJ4JLjNahkCHOz3e6aEePqk8Qs4AgADkp4CAAI/acA==
Date:   Wed, 19 Aug 2020 03:12:22 +0000
Message-ID: <5f6355d6af724dc6b2e113e567e4ec5f@realtek.com>
References: <20200813074908.889-1-tychang@realtek.com>
 <20200813074908.889-6-tychang@realtek.com> <20200817203358.GA1508879@bogus>
 <012eee35-6835-7244-0013-9fc6980107e0@suse.de>
In-Reply-To: <012eee35-6835-7244-0013-9fc6980107e0@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.181.134]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUm9iLCBBbmRyZWFzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNl
LmRlPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMTgsIDIwMjAgNjoxMiBQTQ0KPiBUbzogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IFRZX0NoYW5nW+W8teWtkOmAuF0NCj4gPHR5Y2hh
bmdAcmVhbHRlay5jb20+DQo+IENjOiBsaW51eC1yZWFsdGVrLXNvY0BsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsN
Cj4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNS85
XSBkdC1iaW5kaW5nczogcGluY3RybDogcmVhbHRlazogQWRkIFJlYWx0ZWsgREhDIFNvQw0KPiBy
dGQxMjk1DQo+IA0KPiBBbSAxNy4wOC4yMCB1bSAyMjozMyBzY2hyaWViIFJvYiBIZXJyaW5nOg0K
PiA+IE9uIFRodSwgMTMgQXVnIDIwMjAgMTU6NDk6MDQgKzA4MDAsIFRZIENoYW5nIHdyb3RlOg0K
PiA+PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZyBEb2N1bWVudGF0aW9uIGZvciBydGQxMjk1IHBp
bmN0cmwgZHJpdmVyLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUWSBDaGFuZyA8dHljaGFu
Z0ByZWFsdGVrLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAuLi4vcGluY3RybC9yZWFsdGVrLHJ0ZDEy
OTUtcGluY3RybC55YW1sICAgICAgfCAxOTIgKysrKysrKysrKysrKysrKysrDQo+ID4+ICAxIGZp
bGUgY2hhbmdlZCwgMTkyIGluc2VydGlvbnMoKykNCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0K
PiA+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0
ZDEyOTUtcGluY3RybC55YW0NCj4gPj4gbA0KPiA+Pg0KPiA+DQo+ID4NCj4gPiBQbGVhc2UgYWRk
IEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldyB2ZXJzaW9ucy4NCj4g
PiBIb3dldmVyLCB0aGVyZSdzIG5vIG5lZWQgdG8gcmVwb3N0IHBhdGNoZXMgKm9ubHkqIHRvIGFk
ZCB0aGUgdGFncy4gVGhlDQo+ID4gdXBzdHJlYW0gbWFpbnRhaW5lciB3aWxsIGRvIHRoYXQgZm9y
IGFja3MgcmVjZWl2ZWQgb24gdGhlIHZlcnNpb24gdGhleSBhcHBseS4NCj4gPg0KPiA+IElmIGEg
dGFnIHdhcyBub3QgYWRkZWQgb24gcHVycG9zZSwgcGxlYXNlIHN0YXRlIHdoeSBhbmQgd2hhdCBj
aGFuZ2VkLg0KPiANCj4gVGhlIHRoaW5nIHJlYWxseSBtaXNzaW5nIGhlcmUgaXMgYSBwZXItcGF0
Y2ggY2hhbmdlIGxvZy4NCj4gDQo+IFRoaW5ncyB3ZXJlIGFkZGVkIGhlcmUgdGhhdCBJJ20gc3Vy
ZSB5b3Ugd291bGQgbm90IGdpdmUgeW91ciBSZXZpZXdlZC1ieSBmb3IsDQo+IGluIHBhcnRpY3Vs
YXIgbmV3IHByb3BlcnRpZXMgcHJlZml4ZWQgd2l0aCB1bnJlZ2lzdGVyZWQgcnRrIHByZWZpeCBp
bnN0ZWFkIG9mIHRoZQ0KPiByZWdpc3RlcmVkIHJlYWx0ZWsgcHJlZml4Lg0KDQpJIHdpbGwgbW9k
aWZ5IHRoZSBwcm9wZXJ0eSBuYW1lIHdpdGggcmVhbHRlayBwcmVmaXggaW4gcGF0Y2ggdjQuDQoN
Cj4gDQo+IEBUWSwgaGlkaW5nIHN1Y2ggY2hhbmdlcyBpbiBhIGJpZyBwcmV2aW91c2x5IHJldmll
d2VkIHBhdGNoIHdpdGhvdXQgYW55DQo+IG1lbnRpb24gaXMgcHJvYmxlbWF0aWMgLSBwbGVhc2Ug
cmF0aGVyIGRvIHNtYWxsZXIgZm9sbG93LXVwIHBhdGNoZXMgdG8gbm90DQo+IGludmFsaWRhdGUg
cHJldmlvdXMgcmV2aWV3cyB3aXRoIG5ldyBmZWF0dXJlcy4NCj4gDQoNCkknbSBzb3JyeSBhYm91
dCB0aGF0LiBJIHdpbGwgYWRkIFJldmlld2VkLWJ5IHRhZ3MgaW4gdGhlIHByZXZpb3VzbHkgcmV2
aWV3ZWQgcGF0Y2ggYW5kIGFkZCBmb2xsb3ctdXAgcGF0Y2hlcyBmb3IgbmV3IGZlYXR1cmVzIGlu
IHBhdGNoIHY0Lg0KDQpCZXN0IFJlZ2FyZHMsDQpUWUNoYW5nDQoNCiANCj4gLS0tLS0tUGxlYXNl
IGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
