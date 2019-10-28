Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25413E79FA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 21:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732878AbfJ1UVj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 16:21:39 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34774 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732924AbfJ1UVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 16:21:38 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4D313886BF;
        Tue, 29 Oct 2019 09:21:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572294095;
        bh=c2JPJoDl7GrXsPDEwbV2zdXQAsq3RGTMPAW0OkBfrhQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=yTH+1aoQNjOv9nRSP5I+N5DURyW8lI8R/AGrzjf7R8Pov5K4jpfub1sHgZAULmETK
         VxjwvjP4zzlUlmjWj+IXCK7J9Q+VlqZhON08v9LXfO3wLhlJjd5DuR67TS9OFR4x7N
         gE7Aad6kg/vYaJMwA/5iFRN7EyOAg/DfNIeu3XuuwSd9h/CjQeV5NOMiD0jD/w8Mw9
         I+/bWBGhO1RYAvDbXa2KSMwINahkt9eyuIxuXzhisB5273D1JNpJSaaUg123C3n2y+
         aWbjnPoQHPo6RnoFscr92wQtLd1MHYjDQlhgxI4RZ3SiLjUd73vSqjyPYF+ArcAA40
         DOS96QFv8hmTg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db74dcf0000>; Tue, 29 Oct 2019 09:21:35 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Tue, 29 Oct 2019 09:21:33 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 29 Oct 2019 09:21:33 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: NSP: avoid unnecessary probe deferrals
Thread-Topic: [PATCH 2/2] ARM: dts: NSP: avoid unnecessary probe deferrals
Thread-Index: AQHViujHZY98ZQ157ka0OeDhGPxOgadqws4AgAToBQA=
Date:   Mon, 28 Oct 2019 20:21:32 +0000
Message-ID: <c8c9df8f252ed42c4ac7f3a10e52bfa5f5e31d50.camel@alliedtelesis.co.nz>
References: <20191025040041.6210-1-chris.packham@alliedtelesis.co.nz>
         <20191025040041.6210-3-chris.packham@alliedtelesis.co.nz>
         <5d75b0ba-81c6-3d54-5bef-1127cd1c9998@gmail.com>
