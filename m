Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1A1210308
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 06:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgGAEiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 00:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGAEiD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 00:38:03 -0400
X-Greylist: delayed 8053 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 30 Jun 2020 21:38:02 PDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DE0C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 21:38:02 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A22C8066C;
        Wed,  1 Jul 2020 16:37:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1593578278;
        bh=Wi84TLx1F2NEUOgl/mdFakSQYpQaxC9CQ4JIFp7pX/0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=vn6shSyEMotsJ1TblFLlIJudTTkfwIh8+C8kvDAyIe3ou+PhC6tlPJrdxg/o1b1lp
         eXMDtKk6P+2hDUXKWftMqTkpEKOjwqEXtffLcxQqaH9xB9Ve7XUVgyuX4ODKilW0Dy
         1ELZpGT8NutJmPEBGPubBMbXWpil2heV8yvtKxtiiaNPz1H7qEhdfDmcFDTfcYtGM9
         aPjJIbMn06DkJixWrhFlhxgr77kzVlIhaGo2KERmvNWCkvkIVyPWYeCwqfiSCUgOOR
         ynMkkyzq2cghwldmM8sQkUZR5CXME8K4QQr6rzHILrfEG4qCIDUC7CAtisGhuauXZ4
         JaQCB3UxDAXQw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5efc13260000>; Wed, 01 Jul 2020 16:37:58 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Jul 2020 16:37:54 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 1 Jul 2020 16:37:54 +1200
From:   Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To:     "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
Thread-Topic: [PATCH] pinctrl: initialise nsp-mux earlier.
Thread-Index: AQHWTyWf+OJCQzu0tUG0OUfiNa14/6jw7mWAgABHbYCAAA44gIAAF0UA
Date:   Wed, 1 Jul 2020 04:37:54 +0000
Message-ID: <db96187e25342cd36133cde64ef742e03325c8c3.camel@alliedtelesis.co.nz>
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
         <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
         <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
         <86c009a8-05c4-40a3-daef-6d9e848642a3@gmail.com>
