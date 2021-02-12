Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99154319CCA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 11:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhBLKny (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 05:43:54 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3440 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhBLKnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 05:43:17 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DcVQZ3wQBz5RMf;
        Fri, 12 Feb 2021 18:40:54 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 12 Feb 2021 18:42:19 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 12 Feb 2021 18:42:20 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Fri, 12 Feb 2021 18:42:20 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Arnd Bergmann <arnd@kernel.org>
CC:     luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Topic: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Index: AQHXASPSlQt84o9SE0i+o14ylEf4e6pTywWAgACGpJA=
Date:   Fri, 12 Feb 2021 10:42:19 +0000
Message-ID: <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
 <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
In-Reply-To: <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.31]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3J5Z29yaWkgU3RyYXNo
a28gW21haWx0bzpncnlnb3JpaS5zdHJhc2hrb0B0aS5jb21dDQo+IFNlbnQ6IEZyaWRheSwgRmVi
cnVhcnkgMTIsIDIwMjEgMTE6MjggUE0NCj4gVG86IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVs
Lm9yZz47IFNvbmcgQmFvIEh1YSAoQmFycnkgU29uZykNCj4gPHNvbmcuYmFvLmh1YUBoaXNpbGlj
b24uY29tPg0KPiBDYzogbHVvamlheGluZyA8bHVvamlheGluZ0BodWF3ZWkuY29tPjsgTGludXMg
V2FsbGVpag0KPiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgQW5keSBTaGV2Y2hlbmtvIDxh
bmR5LnNoZXZjaGVua29AZ21haWwuY29tPjsgQW5keQ0KPiBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+OyBTYW50b3NoIFNoaWxpbWthcg0KPiA8c3NhbnRvc2hA
a2VybmVsLm9yZz47IEtldmluIEhpbG1hbiA8a2hpbG1hbkBrZXJuZWwub3JnPjsgb3BlbiBsaXN0
OkdQSU8NCj4gU1VCU1lTVEVNIDxsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4YXJtQG9wZW5ldWxlci5vcmcNCj4gU3ViamVj
dDogUmU6IFtMaW51eGFybV0gUmU6IFtQQVRDSCBmb3IgbmV4dCB2MSAxLzJdIGdwaW86IG9tYXA6
IFJlcGxhY2UNCj4gcmF3X3NwaW5fbG9ja19pcnFzYXZlIHdpdGggcmF3X3NwaW5fbG9jayBpbiBv
bWFwX2dwaW9faXJxX2hhbmRsZXIoKQ0KPiANCj4gSGkgQXJuZCwNCj4gDQo+IE9uIDEyLzAyLzIw
MjEgMTE6NDUsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+ID4gT24gRnJpLCBGZWIgMTIsIDIwMjEg
YXQgNjowNSBBTSBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpDQo+ID4gPHNvbmcuYmFvLmh1YUBo
aXNpbGljb24uY29tPiB3cm90ZToNCj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4NCj4gPj4+DQo+ID4+PiBOb3RlLiB0aGVyZSBpcyBhbHNvIGdlbmVyaWNfaGFuZGxlX2lycSgp
IGNhbGwgaW5zaWRlLg0KPiA+Pg0KPiA+PiBTbyBnZW5lcmljX2hhbmRsZV9pcnEoKSBpcyBub3Qg
c2FmZSB0byBydW4gaW4gdGhyZWFkIHRodXMgcmVxdWlyZXMNCj4gPj4gYW4gaW50ZXJydXB0LWRp
c2FibGVkIGVudmlyb25tZW50IHRvIHJ1bj8gSWYgc28sIEknZCByYXRoZXIgdGhpcw0KPiA+PiBp
cnFzYXZlIG1vdmVkIGludG8gZ2VuZXJpY19oYW5kbGVfaXJxKCkgcmF0aGVyIHRoYW4gYXNraW5n
IGV2ZXJ5b25lDQo+ID4+IGNhbGxpbmcgaXQgdG8gZG8gaXJxc2F2ZS4NCj4gPg0KPiA+IEluIGEg
cHJlZW1wdC1ydCBrZXJuZWwsIGludGVycnVwdHMgYXJlIHJ1biBpbiB0YXNrIGNvbnRleHQsIHNv
IHRoZXkgY2xlYXJseQ0KPiA+IHNob3VsZCBub3QgYmUgY2FsbGVkIHdpdGggaW50ZXJydXB0cyBk
aXNhYmxlZCwgdGhhdCB3b3VsZCBkZWZlYXQgdGhlDQo+ID4gcHVycG9zZSBvZiBtYWtpbmcgdGhl
bSBwcmVlbXB0aWJsZS4NCj4gPg0KPiA+IGdlbmVyaWNfaGFuZGxlX2lycSgpIGRvZXMgbmVlZCB0
byBydW4gd2l0aCBpbl9pcnEoKT09dHJ1ZSB0aG91Z2gsDQo+ID4gYnV0IHRoaXMgc2hvdWxkIGJl
IHNldCBieSB0aGUgY2FsbGVyIG9mIHRoZSBncGlvY2hpcCdzIGhhbmRsZXIsIGFuZA0KPiA+IGl0
IGlzIG5vdCBzZXQgYnkgcmF3X3NwaW5fbG9ja19pcnFzYXZlKCkuDQo+IA0KPiBJdCB3aWxsIHBy
b2R1Y2Ugd2FybmluZyBmcm9tIF9faGFuZGxlX2lycV9ldmVudF9wZXJjcHUoKSwgYXMgdGhpcyBp
cyBJUlENCj4gZGlzcGF0Y2hlcg0KPiBhbmQgZ2VuZXJpY19oYW5kbGVfaXJxKCkgd2lsbCBjYWxs
IG9uZSBvZiBoYW5kbGVfbGV2ZWxfaXJxIG9yIGhhbmRsZV9lZGdlX2lycS4NCj4gDQo+IFRoZSBo
aXN0b3J5IGJlaGluZCB0aGlzIGlzIGNvbW1pdCA0NTBmYTU0Y2ZkNjYgKCJncGlvOiBvbWFwOiBj
b252ZXJ0IHRvIHVzZQ0KPiBnZW5lcmljIGlycSBoYW5kbGVyIikuDQo+IA0KPiBUaGUgcmVzZW50
IHJlbGF0ZWQgZGlzY3Vzc2lvbjoNCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvMTIvNS8y
MDgNCg0KT2ssIHNlY29uZCB0aG91Z2h0LiBpcnFzYXZlIGJlZm9yZSBnZW5lcmljX2hhbmRsZV9p
cnEoKSB3b24ndCBkZWZlYXQNCnRoZSBwdXJwb3NlIG9mIHByZWVtcHRpb24gdG9vIG11Y2ggYXMg
dGhlIGRpc3BhdGNoZWQgaXJxIGhhbmRsZXJzIGJ5DQpncGlvY2hpcCB3aWxsIHJ1biBpbiB0aGVp
ciBvd24gdGhyZWFkcyBidXQgbm90IGluIHRoZSB0aHJlYWQgb2YNCmdwaW9jaGlwJ3MgaGFuZGxl
ci4NCg0Kc28gbG9va3MgbGlrZSB0aGlzIHBhdGNoIGNhbiBpbXByb3ZlIGJ5Og0KKiBtb3ZlIG90
aGVyIHJhd19zcGluX2xvY2tfaXJxc2F2ZSB0byByYXdfc3Bpbl9sb2NrOw0KKiBrZWVwIHRoZSBy
YXdfc3Bpbl9sb2NrX2lycXNhdmUgYmVmb3JlIGdlbmVyaWNfaGFuZGxlX2lycSgpIHRvIG11dGUN
CnRoZSB3YXJuaW5nIGluIGdlbmlycS4NCg0KPiANCj4gDQo+IA0KPiAtLQ0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEdyeWdvcmlpDQoNClRoYW5rcw0KQmFycnkNCg0K
