Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696BA1001F8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 11:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKRKD7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 05:03:59 -0500
Received: from mail-eopbgr800079.outbound.protection.outlook.com ([40.107.80.79]:43025
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726460AbfKRKD7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 05:03:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8jEFXDLIm4J0Q9/4aLZhV+3nB4Blm5sKm3TdZiMH+o2vVY2UXsUaRPdzK3YQ77+/RSof8ClYP5GX58tduDUKkO5O06bHyvY4gDp36pqNbS7KWYJz5nPD1AzernxyjRH+F4XkunTvhWeiVVTkW3er9huTMR1Unb1QstBwPDqMr7qXxlTdfWAeli7sQuBJOTJYewV51+mVxcq+NGML6IjpPC0Yrr9m5LiVi+TSa9cFUk9XeGqZQwhaBWMnsUBz+9KavegB5V2lnbS70dPFncrKeAzFjG4tt1VgaBDQG6wDZ2IGkFc0pKSEz34F+Vf3Rzzhj+vFzPsTTU9Hh3Q/ubxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwc6vQ0hZAJ6YH0zYRRQdWGFpNnpxzVWdPdNo1P+L/Q=;
 b=QNWPM5Xr+0Bqgoezg1VvG7CEFxfF5anFpLelgMYUba8VEu+gA4QNd2jKHHZf+WSOLRY5LerRv9zx1dlC5lRezMOIzcCkfT4ycd5AbOE6MV+Nk1vBUfQV7lRt4+WnSjiTtZYKgzsPvoe1+dwRAwyrdvep+izZqGQB4fwLrYgd7ziw/j1SaFjr1Q1Q3di0JDbhU0/LhWG8FOyxkzSFcxN/HdbLRLt/ftrgR2tI9YlWO7eugMrhKZI3Z2cJ0oGocvCmsVZtcm9ewJrWfdCJzeeKIdqHK61o8yGmEFJQPKaw7yRyI7x34/sFJQ28NNur7VTqJ2iH/nMulz331mvRS9EM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwc6vQ0hZAJ6YH0zYRRQdWGFpNnpxzVWdPdNo1P+L/Q=;
 b=kNkP7VVtLZ+9Q55LJyyswcchY2RgCh00gX61eZyPz3icwxjNL7L6X0YdYVwUfkAP/LKRWv3e8NV8mxfg0olHKr/vhG4V2taQKNHhMKZbQ2pM3Mf3DuNL/CTjkjljfN/kDkW7w9d4V9HBvqs07CvwKmPM9bnYCsvTkE/CvS4zGe4=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3496.namprd13.prod.outlook.com (52.132.245.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.11; Mon, 18 Nov 2019 10:03:53 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.012; Mon, 18 Nov 2019
 10:03:53 +0000
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
Subject: RE: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Topic: [PATCH 3/4] gpio: sifive: Add GPIO driver for SiFive SoCs
Thread-Index: AQHVmVJqQXFGHo/64k2Vkr22HauCBaeJFM0AgAeCbnA=
Date:   Mon, 18 Nov 2019 10:03:52 +0000
Message-ID: <CH2PR13MB33680443C101511E66ECADF08C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-4-git-send-email-yash.shah@sifive.com>
 <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
In-Reply-To: <CAMpxmJWcuV7goPWxOWv_Og9GwzGrioF62SfS1LCiHf9eDX=vdw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bc38015-7707-4fa0-dc60-08d76c0e9df1
x-ms-traffictypediagnostic: CH2PR13MB3496:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3496387C9A3D47388ED085598C4D0@CH2PR13MB3496.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(6029001)(136003)(39850400004)(366004)(396003)(346002)(376002)(189003)(199004)(13464003)(76176011)(186003)(6436002)(3846002)(6506007)(53546011)(6306002)(6116002)(316002)(26005)(66066001)(66476007)(66556008)(64756008)(66446008)(71200400001)(25786009)(86362001)(7696005)(102836004)(305945005)(99286004)(76116006)(4326008)(2906002)(71190400001)(54906003)(66946007)(256004)(7736002)(11346002)(446003)(14444005)(7416002)(81166006)(81156014)(6246003)(55016002)(52536014)(478600001)(476003)(44832011)(33656002)(74316002)(6916009)(107886003)(966005)(229853002)(8936002)(5660300002)(486006)(9686003)(14454004)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3496;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWvut8dnA7gfmx1/kmaK5LhN2yLlX4LtnCenObv+i+y9nkiMP9PmOfMd9nIexyucfcF8waWGjbznjt0xgFw8PlKwwRZLlw4vnl1U8LqOFWxpl6dy+42AZhLSP4JfDtXAbasFAuZoVjwnqOj8B3PbDH8v8u4zn7evHOJYMJe+pyRF4RyOQ9bILZ3x/X50zqRB1ZylH6kTUavYjKk87apOxMonATiv81zTqHb8rWk9yDNPXPdfT5vFDdxc5uhAPnYnYgL0lQ1izm02PdGrZsVVM4cg7GbH41Sbd5kI9sj/NUZy8n+htk1zMMrG4fwxT077Zxm0ac2S8BH1fJKZ2WcczPKg7bseSZkMl5zYdonGHwbHgZkGTYpZuicH9Sg0/jtRwNeNB/Gb2u7DCC1IkylfG42ZnQDGMLy4SaiH+RHO38GHbWQVk7Fd2FqyGkEP2YOH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc38015-7707-4fa0-dc60-08d76c0e9df1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 10:03:53.0010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hpKIXy2h0Q+eYAewa034hHzMN2AEgAvED/K+PkkM9FakGaMCKpb5XPaplP8OPNsUVN3Y+leL8J8r4pOsKworGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3496
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPg0KPiBTZW50OiAxMyBOb3ZlbWJlciAyMDE5IDE4
OjQxDQo+IFRvOiBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPg0KPiBDYzogbGludXMu
d2FsbGVpakBsaW5hcm8ub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0u
Y29tOw0KPiBwYWxtZXJAZGFiYmVsdC5jb207IFBhdWwgV2FsbXNsZXkgKCBTaWZpdmUpIDxwYXVs
LndhbG1zbGV5QHNpZml2ZS5jb20+Ow0KPiBhb3VAZWVjcy5iZXJrZWxleS5lZHU7IHRnbHhAbGlu
dXRyb25peC5kZTsgamFzb25AbGFrZWRhZW1vbi5uZXQ7DQo+IG1hekBrZXJuZWwub3JnOyBibWVu
Zy5jbkBnbWFpbC5jb207IGF0aXNoLnBhdHJhQHdkYy5jb207IFNhZ2FyIEthZGFtDQo+IDxzYWdh
ci5rYWRhbUBzaWZpdmUuY29tPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgU2FjaGluIEdoYWRpIDxzYWNoaW4uZ2hh
ZGlAc2lmaXZlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzRdIGdwaW86IHNpZml2ZTog
QWRkIEdQSU8gZHJpdmVyIGZvciBTaUZpdmUgU29Dcw0KPiANCj4gd3QuLCAxMiBsaXMgMjAxOSBv
IDEzOjEyIFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+IG5hcGlzYcWCKGEpOg0KPiA+
DQo+ID4gQWRkcyB0aGUgR1BJTyBkcml2ZXIgZm9yIFNpRml2ZSBSSVNDLVYgU29Dcy4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFdlc2xleSBXLiBUZXJwc3RyYSA8d2VzbGV5QHNpZml2ZS5jb20+
DQo+ID4gW0F0aXNoOiBWYXJpb3VzIGZpeGVzIGFuZCBjb2RlIGNsZWFudXBdDQo+ID4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lmaXZlLmNvbT4NCg0KWy4uLl0NCg0KPiA+ICsN
Cj4gPiArc3RhdGljIGludCBzaWZpdmVfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0K
PiA+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7
DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmlycV9wYXJlbnQ7DQo+ID4gKyAgICAg
ICBzdHJ1Y3QgaXJxX2RvbWFpbiAqcGFyZW50Ow0KPiA+ICsgICAgICAgc3RydWN0IGdwaW9faXJx
X2NoaXAgKmdpcnE7DQo+ID4gKyAgICAgICBzdHJ1Y3Qgc2lmaXZlX2dwaW8gKmNoaXA7DQo+ID4g
KyAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiArICAgICAgIGludCByZXQsIG5ncGlv
Ow0KPiA+ICsNCj4gPiArICAgICAgIGNoaXAgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmNo
aXApLCBHRlBfS0VSTkVMKTsNCj4gPiArICAgICAgIGlmICghY2hpcCkNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICsgICAgICAgcmVzID0gcGxhdGZvcm1f
Z2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gPiArICAgICAgIGNoaXAt
PmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiANCj4gVXNlIGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIGFuZCBkcm9wIHRoZSByZXMgdmFyaWFibGUuDQo+
IA0KDQpTdXJlLCB3aWxsIGRvIHRoYXQuDQoNCj4gPiArICAgICAgIGlmIChJU19FUlIoY2hpcC0+
YmFzZSkpIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gYWxs
b2NhdGUgZGV2aWNlIG1lbW9yeVxuIik7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKGNoaXAtPmJhc2UpOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGNoaXAt
PnJlZ3MgPSBkZXZtX3JlZ21hcF9pbml0X21taW8oZGV2LCBjaGlwLT5iYXNlLA0KPiA+ICsNCj4g
PiArICZzaWZpdmVfZ3Bpb19yZWdtYXBfY29uZmlnKTsNCj4gDQo+IFdoeSBkbyB5b3UgbmVlZCB0
aGlzIHJlZ21hcCBoZXJlPyBZb3UgaW5pdGlhbGl6ZSBhIG5ldyByZWdtYXAsIHRoZW4gdXNlDQo+
IHlvdXIgb3duIGxvY2tpbmcgZGVzcGl0ZSBub3QgaGF2aW5nIGRpc2FibGVkIHRoZSBpbnRlcm5h
bCBsb2NraW5nIGluIHJlZ21hcCwNCj4gYW5kIHRoZW4geW91IGluaXRpYWxpemUgdGhlIG1taW8g
Z2VuZXJpYyBHUElPIGNvZGUgd2hpY2ggd2lsbCB1c2UgeWV0DQo+IGFub3RoZXIgbG9jayB0byBv
cGVyYXRlIG9uIHRoZSBzYW1lIHJlZ2lzdGVycyBhbmQgaW4gdGhlIGVuZCB5b3Ugd3JpdGUgdG8N
Cj4gdGhvc2UgcmVnaXN0ZXJzIHdpdGhvdXQgdGFraW5nIGFueSBsb2NrIGFueXdheS4NCj4gRG9l
c24ndCBtYWtlIG11Y2ggc2Vuc2UgdG8gbWUuDQo+IA0KDQpBcyBzdWdnZXN0ZWQgaW4gdGhlIGNv
bW1lbnRzIHJlY2VpdmVkIG9uIHRoZSBSRkMgdmVyc2lvbiBvZiB0aGlzIHBhdGNoWzBdLCBJIGFt
IHRyeWluZyB0byB1c2UgcmVnbWFwIE1NSU8gYnkgbG9va2luZyBhdCBncGlvLW12ZWJ1LmMuIEkg
Z290IHlvdXIgcG9pbnQgcmVnYXJkaW5nIHRoZSB1c2FnZSBvZiBvd24gbG9ja3MgaXMgbm90IG1h
a2luZyBhbnkgc2Vuc2UuDQpIZXJlIGlzIHdoYXQgSSB3aWxsIGRvIGluIHYyOg0KMS4gZHJvcCB0
aGUgdXNhZ2Ugb2Ygb3duIGxvY2tzDQoyLiBjb25zaXN0ZW50bHkgdXNlIHJlZ21hcF8qIGFwaXMg
Zm9yIHJlZ2lzdGVyIGFjY2VzcyAocmVwbGFjZSBhbGwgaW93cml0ZXMpLg0KRG9lcyB0aGlzIG1h
a2Ugc2Vuc2Ugbm93Pw0KDQo+ID4gKyAgICAgICBpZiAoSVNfRVJSKGNoaXAtPnJlZ3MpKQ0KPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjaGlwLT5yZWdzKTsNCj4gPiArDQoNClsu
Li5dDQoNCj4gPiArDQo+ID4gKyAgICAgICByZXQgPSBncGlvY2hpcF9hZGRfZGF0YSgmY2hpcC0+
Z2MsIGNoaXApOw0KPiA+ICsgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBj
aGlwKTsNCj4gPiArICAgICAgIGRldl9pbmZvKGRldiwgIlNpRml2ZSBHUElPIGNoaXAgcmVnaXN0
ZXJlZCAlZCBHUElPc1xuIiwNCj4gPiArIG5ncGlvKTsNCj4gDQo+IENvcmUgZ3BpbyBsaWJyYXJ5
IGVtaXRzIGEgdmVyeSBzaW1pbGFyIGRlYnVnIG1lc3NhZ2UgZnJvbQ0KPiBncGlvY2hpcF9zZXR1
cF9kZXYoKSwgSSB0aGluayB5b3UgY2FuIGRyb3AgaXQgYW5kIGRpcmVjdGx5IHJldHVybg0KPiBn
cGlvY2hpcF9hZGRfZGF0YSgpLg0KPiANCj4gQmFydG9zeg0KDQpPay4gV2lsbCBkaXJlY3RseSBy
ZXR1cm4gZ3Bpb2NoaXBfYWRkX2RhdGEoKS4NClRoYW5rcyBmb3IgeW91ciBjb21tZW50cyENCg0K
LSBZYXNoDQoNClswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDE4MTAx
MDEyMzUxOS5SVmV4RHBwYVBGcElXbDdRVV9ocFA4dGM1cXFXUEpnZXVMWW4wRmFHYmVRQHovDQo=
