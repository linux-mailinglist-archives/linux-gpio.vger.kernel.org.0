Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 071A9E7BA4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 22:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731966AbfJ1Voc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 17:44:32 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34990 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731497AbfJ1Voc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 17:44:32 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3C48D886BF;
        Tue, 29 Oct 2019 10:44:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1572299068;
        bh=DYOidqT5tUCFVfyUT2GRpqixTq+ntsgXpdtqwuOAk6k=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=1q2fHQy6amqf2xgJs26FyQkL6UTYuUaWyZ+T+FwsxzszVBd7XPgzBMxyDVLYrZb0P
         23n0/Nt5U+HpPSNTNRF0YWRT8quYDB06byPzP6FKkhDRjh2vYoOEXWBfRgST6Yaxat
         xShZO9FyV2UtSP9TiIWOjUJJhdoktAa9bM2schseZXWv5TNercrQ5hLNSW9kvrhcb6
         SAjU61jBtv/8M/QjnnV0atlkMJ1my9SvzmpoR9gLG7a+ltoBySl5YN6nWycER4ddnU
         FTNc9gY0I/TreSpiR8NZ7SVQbM76cdv1S5QTIu9ehLyE0YgRlU/Sy9jmGLw7jWhgh/
         ma4ZSEsxA1nmg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db7613d0000>; Tue, 29 Oct 2019 10:44:29 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Tue, 29 Oct 2019 10:44:25 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Tue, 29 Oct 2019 10:44:25 +1300
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
Thread-Index: AQHViujHZY98ZQ157ka0OeDhGPxOgadqws4AgAToBQCAABcnAA==
Date:   Mon, 28 Oct 2019 21:44:24 +0000
Message-ID: <b8ef1b3d154e104d943d22dcb07bff2756a82315.camel@alliedtelesis.co.nz>
References: <20191025040041.6210-1-chris.packham@alliedtelesis.co.nz>
         <20191025040041.6210-3-chris.packham@alliedtelesis.co.nz>
         <5d75b0ba-81c6-3d54-5bef-1127cd1c9998@gmail.com>
         <c8c9df8f252ed42c4ac7f3a10e52bfa5f5e31d50.camel@alliedtelesis.co.nz>
