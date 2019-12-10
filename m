Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 863F51191D3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 21:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfLJUYo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 15:24:44 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:44112 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfLJUYn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 15:24:43 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C61B4886BF;
        Wed, 11 Dec 2019 09:24:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576009478;
        bh=cCJ4IOUErdRXpS39JIAoWUSB/QOu2X0QuS4VhmhhzYk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=ivCMbiiPoyvBkAbJvQMZus7eq8oDUJHfmIBM1N7NGCtQqpKVHsA/ajVC3uOdTstzz
         jgn0EURerQBdDjnuUlyfyJtmjN599ppzwyI+I1IIVOCHaHl35SNN+Xe7RvWvCPmihJ
         AWYNw3dF0IARL5nL4XIWO9B0skzGA6/6ArtZQIjr0QLx7fwcnCwgihTX12HbDhRefy
         o8nuxg4JEPB2pFG5s541HgcoxEN20nwiWNOgxwK3kRXwn/oRaMWSMDsfgJ5hKXIrvH
         +CUX1Ap9W9ZY8ZYldbOP+/jRD8eNuG/IKy63zPYFayK47MMCA9YmuA11o3yufWD3wQ
         Yv9kAOoM8yP9g==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5defff050000>; Wed, 11 Dec 2019 09:24:37 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Wed, 11 Dec 2019 09:24:33 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 11 Dec 2019 09:24:33 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "arnd@arndb.de" <arnd@arndb.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>
CC:     "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] gpio: xgs-iproc: remove __exit annotation for
 iproc_gpio_remove
Thread-Topic: [PATCH] gpio: xgs-iproc: remove __exit annotation for
 iproc_gpio_remove
Thread-Index: AQHVr5OrBiJXFgirdU+/MD3yYsX4TKey9pWA
Date:   Tue, 10 Dec 2019 20:24:33 +0000
Message-ID: <01669f6c5d0e40c7a410da2dcce6c9e825e4a1d4.camel@alliedtelesis.co.nz>
References: <20191210195414.705239-1-arnd@arndb.de>
In-Reply-To: <20191210195414.705239-1-arnd@arndb.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:8c06:5a00:1627:6912]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E290714BFDB0144FA4F4989701784D39@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDE5LTEyLTEwIGF0IDIwOjU0ICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBXaGVuIGJ1aWx0IGludG8gdGhlIGtlcm5lbCwgdGhlIGRyaXZlciBjYXVzZXMgYSBsaW5rIHBy
b2JsZW06DQo+IA0KPiBgaXByb2NfZ3Bpb19yZW1vdmUnIHJlZmVyZW5jZWQgaW4gc2VjdGlvbiBg
LmRhdGEnIG9mIGRyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5vOiBkZWZpbmVkIGluIGRpc2Nh
cmRlZCBzZWN0aW9uIGAuZXhpdC50ZXh0JyBvZiBkcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2Mu
bw0KPiANCj4gUmVtb3ZlIHRoZSBpbmNvcnJlY3QgYW5ub3RhdGlvbi4NCj4gDQo+IEZpeGVzOiA2
YTQxYjZjNWZjMjAgKCJncGlvOiBBZGQgeGdzLWlwcm9jIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJldmlld2VkLWJ5OiBDaHJpcyBQ
YWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCldoYXQncyB0aGUg
Y3VycmVudCBiZXN0IHByYWN0aWNlIHcuci50Ll9faW5pdCBhbmQgX19leGl0PyBJIHNlZW0gdG8N
CmhhdmUgbWVzc2VkIHRoaXMgdXAgb24gbXVsdGlwbGUgZnJvbnRzLg0KDQo+IC0tLQ0KPiAgZHJp
dmVycy9ncGlvL2dwaW8teGdzLWlwcm9jLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
aW8vZ3Bpby14Z3MtaXByb2MuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5jDQo+IGlu
ZGV4IDc3M2U1YzI0MzA5ZS4uYjIxYzJlNDM2YjYxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
aW8vZ3Bpby14Z3MtaXByb2MuYw0KPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXByb2Mu
Yw0KPiBAQCAtMjgwLDcgKzI4MCw3IEBAIHN0YXRpYyBpbnQgaXByb2NfZ3Bpb19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1z
dGF0aWMgaW50IF9fZXhpdCBpcHJvY19ncGlvX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiArc3RhdGljIGludCBpcHJvY19ncGlvX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBpcHJvY19ncGlvX2NoaXAgKmNoaXA7DQo+
ICANCg==
