Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E18C935B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 23:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbfJBVPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 17:15:53 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:55352 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729431AbfJBVPx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 17:15:53 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 126C4891AA;
        Thu,  3 Oct 2019 10:15:50 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570050950;
        bh=25Xmkl5cio0Zp4+K/8QH29O5rjUHD24kwL+T+bPzVZQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=HDhuKx5GinYfi8fD+VkNKJePuxXIbTmU/zeVzIswJVMgaEWwvh0mYq3y8Emf7sxra
         Qy/8/VXFlzK6EXzgx/AbIACWGnvwbloDsO0JSD2AX+d7LklILJQ0/gGY3f0ajtVLv9
         V28yB1Q1cDGnoVL3f5BJn8zkoPkkThky1gnl2/MLN+J1awuuqLWV05RazaEUiOZehi
         J5P6jdlXbAeqvn9msQnpXoWLb566p9VKwlw9WA0JCYyI4ChXhXAE+zhHm5VeMwlQEf
         Oz+ZpcsAQ+qhV9Dr7gybFC6bSIB/PVQhDZEDea8tQWxs2ubuB+Z9xO1/viyRZVmXLZ
         eHOm6/+iJ0BEw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d9513860001>; Thu, 03 Oct 2019 10:15:50 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Thu, 3 Oct 2019 10:15:49 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Thu, 3 Oct 2019 10:15:49 +1300
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
Thread-Index: AQHVeAChr1G1lS1DPESIPAb5KujH5KdEPSUAgAAC1QCAAsM3gA==
Date:   Wed, 2 Oct 2019 21:15:49 +0000
Message-ID: <e2e887ae92b61b01eda02b53522b6b07935042ea.camel@alliedtelesis.co.nz>
References: <32c3d1dfe61a656e3250438d887e5ba91bd880d0.camel@alliedtelesis.co.nz>
         <d72a965a-e4e1-ba5d-cd62-b31939e75e44@gmail.com>
         <f3a243b1f22cf29075467d236610dbd2e7a20e55.camel@alliedtelesis.co.nz>
