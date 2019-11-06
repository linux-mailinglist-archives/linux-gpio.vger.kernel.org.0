Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFECF1F43
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 20:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfKFTtv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 14:49:51 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48262 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727547AbfKFTtv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 14:49:51 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6002D886BF;
        Thu,  7 Nov 2019 08:49:47 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1573069787;
        bh=qMGdylTyjH/BzjIPsu4mVVVT3VTtcxgSf7MBXN6MV1M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=b+dGUo26Vm642njRhSmiaoN8E/9bn35fI4qkrwMkz9QUJyS6dQL8pZ+tuE5P5iUYF
         F8R4xATAS/boYg80RYUNt84Zsr7mGTJXuyRng8D1WA+Iqd0V46x0nuDnctVWiqABLB
         np2tNNkQLJNDf5QCtsVluRIVs8NNYh+A0w8laLsQ4tBzUhf1s6eCLkUTI9vj2x87os
         s8h1Ufl3xQTMllJTiFgIiRH8dalzJ/XP6+oVw4AzjAy6GQIhqqGZJo5Jza2e1up2s1
         GTPjzHQxBxmsaRdClKlK/kuBYWVElXXjWyU5YH3BsxsszQ6N8ZLUWXZmksJaf889xm
         LlMuYY42UlA2w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dc323d90001>; Thu, 07 Nov 2019 08:49:45 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Thu, 7 Nov 2019 08:49:47 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 7 Nov 2019 08:49:47 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
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
Thread-Index: AQHVk9d2GHMYQw+EyUqkZ/V+4uyDVad84EwAgADUxIA=
Date:   Wed, 6 Nov 2019 19:49:46 +0000
Message-ID: <7057fc47ded887fb2780332739afba53e3c33e4a.camel@alliedtelesis.co.nz>
References: <20191105124915.34100-1-broonie@kernel.org>
         <TYAPR01MB45442B7135422BA8D088E29CD8790@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB45442B7135422BA8D088E29CD8790@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:f81e:1e86:b004:7754]
Content-Type: text/plain; charset="utf-8"
Content-ID: <44ABDBCC18A6CB4490B129FD6FBE0DD9@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

