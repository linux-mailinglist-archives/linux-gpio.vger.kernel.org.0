Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39620319F9D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 14:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhBLNNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 08:13:49 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2837 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbhBLNN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 08:13:27 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DcYl16pWvz13lkg;
        Fri, 12 Feb 2021 21:10:21 +0800 (CST)
Received: from dggemi759-chm.china.huawei.com (10.1.198.145) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 12 Feb 2021 21:12:40 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi759-chm.china.huawei.com (10.1.198.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 12 Feb 2021 21:12:40 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Fri, 12 Feb 2021 21:12:40 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Arnd Bergmann <arnd@kernel.org>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Topic: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Index: AQHXASPSlQt84o9SE0i+o14ylEf4e6pTywWAgACGpJD//4GQAIAAiAmg//+HpICAAJikgA==
Date:   Fri, 12 Feb 2021 13:12:40 +0000
Message-ID: <014b2e0d2b134bfdbe629ab6146c6bb4@hisilicon.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
 <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
 <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
 <YCZfBMPwmzD2U/4c@smile.fi.intel.com>
 <c4a07bef5dd24fd2af0aa7fe4c78b903@hisilicon.com>
 <33720e72-a438-8ffe-1b5f-38756738ad9b@ti.com>
In-Reply-To: <33720e72-a438-8ffe-1b5f-38756738ad9b@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.43]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3J5Z29yaWkgU3RyYXNo
a28gW21haWx0bzpncnlnb3JpaS5zdHJhc2hrb0B0aS5jb21dDQo+IFNlbnQ6IFNhdHVyZGF5LCBG
ZWJydWFyeSAxMywgMjAyMSAxMjo1MyBBTQ0KPiBUbzogU29uZyBCYW8gSHVhIChCYXJyeSBTb25n
KSA8c29uZy5iYW8uaHVhQGhpc2lsaWNvbi5jb20+OyBBbmR5IFNoZXZjaGVua28NCj4gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5v
cmc+OyBsdW9qaWF4aW5nIDxsdW9qaWF4aW5nQGh1YXdlaS5jb20+OyBMaW51cw0KPiBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBTYW50b3NoIFNoaWxpbWthciA8c3NhbnRvc2hA
a2VybmVsLm9yZz47DQo+IEtldmluIEhpbG1hbiA8a2hpbG1hbkBrZXJuZWwub3JnPjsgb3BlbiBs
aXN0OkdQSU8gU1VCU1lTVEVNDQo+IDxsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZz47IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4YXJtQG9wZW5ldWxlci5vcmcNCj4gU3Vi
amVjdDogUmU6IFtMaW51eGFybV0gUmU6IFtQQVRDSCBmb3IgbmV4dCB2MSAxLzJdIGdwaW86IG9t
YXA6IFJlcGxhY2UNCj4gcmF3X3NwaW5fbG9ja19pcnFzYXZlIHdpdGggcmF3X3NwaW5fbG9jayBp
biBvbWFwX2dwaW9faXJxX2hhbmRsZXIoKQ0KPiANCj4gDQo+IA0KPiBPbiAxMi8wMi8yMDIxIDEz
OjI5LCBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIFttYWls
dG86YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbV0NCj4gPj4gU2VudDogRnJpZGF5LCBGZWJydWFy
eSAxMiwgMjAyMSAxMTo1NyBQTQ0KPiA+PiBUbzogU29uZyBCYW8gSHVhIChCYXJyeSBTb25nKSA8
c29uZy5iYW8uaHVhQGhpc2lsaWNvbi5jb20+DQo+ID4+IENjOiBHcnlnb3JpaSBTdHJhc2hrbyA8
Z3J5Z29yaWkuc3RyYXNoa29AdGkuY29tPjsgQXJuZCBCZXJnbWFubg0KPiA+PiA8YXJuZEBrZXJu
ZWwub3JnPjsgbHVvamlheGluZyA8bHVvamlheGluZ0BodWF3ZWkuY29tPjsgTGludXMgV2FsbGVp
ag0KPiA+PiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgU2FudG9zaCBTaGlsaW1rYXIgPHNz
YW50b3NoQGtlcm5lbC5vcmc+OyBLZXZpbg0KPiA+PiBIaWxtYW4gPGtoaWxtYW5Aa2VybmVsLm9y
Zz47IG9wZW4gbGlzdDpHUElPIFNVQlNZU1RFTQ0KPiA+PiA8bGludXgtZ3Bpb0B2Z2VyLmtlcm5l
bC5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBsaW51eGFybUBvcGVu
ZXVsZXIub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbTGludXhhcm1dIFJlOiBbUEFUQ0ggZm9yIG5l
eHQgdjEgMS8yXSBncGlvOiBvbWFwOiBSZXBsYWNlDQo+ID4+IHJhd19zcGluX2xvY2tfaXJxc2F2
ZSB3aXRoIHJhd19zcGluX2xvY2sgaW4gb21hcF9ncGlvX2lycV9oYW5kbGVyKCkNCj4gPj4NCj4g
Pj4gT24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMTA6NDI6MTlBTSArMDAwMCwgU29uZyBCYW8gSHVh
IChCYXJyeSBTb25nKSB3cm90ZToNCj4gPj4+PiBGcm9tOiBHcnlnb3JpaSBTdHJhc2hrbyBbbWFp
bHRvOmdyeWdvcmlpLnN0cmFzaGtvQHRpLmNvbV0NCj4gPj4+PiBTZW50OiBGcmlkYXksIEZlYnJ1
YXJ5IDEyLCAyMDIxIDExOjI4IFBNDQo+ID4+Pj4gT24gMTIvMDIvMjAyMSAxMTo0NSwgQXJuZCBC
ZXJnbWFubiB3cm90ZToNCj4gPj4+Pj4gT24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgNjowNSBBTSBT
b25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpDQo+ID4+Pj4+IDxzb25nLmJhby5odWFAaGlzaWxpY29u
LmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+Pj4+Pj4gTm90ZS4gdGhlcmUgaXMgYWxzbyBnZW5lcmlj
X2hhbmRsZV9pcnEoKSBjYWxsIGluc2lkZS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBTbyBnZW5lcmlj
X2hhbmRsZV9pcnEoKSBpcyBub3Qgc2FmZSB0byBydW4gaW4gdGhyZWFkIHRodXMgcmVxdWlyZXMN
Cj4gPj4+Pj4+IGFuIGludGVycnVwdC1kaXNhYmxlZCBlbnZpcm9ubWVudCB0byBydW4/IElmIHNv
LCBJJ2QgcmF0aGVyIHRoaXMNCj4gPj4+Pj4+IGlycXNhdmUgbW92ZWQgaW50byBnZW5lcmljX2hh
bmRsZV9pcnEoKSByYXRoZXIgdGhhbiBhc2tpbmcgZXZlcnlvbmUNCj4gPj4+Pj4+IGNhbGxpbmcg
aXQgdG8gZG8gaXJxc2F2ZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gSW4gYSBwcmVlbXB0LXJ0IGtlcm5l
bCwgaW50ZXJydXB0cyBhcmUgcnVuIGluIHRhc2sgY29udGV4dCwgc28gdGhleSBjbGVhcmx5DQo+
ID4+Pj4+IHNob3VsZCBub3QgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCwgdGhh
dCB3b3VsZCBkZWZlYXQgdGhlDQo+ID4+Pj4+IHB1cnBvc2Ugb2YgbWFraW5nIHRoZW0gcHJlZW1w
dGlibGUuDQo+ID4+Pj4+DQo+ID4+Pj4+IGdlbmVyaWNfaGFuZGxlX2lycSgpIGRvZXMgbmVlZCB0
byBydW4gd2l0aCBpbl9pcnEoKT09dHJ1ZSB0aG91Z2gsDQo+ID4+Pj4+IGJ1dCB0aGlzIHNob3Vs
ZCBiZSBzZXQgYnkgdGhlIGNhbGxlciBvZiB0aGUgZ3Bpb2NoaXAncyBoYW5kbGVyLCBhbmQNCj4g
Pj4+Pj4gaXQgaXMgbm90IHNldCBieSByYXdfc3Bpbl9sb2NrX2lycXNhdmUoKS4NCj4gPj4+Pg0K
PiA+Pj4+IEl0IHdpbGwgcHJvZHVjZSB3YXJuaW5nIGZyb20gX19oYW5kbGVfaXJxX2V2ZW50X3Bl
cmNwdSgpLCBhcyB0aGlzIGlzIElSUQ0KPiA+Pj4+IGRpc3BhdGNoZXINCj4gPj4+PiBhbmQgZ2Vu
ZXJpY19oYW5kbGVfaXJxKCkgd2lsbCBjYWxsIG9uZSBvZiBoYW5kbGVfbGV2ZWxfaXJxIG9yDQo+
ID4+IGhhbmRsZV9lZGdlX2lycS4NCj4gPj4+Pg0KPiA+Pj4+IFRoZSBoaXN0b3J5IGJlaGluZCB0
aGlzIGlzIGNvbW1pdCA0NTBmYTU0Y2ZkNjYgKCJncGlvOiBvbWFwOiBjb252ZXJ0IHRvDQo+ID4+
IHVzZQ0KPiA+Pj4+IGdlbmVyaWMgaXJxIGhhbmRsZXIiKS4NCj4gPj4+Pg0KPiA+Pj4+IFRoZSBy
ZXNlbnQgcmVsYXRlZCBkaXNjdXNzaW9uOg0KPiA+Pj4+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8y
MDIwLzEyLzUvMjA4DQo+ID4+Pg0KPiA+Pj4gT2ssIHNlY29uZCB0aG91Z2h0LiBpcnFzYXZlIGJl
Zm9yZSBnZW5lcmljX2hhbmRsZV9pcnEoKSB3b24ndCBkZWZlYXQNCj4gPj4+IHRoZSBwdXJwb3Nl
IG9mIHByZWVtcHRpb24gdG9vIG11Y2ggYXMgdGhlIGRpc3BhdGNoZWQgaXJxIGhhbmRsZXJzIGJ5
DQo+ID4+PiBncGlvY2hpcCB3aWxsIHJ1biBpbiB0aGVpciBvd24gdGhyZWFkcyBidXQgbm90IGlu
IHRoZSB0aHJlYWQgb2YNCj4gPj4+IGdwaW9jaGlwJ3MgaGFuZGxlci4NCj4gPj4+DQo+ID4+PiBz
byBsb29rcyBsaWtlIHRoaXMgcGF0Y2ggY2FuIGltcHJvdmUgYnk6DQo+ID4+PiAqIG1vdmUgb3Ro
ZXIgcmF3X3NwaW5fbG9ja19pcnFzYXZlIHRvIHJhd19zcGluX2xvY2s7DQo+ID4+PiAqIGtlZXAg
dGhlIHJhd19zcGluX2xvY2tfaXJxc2F2ZSBiZWZvcmUgZ2VuZXJpY19oYW5kbGVfaXJxKCkgdG8g
bXV0ZQ0KPiA+Pj4gdGhlIHdhcm5pbmcgaW4gZ2VuaXJxLg0KPiA+Pg0KPiA+PiBJc24ndCB0aGUg
aWRlYSBvZiBpcnFzYXZlIGlzIHRvIHByZXZlbnQgZGVhZCBsb2NrIGZyb20gdGhlIHByb2Nlc3Mg
Y29udGV4dA0KPiB3aGVuDQo+ID4+IHdlIGdldCBpbnRlcnJ1cHQgb24gdGhlICpzYW1lKiBDUFU/
DQo+ID4NCj4gPiBBbnl3YXksIGdwaW9jaGlwIGlzIG1vcmUgdHJpY2t5IGFzIGl0IGlzIGFsc28g
YSBpcnEgZGlzcGF0Y2hlci4gTW92aW5nDQo+ID4gc3Bpbl9sb2NrX2lycSB0byBzcGluX2xvY2sg
aW4gdGhlIGlycSBoYW5kbGVyIG9mIG5vbi1pcnEgZGlzcGF0Y2hlcg0KPiA+IGRyaXZlciBpcyBh
bG1vc3QgYWx3YXlzIGNvcnJlY3QuDQo+ID4NCj4gPiBCdXQgZm9yIGdwaW9jaGlwLCB3b3VsZCB0
aGUgYmVsb3cgYmUgdHJ1ZSB0aG91Z2ggaXQgaXMgYWxtb3N0IGFsd2F5IHRydWUNCj4gPiBmb3Ig
bm9uLWlycSBkaXNwYXRjaGVyPw0KPiA+DQo+ID4gMS4gV2hpbGUgZ3Bpb2NoaXAncyBoYW5kbGVy
IHJ1bnMgaW4gaGFyZElSUSwgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQsIHNvIG5vDQo+IG1vcmUN
Cj4gPiBpbnRlcnJ1cHQgb24gdGhlIHNhbWUgY3B1IC0+IE5vIGRlYWRsZWFrLg0KPiA+DQo+ID4g
Mi4gV2hpbGUgZ3Bpb2NoaXAncyBoYW5kbGVyIHJ1bnMgaW4gdGhyZWFkcw0KPiA+ICogb3RoZXIg
bm9uLXRocmVhZGVkIGludGVycnVwdHMgc3VjaCBhcyB0aW1lciB0aWNrIG1pZ2h0IGNvbWUgb24g
c2FtZSBjcHUsDQo+ID4gYnV0IHRoZXkgYXJlIGFuIGlycmVsZXZhbnQgZHJpdmVyIGFuZCB0aHVz
IHRoZXkgYXJlIG5vdCBnb2luZyB0byBnZXQgdGhlDQo+ID4gbG9jayBncGlvY2hpcCdzIGhhbmRs
ZXIgaGFzIGhlbGQuIC0+IG5vIGRlYWRsb2NrLg0KPiA+ICogb3RoZXIgZGV2aWNlcyBhdHRhY2hl
ZCB0byB0aGlzIGdwaW9jaGlwIG1pZ2h0IGdldCBpbnRlcnJ1cHRzLCBzaW5jZQ0KPiA+IGdwaW9j
aGlwJ3MgaGFuZGxlciBpcyBydW5uaW5nIGluIHRocmVhZHMsIHJhd19zcGluX2xvY2sgY2FuIGhl
bHAgYXZvaWQNCj4gPiBtZXNzaW5nIHVwIHRoZSBjcml0aWNhbCBkYXRhIGJ5IHR3byB0aHJlYWRz
IC0+IHN0aWxsIG5vIGRlYWRsb2NrLg0KPiANCj4gVGhlIHdvcnN0IFJUIGNhc2UgSSBjYW4gaW1h
Z2luZSBpcyB3aGVuIGdwaW8gQVBJIGlzIHN0aWxsIGNhbGxlZCBmcm9tIGhhcmQgSVJRDQo+IGNv
bnRleHQgYnkgc29tZQ0KPiBvdGhlciBkZXZpY2UgZHJpdmVyIC0gc29tZSB0b2dnbGluZyBmb3Ig
ZXhhbXBsZS4NCj4gTm90ZS4gUlQgb3IgInRocmVhZGlycXMiIGRvZXMgbm90IG1lYW4gZ3Bpb2No
aXAgYmVjb21lIHNsZWVwYWJsZS4NCj4gDQo+IEluIHRoaXMgY2FzZToNCj4gICB0aHJlYWRlZCBo
YW5kbGVyDQo+ICAgICByYXdfc3Bpbl9sb2NrDQo+IAlJUlEgZnJvbSBvdGhlciBkZXZpY2UNCj4g
ICAgICAgICAgICBoYXJkX2lycSBoYW5kbGVyDQo+ICAgICAgICAgICAgICBncGlvZF94KCkNCj4g
CQlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoKSAtLSBvb3BzDQoNCkFjdHVhbGx5IG5vIG9vcHMgaGVy
ZS4gb3RoZXIgZHJpdmVycyBkb24ndCBob2xkIHRoZSBzYW1lDQpzcGlubG9jayBvZiB0aGlzIGRy
aXZlci4NCg0KPiANCj4gQnV0IGluIGdlbmVyYWwsIHdoYXQgYXJlIHRoZSBiZW5lZml0IG9mIHN1
Y2ggY2hhbmdlcyBhdCBhbGwsIGV4Y2VwdCBiZXR0ZXIgbWFya2luZw0KPiBjYWxsIGNvbnRleHQg
YW5ub3RhdGlvbiwNCj4gc28gd2UgYXJlIHNwZW5kaW5nIHNvIG11Y2ggdGltZSBvbiBpdD8NCg0K
VEJILCB0aGUgYmVuZWZpdCBpcyByZWFsbHkgdGlueSBleGNlcHQgY29kZSBjbGVhbnVwLiBqdXN0
IGN1cmlvdXMgaG93IHRoaW5ncyBjb3VsZA0KYmUgZGlmZmVyZW50IHdoaWxlIGl0IGhhcHBlbnMg
aW4gYW4gaXJxIGRpc3BhdGNoZXIncyBoYW5kbGVyLg0KDQo+IA0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBHcnlnb3JpaQ0KDQpUaGFua3MNCkJhcnJ5DQoNCg==