In-Reply-To: <c8c9df8f252ed42c4ac7f3a10e52bfa5f5e31d50.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:54a5:7b66:76cf:b046]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C26432F61A07B46A928981BB4283381@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gVHVlLCAyMDE5LTEwLTI5IGF0IDA5OjIxICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBPbiBGcmksIDIwMTktMTAtMjUgYXQgMTA6MjYgLTA3MDAsIEZsb3JpYW4gRmFpbmVsbGkgd3Jv
dGU6DQo+ID4gT24gMTAvMjQvMTkgOTowMCBQTSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4gPiA+
IFRoZSBwaW5jdHJsIG5vZGUgaXMgdXNlZCBieSB0aGUgZ3Bpb2Egbm9kZS4gV2hpY2ggbWF5IGhh
dmUgbW9yZQ0KPiA+ID4gZGVzY2VuZGFudHMgYXQgYSBib2FyZCBsZXZlbC4gSWYgdGhlIHBpbmN0
cmwgbm9kZSBpc24ndCBwcm9iZWQgZmlyc3QgdGhlDQo+ID4gPiBncGlvIGlzIGRlZmVycmVkIGFu
ZCBhbnl0aGluZyB0aGF0IG5lZWRzIGEgZ3BpbyBwaW4gb24gdGhhdCBjaGlwIGlzIGFsc28NCj4g
PiA+IGRlZmVycmVkLg0KPiA+IA0KPiA+IElmIHdoYXQgeW91IGNhcmUgaXMgdG8gb3B0aW1pemUg
eW91ciBib290IGZsb3cgc3VjaCB0aGF0IG5vIHJlLXByb2JpbmcNCj4gPiBvY2N1cnMsIG1heWJl
IGFub3RoZXIgc29sdXRpb24gdG8gbG9vayBhdCBpcyB0byByZS1vcmRlciB0aGUgb3JkZXIgaW4N
Cj4gPiB3aGljaCBzdWJzeXN0ZW1zIGFyZSBpbml0aWFsaXplZCBvciBidWlsdCAoX2luaXRjYWxs
IGNoYW5nZXMgb3INCj4gPiBkcml2ZXJzL01ha2VmaWxlIGNoYW5nZXMpLCBiZWNhdXNlIGNoYW5n
aW5nIERldmljZSBUcmVlIGNlcnRhaW5seSBkb2VzDQo+ID4gbm90IHNjYWxlIG92ZXIgcGxhdGZv
cm1zIGFuZCBJIHJlY2FsbCBSb2IgaW5kaWNhdGluZyB0aGF0IGhlIHdhbnRlZCB0bw0KPiA+IGlu
dHJvZHVjZSByYW5kb21pemVkIHBsYXRmb3JtX2RldmljZSBjcmVhdGlvbiBmcm9tDQo+ID4gb2Zf
cGxhdGZvcm1fYnVzX3BvcHVsYXRlKCkgYXQgb25lIHBvaW50IG9yIGFub3RoZXIuDQo+ID4gDQo+
IA0KPiBIbW0uIEkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcuIHBpbmN0cmwtbnNwLWdwaW8u
YyB1c2VzDQo+IGFyY2hfaW5pdGNhbGxfc3luYygpIGFuZCBwaW5jdHJsLW5zcC1tdXguYyB1c2Vz
IGFyY2hfaW5pdGNhbGwoKSBzbyBpbg0KPiB0aGVvcnkgdGhleSBhcmUgYWxyZWFkeSBpbiB0aGUg
cmlnaHQgb3JkZXIuDQo+IA0KDQpBY3R1YWxseSB0aGUgaW5pdCBjYWxscyBhcmUgbWFkZSBpbiB0
aGUgcmVxdWlyZWQgb3JkZXIgdy5yLnQgZWFjaA0Kb3RoZXIuIEJ1dCB0aGV5IGFyZSBib3RoIGJl
Zm9yZSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSwgc28gaXQncyBiYWNrIHRvDQp0aGUgZGV2aWNlIHRy
ZWUgYmVpbmcgdGhlIGRldGVybWluaW5nIGZhY3RvciBmb3Igd2hlbiB0aGUgcHJvYmUoKQ0KZnVu
Y3Rpb25zIGFyZSBydW4uDQoNCldpdGggdGhlIGN1cnJlbnQga2VybmVsIEkgZ2V0DQoNCm5zcF9w
aW5tdXhfaW5pdDoNCm5zcF9ncGlvX2luaXQ6DQpPRjogb2ZfcGxhdGZvcm1fcG9wdWxhdGU6DQpP
Rjogb2ZfcGxhdGZvcm1fYnVzX2NyZWF0ZTogL2F4aUAxODAwMDAwMC9ncGlvQDIwDQpuc3BfZ3Bp
b19wcm9iZToNCmdwaW9jaGlwX2FkZF9kYXRhX3dpdGhfa2V5OiBHUElPcyA0ODAuLjUxMSAoMTgw
MDAwMjAuZ3BpbykgZmFpbGVkIHRvDQpyZWdpc3RlciwgLTUxNw0KbnNwLWdwaW8tYSAxODAwMDAy
MC5ncGlvOiB1bmFibGUgdG8gYWRkIEdQSU8gY2hpcA0KT0Y6IG9mX3BsYXRmb3JtX2J1c19jcmVh
dGU6IC9heGlAMTgwMDAwMDAvcGluY3RybEAzZjFjMA0KbnNwX3Bpbm11eF9wcm9iZToNCi4uLiBt
dWNoIGxhdGVyIC4uLg0KbnNwX2dwaW9fcHJvYmU6DQoNCldvdWxkIGl0IGJlIGFjY2VwdGFibGUg
dG8gY2hhbmdlIHRoZSBpbml0IGNhbGxzIHRvIGRldmljZV9pbml0Y2FsbCgpDQphbmQgZGV2aWNl
X2luaXRjYWxsX3N5bmMoKT8gcGluY3RybC1uc3AtbXV4LmMgY291bGQgZXZlbiBiZSBjb252ZXJ0
ZWQNCnRvIChidWlsdGluXylwbGF0Zm9ybV9kcml2ZXIuDQoNCj4gPiA+IA0KPiA+ID4gTm9ybWFs
bHkgd2UgYW5kIG5vZGVzIGluIHRoZSBkZXZpY2UgdHJlZSB0byBiZSBsaXN0ZWQgaW4gdGhlaXIg
bmF0dXJhbA0KPiA+ID4gbWVtb3J5IG1hcHBlZCBhZGRyZXNzIG9yZGVyIGJ1dCBwdXR0aW5nIHRo
ZSBwaW5jdHJsIG5vZGUgZmlyc3QgYXZvaWRzDQo+ID4gPiB0aGUgZGVmZXJyYWwgb2YgbnVtZXJv
dXMgZGV2aWNlcyBzbyBtYWtlIGFuIGV4Y2VwdGlvbiBpbiB0aGlzIGNhc2UuDQo+ID4gDQo+ID4g
VGhhdCBpcyBhIHdvcmthcm91bmQgbW9yZSB0aGFuIGEgcmVhbCBzb2x1dGlvbiwgdGhvdWdoIEkg
dW5kZXJzdGFuZCB3aHkNCj4gPiB5b3Ugd291bGQgdG8gZG8gdGhhdC4gT25lIGRvd25zaWRlIGlz
IHRoYXQgdGhlIGVudHJpZXMgYXJlIG5vIGxvbmdlciBpbg0KPiA+IGluY3JlbWVudGluZyByZWdp
c3RlciBhZGRyZXNzIG9yZGVyIGFuZCB0aGF0IGlzIHZpc3VhbGx5IGRpc3R1cmJpbmcgYW5kDQo+
ID4gd2hvIGtub3dzLCBtYXliZSBhIGRyaXZlIGJ5IGNvbnRyaWJ1dG9yIHdob3NlIHBldCBwcm9q
ZWN0IHdpbGwgYmUgdG8NCj4gPiBvcmRlciB0aGUgRGV2aWNlIFRyZWUgZW50cmllcyBieSBpbmNy
ZW1lbnRpbmcgYWRkcmVzc2VzIHdpbGwgY2hhbmdlIHRoYXQNCj4gPiBpbiB0aGUgZnV0dXJlLi4u
DQo+ID4gDQo+IA0KPiBJIGd1ZXNzIHJlYWxseSB3aGF0J3MgbmVlZGVkIGlzIHNvbWV0aGluZyB0
aGF0IHVuZGVyc3RhbmRzIHBoYW5kbGVzIGFuZA0KPiB0cmllcyB0byBwcm9kdWNlIGEgZGVwZW5k
ZW5jeSB0cmVlIGJhc2VkIG9uIHRoYXQuDQo+IA0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+ID4g
PiAtLS0NCj4gPiA+ICBhcmNoL2FybS9ib290L2R0cy9iY20tbnNwLmR0c2kgfCAxNCArKysrKysr
LS0tLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9iY20t
bnNwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9iY20tbnNwLmR0c2kNCj4gPiA+IGluZGV4IGRh
NmQ3MGYwOWVmMS4uZGQ3YTY1NzQzYzA4IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvYmNtLW5zcC5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9iY20tbnNw
LmR0c2kNCj4gPiA+IEBAIC0xNzIsNiArMTcyLDEzIEBADQo+ID4gPiAgCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCj4gPiA+ICAJCSNzaXplLWNlbGxzID0gPDE+Ow0KPiA+ID4gIA0KPiA+ID4gKwkJ
cGluY3RybDogcGluY3RybEAzZjFjMCB7DQo+ID4gPiArCQkJY29tcGF0aWJsZSA9ICJicmNtLG5z
cC1waW5tdXgiOw0KPiA+ID4gKwkJCXJlZyA9IDwweDNmMWMwIDB4MDQ+LA0KPiA+ID4gKwkJCSAg
ICAgIDwweDMwMDI4IDB4MDQ+LA0KPiA+ID4gKwkJCSAgICAgIDwweDNmNDA4IDB4MDQ+Ow0KPiA+
ID4gKwkJfTsNCj4gPiA+ICsNCj4gPiA+ICAJCWdwaW9hOiBncGlvQDIwIHsNCj4gPiA+ICAJCQlj
b21wYXRpYmxlID0gImJyY20sbnNwLWdwaW8tYSI7DQo+ID4gPiAgCQkJcmVnID0gPDB4MDAyMCAw
eDcwPiwNCj4gPiA+IEBAIC00NTgsMTMgKzQ2NSw2IEBADQo+ID4gPiAgCQkJCQkgICAgICJzYXRh
MiI7DQo+ID4gPiAgCQl9Ow0KPiA+ID4gIA0KPiA+ID4gLQkJcGluY3RybDogcGluY3RybEAzZjFj
MCB7DQo+ID4gPiAtCQkJY29tcGF0aWJsZSA9ICJicmNtLG5zcC1waW5tdXgiOw0KPiA+ID4gLQkJ
CXJlZyA9IDwweDNmMWMwIDB4MDQ+LA0KPiA+ID4gLQkJCSAgICAgIDwweDMwMDI4IDB4MDQ+LA0K
PiA+ID4gLQkJCSAgICAgIDwweDNmNDA4IDB4MDQ+Ow0KPiA+ID4gLQkJfTsNCj4gPiA+IC0NCj4g
PiA+ICAJCXRoZXJtYWw6IHRoZXJtYWxAM2YyYzAgew0KPiA+ID4gIAkJCWNvbXBhdGlibGUgPSAi
YnJjbSxucy10aGVybWFsIjsNCj4gPiA+ICAJCQlyZWcgPSA8MHgzZjJjMCAweDEwPjsNCj4gPiA+
IA0KPiA+IA0KPiA+IA0K
