Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F933165BE
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 12:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbhBJLyB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 06:54:01 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2897 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhBJLvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 06:51:31 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DbJ234Ffdz5Q5Z;
        Wed, 10 Feb 2021 19:48:59 +0800 (CST)
Received: from dggemi710-chm.china.huawei.com (10.3.20.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 10 Feb 2021 19:50:45 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi710-chm.china.huawei.com (10.3.20.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 10 Feb 2021 19:50:45 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Wed, 10 Feb 2021 19:50:45 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        luojiaxing <luojiaxing@huawei.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Kevin Hilman" <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm]  Re: [PATCH for next v1 0/2] gpio: few clean up
 patches to replace spin_lock_irqsave with spin_lock
Thread-Topic: [Linuxarm]  Re: [PATCH for next v1 0/2] gpio: few clean up
 patches to replace spin_lock_irqsave with spin_lock
Thread-Index: AQHW/fpz5jJ2/H7qpkegS3EF2g2rTapNupMAgAFOFgCAAATsgIABLhiAgAB3XwCAAJQm4A==
Date:   Wed, 10 Feb 2021 11:50:45 +0000
Message-ID: <947bcef0d56a4d0c82729d6899394f4a@hisilicon.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <2b8001bb-0bcd-3fea-e15c-2722e7243209@huawei.com>
 <CAHp75VcpeYpsW6B85F0u=B+GToNh=1fYdRSMeQqE0vOtOdSi8A@mail.gmail.com>
 <1a5dfcf2-11a2-f549-782d-447d58e21305@huawei.com>
 <CAHp75Vd5UV3E79sdq8uQ4pgjFORdJknpm-g7No3tomnKhinMnw@mail.gmail.com>
 <c2458ac9-669b-bd46-df98-7d86d38459b1@huawei.com>
 <CAHp75VdrskuNkvFr4MPbbg8c8=VSug0GT+vs=cMRMOqLr+-f5A@mail.gmail.com>
In-Reply-To: <CAHp75VdrskuNkvFr4MPbbg8c8=VSug0GT+vs=cMRMOqLr+-f5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.187]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IFttYWlsdG86YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBG
ZWJydWFyeSAxMCwgMjAyMSAxMTo1MSBQTQ0KPiBUbzogbHVvamlheGluZyA8bHVvamlheGluZ0Bo
dWF3ZWkuY29tPg0KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
PjsgQW5keSBTaGV2Y2hlbmtvDQo+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+
OyBHcnlnb3JpaSBTdHJhc2hrbw0KPiA8Z3J5Z29yaWkuc3RyYXNoa29AdGkuY29tPjsgU2FudG9z
aCBTaGlsaW1rYXIgPHNzYW50b3NoQGtlcm5lbC5vcmc+OyBLZXZpbg0KPiBIaWxtYW4gPGtoaWxt
YW5Aa2VybmVsLm9yZz47IG9wZW4gbGlzdDpHUElPIFNVQlNZU1RFTQ0KPiA8bGludXgtZ3Bpb0B2
Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0DQo+IDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPjsgbGludXhhcm1Ab3BlbmV1bGVyLm9yZw0KPiBTdWJqZWN0OiBb
TGludXhhcm1dIFJlOiBbUEFUQ0ggZm9yIG5leHQgdjEgMC8yXSBncGlvOiBmZXcgY2xlYW4gdXAg
cGF0Y2hlcyB0bw0KPiByZXBsYWNlIHNwaW5fbG9ja19pcnFzYXZlIHdpdGggc3Bpbl9sb2NrDQo+
IA0KPiBPbiBXZWQsIEZlYiAxMCwgMjAyMSBhdCA1OjQzIEFNIGx1b2ppYXhpbmcgPGx1b2ppYXhp
bmdAaHVhd2VpLmNvbT4gd3JvdGU6DQo+ID4gT24gMjAyMS8yLzkgMTc6NDIsIEFuZHkgU2hldmNo
ZW5rbyB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgRmViIDksIDIwMjEgYXQgMTE6MjQgQU0gbHVvamlh
eGluZyA8bHVvamlheGluZ0BodWF3ZWkuY29tPiB3cm90ZToNCj4gPiA+PiBPbiAyMDIxLzIvOCAy
MToyOCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4+PiBPbiBNb24sIEZlYiA4LCAyMDIx
IGF0IDExOjExIEFNIGx1b2ppYXhpbmcgPGx1b2ppYXhpbmdAaHVhd2VpLmNvbT4gd3JvdGU6DQo+
ID4gPj4+PiBPbiAyMDIxLzIvOCAxNjo1NiwgTHVvIEppYXhpbmcgd3JvdGU6DQo+ID4gPj4+Pj4g
VGhlcmUgaXMgbm8gbmVlZCB0byB1c2UgQVBJIHdpdGggX2lycXNhdmUgaW4gaGFyZCBJUlEgaGFu
ZGxlciwgU28gcmVwbGFjZQ0KPiA+ID4+Pj4+IHRob3NlIHdpdGggc3Bpbl9sb2NrLg0KPiA+ID4+
PiBIb3cgZG8geW91IGtub3cgdGhhdCBhbm90aGVyIENQVSBpbiB0aGUgc3lzdGVtIGNhbid0IHNl
cnZlIHRoZQ0KPiA+ID4gVGhlIGtleXdvcmQgaGVyZSBpczogKmFub3RoZXIqLg0KPiA+DQo+ID4g
b29oLCBzb3JyeSwgbm93IEkgZ290IHlvdXIgcG9pbnQuDQo+ID4NCj4gPiBBcyB0byBtZSwgSSBk
b24ndCB0aGluayBhbm90aGVyIENQVSBjYW4gc2VydmUgdGhlIElSUSB3aGVuIG9uZSBDUFUNCj4g
PiBydW5pbmcgaGFyZCBJUlEgaGFuZGxlciwNCj4gDQo+IFdoeSBpcyBpdCBzbz8NCj4gRWFjaCBD
UFUgY2FuIHNlcnZlIElSUXMgc2VwYXJhdGVseS4NCj4gDQo+ID4gZXhjZXB0IGl0J3MgYSBwZXIg
Q1BVIGludGVycnVwdHMuDQo+IA0KPiBJIGRpZG4ndCBnZXQgaG93IGl0IGlzIHJlbGF0ZWQuDQo+
IA0KPiA+IFRoZSBmb2xsb3dpbmcgaXMgYSBzaW1wbGUgY2FsbCBsb2dpYyB3aGVuIElSUSBjb21l
Lg0KPiA+DQo+ID4gZWx4X2lycSAtPiBoYW5kbGVfYXJjaF9pcnEgLT4gX19oYW5kbGVfZG9tYWlu
X2lycSAtPiBkZXNjLT5oYW5kbGVfaXJxIC0+DQo+ID4gaGFuZGxlX2lycV9ldmVudA0KPiANCj4g
V2hhdCBpcyBgZWx4X2lycSgpYD8gSSBoYXZlbid0IGZvdW5kIGFueSBtZW50aW9uIG9mIHRoaXMg
aW4gdGhlIGtlcm5lbA0KPiBzb3VyY2UgdHJlZS4NCj4gQnV0IG9rYXksIGl0IHNob3VsZG4ndCBw
cmV2ZW50IG91ciBkaXNjdXNzaW9uLg0KPiANCj4gPiBBc3N1bWUgdGhhdCB0d28gQ1BVcyByZWNl
aXZlIHRoZSBzYW1lIElSUSBhbmQgZW50ZXIgdGhlIHByZWNlZGluZw0KPiA+IHByb2Nlc3MuIEJv
dGggb2YgdGhlbSB3aWxsIGdvIHRvIGRlc2MtPmhhbmRsZV9pcnEoKS4NCj4gDQo+IEFoLCBJJ20g
dGFsa2luZyBhYm91dCB0aGUgc2FtZSBJUlEgYnkgbnVtYmVyIChsaWtlIExpbnV4IElSUSBudW1i
ZXIsDQo+IG1lYW5zIGZyb20gdGhlIHNhbWUgc291cmNlKSwgYnV0IHdpdGggZGlmZmVyZW50IHNl
cXVlbmNlIG51bWJlciAobWVhbnMNCj4gdHdvIGNvbnNlcXVlbnQgZXZlbnRzKS4NCj4gDQo+ID4g
SW4gaGFuZGxlX2lycSgpLCByYXdfc3Bpbl9sb2NrKCZkZXNjLT5sb2NrKSBhbHdheXMgYmUgY2Fs
bGVkIGZpcnN0Lg0KPiA+IFRoZXJlZm9yZSwgZXZlbiBpZiB0d28gQ1BVcyBhcmUgcnVubmluZyBo
YW5kbGVfaXJxKCksDQo+ID4NCj4gPiBvbmx5IG9uZSBjYW4gZ2V0IHRoZSBzcGluIGxvY2suIEFz
c3VtZSB0aGF0IENQVSBBIG9idGFpbnMgdGhlIHNwaW4gbG9jay4NCj4gPiBUaGVuIENQVSBBIHdp
bGwgc2V0cyB0aGUgc3RhdHVzIG9mIGlycV9kYXRhIHRvDQo+ID4NCj4gPiBJUlFEX0lSUV9JTlBS
T0dSRVNTIGluIGhhbmRsZV9pcnFfZXZlbnQoKSBhbmQgcmVsZWFzZXMgdGhlIHNwaW4gbG9jay4N
Cj4gPiBFdmVuIHRob3VnaCBDUFUgQiBnZXRzIHRoZSBzcGluIGxvY2sgbGF0ZXIgYW5kDQo+ID4N
Cj4gPiBjb250aW51ZSB0byBydW4gaGFuZGxlX2lycSgpLCBidXQgdGhlIGNoZWNrIG9mIGlycV9t
YXlfcnVuKGRlc2MpIGNhdXNlcw0KPiA+IGl0IHRvIGV4aXQuDQo+ID4NCj4gPg0KPiA+IHNvLCBJ
IHRoaW5rIHdlIGRvbid0IG93biB0aGUgc2l0dWF0aW9uIHRoYXQgdHdvIENQVSBzZXJ2ZXIgdGhl
IGhhcmQgSVJRDQo+ID4gaGFuZGxlciBhdCB0aGUgc2FtZSB0aW1lLg0KPiANCj4gT2theS4gQXNz
dW1pbmcgeW91ciBhbmFseXNpcyBpcyBjb3JyZWN0LCBoYXZlIHlvdSBjb25zaWRlcmVkIHRoZSBj
YXNlDQo+IHdoZW4gYWxsIElSUSBoYW5kbGVycyBhcmUgdGhyZWFkZWQ/IChUaGVyZSBpcyBhIGtl
cm5lbCBjb21tYW5kIGxpbmUNCj4gb3B0aW9uIHRvIGZvcmNlIHRoaXMpDQo+IA0KPiA+ID4+PiBm
b2xsb3dpbmcgaW50ZXJydXB0IGZyb20gdGhlIGhhcmR3YXJlIGF0IHRoZSBzYW1lIHRpbWU/DQo+
ID4gPj4gWWVzLCBJIGhhdmUgc29tZSBxdWVzdGlvbiBiZWZvcmUuDQo+ID4gPj4NCj4gPiA+PiBU
aGVyZSBhcmUgc29tZSBzaW1pbGFyIGRpc2N1c3Npb24gaGVyZSwgIHBsZWFzZSB0YWtlIGEgbG9v
aywgU29uZyBiYW9odWENCj4gPiA+PiBleHBsYWluZWQgaXQgbW9yZSBwcm9mZXNzaW9uYWxseS4N
Cj4gPiA+Pg0KPiA+ID4+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZTk0OWE0NzRh
OTI4NGFjNjk1MTgxM2JmYzhiMzQ5NDVAaGlzaWxpY29uLmNvDQo+IG0vDQo+ID4gPj4NCj4gPiA+
PiBIZXJlIGFyZSBzb21lIGV4Y2VycHRzIGZyb20gdGhlIGRpc2N1c3Npb246DQo+ID4gPj4NCj4g
PiA+PiBJIHRoaW5rIHRoZSBjb2RlIGRpc2FibGluZyBpcnEgaW4gaGFyZElSUSBpcyBzaW1wbHkg
d3JvbmcuDQo+ID4gPiBXaHk/DQo+ID4NCj4gPg0KPiA+IEkgbWVudGlvbiB0aGUgZm9sbG93aW5n
IGNhbGwgYmVmb3JlLg0KPiA+DQo+ID4gZWx4X2lycSAtPiBoYW5kbGVfYXJjaF9pcnEgLT4gX19o
YW5kbGVfZG9tYWluX2lycSAtPiBkZXNjLT5oYW5kbGVfaXJxIC0+DQo+ID4gaGFuZGxlX2lycV9l
dmVudA0KPiA+DQo+ID4NCj4gPiBfX2hhbmRsZV9kb21haW5faXJxKCkgd2lsbCBjYWxsIGlycV9l
bnRlcigpLCBpdCBlbnN1cmVzIHRoYXQgdGhlIElSUQ0KPiA+IHByb2Nlc3Npbmcgb2YgdGhlIGN1
cnJlbnQgQ1BVIGNhbiBub3QgYmUgcHJlZW1wdGVkLg0KPiA+DQo+ID4gU28gSSB0aGluayB0aGlz
IGlzIHRoZSByZWFzb24gd2h5IFNvbmcgYmFvaHVhIHNhaWQgaXQncyBub3QgbmVlZCB0bw0KPiA+
IGRpc2FibGUgSVJRIGluIGhhcmRJUlEgaGFuZGxlci4NCj4gPg0KPiA+ID4+IFNpbmNlIHRoaXMg
Y29tbWl0DQo+ID4gPj4NCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8NCj4gP2lkPWU1OGFhM2QyZDBjYw0K
PiA+ID4+IGdlbmlycTogUnVuIGlycSBoYW5kbGVycyB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQN
Cj4gPiA+Pg0KPiA+ID4+IGludGVycnVwdCBoYW5kbGVycyBhcmUgZGVmaW5pdGVseSBydW5uaW5n
IGluIGEgaXJxLWRpc2FibGVkIGNvbnRleHQNCj4gPiA+PiB1bmxlc3MgaXJxIGhhbmRsZXJzIGVu
YWJsZSB0aGVtIGV4cGxpY2l0bHkgaW4gdGhlIGhhbmRsZXIgdG8gcGVybWl0DQo+ID4gPj4gb3Ro
ZXIgaW50ZXJydXB0cy4NCj4gPiA+IFRoaXMgZG9lc24ndCBleHBsYWluIGFueSBjaGFuZ2VzIGlu
IHRoZSBiZWhhdmlvdXIgb24gU01QLg0KPiA+ID4gSVJRIGxpbmUgY2FuIGJlIGRpc2FibGVkIG9u
IGEgZmV3IHN0YWdlczoNCj4gPiA+ICAgYSkgb24gdGhlIHNvdXJjZSAoSVAgdGhhdCBnZW5lcmF0
ZXMgYW4gZXZlbnQpDQo+ID4gPiAgIGIpIG9uIElSUSByb3V0ZXIgLyBjb250cm9sbGVyDQo+ID4g
PiAgIGMpIG9uIENQVSBzaWRlDQo+ID4NCj4gPiB5ZXMsIHlvdSBhcmUgcmlnaHQuDQo+ID4NCj4g
PiA+IFRoZSBjb21taXQgYWJvdmUgaXMgZGlzY3Vzc2luZyAocmlnaHRmdWxseSEpIHRoZSBwcm9i
bGVtIHdoZW4gYWxsDQo+ID4gPiBpbnRlcnJ1cHRzIGFyZSBiZWluZyBzZXJ2ZWQgYnkgYSAqc2lu
Z2xlKiBjb3JlLiBOb2JvZHkgcHJldmVudHMgdGhlbQ0KPiA+ID4gZnJvbSBiZWluZyBzZXJ2ZWQg
YnkgKmRpZmZlcmVudCogY29yZXMgc2ltdWx0YW5lb3VzbHkuIEFsc28sIHNlZSBbMV0uDQo+ID4g
Pg0KPiA+ID4gWzFdOiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sZG9jcy9rZXJuZWwt
bG9ja2luZy9jaGVhdHNoZWV0Lmh0bWwNCj4gPg0KPiA+IEkgY2hlY2sgWzFdLCBxdWl0ZSB1c2Vm
dWwgZGVzY3JpcHRpb24gYWJvdXQgbG9ja2luZywgdGhhbmtzLiBCdXQgeW91IGNhbg0KPiA+IHNl
ZSBUYWJsZSBvZiBsb2NraW5nIFJlcXVpcmVtZW50cw0KPiA+DQo+ID4gQmV0d2VlbiBJUlEgaGFu
ZGxlciBBIGFuZCBJUlEgaGFuZGxlIEEsIGl0J3Mgbm8gbmVlZCBmb3IgYSBTTElTLg0KPiANCj4g
UmlnaHQsIGJ1dCBpdCdzIG5vdCB0aGUgY2FzZSBpbiB0aGUgcGF0Y2hlcyB5b3UgcHJvdmlkZWQu
DQoNClRoZSBjb2RlIHN0aWxsIGhvbGRzIHNwaW5fbG9jay4gU28gaWYgdHdvIGNwdXMgY2FsbCBz
YW1lIElSUSBoYW5kbGVyLA0Kc3Bpbl9sb2NrIG1ha2VzIHRoZW0gc3BpbjsgYW5kIGlmIGludGVy
cnVwdHMgYXJlIHRocmVhZGVkLCBzcGluX2xvY2sNCm1ha2VzIHR3byB0aHJlYWRzIHJ1biB0aGUg
c2FtZSBoYW5kbGVyIG9uZSBieSBvbmUuDQoNCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRz
LA0KPiBBbmR5IFNoZXZjaGVua28NCg0KVGhhbmtzDQpCYXJyeQ0KDQo=
