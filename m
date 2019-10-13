Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB00D5831
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2019 23:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbfJMVCj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Oct 2019 17:02:39 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:41748 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbfJMVCj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Oct 2019 17:02:39 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F0458886BF;
        Mon, 14 Oct 2019 10:02:35 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571000555;
        bh=aTyDQx9xSa+g9n9I5ovNf7kTdG/X4cEbtfakvmWPRvI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=QCY1k3xnbMrq6iEXOGpaStm2wCIvQqooEyXNcbgzawxjRzR/+nZWoW1EVug6Sak81
         +p/IH3cOJa3lDdAbSo+ZIvDMYC2ZAQIcWHmmXyKmGkjFsEJQEEGpRCZArVKsyisa9k
         SoxiEfspKPsK0r6/uYIINh1fsoVNYl+55wxzGfYUdoJdJYAW5b8Z13AvQF+vmyzF/8
         FYCHkcTrWt2tTP6C2RdafXAZyq3vjuoZqcHYvnQ8gXFg8T9gxQ8Sdx8X2i/lE6Ot6p
         1YpLWs0gw+wHCnaQKDrstc4YY3Mu2vqUDDDdkHHQrGEaTlcvTxyXjjnn6vYP5VhPNZ
         pALbp6svuulAw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5da390eb0001>; Mon, 14 Oct 2019 10:02:35 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Mon, 14 Oct 2019 10:02:35 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Mon, 14 Oct 2019 10:02:35 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "maz@kernel.org" <maz@kernel.org>,
        "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "rayagonda.kokatanur@broadcom.com" <rayagonda.kokatanur@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "li.jin@broadcom.com" <li.jin@broadcom.com>
Subject: Re: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
Thread-Topic: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
Thread-Index: AQHVeX3zc8UV+9y5lE6TCaRj1KlYYqdN9V8AgAAMPQCAAJXSAIAJrrkA
Date:   Sun, 13 Oct 2019 21:02:34 +0000
Message-ID: <1f29cade7a0405c33b8e76ea6a21939f6116371a.camel@alliedtelesis.co.nz>
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
         <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
         <CAMuHMdV7syxxtnHEcgFBrf5DLo-M_71tZFWHHQ6kTO=2A1eVhg@mail.gmail.com>
         <86blutdlap.wl-maz@kernel.org>
         <44510e8c-4e9b-603f-2c26-19db9121d68c@broadcom.com>
