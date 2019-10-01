Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC76C2C37
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 05:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731847AbfJADEm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 23:04:42 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52185 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731548AbfJADEm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 23:04:42 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C7133891AB;
        Tue,  1 Oct 2019 16:04:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1569899077;
        bh=6Ps8c2mwMYs63gM+juMo2bF9nGCmlv/Bhb3Rap1Be20=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=g7Kb8urqcsSwRVSLn6snIAYWTH9UxmhXtG9vyE3PE6b2bHPqOJeXzBFnWlbuMLm2V
         HFIPoxUGxDmJI47iL72GqBSaZ6ivw7sTgL24PRAAqpMiqsQ5XCnKQgDXN9GNHnz68v
         ZcbMKhmDazzfis2jYT2EqPNNyCpQEZb1Itq5ksmwZ5LiTlL9Atnu1z07+BT9Dsahza
         9SdXy3WAMVVYoOCBugXsjJ6GTX+thnBjRY637m0iHFBYGNi2BxQAcntO3RAoeOqnv+
         lg1+xT+xjDEzjyEze7IxJtui+5Fx2KF7Nizz0LsKPll5SUzFGNrB531KpV2PcNPBmC
         GhO6HgSRLsqUw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d92c2460001>; Tue, 01 Oct 2019 16:04:38 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Tue, 1 Oct 2019 16:04:37 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 1 Oct 2019 16:04:37 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "rayagonda.kokatanur@broadcom.com" <rayagonda.kokatanur@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "li.jin@broadcom.com" <li.jin@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Problem sharing interrupts between gpioa and uart0 on Broadcom
 Hurricane 2 (iProc)
Thread-Topic: Problem sharing interrupts between gpioa and uart0 on Broadcom
 Hurricane 2 (iProc)
Thread-Index: AQHVeAChr1G1lS1DPESIPAb5KujH5KdEPSUAgAAC1QA=
Date:   Tue, 1 Oct 2019 03:04:36 +0000
Message-ID: <f3a243b1f22cf29075467d236610dbd2e7a20e55.camel@alliedtelesis.co.nz>
References: <32c3d1dfe61a656e3250438d887e5ba91bd880d0.camel@alliedtelesis.co.nz>
         <d72a965a-e4e1-ba5d-cd62-b31939e75e44@gmail.com>