In-Reply-To: <86c009a8-05c4-40a3-daef-6d9e848642a3@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:899d:a7e9:b35a:a1ab]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7788E01D7A1BF43A0671BC8590FC233@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDIwLTA2LTMwIGF0IDIwOjE0IC0wNzAwLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
Og0KPiBTb3JyeSwgaXQgbG9va3MgbGlrZSBJIG1hZGUgYSBtaXN0YWtlIGluIG15IHRlc3Rpbmcg
KG9yIEkgd2FzIGx1Y2t5KSwNCj4gPiBhbmQgdGhpcyBwYXRjaCBkb2Vzbid0IGZpeCB0aGUgaXNz
dWUuIFdoYXQgaXMgaGFwcGVuaW5nIGlzOg0KPiA+IDEpIG5zcC1waW5tdXggZHJpdmVyIGlzIHJl
Z2lzdGVyZWQgKGFyY2hfaW5pdGNhbGwpLg0KPiA+IDIpIG5zcC1ncGlvLWEgZHJpdmVyIGlzIHJl
Z2lzdGVyZWQgKGFyY2hfaW5pdGNhbGxfc3luYykuDQo+ID4gMykgb2ZfcGxhdGZvcm1fZGVmYXVs
dF9wb3B1bGF0ZV9pbml0KCkgaXMgY2FsbGVkIChhbHNvIGF0IGxldmVsDQo+ID4gYXJjaF9pbml0
Y2FsbF9zeW5jKSwgd2hpY2ggc2NhbnMgdGhlIGRldmljZSB0cmVlLCBhZGRzIHRoZSBuc3AtZ3Bp
by1hDQo+ID4gZGV2aWNlLCBydW5zIGl0cyBwcm9iZSwgYW5kIHRoaXMgcmV0dXJucyAtRVBST0JF
X0RFRkVSIHdpdGggdGhlIGVycm9yDQo+ID4gbWVzc2FnZS4NCj4gPiA0KSBPbmx5IG5vdyBuc3At
cGlubXV4IGRldmljZSBpcyBwcm9iZWQuDQo+ID4gDQo+ID4gQ2hhbmdpbmcgdGhlICdhcmNoX2lu
aXRjYWxsX3N5bmMnIHRvICdkZXZpY2VfaW5pdGNhbGwnIGluIG5zcC1ncGlvLWENCj4gPiBlbnN1
cmVzIHRoYXQgdGhlIHBpbm11eCBpcyBwcm9iZWQgZmlyc3Qgc2luY2UNCj4gPiBvZl9wbGF0Zm9y
bV9kZWZhdWx0X3BvcHVsYXRlX2luaXQoKSB3aWxsIGJlIGNhbGxlZCBiZXR3ZWVuIHRoZSB0d28N
Cj4gPiByZWdpc3RlciBjYWxscywgYW5kIHRoZSBlcnJvciBnb2VzIGF3YXkuIElzIHRoaXMgY2hh
bmdlIGFjY2VwdGFibGUgYXMgYQ0KPiA+IHNvbHV0aW9uPw0KPiANCj4gSWYgcHJvYmUgZGVmZXJy
YWwgZGlkIG5vdCB3b3JrLCBjZXJ0YWlubHkgYnV0IGl0IHNvdW5kcyBsaWtlIHRoaXMgaXMNCj4g
YmVpbmcgZG9uZSBqdXN0IGZvciB0aGUgc2FrZSBvZiBlbGltaW5hdGluZyBhIHJvdW5kIG9mIHBy
b2JlIGRlZmVycmFsLA0KPiBpcyB0aGVyZSBhIGZ1bmN0aW9uYWwgcHJvYmxlbSB0aGlzIGlzIGZp
eGluZz8NCg0KTm8sIEknbSBqdXN0IHRyeWluZyB0byBwcmV2ZW50IGFuICJlcnJvciIgbWVzc2Fn
ZSBhcHBlYXJpbmcgaW4gc3lzbG9nLg0KDQo+ID4gVGhlIGFjdHVhbCBlcnJvciBtZXNzYWdlIGlu
IHN5c2xvZyBpczoNCj4gPiANCj4gPiBrZXJuLmVyciBrZXJuZWw6IGdwaW9jaGlwX2FkZF9kYXRh
X3dpdGhfa2V5OiBHUElPcyA0ODAuLjUxMQ0KPiA+ICgxODAwMDAyMC5ncGlvKSBmYWlsZWQgdG8g
cmVnaXN0ZXIsIC01MTcNCj4gPiANCj4gPiBTbyBhbiBlbmQgdXNlciBzZWVzICJlcnIiIGFuZCAi
ZmFpbGVkIiwgYW5kIGRvZXNuJ3Qga25vdyB3aGF0ICItNTE3Ig0KPiA+IG1lYW5zLg0KPiANCj4g
SG93IGFib3V0IHRoaXMgaW5zdGVhZDoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpb2xpYi5jIGIvZHJpdmVycy9ncGlvL2dwaW9saWIuYw0KPiBpbmRleCA0ZmEwNzVkNDlmYmMu
LjEwZDlkMGMxN2M5ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW9saWIuYw0KPiAr
KysgYi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi5jDQo+IEBAIC0xODE4LDkgKzE4MTgsMTAgQEAgaW50
IGdwaW9jaGlwX2FkZF9kYXRhX3dpdGhfa2V5KHN0cnVjdCBncGlvX2NoaXANCj4gKmdjLCB2b2lk
ICpkYXRhLA0KPiAgICAgICAgIGlkYV9zaW1wbGVfcmVtb3ZlKCZncGlvX2lkYSwgZ2Rldi0+aWQp
Ow0KPiAgZXJyX2ZyZWVfZ2RldjoNCj4gICAgICAgICAvKiBmYWlsdXJlcyBoZXJlIGNhbiBtZWFu
IHN5c3RlbXMgd29uJ3QgYm9vdC4uLiAqLw0KPiAtICAgICAgIHByX2VycigiJXM6IEdQSU9zICVk
Li4lZCAoJXMpIGZhaWxlZCB0byByZWdpc3RlciwgJWRcbiIsIF9fZnVuY19fLA0KPiAtICAgICAg
ICAgICAgICBnZGV2LT5iYXNlLCBnZGV2LT5iYXNlICsgZ2Rldi0+bmdwaW8gLSAxLA0KPiAtICAg
ICAgICAgICAgICBnYy0+bGFiZWwgPyA6ICJnZW5lcmljIiwgcmV0KTsNCj4gKyAgICAgICBpZiAo
cmV0ICE9IC1FUFJPQkVfREVGRVIpDQo+ICsgICAgICAgICAgICAgICBwcl9lcnIoIiVzOiBHUElP
cyAlZC4uJWQgKCVzKSBmYWlsZWQgdG8gcmVnaXN0ZXIsICVkXG4iLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgZ2Rldi0+YmFzZSwgZ2Rldi0+YmFzZSArIGdkZXYtPm5ncGlv
IC0gMSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ2MtPmxhYmVsID8gOiAiZ2VuZXJpYyIs
IHJldCk7DQo+ICAgICAgICAga2ZyZWUoZ2Rldik7DQo+ICAgICAgICAgcmV0dXJuIHJldDsNCj4g
IH0NCj4gDQpUaGF0IHdhcyBvbmUgb2YgbXkgdGhvdWdodHMgdG9vLiBJIGZvdW5kIHNvbWVvbmUg
aGFkIHRyaWVkIHRoYXQNCmVhcmxpZXIsIGJ1dCBpdCB3YXMgcmVqZWN0ZWQ6DQoNCg0KaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LWdwaW8vcGF0Y2gvMTUxNjU2Njc3
NC0xNzg2LTEtZ2l0LXNlbmQtZW1haWwtZGF2aWRAbGVjaG5vbG9neS5jb20vDQoNCg==
