Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFFC24346D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHMHJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:09:37 -0400
Received: from rtits2.realtek.com ([211.75.126.72]:35267 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgHMHJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 03:09:37 -0400
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 07D798Jb8012557, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
        by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 07D798Jb8012557
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 13 Aug 2020 15:09:08 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:09:08 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 13 Aug 2020 15:09:08 +0800
Received: from RTEXMB04.realtek.com.tw ([fe80::941:6388:7d34:5c44]) by
 RTEXMB04.realtek.com.tw ([fe80::941:6388:7d34:5c44%3]) with mapi id
 15.01.1779.005; Thu, 13 Aug 2020 15:09:08 +0800
From:   =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-realtek-soc@lists.infradead.org" 
        <linux-realtek-soc@lists.infradead.org>,
        "afaerber@suse.de" <afaerber@suse.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/8] dt-bindings: pinctrl: realtek: Add Realtek DHC SoC rtd1195
Thread-Topic: [PATCH v2 4/8] dt-bindings: pinctrl: realtek: Add Realtek DHC
 SoC rtd1195
Thread-Index: AQHWW6sA2D84X/x43EmLwrf4QwIbEKk1xoaQ
Date:   Thu, 13 Aug 2020 07:09:07 +0000
Message-ID: <a85ea28815c74b1282cb762073e43c6e@realtek.com>
References: <20200716023338.14922-1-tychang@realtek.com>
 <20200716023338.14922-5-tychang@realtek.com> <20200716195458.GA2739358@bogus>
