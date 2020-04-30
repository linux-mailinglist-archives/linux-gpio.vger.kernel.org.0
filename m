Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D4D1BF0A2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 08:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgD3G5B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 02:57:01 -0400
Received: from mailgw01.mediatek.com ([216.200.240.184]:58815 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgD3G5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2020 02:57:00 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Apr 2020 02:57:00 EDT
X-UUID: 890afbba71374a1788c031df98bde511-20200429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=s2dkEOMGbr8zmnRl4873RwL4QHEhugqZDl7HL1k+ZTg=;
        b=mHGWABDsM1tx4gU6tNElmsxKjMk5PfejytxRcMxEuSG1XUJiQG116Nkb9RlcG+ngwTpbqik2rI192R0qqdTEUuOwQfOyMlbKu0BKlSwPMjZ3rxzYKVOF+DsmK1wrsx3W2I8R5wPkouWlwa4psDcvr0uIQ7PmWL7GItcI7UladqY=;
X-UUID: 890afbba71374a1788c031df98bde511-20200429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
        (envelope-from <light.hsieh@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1995040796; Wed, 29 Apr 2020 22:51:52 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Apr 2020 23:41:52 -0700
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 14:41:53 +0800
Message-ID: <1588228913.3817.6.camel@mtkswgap22>
Subject: Re: [PATCH] pinctrl: mediatek: fix mtk_eint link error
From:   Light Hsieh <light.hsieh@mediatek.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 30 Apr 2020 14:41:53 +0800
In-Reply-To: <20200429132443.1295194-1-arnd@arndb.de>
References: <20200429132443.1295194-1-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gV2VkLCAyMDIwLTA0LTI5IGF0IDE1OjI0ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBJbiBhIGNvbmZpZ3VyYXRpb24gd2l0aCBDT05GSUdfUElOQ1RSTF9NVEtfTU9PUkU9eSBhbmQg
Q09ORklHX1BJTkNUUkxfTVRLX1BBUklTPW0sDQo+IHdlIGVuZCB1cCB3aXRoIHRoZSBtdGtfZWlu
dCBkcml2ZXIgYXMgYSBsb2FkYWJsZSBtb2R1bGUgdGhhdCBjYW5ub3QgYmUNCj4gbGlua2VkIGZy
b20gYnVpbHQtaW4gY29kZToNCg0KSG93IGRpZCB5b3Ugc2V0IGFsbCBNVEstcmVsYXRlZCBQSU5D
VFJMIGNvbmZpZ3M/DQphbmQgd2hhdCBpcyB0aGUgZ2VuZXJhdGVkIHJlc3VsdCBvZiAuY29uZmln
Pw0KDQoNCg0KPiBhYXJjaDY0LWxpbnV4LWxkOiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGlu
Y3RybC1tdGstY29tbW9uLXYyLm86IGluIGZ1bmN0aW9uIGBtdGtfYnVpbGRfZWludCc6DQo+ICgu
dGV4dCsweDMwNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG10a19laW50X2RvX2luaXQnDQo+
IGFhcmNoNjQtbGludXgtbGQ6IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW1vb3Jl
Lm86IGluIGZ1bmN0aW9uIGBtdGtfZ3Bpb19zZXRfY29uZmlnJzoNCj4gcGluY3RybC1tb29yZS5j
OigudGV4dCsweGY4MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG10a19laW50X3NldF9kZWJv
dW5jZScNCj4gYWFyY2g2NC1saW51eC1sZDogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0
cmwtbW9vcmUubzogaW4gZnVuY3Rpb24gYG10a19ncGlvX3RvX2lycSc6DQo+IHBpbmN0cmwtbW9v
cmUuYzooLnRleHQrMHgxMDI4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbXRrX2VpbnRfZmlu
ZF9pcnEnDQo+IA0KPiBTaW1wbGlmeSB0aGUgS2NvbmZpZyBsb2dpYyB0byBhbHdheXMgc2VsZWN0
IEVJTlRfTVRLIHdoZW4gaXQgaXMgbmVlZGVkLCBhbmQNCj4gcmVtb3ZlIHRoZSAnZGVmYXVsdCcg
c3RhdGVtZW50cy4NCj4gDQo+IEZpeGVzOiA4MTc0YTg1MTJlM2UgKCJwaW5jdHJsOiBtZWRpYXRl
azogbWFrZSBNZWRpYVRlayBwaW5jdHJsIHYyIGRyaXZlciByZWFkeSBmb3IgYnVpZGxpbmcgbG9h
ZGFibGUgbW9kdWxlIikNCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZyAgICB8ICA0
ICstLS0NCj4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5oIHwgMjggLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMzEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21l
ZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvS2NvbmZpZw0KPiBpbmRl
eCBmMzJkMzY0NGM1MDkuLmI2YThkOTFmNDg4NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5j
dHJsL21lZGlhdGVrL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL0tj
b25maWcNCj4gQEAgLTcsOCArNyw2IEBAIGNvbmZpZyBFSU5UX01USw0KPiAgCWRlcGVuZHMgb24g
UElOQ1RSTF9NVEsgfHwgUElOQ1RSTF9NVEtfTU9PUkUgfHwgUElOQ1RSTF9NVEtfUEFSSVMgfHwg
Q09NUElMRV9URVNUDQo+ICAJc2VsZWN0IEdQSU9MSUINCj4gIAlzZWxlY3QgSVJRX0RPTUFJTg0K
PiAtCWRlZmF1bHQgeSBpZiBQSU5DVFJMX01USyB8fCBQSU5DVFJMX01US19NT09SRQ0KPiAtCWRl
ZmF1bHQgUElOQ1RSTF9NVEtfUEFSSVMNCj4gIA0KPiAgY29uZmlnIFBJTkNUUkxfTVRLDQo+ICAJ
Ym9vbA0KPiBAQCAtMjAsNiArMTgsNyBAQCBjb25maWcgUElOQ1RSTF9NVEsNCj4gIAlzZWxlY3Qg
T0ZfR1BJTw0KPiAgDQo+ICBjb25maWcgUElOQ1RSTF9NVEtfVjINCj4gKwlzZWxlY3QgRUlOVF9N
VEsNCj4gIAl0cmlzdGF0ZQ0KPiAgDQo+ICBjb25maWcgUElOQ1RSTF9NVEtfTU9PUkUNCj4gQEAg
LTM4LDcgKzM3LDYgQEAgY29uZmlnIFBJTkNUUkxfTVRLX1BBUklTDQo+ICAJc2VsZWN0IFBJTk1V
WA0KPiAgCXNlbGVjdCBHRU5FUklDX1BJTkNPTkYNCj4gIAlzZWxlY3QgR1BJT0xJQg0KPiAtCXNl
bGVjdCBFSU5UX01USw0KPiAgCXNlbGVjdCBPRl9HUElPDQo+ICAJc2VsZWN0IFBJTkNUUkxfTVRL
X1YyDQoNCldpdGggdGhpcyBtb2RpZmljYXRpb24sUElOQ1RSS19NVEtfTU9PUkUgYWx3YXlzIHNl
bGVjdCBFSU5UX01USw0KKGluZGlyZWN0bHkgdmlhIHNlbGVjdCBQSU5DVFJMX01US19WMikuDQpI
b3dldmVyLCBpbiBwcmV2aW91cyByZXZpZXcsIFNlYW4gV2FuZyBzYWlkIHRoYXQgUElOQ1RSTF9N
VEtfTU9PUkUgZG9lcw0Kbm90IGFsd2F5cyB1c2UgRUlOVF9NVEsgc28gUElOQ1RSTF9NVEtfTU9P
UkUgc2hhbGwgbm90IHNlbGVjdCBFSU5UX01USw0KdW4tY29uZGl0aW9uYWxseS4NCg0KDQo+ICAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5oIGIvZHJp
dmVycy9waW5jdHJsL21lZGlhdGVrL210ay1laW50LmgNCj4gaW5kZXggNDg0NjhkMGZhZTY4Li5m
NDBkYWI1MGE1ZjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGst
ZWludC5oDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9tdGstZWludC5oDQo+IEBA
IC02OCw3ICs2OCw2IEBAIHN0cnVjdCBtdGtfZWludCB7DQo+ICAJY29uc3Qgc3RydWN0IG10a19l
aW50X3h0ICpncGlvX3hsYXRlOw0KPiAgfTsNCj4gIA0KPiAtI2lmIElTX0VOQUJMRUQoQ09ORklH
X0VJTlRfTVRLKQ0KPiAgaW50IG10a19laW50X2RvX2luaXQoc3RydWN0IG10a19laW50ICplaW50
KTsNCj4gIGludCBtdGtfZWludF9kb19zdXNwZW5kKHN0cnVjdCBtdGtfZWludCAqZWludCk7DQo+
ICBpbnQgbXRrX2VpbnRfZG9fcmVzdW1lKHN0cnVjdCBtdGtfZWludCAqZWludCk7DQo+IEBAIC03
NiwzMSArNzUsNCBAQCBpbnQgbXRrX2VpbnRfc2V0X2RlYm91bmNlKHN0cnVjdCBtdGtfZWludCAq
ZWludCwgdW5zaWduZWQgbG9uZyBlaW50X24sDQo+ICAJCQkgIHVuc2lnbmVkIGludCBkZWJvdW5j
ZSk7DQo+ICBpbnQgbXRrX2VpbnRfZmluZF9pcnEoc3RydWN0IG10a19laW50ICplaW50LCB1bnNp
Z25lZCBsb25nIGVpbnRfbik7DQo+ICANCj4gLSNlbHNlDQo+IC1zdGF0aWMgaW5saW5lIGludCBt
dGtfZWludF9kb19pbml0KHN0cnVjdCBtdGtfZWludCAqZWludCkNCj4gLXsNCj4gLQlyZXR1cm4g
LUVPUE5PVFNVUFA7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBpbmxpbmUgaW50IG10a19laW50X2Rv
X3N1c3BlbmQoc3RydWN0IG10a19laW50ICplaW50KQ0KPiAtew0KPiAtCXJldHVybiAtRU9QTk9U
U1VQUDsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGlubGluZSBpbnQgbXRrX2VpbnRfZG9fcmVzdW1l
KHN0cnVjdCBtdGtfZWludCAqZWludCkNCj4gLXsNCj4gLQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+
IC19DQo+IC0NCj4gLXN0YXRpYyBpbmxpbmUgaW50IG10a19laW50X3NldF9kZWJvdW5jZShzdHJ1
Y3QgbXRrX2VpbnQgKmVpbnQsIHVuc2lnbmVkIGxvbmcgZWludF9uLA0KPiAtCQkJICB1bnNpZ25l
ZCBpbnQgZGVib3VuY2UpDQo+IC17DQo+IC0JcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAtfQ0KPiAt
DQo+IC1zdGF0aWMgaW5saW5lIGludCBtdGtfZWludF9maW5kX2lycShzdHJ1Y3QgbXRrX2VpbnQg
KmVpbnQsIHVuc2lnbmVkIGxvbmcgZWludF9uKQ0KPiAtew0KPiAtCXJldHVybiAtRU9QTk9UU1VQ
UDsNCj4gLX0NCj4gLSNlbmRpZg0KPiAgI2VuZGlmIC8qIF9fTVRLX0VJTlRfSCAqLw0KDQo=

