Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E69104DF9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 09:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKUIcj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 03:32:39 -0500
Received: from mail-eopbgr720060.outbound.protection.outlook.com ([40.107.72.60]:37443
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726132AbfKUIcj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 03:32:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZAq84s4rX+3DPQgo3i/TwB95MGnCzq2/zXzXmEylM1RxpGF3kFxrERXMvsANfQChW68tWyFB0JUeIfCL569+1eimS9MTxxCjG0PMxGI7NkD9rrRRe9mtlbECaN7seshFmZuuNscL0G+a1F4kOvdNZ0dIoE7H51bT1w2NYf8ixB7bWiT1pY+P6PjjLuVLsVuYHhgv4+miNmZaBPL+kY1SE/8vwxdaqcbL1dwY513dL7vdW7T54Gk9tjBzbxBxDjQjevmpJBCy2JhESwWRhNjsXTYUdvfgMKyslX1mG45xVk0cuts8k5P1IknXLBL2puQs2sYRJf6LPxjEoi6wYIdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LObPKV2I3TIgIm3aGytSrIHyCFApil+sQwyntJfBDc=;
 b=jfXpM/VoL9hGdkFeccnkq71FGfmnPJBf8ONxCdq6C40QvuczNRRcBPHPI+4Nf0I1boPHZ30uSFRT9wnaq+01LtwH09IDHVV3bFcyuLl5bhWDuras8THbVT4yTZd+vvbXUyJbl2JdVd/Zk2KV5iFlvWwUWlrnMNfno8ylqN4DFlpGQnmKcjqtWgyqHMsjMGx1H5PfycIMpjH0HEe/VcjN7/Vn6u50fhbuTKIna8oRDH9BR5sGL8HT8ct/VyknDQEaBwS7FJSMmchAfGvpwBPmiET8xHF+yTb59xDuMnyZ8f1sMA0Kp4LHxlp8nJ2V41sM8J/VRf3b5rdkOuUniLAnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LObPKV2I3TIgIm3aGytSrIHyCFApil+sQwyntJfBDc=;
 b=P/A1nIxk7sE2EIQwDo9HGmP42NUbPQs1g2kXJTpiufFb6ddey6v5/QCy305GYuHB+UPXahN5u8m5i1XrRc7hGqoXbYz47WtyWj+YsA7GyZmZ8B2nTE7TCWYyH+zLsZGlTB1E8sX8Okwaj7manVGkQwCOqzBaasNj7Os1eFM+1S0=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3606.namprd13.prod.outlook.com (52.132.246.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.10; Thu, 21 Nov 2019 08:32:33 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.018; Thu, 21 Nov 2019
 08:32:33 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: RE: [PATCH v2 4/5] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Topic: [PATCH v2 4/5] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Index: AQHVn3AVOu1YvEqrSUK2kxGeF7Rov6eT0/+AgAF4gCA=
Date:   Thu, 21 Nov 2019 08:32:33 +0000
Message-ID: <CH2PR13MB3368A85F74CA82994E8C0D1B8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-5-git-send-email-yash.shah@sifive.com>
 <CAMpxmJX0A+_6LmrWPe=Ne5KGhG9r_HySpstDhV5ZTnpz2QXF7Q@mail.gmail.com>
In-Reply-To: <CAMpxmJX0A+_6LmrWPe=Ne5KGhG9r_HySpstDhV5ZTnpz2QXF7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe53d99-ae6c-4409-e020-08d76e5d5ae7
x-ms-traffictypediagnostic: CH2PR13MB3606:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3606558442BD56B81775A4718C4E0@CH2PR13MB3606.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(376002)(39840400004)(366004)(136003)(396003)(346002)(13464003)(189003)(199004)(86362001)(186003)(53546011)(6506007)(26005)(446003)(44832011)(11346002)(102836004)(14454004)(6916009)(5660300002)(7736002)(478600001)(52536014)(14444005)(7696005)(76116006)(305945005)(66946007)(74316002)(7416002)(76176011)(66476007)(25786009)(66446008)(64756008)(66556008)(81166006)(81156014)(3846002)(8936002)(6116002)(33656002)(99286004)(256004)(316002)(8676002)(54906003)(6246003)(107886003)(55016002)(9686003)(4326008)(66066001)(71200400001)(71190400001)(229853002)(2906002)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3606;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GUbGOwExWAoAkA2lyxtdOwT5CfL9vEtcB2OyRM0uLVWgQzF9qsO+jMWJT0qzgShxrHygEeym3Nx6D2uQuqi5kpDu6J/wUZV6q2d4sqNL+pqA6/b97HVl2gw5HTcb3T5SNmu6m6zuoXp/r/qqPaTsv3dyJnkyXbRg+7gP2EmEdED/2k79B+cSFS06kZuEhIe4eXShVinF6zXOwB/6yqB8oHPOdcv1SxV6wCCqnqKJtWSvp5Glyl+yEicNMyGG5au4IN/8Ef7vdDHO1eA/9oYssR1VgeXtC5WvpjD4+hCuw3ry6tDp4QCUOK2Q8TWdLEqBiPaufp51DdibcROUO299vVtmswy/2/pBpObnw+64RGeji5MIyoFM1FjQVgFU8yJsBqMy+TY1aoNLtfx+GanNXbZ3w3S3Jl1/rE+a3Tv+4hEjNxgI3ydX/D6TtAKDxB5u
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe53d99-ae6c-4409-e020-08d76e5d5ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:32:33.1474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yh0JX270p+ErwDZVg19Bqh44nwlqt4Frx7Ee/wOFxTJ/IjQ/7jNamxTjQ629AHz7nP+gw1X69O9hgccOd4loTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3606
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPg0KPiBTZW50OiAyMCBOb3ZlbWJlciAyMDE5IDE1
OjMxDQo+IFRvOiBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPg0KPiBDYzogbGludXMu
d2FsbGVpakBsaW5hcm8ub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0u
Y29tOw0KPiBwYWxtZXJAZGFiYmVsdC5jb207IFBhdWwgV2FsbXNsZXkgKCBTaWZpdmUpIDxwYXVs
LndhbG1zbGV5QHNpZml2ZS5jb20+Ow0KPiBhb3VAZWVjcy5iZXJrZWxleS5lZHU7IHRnbHhAbGlu
dXRyb25peC5kZTsgamFzb25AbGFrZWRhZW1vbi5uZXQ7DQo+IG1hekBrZXJuZWwub3JnOyBibWVu
Zy5jbkBnbWFpbC5jb207IGF0aXNoLnBhdHJhQHdkYy5jb207IFNhZ2FyIEthZGFtDQo+IDxzYWdh
ci5rYWRhbUBzaWZpdmUuY29tPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgU2FjaGluIEdoYWRpIDxzYWNoaW4uZ2hh
ZGlAc2lmaXZlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzVdIGdwaW86IHNpZml2
ZTogQWRkIEdQSU8gZHJpdmVyIGZvciBTaUZpdmUgU29Dcw0KPiANCj4gxZtyLiwgMjAgbGlzIDIw
MTkgbyAwNzo1OSBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiBuYXBpc2HFgihhKToN
Cj4gPg0KPiA+IEFkZHMgdGhlIEdQSU8gZHJpdmVyIGZvciBTaUZpdmUgUklTQy1WIFNvQ3MuDQo+
ID4NCj4gDQo+IFRoaXMgbG9va3MgbXVjaCBiZXR0ZXIganVzdCBhIGNvdXBsZSBuaXRzLg0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZXNsZXkgVy4gVGVycHN0cmEgPHdlc2xleUBzaWZpdmUuY29t
Pg0KPiA+IFtBdGlzaDogVmFyaW91cyBmaXhlcyBhbmQgY29kZSBjbGVhbnVwXQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+DQpbLi4uXQ0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNp
Zml2ZS5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMC4uMDI2NjZhZQ0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYw0K
PiA+IEBAIC0wLDAgKzEsMjU2IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOSBTaUZpdmUNCj4gPiAr
ICovDQo+IA0KPiBJIHByZWZlciB0byBoYXZlIGEgbmV3bGluZSBiZXR3ZWVuIHRoZSBjb3B5cmln
aHQgbm90aWNlIGFuZCB0aGUgaGVhZGVycy4NCg0KRG9uZQ0KDQo+IA0KPiA+ICsjaW5jbHVkZSA8
bGludXgvYml0b3BzLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVyLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9p
bml0Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiANCj4gSXMgdGhpcyByZWFsbHkg
bmVlZGVkPyBJIG9ubHkgc2VlIGZ1bmN0aW9ucyBkZWZpbmVkIGluIG9mX2lycS5oLg0KPiANCj4g
PiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvcG0uaD4NCj4gDQo+IFNhbWUgaGVyZSAtIEkgZG9uJ3Qgc2VlIGFueSBmdW5jdGlvbnMgZnJv
bSB0aGlzIGhlYWRlciBiZWluZyBjYWxsZWQuDQo+IA0KDQpZZXMsIHlvdSBhcmUgcmlnaHQuIEJv
dGggdGhlIGFib3ZlIGluY2x1c2lvbiBvZiBoZWFkZXIgZmlsZSBpcyB1bm5lY2Vzc2FyeS4gV2ls
bCByZW1vdmUgdGhlbS4NCg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvc3BpbmxvY2suaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0K
PiA+ICsNCj4gPiArI2RlZmluZSBHUElPX0lOUFVUX1ZBTCAweDAwDQo+ID4gKyNkZWZpbmUgR1BJ
T19JTlBVVF9FTiAgMHgwNA0KPiA+ICsjZGVmaW5lIEdQSU9fT1VUUFVUX0VOIDB4MDgNCj4gPiAr
I2RlZmluZSBHUElPX09VVFBVVF9WQUwgICAgICAgIDB4MEMNCj4gPiArI2RlZmluZSBHUElPX1JJ
U0VfSUUgICAweDE4DQo+ID4gKyNkZWZpbmUgR1BJT19SSVNFX0lQICAgMHgxQw0KPiA+ICsjZGVm
aW5lIEdQSU9fRkFMTF9JRSAgIDB4MjANCj4gPiArI2RlZmluZSBHUElPX0ZBTExfSVAgICAweDI0
DQo+ID4gKyNkZWZpbmUgR1BJT19ISUdIX0lFICAgMHgyOA0KPiA+ICsjZGVmaW5lIEdQSU9fSElH
SF9JUCAgIDB4MkMNCj4gPiArI2RlZmluZSBHUElPX0xPV19JRSAgICAweDMwDQo+ID4gKyNkZWZp
bmUgR1BJT19MT1dfSVAgICAgMHgzNA0KPiA+ICsjZGVmaW5lIEdQSU9fT1VUUFVUX1hPUiAgICAg
ICAgMHg0MA0KPiA+ICsNCj4gPiArI2RlZmluZSBNQVhfR1BJTyAgICAgICAgICAgICAgIDMyDQo+
ID4gKyNkZWZpbmUgU0lGSVZFX0dQSU9fSVJRX09GRlNFVCA3DQo+IA0KPiBQbGVhc2UgdXNlIGEg
c2luZ2xlIHByZWZpeCBmb3IgYWxsIHN5bWJvbHMgaW4gdGhpcyBkcml2ZXIuIExldCdzIHN0aWNr
IHRvIHNpZml2ZV9ncGlvDQo+IGFuZCBTSUZJVkVfR1BJTyBmb3IgZGVmaW5lcy4NCg0KU3VyZS4N
Cg0KPiANCj4gPiArDQo+ID4gK3N0cnVjdCBzaWZpdmVfZ3BpbyB7DQo+ID4gKyAgICAgICB2b2lk
IF9faW9tZW0gICAgICAgICAgICAqYmFzZTsNCj4gPiArICAgICAgIHN0cnVjdCBncGlvX2NoaXAg
ICAgICAgIGdjOw0KPiA+ICsgICAgICAgc3RydWN0IHJlZ21hcCAgICAgICAgICAgKnJlZ3M7DQo+
ID4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBlbmFibGVkOw0KPiANCj4gVGhlIG5h
bWUgb2YgdGhpcyBmaWVsZCBpcyBhIGJpdCBjb25mdXNpbmcgLSBkbyB5b3UgbWluZCByZW5hbWlu
ZyBpdCB0bw0KPiBzb21ldGhpbmcgbGlrZSBpcnFfc3RhdGU/IE1heWJlIHNvbWV0aGluZyBlbHNl
LCBidXQgc2ltcGx5IHVzaW5nICdlbmFibGVkJw0KPiBtYWtlcyBtZSB0aGluayB0aGlzIGhhcyBt
b3JlIHRvIGRvIHdpdGggdGhlIGNoaXAgYmVpbmcgZW5hYmxlZC4NCj4gDQoNClN1cmUsIHdpbGwg
cmVuYW1lIGl0IHRvIGlycV9zdGF0ZS4NCg0KWy4uLl0NCj4gPiArICAgICAgIHNwaW5fbG9ja19p
cnFzYXZlKCZjaGlwLT5nYy5iZ3Bpb19sb2NrLCBmbGFncyk7DQo+ID4gKyAgICAgICAvKiBEaXNh
YmxlIGFsbCBHUElPIGludGVycnVwdHMgYmVmb3JlIGVuYWJsaW5nIHBhcmVudCBpbnRlcnJ1cHRz
ICovDQo+ID4gKyAgICAgICByZWdtYXBfd3JpdGUoY2hpcC0+cmVncywgR1BJT19SSVNFX0lFLCAw
KTsNCj4gPiArICAgICAgIHJlZ21hcF93cml0ZShjaGlwLT5yZWdzLCBHUElPX0ZBTExfSUUsIDAp
Ow0KPiA+ICsgICAgICAgcmVnbWFwX3dyaXRlKGNoaXAtPnJlZ3MsIEdQSU9fSElHSF9JRSwgMCk7
DQo+ID4gKyAgICAgICByZWdtYXBfd3JpdGUoY2hpcC0+cmVncywgR1BJT19MT1dfSUUsIDApOw0K
PiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2hpcC0+Z2MuYmdwaW9fbG9jaywg
ZmxhZ3MpOw0KPiANCj4gTm8gbmVlZCBmb3IgbG9ja2luZyBpbiBwcm9iZSgpLg0KDQpPay4NClRo
YW5rcyBmb3IgeW91ciBjb21tZW50cyENCg0KLSBZYXNoDQoNCg==