In-Reply-To: <44510e8c-4e9b-603f-2c26-19db9121d68c@broadcom.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:94ca:f8ed:f039:abe3]
Content-Type: text/plain; charset="utf-8"
Content-ID: <51B1B091E91BEC42B9FC58CC7D24ED0E@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXNXLCBTY290dCwgR2VlcnQsIE1hcmNaLA0KDQpPbiBNb24sIDIwMTktMTAtMDcgYXQg
MTA6MTAgLTA3MDAsIFNjb3R0IEJyYW5kZW4gd3JvdGU6DQo+IA0KPiBPbiAyMDE5LTEwLTA3IDE6
MTQgYS5tLiwgTWFyYyBaeW5naWVyIHdyb3RlOg0KPiA+IE9uIE1vbiwgMDcgT2N0IDIwMTkgMDg6
MzA6NTAgKzAxMDAsDQo+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4gd3JvdGU6DQo+ID4gPiBIaSBDaHJpcywNCj4gPiA+IA0KPiA+ID4gQ0MgTWFyY1oNCj4gPiA+
IA0KPiA+ID4gT24gVGh1LCBPY3QgMywgMjAxOSBhdCAyOjAzIEFNIENocmlzIFBhY2toYW0NCj4g
PiA+IDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdyb3RlOg0KPiA+ID4gPiBV
c2UgdGhlIGRldl9uYW1lKGRldikgZm9yIHRoZSBpcnFjLT5uYW1lIHNvIHRoYXQgd2UgZ2V0IHVu
aXF1ZSBuYW1lcw0KPiA+ID4gPiB3aGVuIHdlIGhhdmUgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIHRo
aXMgZHJpdmVyLg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hh
bSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiA+ID4gDQo+ID4gPiBBIHdo
aWxlIGFnbywgTWFyYyBaeW5naWVyIHBvaW50ZWQgb3V0IHRoYXQgdGhlIGlycV9jaGlwIC5uYW1l
IGZpZWxkDQo+ID4gPiBzaG91bGQgY29udGFpbiB0aGUgZGV2aWNlJ3MgY2xhc3MgbmFtZSwgbm90
IHRoZSBpbnN0YW5jZSdzIG5hbWUuDQo+ID4gPiBIZW5jZSB0aGUgY3VycmVudCBjb2RlIGlzIGNv
cnJlY3Q/DQo+ID4gDQo+ID4gVGhhbmtzIEdlZXJ0IGZvciBsb29waW5nIG1lIGluLiBUaGUgbWFp
biByZWFzb25zIHdoeSBJIG9wcG9zZSB0aGlzDQo+ID4ga2luZCBvZiAibGV0J3Mgc2hvdyBhcyBt
dWNoIGluZm9ybWF0aW9uIGFzIHdlIGNhbiBpbiAvcHJvYy9pbnRlcnJ1cHRzIg0KPiA+IGFyZToN
Cj4gPiANCj4gPiAtIEl0IGNsdXR0ZXJzIHRoZSBvdXRwdXQgYmFkbHk6IHRoZSBmb3JtYXR0aW5n
IG9mIHRoaXMgZmlsZSwgd2hpY2ggaXMNCj4gPiAgICBiYWQgZW5vdWdoIHdoZW4geW91IGhhdmUg
YSBzbWFsbCBudW1iZXIgb2YgQ1BVcywgYmVjb21lcyB1bnJlYWRhYmxlDQo+ID4gICAgd2hlbiB5
b3UgaGF2ZSBhIGxhcmdlIG51bWJlciBvZiB0aGVtICphbmQqIHN0dXBpZGx5IGxvbmcgc3RyaW5n
cw0KPiA+ICAgIHRoYXQgb25seSBtYWtlIHNlbnNlIG9uIGEgZ2l2ZW4gcGxhdGZvcm0uDQo+ID4g
DQo+ID4gLSBMaWtlIGl0IG9yIG5vdCwgL3Byb2MgaXMgQUJJLiBXZSBkb24ndCBjaGFuZ2UgdGhp
bmdzIHJhbmRvbWx5IHRoZXJlDQo+ID4gICAgd2l0aG91dCBhIGdvb2QgcmVhc29uLCBhbmQgZGVi
dWdnaW5nIGlzbid0IG9uZSBvZiB0aGVtLg0KPiA+IA0KPiA+IC0gRGVidWcgaW5mb3JtYXRpb24g
YmVsb25ncyB0byBkZWJ1Z2ZzLCB3aGVyZSB3ZSBhbHJlYWR5IGhhdmUgcGxlbnR5DQo+ID4gICAg
b2Ygc3R1ZmYgKHNlZSBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdGUykuIEknZCByYXRoZXIgd2Ug
aW1wcm92ZQ0KPiA+ICAgIHRoaXMgaW5mcmFzdHJ1Y3R1cmUgaWYgbmVlZGVkLCByYXRoZXIgdGhh
biBhZGQgcGxhdGZvcm0gc3BlY2lmaWMNCj4gPiAgICBoYWNrcy4NCj4gPiANCj4gPiA8L3JhbnQ+
DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+IAlNLg0KPiANCj4gVGhhbmtzIE1hcmMvR2Vl
cnQuICBTb3VuZHMgbGlrZSB3ZSBzaG91bGQgZHJvcCBwYXRjaCAyIGZyb20gc2VyaWVzLg0KDQpT
b3JyeSBmb3Igbm90IHJlc3BvbmRpbmcgZWFybGllciAoSSB3YXMgb24gdmFjYXRpb24gZm9yIGEg
d2VlaykuIEknbQ0KZmluZSB3aXRoIGRyb3BwaW5nIHRoaXMgcGF0Y2guDQoNCj4gPiANCj4gPiA+
IFNlZSBhbHNvICJbUEFUQ0ggMC80XSBpcnFjaGlwOiByZW5lc2FzOiBVc2UgcHJvcGVyIGlycV9j
aGlwIG5hbWUgYW5kIHBhcmVudCINCj4gPiA+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTkwNjA3MDk1ODU4LjEwMDI4LTEtZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUvKQ0KPiA+ID4g
Tm90ZSB0aGF0IHRoZSBpcnFjaGlwIHBhdGNoZXMgaW4gdGhhdCBzZXJpZXMgaGF2ZSBiZWVuIGFw
cGxpZWQ7IHRoZSBncGlvDQo+ID4gPiBwYXRjaGVzIGhhdmVuJ3QgYmVlbiBhcHBsaWVkIHlldC4N
Cj4gPiA+IA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvYmNtL3BpbmN0cmwtaXByb2Mt
Z3Bpby5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9iY20vcGluY3RybC1pcHJvYy1n
cGlvLmMNCj4gPiA+ID4gQEAgLTg1OCw3ICs4NTgsNyBAQCBzdGF0aWMgaW50IGlwcm9jX2dwaW9f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4gICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZ3Bpb19pcnFfY2hpcCAqZ2lycTsNCj4gPiA+ID4gDQo+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgaXJxYyA9ICZjaGlwLT5pcnFjaGlwOw0KPiA+ID4gPiAtICAgICAgICAgICAg
ICAgaXJxYy0+bmFtZSA9ICJiY20taXByb2MtZ3BpbyI7DQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICBpcnFjLT5uYW1lID0gZGV2X25hbWUoZGV2KTsNCj4gPiA+ID4gICAgICAgICAgICAgICAgICBp
cnFjLT5pcnFfYWNrID0gaXByb2NfZ3Bpb19pcnFfYWNrOw0KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgIGlycWMtPmlycV9tYXNrID0gaXByb2NfZ3Bpb19pcnFfbWFzazsNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgICBpcnFjLT5pcnFfdW5tYXNrID0gaXByb2NfZ3Bpb19pcnFfdW5tYXNrOw0KPiA+
ID4gDQo+ID4gPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gPiA+IA0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+ID4gPiANCj4gPiA+IC0tIA0KPiA+ID4gR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZw0KPiA+ID4gDQo+ID4gPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+ID4gPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0KPiA+ID4gDQo+IA0KPiANCg==