KGFkZGluZyBHdWlsbGFtdW1lKSwNCg0KT24gV2VkLCAyMDE5LTExLTA2IGF0IDA3OjA4ICswMDAw
LCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gSGkgTWFyaywNCj4gDQo+ID4gRnJvbTogTWFy
ayBCcm93biwgU2VudDogVHVlc2RheSwgTm92ZW1iZXIgNSwgMjAxOSA5OjQ5IFBNDQo+ID4gDQo+
ID4gVGhlIHRhYmxlIG9mIGRldmljZXRyZWUgaWRlbnRpZmllcnMgaXMgYW5ub3RhdGVkIGFzIF9f
aW5pdGNvbnN0DQo+ID4gaW5kaWNhdGluZyB0aGF0IGl0IGNhbiBiZSBkaXNjYXJkZWQgYWZ0ZXIg
a2VybmVsIGJvb3QgYnV0IGl0IGlzDQo+ID4gcmVmZXJlbmNlZCBmcm9tIHRoZSBkcml2ZXIgc3Ry
dWN0IHdoaWNoIGhhcyBubyBpbml0IGFubm90YXRpb24gbGVhZGluZw0KPiA+IHRvIGEgbGlua2Vy
IHdhcm5pbmc6DQo+ID4gDQo+ID4gV0FSTklORzogdm1saW51eC5vKC5kYXRhKzB4ODJkNTgpOiBT
ZWN0aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZSBmcm9tIHRoZSB2YXJpYWJsZSBiY21faXByb2Nf
Z3Bpb19kcml2ZXIgdG8gdGhlDQo+ID4gdmFyaWFibGUgLmluaXQucm9kYXRhOmJjbV9pcHJvY19n
cGlvX29mX21hdGNoDQo+ID4gVGhlIHZhcmlhYmxlIGJjbV9pcHJvY19ncGlvX2RyaXZlciByZWZl
cmVuY2VzDQo+ID4gdGhlIHZhcmlhYmxlIF9faW5pdGNvbnN0IGJjbV9pcHJvY19ncGlvX29mX21h
dGNoDQo+ID4gDQo+ID4gU2luY2UgZHJpdmVycyBjYW4gYmUgcHJvYmVkIGFmdGVyIGluaXQgdGhl
IGxhY2sgb2YgYW5ub3RhdGlvbiBvbiB0aGUNCj4gPiBkcml2ZXIgc3RydWN0IGlzIGNvcnJlY3Qg
c28gcmVtb3ZlIHRoZSBhbm5vdGF0aW9uIGZyb20gdGhlIG1hdGNoIHRhYmxlLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gDQo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoISBXaXRob3V0IHRoaXMgcGF0Y2gsIEkgaGFkIGVuY291bnRl
cmVkIGFub3RoZXINCj4gaXNzdWUgd2hpY2ggbXkgZW52aXJvbm1lbnQgY2F1c2VkIGEgcGFuaWMg
d2hlbiBJIHRyaWVkIHRvIGluc3RhbGwgYSB1c2IgaG9zdA0KPiBkcml2ZXIgYWZ0ZXIgYm9vdGVk
IFsxXS4gQnV0LCBJIGNvdWxkIHJlc29sdmVkIHRoZSBpc3N1ZSBhZnRlcg0KPiBJIGFwcGxpZWQg
dGhpcyBwYXRjaC4gQWxzbywgSSBjb25maXJtZWQgdGhpcyBwYXRjaCBjb3VsZCByZXNvbHZlZCB0
aGUgd2FybmluZy4NCj4gDQo+IFNvLA0KPiBSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiBUZXN0ZWQtYnk6IFlvc2hpaGly
byBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gWW9zaGloaXJvIFNoaW1vZGENCj4gDQo+IC0tLQ0KPiBbMV0NCj4gWyAgMTQ2
LjU0MTE4OF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVh
bCBhZGRyZXNzIGZmZmY4MDAwMTFmNzM1NDANCj4gWyAgMTQ2LjU0OTA5OV0gTWVtIGFib3J0IGlu
Zm86DQo+IFsgIDE0Ni41NTE4ODVdICAgRVNSID0gMHg5NjAwMDAwNw0KPiBbICAxNDYuNTU0OTM0
XSAgIEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiBbICAxNDYu
NTYwMjM4XSAgIFNFVCA9IDAsIEZuViA9IDANCj4gWyAgMTQ2LjU2MzI4NF0gICBFQSA9IDAsIFMx
UFRXID0gMA0KPiBbICAxNDYuNTY2NDE2XSBEYXRhIGFib3J0IGluZm86DQo+IFsgIDE0Ni41Njky
ODldICAgSVNWID0gMCwgSVNTID0gMHgwMDAwMDAwNw0KPiBbICAxNDYuNTczMTE3XSAgIENNID0g
MCwgV25SID0gMA0KPiBbICAxNDYuNTc2MDc4XSBzd2FwcGVyIHBndGFibGU6IDRrIHBhZ2VzLCA0
OC1iaXQgVkFzLCBwZ2RwPTAwMDAwMDAwNDllNGEwMDANCj4gWyAgMTQ2LjU4Mjc3MF0gW2ZmZmY4
MDAwMTFmNzM1NDBdIHBnZD0wMDAwMDAwNzdmZmZmMDAzLCBwdWQ9MDAwMDAwMDc3ZmZmZTAwMywg
cG1kPTAwMDAwMDA3N2ZmZmIwMDMsIHB0ZT0wMDAwMDAwMDAwMDAwMDAwDQo+IFsgIDE0Ni41OTMz
NzVdIEludGVybmFsIGVycm9yOiBPb3BzOiA5NjAwMDAwNyBbIzFdIFBSRUVNUFQgU01QDQo+IFsg
IDE0Ni41OTg5NDRdIENQVTogMCBQSUQ6IDEwNiBDb21tOiBrd29ya2VyLzA6MSBOb3QgdGFpbnRl
ZCA1LjQuMC1yYzYtbmV4dC0yMDE5MTEwNSAjODcNCj4gWyAgMTQ2LjYwNjc2Nl0gSGFyZHdhcmUg
bmFtZTogUmVuZXNhcyBTYWx2YXRvci1YIDJuZCB2ZXJzaW9uIGJvYXJkIGJhc2VkIG9uIHI4YTc3
OTUgRVMyLjArIChEVCkNCj4gWyAgMTQ2LjYxNTIwOV0gV29ya3F1ZXVlOiBldmVudHMgZGVmZXJy
ZWRfcHJvYmVfd29ya19mdW5jDQo+IFsgIDE0Ni42MjAzNDFdIHBzdGF0ZTogYTAwMDAwODUgKE56
Q3YgZGFJZiAtUEFOIC1VQU8pDQo+IFsgIDE0Ni42MjUxMzJdIHBjIDogX19vZl9tYXRjaF9ub2Rl
LnBhcnQuNCsweDNjLzB4NzgNCj4gWyAgMTQ2LjYyOTgzMF0gbHIgOiBvZl9tYXRjaF9ub2RlKzB4
M2MvMHg3MA0KPiAuLi4NCj4gLS0tDQo+IA0KPiANCj4gU28sDQoNCkkgZ3Vlc3MgdGhhdCBrZXJu
ZWxjaSBmYWlsdXJlWzFdIHdhc24ndCBib2d1cyBhZnRlciBhbGwuIFNvcnJ5IGFnYWluDQpmb3Ig
dGhlIGhhc3NsZS4gQW5kIE1hcmssIFlvc2hpaGlybyB0aGFua3MgZm9yIHRoZSBmaXggYW5kIHRl
c3QuDQoNClsxXSAtIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC81ZGJiMmFjZi4xYzY5
ZmI4MS41NGNlMi4yZjQ4QG14Lmdvb2dsZS5jb20vDQoNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IFlvc2hpaGlybyBTaGltb2RhDQo+IA0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncGlv
L2dwaW8teGdzLWlwcm9jLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby14Z3MtaXByb2MuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5jDQo+ID4gaW5k
ZXggYTNmZGQ5NWNjOWU2Li5iYjE4M2Y1ODRkOTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cGlvL2dwaW8teGdzLWlwcm9jLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby14Z3MtaXBy
b2MuYw0KPiA+IEBAIC0yOTksNyArMjk5LDcgQEAgc3RhdGljIGludCBfX2V4aXQgaXByb2NfZ3Bp
b19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgCXJldHVybiAwOw0K
PiA+ICB9DQo+ID4gDQo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJjbV9p
cHJvY19ncGlvX29mX21hdGNoW10gX19pbml0Y29uc3QgPSB7DQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGJjbV9pcHJvY19ncGlvX29mX21hdGNoW10gPSB7DQo+ID4gIAl7
IC5jb21wYXRpYmxlID0gImJyY20saXByb2MtZ3Bpby1jY2EiIH0sDQo+ID4gIAl7fQ0KPiA+ICB9
Ow0KPiA+IC0tDQo+ID4gMi4yMC4xDQo+IA0KPiANCg==
