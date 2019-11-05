Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF3FF06A5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfKEUHz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:07:55 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46185 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEUHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 15:07:54 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B6B03886BF;
        Wed,  6 Nov 2019 09:07:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572984469;
        bh=lHjwz71E/Xg4m738q0J/T5/3YlB+63AdTckR6CbpTf8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=sbMfx1ncLH2xNDcnnjsrpyEOYMV4A5Xmp1wQ+aoovd95E2gMR8deiWjdQIHC6A/gc
         flkdKoFwf4E8fcA8d3cA+m8dJADMOshyt1pbTwCLaPCGjeWXFxnNWh+s2r/ZRRUrxt
         /lSTb31yObZniMqgDlnlXZ0sPrajuUNC3ec1HkGYW17UQnNVTigsiAwhK+czrwX8H1
         rbow6hqbGlimL09AgB6m3fpde6IXLNJsFPIGCZXXR3mZxMi3jBEKvMwTU3YIW0eo2N
         3nzqhmysAaOk/BAZXud2j1E/PnJ4tosJZmiHSWIcK94NZ+ENnGNbQThOfcRfxSQwZy
         p5B0SEZ29LGbw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dc1d6950000>; Wed, 06 Nov 2019 09:07:49 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Wed, 6 Nov 2019 09:07:47 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 6 Nov 2019 09:07:47 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree
 match table
Thread-Topic: [PATCH] gpio: xgs-iproc: Fix section mismatch on device tree
 match table
Thread-Index: AQHVk9d2GHMYQw+EyUqkZ/V+4uyDVad8J8QA
Date:   Tue, 5 Nov 2019 20:07:47 +0000
Message-ID: <b8563b7fde5bf3fa7ac255e8d3149dcd6d773f7f.camel@alliedtelesis.co.nz>
References: <20191105124915.34100-1-broonie@kernel.org>
In-Reply-To: <20191105124915.34100-1-broonie@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:d4b1:92dc:7823:3af2]
Content-Type: text/plain; charset="utf-8"
Content-ID: <212704B755D168488BFC89B45BF894EA@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTWFyaywNCg0KT24gVHVlLCAyMDE5LTExLTA1IGF0IDEyOjQ5ICswMDAwLCBNYXJrIEJyb3du
IHdyb3RlOg0KPiBUaGUgdGFibGUgb2YgZGV2aWNldHJlZSBpZGVudGlmaWVycyBpcyBhbm5vdGF0
ZWQgYXMgX19pbml0Y29uc3QNCj4gaW5kaWNhdGluZyB0aGF0IGl0IGNhbiBiZSBkaXNjYXJkZWQg
YWZ0ZXIga2VybmVsIGJvb3QgYnV0IGl0IGlzDQo+IHJlZmVyZW5jZWQgZnJvbSB0aGUgZHJpdmVy
IHN0cnVjdCB3aGljaCBoYXMgbm8gaW5pdCBhbm5vdGF0aW9uIGxlYWRpbmcNCj4gdG8gYSBsaW5r
ZXIgd2FybmluZzoNCj4gDQo+IFdBUk5JTkc6IHZtbGludXgubyguZGF0YSsweDgyZDU4KTogU2Vj
dGlvbiBtaXNtYXRjaCBpbiByZWZlcmVuY2UgZnJvbSB0aGUgdmFyaWFibGUgYmNtX2lwcm9jX2dw
aW9fZHJpdmVyIHRvIHRoZSB2YXJpYWJsZSAuaW5pdC5yb2RhdGE6YmNtX2lwcm9jX2dwaW9fb2Zf
bWF0Y2gNCj4gVGhlIHZhcmlhYmxlIGJjbV9pcHJvY19ncGlvX2RyaXZlciByZWZlcmVuY2VzDQo+
IHRoZSB2YXJpYWJsZSBfX2luaXRjb25zdCBiY21faXByb2NfZ3Bpb19vZl9tYXRjaA0KPiANCj4g
U2luY2UgZHJpdmVycyBjYW4gYmUgcHJvYmVkIGFmdGVyIGluaXQgdGhlIGxhY2sgb2YgYW5ub3Rh
dGlvbiBvbiB0aGUNCj4gZHJpdmVyIHN0cnVjdCBpcyBjb3JyZWN0IHNvIHJlbW92ZSB0aGUgYW5u
b3RhdGlvbiBmcm9tIHRoZSBtYXRjaCB0YWJsZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmsg
QnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCg0KVGhhbmtzIGZvciBwaWNraW5nIHRoaXMgdXAN
Cg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNp
cy5jby5uej4NCg0KSXMgaXQgd29ydGggaW5jbHVkaW5nICdGaXhlczogNmE0MWI2YzVmYzIwICgi
Z3BpbzogQWRkIHhncy1pcHJvYw0KZHJpdmVyIiknPw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlv
L2dwaW8teGdzLWlwcm9jLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby14
Z3MtaXByb2MuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5jDQo+IGluZGV4IGEzZmRk
OTVjYzllNi4uYmIxODNmNTg0ZDkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby14
Z3MtaXByb2MuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2MuYw0KPiBAQCAt
Mjk5LDcgKzI5OSw3IEBAIHN0YXRpYyBpbnQgX19leGl0IGlwcm9jX2dwaW9fcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gLXN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJjbV9pcHJvY19ncGlvX29mX21hdGNoW10g
X19pbml0Y29uc3QgPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBiY21f
aXByb2NfZ3Bpb19vZl9tYXRjaFtdID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAiYnJjbSxpcHJv
Yy1ncGlvLWNjYSIgfSwNCj4gIAl7fQ0KPiAgfTsNCg==