In-Reply-To: <d72a965a-e4e1-ba5d-cd62-b31939e75e44@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:11c:6830:fcb5:dc24]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ED249CD8C3C5A4AA80456A8123D76C6@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgRmxvcmlhbiwNCg0KT24gTW9uLCAyMDE5LTA5LTMwIGF0IDE5OjU0IC0wNzAwLCBGbG9yaWFu
IEZhaW5lbGxpIHdyb3RlOg0KPiANCj4gT24gOS8zMC8yMDE5IDc6MzMgUE0sIENocmlzIFBhY2to
YW0gd3JvdGU6DQo+ID4gSGksDQo+ID4gDQo+ID4gV2UgaGF2ZSBhIHBsYXRmb3JtIHVzaW5nIHRo
ZSBCQ001MzM0NCBpbnRlZ3JhdGVkIHN3aXRjaC9DUFUuIFRoaXMgaXMNCj4gPiBwYXJ0IG9mIHRo
ZSBIdXJyaWNhbmUgMiAodGVjaG5pY2FsbHkgV29sZmhvdW5kKSBmYW1pbHkgb2YgZGV2aWNlcy4N
Cj4gPiANCj4gPiBDdXJyZW50bHkgd2UncmUgdXNpbmcgcGllY2VzIG9mIEJyb2FkY29tJ3MgImlQ
cm9jIiBTREsgYmFzZWQgb24gYW4gb3V0DQo+ID4gb2YgZGF0ZSBrZXJuZWwgYW5kIHdlJ2QgdmVy
eSBtdWNoIGxpa2UgdG8gYmUgcnVubmluZyBhcyBjbG9zZSB0bw0KPiA+IHVwc3RyZWFtIGFzIHBv
c3NpYmxlLiBUaGUgZmFjdCB0aGF0IHRoZSBVYmlxdWl0aSBVbmlGaSBTd2l0Y2ggOCBpcw0KPiA+
IHVwc3RyZWFtIGdpdmVzIG1lIHNvbWUgaG9wZS4NCj4gDQo+IEZZSSwgSSBjb3VsZCBub3QgZ2V0
IGVub3VnaCBpbmZvcm1hdGlvbiBmcm9tIHRoZSBpUHJvYyBTREsgdG8gcG9ydCAob3INCj4gbm90
KSB0aGUgY2xvY2sgZHJpdmVyLCBzbyBpZiBub3RoaW5nIGVsc2UsIHRoYXQgaXMgYW4gYXJlYSB0
aGF0IG1heQ0KPiByZXF1aXJlIGltbWVkaWF0ZSB3b3JrICh0aG91Z2ggc29tZXRpbWVzIGZpeGVk
LWNsb2NrcyB3b3VsZCBkbyBqdXN0IGZpbmUpLg0KDQpTZXR0aW5nIGEgZml4ZWQgY2xvY2sgc2Vl
bXMgdG8gd29yayBmb3IgbWUuIEF0IGxlYXN0IGZvciBub3cuDQoNCj4gDQo+ID4gDQo+ID4gTXkg
Y3VycmVudCBwcm9ibGVtIGlzIHRoZSBmYWN0IHRoYXQgdGhlIHVhcnQwIGludGVycnVwdCBpcyBz
aGFyZWQgd2l0aA0KPiA+IHRoZSBDaGlwIENvbW1vbiBBIGdwaW8gYmxvY2suIFdoZW4gSSBoYXZl
IGFuZCBpbnRlcnJ1cHQgbm9kZSBvbiB0aGUNCj4gPiBncGlvIGluIHRoZSBkZXZpY2UgdHJlZSBJ
IGdldCBhbiBpbml0IGV4aXQgYXQgc3RhcnR1cC4gSWYgSSByZW1vdmUgdGhlDQo+ID4gaW50ZXJy
dXB0IG5vZGUgdGhlIHN5c3RlbSB3aWxsIGJvb3QgKGV4Y2VwdCBJIGRvbid0IGdldCBjYXNjYWRl
ZA0KPiA+IGludGVycnVwdHMgZnJvbSB0aGUgR1BJT3MpLg0KPiA+IA0KPiA+IExvb2tpbmcgYXQg
dGhlIHBpbmN0cmwtbnNwLWdwaW8uYyBpdCBsb29rcyBhcyB0aG91Z2ggSSBtaWdodCBiZSBhYmxl
IHRvDQo+ID4gbWFrZSB0aGlzIHdvcmsgaWYgSSBjYW4gY29udmluY2UgdGhlIGdwaW8gY29kZSB0
byByZXR1cm4gSVJRX0hBTkRMRUQgb3INCj4gPiBJUlFfTk9ORSBidXQgSSdtIHN0cnVnZ2xpbmcg
YWdhaW5zdCB0aGUgZmFjdCB0aGF0IHRoZSBwaW5jdHJsLWlwcm9jLQ0KPiA+IGdwaW8uYyBkZWZl
cnMgaXQncyBpbnRlcnJ1cHQgaGFuZGluZyB0byB0aGUgZ3BpbyBjb3JlLg0KPiANCj4gTm90IHN1
cmUgSSBmb2xsb3cgeW91IGhlcmUsIHdoYXQgcGFydCBpcyBiZWluZyBoYW5kZWQgdG8gZ3Bpb2xp
Yj8gVGhlDQo+IHRvcCBpbnRlcnJ1cHQgaGFuZGxlciB1bmRlciBuc3BfZ3Bpb19pcnFfaGFuZGxl
cigpIHdpbGwgdHJ5IHRvIGRvDQo+IGV4YWN0bHkgYXMgeW91IGRlc2NyaWJlZC4gSW4gZmFjdCwg
dGhlcmUgYXJlIG90aGVyIGlQcm9jIGRlc2lnbnMgd2hlcmUNCj4gImdwaW8tYSIgYW5kIGFub3Ro
ZXIgaW50ZXJydXB0LCBhcmNoL2FybS9ib290L2R0cy9iY20tbnNwLmR0c2kgaXMgb25lDQo+IHN1
Y2ggZXhhbXBsZSBhbmQgSSBuZXZlciBoYWQgcHJvYmxlbXMgd2l0aCB0aGF0IHBhcnQgb2YgTlNQ
Lg0KPiANCg0KbnNwX2dwaW9fcHJvYmUoKSBjcmVhdGVzIHRoZSBpcnEgZG9tYWluIGRpcmVjdGx5
IGFuZA0KbnNwX2dwaW9faXJxX2hhbmRsZXIoKSBkaXJlY3RseSBkZWFscyB3aXRoIHNoYXJpbmcg
YnkgcmV0dXJuaW5nDQpJUlFfSEFORExFRCBvciBJUlFfTk9ORSBkZXBlbmRpbmcgb24gd2hldGhl
ciBpdCBoYXMgYSBiaXQgc2V0Lg0KDQppcHJvY19ncGlvX3Byb2JlKCkgb24gdGhlIHNldHMgaXBy
b2NfZ3Bpb19pcnFfaGFuZGxlcigpIGFzIHRoZQ0KcGFyZW50X2hhbmRsZXIgYW5kIGRlZmVycyB0
byBncGlvbGliIHRvIGRlYWwgd2l0aCB0aGUgaXJxIGRvbWFpbiBldGMuDQoNCkknbSBjdXJyZW50
bHkgYXNzdW1pbmcgdGhpcyBpcyB3aHkgSSBjYW4ndCBoYXZlIHVhcnQwIGFuZCBncGlvDQppbnRl
cnJ1cHRzLiBCdXQgb2YgY291cnNlIEkgY291bGQgYmUgY29tcGxldGVseSB3cm9uZy4NCg0KPiA+
IA0KPiA+IElzIHRoZXJlIGFueSB3YXkgSSBjYW4gZ2V0IHRoZSBncGlvIGNvcmUgdG8gZGVhbCB3
aXRoIHRoZSBzaGFyZWQNCj4gPiBpbnRlcnJ1cHQ/DQo=