In-Reply-To: <f3a243b1f22cf29075467d236610dbd2e7a20e55.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:2007:5b4f:51fc:6cd1]
Content-Type: text/plain; charset="utf-8"
Content-ID: <180ABB796D214C49B0635D214E52E607@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDE5LTEwLTAxIGF0IDE2OjA0ICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBIaSBGbG9yaWFuLA0KPiANCj4gT24gTW9uLCAyMDE5LTA5LTMwIGF0IDE5OjU0IC0wNzAwLCBG
bG9yaWFuIEZhaW5lbGxpIHdyb3RlOg0KPiA+IA0KPiA+IE9uIDkvMzAvMjAxOSA3OjMzIFBNLCBD
aHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+ID4gSGksDQo+ID4gPiANCj4gPiA+IFdlIGhhdmUgYSBw
bGF0Zm9ybSB1c2luZyB0aGUgQkNNNTMzNDQgaW50ZWdyYXRlZCBzd2l0Y2gvQ1BVLiBUaGlzIGlz
DQo+ID4gPiBwYXJ0IG9mIHRoZSBIdXJyaWNhbmUgMiAodGVjaG5pY2FsbHkgV29sZmhvdW5kKSBm
YW1pbHkgb2YgZGV2aWNlcy4NCj4gPiA+IA0KPiA+ID4gQ3VycmVudGx5IHdlJ3JlIHVzaW5nIHBp
ZWNlcyBvZiBCcm9hZGNvbSdzICJpUHJvYyIgU0RLIGJhc2VkIG9uIGFuIG91dA0KPiA+ID4gb2Yg
ZGF0ZSBrZXJuZWwgYW5kIHdlJ2QgdmVyeSBtdWNoIGxpa2UgdG8gYmUgcnVubmluZyBhcyBjbG9z
ZSB0bw0KPiA+ID4gdXBzdHJlYW0gYXMgcG9zc2libGUuIFRoZSBmYWN0IHRoYXQgdGhlIFViaXF1
aXRpIFVuaUZpIFN3aXRjaCA4IGlzDQo+ID4gPiB1cHN0cmVhbSBnaXZlcyBtZSBzb21lIGhvcGUu
DQo+ID4gDQo+ID4gRllJLCBJIGNvdWxkIG5vdCBnZXQgZW5vdWdoIGluZm9ybWF0aW9uIGZyb20g
dGhlIGlQcm9jIFNESyB0byBwb3J0IChvcg0KPiA+IG5vdCkgdGhlIGNsb2NrIGRyaXZlciwgc28g
aWYgbm90aGluZyBlbHNlLCB0aGF0IGlzIGFuIGFyZWEgdGhhdCBtYXkNCj4gPiByZXF1aXJlIGlt
bWVkaWF0ZSB3b3JrICh0aG91Z2ggc29tZXRpbWVzIGZpeGVkLWNsb2NrcyB3b3VsZCBkbyBqdXN0
IGZpbmUpLg0KPiANCj4gU2V0dGluZyBhIGZpeGVkIGNsb2NrIHNlZW1zIHRvIHdvcmsgZm9yIG1l
LiBBdCBsZWFzdCBmb3Igbm93Lg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gTXkgY3VycmVudCBw
cm9ibGVtIGlzIHRoZSBmYWN0IHRoYXQgdGhlIHVhcnQwIGludGVycnVwdCBpcyBzaGFyZWQgd2l0
aA0KPiA+ID4gdGhlIENoaXAgQ29tbW9uIEEgZ3BpbyBibG9jay4gV2hlbiBJIGhhdmUgYW5kIGlu
dGVycnVwdCBub2RlIG9uIHRoZQ0KPiA+ID4gZ3BpbyBpbiB0aGUgZGV2aWNlIHRyZWUgSSBnZXQg
YW4gaW5pdCBleGl0IGF0IHN0YXJ0dXAuIElmIEkgcmVtb3ZlIHRoZQ0KPiA+ID4gaW50ZXJydXB0
IG5vZGUgdGhlIHN5c3RlbSB3aWxsIGJvb3QgKGV4Y2VwdCBJIGRvbid0IGdldCBjYXNjYWRlZA0K
PiA+ID4gaW50ZXJydXB0cyBmcm9tIHRoZSBHUElPcykuDQo+ID4gPiANCj4gPiA+IExvb2tpbmcg
YXQgdGhlIHBpbmN0cmwtbnNwLWdwaW8uYyBpdCBsb29rcyBhcyB0aG91Z2ggSSBtaWdodCBiZSBh
YmxlIHRvDQo+ID4gPiBtYWtlIHRoaXMgd29yayBpZiBJIGNhbiBjb252aW5jZSB0aGUgZ3BpbyBj
b2RlIHRvIHJldHVybiBJUlFfSEFORExFRCBvcg0KPiA+ID4gSVJRX05PTkUgYnV0IEknbSBzdHJ1
Z2dsaW5nIGFnYWluc3QgdGhlIGZhY3QgdGhhdCB0aGUgcGluY3RybC1pcHJvYy0NCj4gPiA+IGdw
aW8uYyBkZWZlcnMgaXQncyBpbnRlcnJ1cHQgaGFuZGluZyB0byB0aGUgZ3BpbyBjb3JlLg0KPiA+
IA0KPiA+IE5vdCBzdXJlIEkgZm9sbG93IHlvdSBoZXJlLCB3aGF0IHBhcnQgaXMgYmVpbmcgaGFu
ZGVkIHRvIGdwaW9saWI/IFRoZQ0KPiA+IHRvcCBpbnRlcnJ1cHQgaGFuZGxlciB1bmRlciBuc3Bf
Z3Bpb19pcnFfaGFuZGxlcigpIHdpbGwgdHJ5IHRvIGRvDQo+ID4gZXhhY3RseSBhcyB5b3UgZGVz
Y3JpYmVkLiBJbiBmYWN0LCB0aGVyZSBhcmUgb3RoZXIgaVByb2MgZGVzaWducyB3aGVyZQ0KPiA+
ICJncGlvLWEiIGFuZCBhbm90aGVyIGludGVycnVwdCwgYXJjaC9hcm0vYm9vdC9kdHMvYmNtLW5z
cC5kdHNpIGlzIG9uZQ0KPiA+IHN1Y2ggZXhhbXBsZSBhbmQgSSBuZXZlciBoYWQgcHJvYmxlbXMg
d2l0aCB0aGF0IHBhcnQgb2YgTlNQLg0KPiA+IA0KPiANCj4gbnNwX2dwaW9fcHJvYmUoKSBjcmVh
dGVzIHRoZSBpcnEgZG9tYWluIGRpcmVjdGx5IGFuZA0KPiBuc3BfZ3Bpb19pcnFfaGFuZGxlcigp
IGRpcmVjdGx5IGRlYWxzIHdpdGggc2hhcmluZyBieSByZXR1cm5pbmcNCj4gSVJRX0hBTkRMRUQg
b3IgSVJRX05PTkUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQgaGFzIGEgYml0IHNldC4NCj4gDQo+
IGlwcm9jX2dwaW9fcHJvYmUoKSBvbiB0aGUgc2V0cyBpcHJvY19ncGlvX2lycV9oYW5kbGVyKCkg
YXMgdGhlDQo+IHBhcmVudF9oYW5kbGVyIGFuZCBkZWZlcnMgdG8gZ3Bpb2xpYiB0byBkZWFsIHdp
dGggdGhlIGlycSBkb21haW4gZXRjLg0KPiANCj4gSSdtIGN1cnJlbnRseSBhc3N1bWluZyB0aGlz
IGlzIHdoeSBJIGNhbid0IGhhdmUgdWFydDAgYW5kIGdwaW8NCj4gaW50ZXJydXB0cy4gQnV0IG9m
IGNvdXJzZSBJIGNvdWxkIGJlIGNvbXBsZXRlbHkgd3JvbmcuDQo+IA0KPiA+ID4gDQo+ID4gPiBJ
cyB0aGVyZSBhbnkgd2F5IEkgY2FuIGdldCB0aGUgZ3BpbyBjb3JlIHRvIGRlYWwgd2l0aCB0aGUg
c2hhcmVkDQo+ID4gPiBpbnRlcnJ1cHQ/DQoNCkkgdGhpbmsgYXQgbGVhc3QgcGFydCBvZiBteSBw
cm9ibGVtIGlzIHRoYXQgdGhlIGlQcm9jIENoaXBDb21tb25CDQpyZWdpc3RlciBsYXlvdXQgaXMg
ZGlmZmVyZW50IHRvIHRoZSBpUHJvYyBDaGlwQ29tbW9uQS4gSXQncyBjbG9zZXIgdG8NCnRoZSBO
b3J0aFN0YXIgUGx1cyBidXQgc3RpbGwgZGlmZmVyZW50IGxheW91dC4gSSB0aGluayBJJ2xsIG5l
ZWQgdG8NCndyaXRlIGEgbmV3IGRyaXZlciByYXRoZXIgdGhhbiB0cnlpbmcgdG8gZ2V0IHBpbmN0
cmwtbnNwLWdwaW8uYyBvcg0KcGluY3RybC1pcHJvYy1ncGlvLmMgdG8gd29yay4NCg0K