In-Reply-To: <20200716195458.GA2739358@bogus>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.181.134]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgUm9iLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gU2Vu
dDogRnJpZGF5LCBKdWx5IDE3LCAyMDIwIDM6NTUgQU0NCj4gVG86IFRZX0NoYW5nW7FppGy2aF0g
PHR5Y2hhbmdAcmVhbHRlay5jb20+DQo+IENjOiBsaW51eC1yZWFsdGVrLXNvY0BsaXN0cy5pbmZy
YWRlYWQub3JnOyBhZmFlcmJlckBzdXNlLmRlOw0KPiBsaW51cy53YWxsZWlqQGxpbmFyby5vcmc7
IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
IDQvOF0gZHQtYmluZGluZ3M6IHBpbmN0cmw6IHJlYWx0ZWs6IEFkZCBSZWFsdGVrIERIQyBTb0MN
Cj4gcnRkMTE5NQ0KPiANCj4gT24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMTA6MzM6MzRBTSArMDgw
MCwgVFkgQ2hhbmcgd3JvdGU6DQo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmcgRG9jdW1lbnRh
dGlvbiBmb3IgcnRkMTE5NSBwaW5jdHJsIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFRZIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGluY3Ry
bC9yZWFsdGVrLHJ0ZDExOTUtcGluY3RybC55YW1sICAgICAgfCAxMDQgKysrKysrKysrKysrKysr
KysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMDQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9yZWFsdGVrLHJ0ZDExOTUtcGluY3RybC55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDEx
OTUtcGluY3RybC55YQ0KPiA+IG1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDExOTUtcGluY3RybC55YQ0KPiA+IG1sDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUwYTk1YmM0NmUyYg0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9yZWFsdGVrLHJ0ZDExOTUtcGluY3RyDQo+ID4gKysrIGwueWFtbA0KPiA+
IEBAIC0wLDAgKzEsMTA0IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoN
Cj4gPiAraHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9yZWFsdGVrLHJ0ZDEx
OTUtcGluY3RybC55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBSZWFsdGVrIERIQyBSVEQx
MTk1IHBpbiBjb250cm9sDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEFuZHJl
YXMgRmFyYmVyIDxhZmFlcmJlckBzdXNlLmRlPg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4g
PiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSByZWFsdGVrLHJ0
ZDExOTUtaXNvLXBpbmN0cmwNCj4gPiArICAgICAgLSByZWFsdGVrLHJ0ZDExOTUtY3J0LXBpbmN0
cmwNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArcmVxdWly
ZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArDQo+ID4gKyNQSU4g
Q09ORklHVVJBVElPTiBOT0RFUw0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAnLXBp
bnMkJzoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4g
KyAgICAgIFBpbmN0cmwgbm9kZSdzIGNsaWVudCBkZXZpY2VzIHVzZSBzdWJub2RlcyBmb3IgZGVz
aXJlZCBwaW4NCj4gY29uZmlndXJhdGlvbi4NCj4gPiArICAgICAgQ2xpZW50IGRldmljZSBzdWJu
b2RlcyB1c2UgYmVsb3cgc3RhbmRhcmQgcHJvcGVydGllcy4NCj4gPiArICAgIGFsbE9mOg0KPiA+
ICsgICAgICAtICRyZWY6ICIvc2NoZW1hcy9waW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwiDQo+ID4g
Kw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgZ3JvdXBzOg0KPiA+ICsgICAgICAg
IGl0ZW1zOg0KPiA+ICsgICAgICAgICAgZW51bTogWyBpc29fZ3Bpb18wLCBpc29fZ3Bpb18xLCB1
c2IwLCB1c2IxLCB2ZmRfY3NfbiwNCj4gPiArICAgICAgICAgIHZmZF9jbGssIHZmZF9kLCBpcl9y
eCwgaXJfdHgsIHVyMF9yeCwgdXIwX3R4LA0KPiA+ICsgICAgICAgICAgdXIxX3J4LCB1cjFfdHgs
IHVyMV9jdHNfbiwgdXIxX3J0c19uLCBpMmNfc2NsXzAsDQo+ID4gKyAgICAgICAgICBpMmNfc2Rh
XzAsIGV0bl9sZWRfbGluaywgZXRuX2xlZF9yeHR4LA0KPiA+ICsgICAgICAgICAgaTJjX3NjbF82
LCBpMmNfc2RhXzYsIGFpX2xvYywgZWp0YWdfYXZjcHVfbG9jLA0KPiA+ICsgICAgICAgICAgdXIx
X2xvYywgcHdtXzAxX29wZW5fZHJhaW4sIHB3bV8yM19vcGVuX2RyYWluLA0KPiA+ICsgICAgICAg
ICAgZ3Bpb18wLCBncGlvXzEsIGdwaW9fMiwgZ3Bpb18zLCBncGlvXzQsIGdwaW9fNSwNCj4gPiAr
ICAgICAgICAgIGdwaW9fNiwgZ3Bpb183LCBncGlvXzgsIG5mX2RkXzAsIG5mX2RkXzEsDQo+ID4g
KyAgICAgICAgICBuZl9kZF8yLCBuZl9kZF8zLCBuZl9kZF80LCBuZl9kZF81LCBuZl9kZF82LA0K
PiA+ICsgICAgICAgICAgbmZfZGRfNywgbmZfcmR5LCBuZl9yZF9uLCBuZl93cl9uLCBuZl9hbGUs
DQo+ID4gKyAgICAgICAgICBuZl9jbGUsIG5mX2NlX25fMCwgbmZfY2Vfbl8xLCBtbWNfZGF0YV8w
LA0KPiA+ICsgICAgICAgICAgbW1jX2RhdGFfMSwgbW1jX2RhdGFfMiwgbW1jX2RhdGFfMywgbW1j
X2NsaywNCj4gPiArICAgICAgICAgIG1tY19jbWQsIG1tY193cCwgbW1jX2NkLCBzZGlvX2Nsaywg
c2Rpb19kYXRhXzAsDQo+ID4gKyAgICAgICAgICBzZGlvX2RhdGFfMSwgc2Rpb19kYXRhXzIsIHNk
aW9fZGF0YV8zLCBzZGlvX2NtZCwNCj4gPiArICAgICAgICAgIGkyY19zY2xfNSwgaTJjX3NkYV81
LCB0cDFfZGF0YSwgdHAxX2NsaywNCj4gPiArICAgICAgICAgIHRwMV92YWxpZCwgdHAxX3N5bmMs
IHRwMF9kYXRhLCB0cDBfY2xrLA0KPiA+ICsgICAgICAgICAgdHAwX3ZhbGlkLCB0cDBfc3luYywg
dXNiX2lkLCBoZG1pX2hwZCwgc3BkaWYsDQo+ID4gKyAgICAgICAgICBpMmNfc2NsXzEsIGkyY19z
ZGFfMSwgaTJjX3NjbF80LCBpMmNfc2RhXzQsDQo+ID4gKyAgICAgICAgICBzZW5zb3JfY2tvXzAs
IHNlbnNvcl9ja29fMSwgc2Vuc29yX3JzdCwNCj4gPiArICAgICAgICAgIHNlbnNvcl9zdGJfMCwg
c2Vuc29yX3N0Yl8xLCBlanRhZ19zY3B1X2xvYywNCj4gPiArICAgICAgICAgIGhpZl9sb2MsIGFv
X2xvYyBdDQo+ID4gKyAgICAgICAgbWluSXRlbXM6IDENCj4gPiArDQo+ID4gKyAgICAgIGZ1bmN0
aW9uOg0KPiA+ICsgICAgICAgIGVudW06IFsgZ3BpbywgYWlfdXIxLCBhaV92ZmQsIGF2Y3B1X2Vq
dGFnX2lzbywNCj4gPiArICAgICAgICBhdmNwdV9lanRhZ19taXNjX2xvYywgZXRuX2xlZCwgaTJj
MCwgaTJjMiwNCj4gPiArICAgICAgICBpMmMzLCBpMmM2LCBpcl9yeCwgaXJfdHgsIHB3bSwgc3Rh
bmRieV9kYmcsDQo+ID4gKyAgICAgICAgdWFydDAsIHVhcnQxLCB1cjFfbWlzYywgdmZkLCBwd21f
MDFfbm9ybWFsLA0KPiA+ICsgICAgICAgIHB3bV8yM19ub3JtYWwsIHB3bV8wMV9vcGVuX2RyYWlu
LCBwd21fMjNfb3Blbl9kcmFpbiwNCj4gPiArICAgICAgICBhb190cDAsIGFvX2dwaW8sIGF2Y3B1
X2VqdGFnX21pc2MsIGNwdV9sb29wLCBlbW1jLA0KPiA+ICsgICAgICAgIGdzcGksIGhpZl9taXNj
LCBoaWZfbmYsIGkyYzEsIGkyYzIsIGkyYzMsDQo+ID4gKyAgICAgICAgaTJjNCwgaTJjNSwgbW1j
LCBuYW5kLCBzY3B1X2VqdGFnX2dwaW8sDQo+ID4gKyAgICAgICAgc2NwdV9lanRhZ19jciwgc2Rp
bywgc2Vuc29yLCBzcGRpZiwgdHAwLCB0cDEsDQo+ID4gKyAgICAgICAgdWFydDEsIHVzYiBdDQo+
ID4gKw0KPiA+ICsgICAgICBkcml2ZS1zdHJlbmd0aDoNCj4gPiArICAgICAgICBlbnVtOiBbMiwg
NCwgOF0NCj4gPiArDQo+ID4gKyAgICAgIGJpYXMtcHVsbC1kb3duOiB0cnVlDQo+ID4gKw0KPiA+
ICsgICAgICBiaWFzLXB1bGwtdXA6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgIGJpYXMtZGlzYWJs
ZTogdHJ1ZQ0KPiA+ICsNCj4gPiArICAgICAgaW5wdXQtc2NobWl0dC1kaXNhYmxlOiB0cnVlDQo+
ID4gKw0KPiA+ICsgICAgICBpbnB1dC1zY2htaXR0LWVuYWJsZTogdHJ1ZQ0KPiA+ICsNCj4gPiAr
ICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAtIGdyb3Vwcw0KPiA+ICsgICAgICAtIGZ1bmN0aW9u
DQo+ID4gKw0KPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBBbHNv
IG5lZWQgYSB0b3AtbGV2ZWwgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZScNCg0KSSB3aWxs
IGFkZCB0aGlzIGluIHBhdGNoIHYzLg0KDQo+IA0KPiBXaXRoIHRoYXQsDQo+IA0KPiBSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gDQoNCkJlc3QgUmVnYXJkcywN
ClRZQ2hhbmcNCg0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9y
ZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