In-Reply-To: <5d75b0ba-81c6-3d54-5bef-1127cd1c9998@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:54a5:7b66:76cf:b046]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBA0E80993A24C42943B8516703686CD@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gRnJpLCAyMDE5LTEwLTI1IGF0IDEwOjI2IC0wNzAwLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
Og0KPiBPbiAxMC8yNC8xOSA5OjAwIFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+IFRoZSBw
aW5jdHJsIG5vZGUgaXMgdXNlZCBieSB0aGUgZ3Bpb2Egbm9kZS4gV2hpY2ggbWF5IGhhdmUgbW9y
ZQ0KPiA+IGRlc2NlbmRhbnRzIGF0IGEgYm9hcmQgbGV2ZWwuIElmIHRoZSBwaW5jdHJsIG5vZGUg
aXNuJ3QgcHJvYmVkIGZpcnN0IHRoZQ0KPiA+IGdwaW8gaXMgZGVmZXJyZWQgYW5kIGFueXRoaW5n
IHRoYXQgbmVlZHMgYSBncGlvIHBpbiBvbiB0aGF0IGNoaXAgaXMgYWxzbw0KPiA+IGRlZmVycmVk
Lg0KPiANCj4gSWYgd2hhdCB5b3UgY2FyZSBpcyB0byBvcHRpbWl6ZSB5b3VyIGJvb3QgZmxvdyBz
dWNoIHRoYXQgbm8gcmUtcHJvYmluZw0KPiBvY2N1cnMsIG1heWJlIGFub3RoZXIgc29sdXRpb24g
dG8gbG9vayBhdCBpcyB0byByZS1vcmRlciB0aGUgb3JkZXIgaW4NCj4gd2hpY2ggc3Vic3lzdGVt
cyBhcmUgaW5pdGlhbGl6ZWQgb3IgYnVpbHQgKF9pbml0Y2FsbCBjaGFuZ2VzIG9yDQo+IGRyaXZl
cnMvTWFrZWZpbGUgY2hhbmdlcyksIGJlY2F1c2UgY2hhbmdpbmcgRGV2aWNlIFRyZWUgY2VydGFp
bmx5IGRvZXMNCj4gbm90IHNjYWxlIG92ZXIgcGxhdGZvcm1zIGFuZCBJIHJlY2FsbCBSb2IgaW5k
aWNhdGluZyB0aGF0IGhlIHdhbnRlZCB0bw0KPiBpbnRyb2R1Y2UgcmFuZG9taXplZCBwbGF0Zm9y
bV9kZXZpY2UgY3JlYXRpb24gZnJvbQ0KPiBvZl9wbGF0Zm9ybV9idXNfcG9wdWxhdGUoKSBhdCBv
bmUgcG9pbnQgb3IgYW5vdGhlci4NCj4gDQoNCkhtbS4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0
aGluZy4gcGluY3RybC1uc3AtZ3Bpby5jIHVzZXMNCmFyY2hfaW5pdGNhbGxfc3luYygpIGFuZCBw
aW5jdHJsLW5zcC1tdXguYyB1c2VzIGFyY2hfaW5pdGNhbGwoKSBzbyBpbg0KdGhlb3J5IHRoZXkg
YXJlIGFscmVhZHkgaW4gdGhlIHJpZ2h0IG9yZGVyLg0KDQo+ID4gDQo+ID4gTm9ybWFsbHkgd2Ug
YW5kIG5vZGVzIGluIHRoZSBkZXZpY2UgdHJlZSB0byBiZSBsaXN0ZWQgaW4gdGhlaXIgbmF0dXJh
bA0KPiA+IG1lbW9yeSBtYXBwZWQgYWRkcmVzcyBvcmRlciBidXQgcHV0dGluZyB0aGUgcGluY3Ry
bCBub2RlIGZpcnN0IGF2b2lkcw0KPiA+IHRoZSBkZWZlcnJhbCBvZiBudW1lcm91cyBkZXZpY2Vz
IHNvIG1ha2UgYW4gZXhjZXB0aW9uIGluIHRoaXMgY2FzZS4NCj4gDQo+IFRoYXQgaXMgYSB3b3Jr
YXJvdW5kIG1vcmUgdGhhbiBhIHJlYWwgc29sdXRpb24sIHRob3VnaCBJIHVuZGVyc3RhbmQgd2h5
DQo+IHlvdSB3b3VsZCB0byBkbyB0aGF0LiBPbmUgZG93bnNpZGUgaXMgdGhhdCB0aGUgZW50cmll
cyBhcmUgbm8gbG9uZ2VyIGluDQo+IGluY3JlbWVudGluZyByZWdpc3RlciBhZGRyZXNzIG9yZGVy
IGFuZCB0aGF0IGlzIHZpc3VhbGx5IGRpc3R1cmJpbmcgYW5kDQo+IHdobyBrbm93cywgbWF5YmUg
YSBkcml2ZSBieSBjb250cmlidXRvciB3aG9zZSBwZXQgcHJvamVjdCB3aWxsIGJlIHRvDQo+IG9y
ZGVyIHRoZSBEZXZpY2UgVHJlZSBlbnRyaWVzIGJ5IGluY3JlbWVudGluZyBhZGRyZXNzZXMgd2ls
bCBjaGFuZ2UgdGhhdA0KPiBpbiB0aGUgZnV0dXJlLi4uDQo+IA0KDQpJIGd1ZXNzIHJlYWxseSB3
aGF0J3MgbmVlZGVkIGlzIHNvbWV0aGluZyB0aGF0IHVuZGVyc3RhbmRzIHBoYW5kbGVzIGFuZA0K
dHJpZXMgdG8gcHJvZHVjZSBhIGRlcGVuZGVuY3kgdHJlZSBiYXNlZCBvbiB0aGF0Lg0KDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0
ZWxlc2lzLmNvLm56Pg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9iY20tbnNwLmR0
c2kgfCAxNCArKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9iY20tbnNwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9iY20tbnNwLmR0c2kNCj4gPiBp
bmRleCBkYTZkNzBmMDllZjEuLmRkN2E2NTc0M2MwOCAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9iY20tbnNwLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9iY20t
bnNwLmR0c2kNCj4gPiBAQCAtMTcyLDYgKzE3MiwxMyBAQA0KPiA+ICAJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+Ow0KPiA+ICAJCSNzaXplLWNlbGxzID0gPDE+Ow0KPiA+ICANCj4gPiArCQlwaW5jdHJs
OiBwaW5jdHJsQDNmMWMwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJicmNtLG5zcC1waW5tdXgi
Ow0KPiA+ICsJCQlyZWcgPSA8MHgzZjFjMCAweDA0PiwNCj4gPiArCQkJICAgICAgPDB4MzAwMjgg
MHgwND4sDQo+ID4gKwkJCSAgICAgIDwweDNmNDA4IDB4MDQ+Ow0KPiA+ICsJCX07DQo+ID4gKw0K
PiA+ICAJCWdwaW9hOiBncGlvQDIwIHsNCj4gPiAgCQkJY29tcGF0aWJsZSA9ICJicmNtLG5zcC1n
cGlvLWEiOw0KPiA+ICAJCQlyZWcgPSA8MHgwMDIwIDB4NzA+LA0KPiA+IEBAIC00NTgsMTMgKzQ2
NSw2IEBADQo+ID4gIAkJCQkJICAgICAic2F0YTIiOw0KPiA+ICAJCX07DQo+ID4gIA0KPiA+IC0J
CXBpbmN0cmw6IHBpbmN0cmxAM2YxYzAgew0KPiA+IC0JCQljb21wYXRpYmxlID0gImJyY20sbnNw
LXBpbm11eCI7DQo+ID4gLQkJCXJlZyA9IDwweDNmMWMwIDB4MDQ+LA0KPiA+IC0JCQkgICAgICA8
MHgzMDAyOCAweDA0PiwNCj4gPiAtCQkJICAgICAgPDB4M2Y0MDggMHgwND47DQo+ID4gLQkJfTsN
Cj4gPiAtDQo+ID4gIAkJdGhlcm1hbDogdGhlcm1hbEAzZjJjMCB7DQo+ID4gIAkJCWNvbXBhdGli
bGUgPSAiYnJjbSxucy10aGVybWFsIjsNCj4gPiAgCQkJcmVnID0gPDB4M2YyYzAgMHgxMD47DQo+
ID4gDQo+IA0KPiANCg==
