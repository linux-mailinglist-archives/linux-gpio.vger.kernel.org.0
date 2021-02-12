Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F3E31A638
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 21:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhBLUts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 15:49:48 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3442 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbhBLUtr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 15:49:47 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Dcltf1mVTz5Qm3;
        Sat, 13 Feb 2021 04:47:38 +0800 (CST)
Received: from dggemi709-chm.china.huawei.com (10.3.20.108) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Sat, 13 Feb 2021 04:49:04 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi709-chm.china.huawei.com (10.3.20.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Sat, 13 Feb 2021 04:49:04 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Sat, 13 Feb 2021 04:49:03 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Santosh Shilimkar" <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Topic: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Index: AQHXASPSlQt84o9SE0i+o14ylEf4e6pTywWAgACGpJD//4GQAIAAiAmg//+HpICAAI6IgIAAimfw
Date:   Fri, 12 Feb 2021 20:49:03 +0000
Message-ID: <a92d5e15724a4843887212d7e05c99f8@hisilicon.com>
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
 <CAK8P3a0JEhhw4vB=YgUJj5_ywds=sVuzPd4Zf0iiRwX4Mgsk3g@mail.gmail.com>
In-Reply-To: <CAK8P3a0JEhhw4vB=YgUJj5_ywds=sVuzPd4Zf0iiRwX4Mgsk3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.105]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuZCBCZXJnbWFubiBb
bWFpbHRvOmFybmRAa2VybmVsLm9yZ10NCj4gU2VudDogU2F0dXJkYXksIEZlYnJ1YXJ5IDEzLCAy
MDIxIDk6MjMgQU0NCj4gVG86IEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaS5zdHJhc2hrb0B0
aS5jb20+DQo+IENjOiBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpIDxzb25nLmJhby5odWFAaGlz
aWxpY29uLmNvbT47IEFuZHkgU2hldmNoZW5rbw0KPiA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNv
bT47IGx1b2ppYXhpbmcgPGx1b2ppYXhpbmdAaHVhd2VpLmNvbT47IExpbnVzDQo+IFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IFNhbnRvc2ggU2hpbGlta2FyIDxzc2FudG9zaEBr
ZXJuZWwub3JnPjsNCj4gS2V2aW4gSGlsbWFuIDxraGlsbWFuQGtlcm5lbC5vcmc+OyBvcGVuIGxp
c3Q6R1BJTyBTVUJTWVNURU0NCj4gPGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXhhcm1Ab3BlbmV1bGVyLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW0xpbnV4YXJtXSBSZTogW1BBVENIIGZvciBuZXh0IHYxIDEvMl0gZ3Bpbzogb21h
cDogUmVwbGFjZQ0KPiByYXdfc3Bpbl9sb2NrX2lycXNhdmUgd2l0aCByYXdfc3Bpbl9sb2NrIGlu
IG9tYXBfZ3Bpb19pcnFfaGFuZGxlcigpDQo+IA0KPiBPbiBGcmksIEZlYiAxMiwgMjAyMSBhdCAx
Mjo1MyBQTSBHcnlnb3JpaSBTdHJhc2hrbw0KPiA8Z3J5Z29yaWkuc3RyYXNoa29AdGkuY29tPiB3
cm90ZToNCj4gPg0KPiA+IFRoZSB3b3JzdCBSVCBjYXNlIEkgY2FuIGltYWdpbmUgaXMgd2hlbiBn
cGlvIEFQSSBpcyBzdGlsbCBjYWxsZWQgZnJvbSBoYXJkDQo+IElSUSBjb250ZXh0IGJ5IHNvbWUN
Cj4gPiBvdGhlciBkZXZpY2UgZHJpdmVyIC0gc29tZSB0b2dnbGluZyBmb3IgZXhhbXBsZS4NCj4g
PiBOb3RlLiBSVCBvciAidGhyZWFkaXJxcyIgZG9lcyBub3QgbWVhbiBncGlvY2hpcCBiZWNvbWUg
c2xlZXBhYmxlLg0KPiA+DQo+ID4gSW4gdGhpcyBjYXNlOg0KPiA+ICAgdGhyZWFkZWQgaGFuZGxl
cg0KPiA+ICAgICByYXdfc3Bpbl9sb2NrDQo+ID4gICAgICAgICBJUlEgZnJvbSBvdGhlciBkZXZp
Y2UNCj4gPiAgICAgICAgICAgIGhhcmRfaXJxIGhhbmRsZXINCj4gPiAgICAgICAgICAgICAgZ3Bp
b2RfeCgpDQo+ID4gICAgICAgICAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgpIC0tIG9v
cHMNCj4gPg0KPiANCj4gR29vZCBwb2ludCwgSSBoYWQgbWlzc2VkIHRoZSBmYWN0IHRoYXQgZHJp
dmVycyBjYW4gY2FsbCBncGlvIGZ1bmN0aW9ucyBmcm9tDQo+IGhhcmRpcnEgY29udGV4dCB3aGVu
IEkgcmVwbGllZCBlYXJsaWVyLCBncGlvIGlzIGNsZWFybHkgc3BlY2lhbCBoZXJlLg0KDQoNClll
cy4gR3BpbyBwcm92aWRlcyBBUElzLCB0aHVzLCBvdGhlciBkcml2ZXJzIGNhbiBnbyBkaXJlY3Rs
eSBpbnRvIHRoZQ0KdGVycml0b3J5IG9mIGdwaW8gZHJpdmVyLg0KDQpBbm90aGVyIG9uZSB3aGlj
aCBpcyBldmVuIG1vcmUgc3BlY2lhbCBtaWdodCBiZSBtNjhrLCB3aGljaCBJIGNjLWVkIHlvdQ0K
eWVzdGVyZGF5Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9jNDZkZGI5NTRjZmU0NWQ5
ODQ5YzkxMTI3MWQ3ZWMyM0BoaXNpbGljb24uY29tLw0KDQo+IA0KPiAgICAgICAgICAgQXJuZA0K
DQpUaGFua3MNCkJhcnJ5DQoNCg==
