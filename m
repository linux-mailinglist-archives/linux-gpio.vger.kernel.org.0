Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF0AEFFF5B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 08:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfKRHOd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 02:14:33 -0500
Received: from mail-eopbgr820043.outbound.protection.outlook.com ([40.107.82.43]:60006
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726552AbfKRHOc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Nov 2019 02:14:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9jdCG6FypEr7RBKq1IixN/tSmm/My2D3h1wUBj1Bc0bDaG/p7eoSnUctWUeGFBYtSTObqdb6+WyYRyymXypaVHCOxvorQmzUNO+qeocLc+mW7PYOexXFtDWnGb3aSdsE09v9XxUqTzU0WHgS4sPTK/No6pwC/2N+l+OrCqghE9v8kutXFh4GhbSBU5ldUsLnBtG/Ute14tx6kJqHUxpQd0dgn8vjU+ZslgPfnvjQZcwO1B9fkLHs1+SANsh0G98IjBIY920Z+NxTOm4qOH6IqQQmFuknlEfIb2lC7PC93/U2FJZU8UyhuAiqeJcfec8ciR8E8LD9RdO9yaO+Z5vew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz7BcH3KrKew71E5j6GlDHqVcrDDEIUcDM8g0aS0LKU=;
 b=OaUFT6Vo3R+bcxMr9DMf75CzrxJeQzHsHp7CdxAd1SLgtJbTfS3XSGfQNN7HRR8xfc2akB2tIKceOKezm9NWNy03C4g/ruYdyo8ZWb1IMApnwymIW+X3upLNq6drJG3YHvLir/YyW+RTsclSuFE/1aZt+4llxN9y5k0wyq2WMWZAIsNc82b3A5IdjM9bYzfaK5oK0VhoOz/gkXR1beVAjsSxmmKWHHylEwia07dyIsgRWlI96uNSBMEVcXkCJoVvNQ4PELLHiroXanzwZiTVTjEeJGzGjjSCZz5w1s+I6VW0ULoYfVoQTZrjU0G8KVb/ornTcDlDLcFbAa+JkPtWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz7BcH3KrKew71E5j6GlDHqVcrDDEIUcDM8g0aS0LKU=;
 b=erifsc6XS7U6kAEZgPq93Qo/UkxKNt6w2U+KrPIZWkhVv/BGWhcKhznqrbwZB2p5D6WMDmFK93Ly/0rlGWfDSjMfnpp9QQlKJTIc4LLw7w+DbekLD1FjTePlwXjOx7yc2OewzC2OjFBJhXM9eCGif3qwK3LkPfl8hBK7MkjF7Bg=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3304.namprd13.prod.outlook.com (10.255.155.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.15; Mon, 18 Nov 2019 07:14:27 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.012; Mon, 18 Nov 2019
 07:14:27 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     Marc Zyngier <maz@kernel.org>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: RE: [PATCH 1/4] irqchip: sifive: Support hierarchy irq domain
Thread-Topic: [PATCH 1/4] irqchip: sifive: Support hierarchy irq domain
Thread-Index: AQHVmVJiuq127ZCTBUqmuCH0wyl5F6eHetSAgAkRSfA=
Date:   Mon, 18 Nov 2019 07:14:27 +0000
Message-ID: <CH2PR13MB3368254D0684E46A2C47AE418C4D0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1573560684-48104-1-git-send-email-yash.shah@sifive.com>
 <1573560684-48104-2-git-send-email-yash.shah@sifive.com>
 <ad0a3b419a3f5c3475d5fafcc2a037fb@www.loen.fr>
In-Reply-To: <ad0a3b419a3f5c3475d5fafcc2a037fb@www.loen.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14783145-2780-4b5d-2cf8-08d76bf6f2dc
x-ms-traffictypediagnostic: CH2PR13MB3304:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB330474EB2317E3655E1C393C8C4D0@CH2PR13MB3304.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(366004)(346002)(39830400003)(136003)(13464003)(189003)(199004)(6506007)(33656002)(8936002)(8676002)(81166006)(53546011)(81156014)(102836004)(7696005)(76176011)(486006)(26005)(4326008)(44832011)(186003)(446003)(11346002)(476003)(229853002)(66066001)(7416002)(6916009)(6436002)(55016002)(74316002)(66446008)(64756008)(66556008)(66476007)(6116002)(3846002)(5660300002)(52536014)(9686003)(6246003)(305945005)(7736002)(107886003)(76116006)(2906002)(66946007)(54906003)(478600001)(256004)(71190400001)(71200400001)(4001150100001)(316002)(99286004)(25786009)(14454004)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3304;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XwusVMB7vjqGB6vof1yERGl8XvW5TFjKRtIuBF8dzcEKaLzpqnZUu2zDW/yPy1y5KbkIIoXjSGS1vg8nS4RQbzhceE7eaLpvAr7h7bn7mMF2pSB2NEISG2cuXNKoIe2iXGl+CkDHiEStXhnDvBuj6Kr/bOUqWovNbvtWK/FWnQOma+J/6EzDM/S1tZ+SVbg7HjRJUQ18MIaDs2FaYmOfTGTNZmk7Bw2MnTYaM2n+xhr6ciPox0I6VpVD8ODkBSmXj99OVQIVIABnBG/rSd/+ZTyiEtbv1mmLCYy8fJ6u8hSFVZL+k7HWKAb1oRBJ7O6Jo1kprulrDFIx3HWdKvDDhJtsoZcnHgONtWyyEUVOH9KMyerW5J62Z383w/So7C/U75Fj0aRcYj0nxzfhij3jSLEbngsYn/nKcnWn+AC8A9QO171do1bnMpQCGI47i5jV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14783145-2780-4b5d-2cf8-08d76bf6f2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 07:14:27.5307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tu8aHh2Y4u+6eQTDkGT+rB0XjGT7rOLTYN+eOQOMLRr6c6fgepcmrIFCs9WmH0r7zSD5DgX+nrNHzbcYqD3zGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3304
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJjIFp5bmdpZXIgPG1hekBr
ZXJuZWwub3JnPg0KPiBTZW50OiAxMiBOb3ZlbWJlciAyMDE5IDE4OjEzDQo+IFRvOiBZYXNoIFNo
YWggPHlhc2guc2hhaEBzaWZpdmUuY29tPg0KPiBDYzogbGludXMud2FsbGVpakBsaW5hcm8ub3Jn
OyBiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsu
cnV0bGFuZEBhcm0uY29tOyBwYWxtZXJAZGFiYmVsdC5jb207IFBhdWwNCj4gV2FsbXNsZXkgKCBT
aWZpdmUpIDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+OyBhb3VAZWVjcy5iZXJrZWxleS5lZHU7
DQo+IHRnbHhAbGludXRyb25peC5kZTsgamFzb25AbGFrZWRhZW1vbi5uZXQ7IGJtZW5nLmNuQGdt
YWlsLmNvbTsNCj4gYXRpc2gucGF0cmFAd2RjLmNvbTsgU2FnYXIgS2FkYW0gPHNhZ2FyLmthZGFt
QHNpZml2ZS5jb20+OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgU2FjaGluIEdoYWRpDQo+IDxzYWNoaW4uZ2hhZGlA
c2lmaXZlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGlycWNoaXA6IHNpZml2ZTog
U3VwcG9ydCBoaWVyYXJjaHkgaXJxIGRvbWFpbg0KPiANCj4gT24gMjAxOS0xMS0xMiAxMzoyMSwg
WWFzaCBTaGFoIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBoaWVyYXJjaHkgaXJxIGRvbWFp
bnMuIFRoaXMgaXMgbmVlZGVkIGFzIHByZS1yZXF1aXNpdGUNCj4gPiBmb3IgZ3Bpby1zaWZpdmUg
ZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFzaCBTaGFoIDx5YXNoLnNoYWhAc2lm
aXZlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pcnFjaGlwL0tjb25maWcgICAgICAgICAg
IHwgIDEgKw0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmMgfCA0MQ0KPiA+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pcnFjaGlwL0tjb25maWcgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZyBp
bmRleA0KPiA+IGNjYmI4OTcuLmEzOTg1NTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pcnFj
aGlwL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZw0KPiA+IEBAIC00
ODgsNiArNDg4LDcgQEAgZW5kbWVudQ0KPiA+ICBjb25maWcgU0lGSVZFX1BMSUMNCj4gPiAgCWJv
b2wgIlNpRml2ZSBQbGF0Zm9ybS1MZXZlbCBJbnRlcnJ1cHQgQ29udHJvbGxlciINCj4gPiAgCWRl
cGVuZHMgb24gUklTQ1YNCj4gPiArCXNlbGVjdCBJUlFfRE9NQUlOX0hJRVJBUkNIWQ0KPiA+ICAJ
aGVscA0KLi4uDQo+ID4NCj4gPiArc3RhdGljIGludCBwbGljX2lycV9kb21haW5fdHJhbnNsYXRl
KHN0cnVjdCBpcnFfZG9tYWluICpkLA0KPiA+ICsJCQkJICAgICBzdHJ1Y3QgaXJxX2Z3c3BlYyAq
ZndzcGVjLA0KPiA+ICsJCQkJICAgICB1bnNpZ25lZCBsb25nICpod2lycSwgdW5zaWduZWQgaW50
ICp0eXBlKQ0KPiB7DQo+ID4gKwlpZiAoV0FSTl9PTihmd3NwZWMtPnBhcmFtX2NvdW50IDwgMSkp
DQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwkqaHdpcnEgPSBmd3NwZWMtPnBhcmFtWzBd
Ow0KPiA+ICsJKnR5cGUgPSBJUlFfVFlQRV9OT05FOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gDQo+IFRoaXMgaXMgYWN0dWFsbHkgd2hhdCBzaG91bGQgYmUgY2FsbGVkIGlycV9kb21haW5f
dHJhbnNsYXRlX29uZWNlbGwoKS4NCj4gDQo+IENvbnNpZGVyIGltcGxlbWVudGluZyB0aGF0IGlu
c3RlYWQsIGFuZCB1c2luZyBpdCBpbiB0aGlzIGRyaXZlci4gSSdtIHByZXR0eSBzdXJlDQo+IG90
aGVyIGRyaXZlcnMgY291bGQgdXNlIGl0IChJIHNwb3R0ZWQgaXJxLW52aWMuYykuDQoNClN1cmUs
IHdpbGwgaW1wbGVtZW50IGlycV9kb21haW5fdHJhbnNsYXRlX29uZWNlbGwoKSBhbmQgdXNlIHRo
YXQgaW5zdGVhZC4NClRoYW5rcyBmb3IgeW91ciBjb21tZW50cyENCg0KLSBZYXNoDQoNCj4gDQo+
ID4NCj4gPiAgc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICpwbGljX2lycWRvbWFpbjsNCj4gDQo+
IE90aGVyd2lzZSwgbG9va3MgT0suDQo+IA0KPiBUaGFua3MsDQo+IA0KPiAgICAgICAgICBNLg0K
PiAtLQ0KPiBKYXp6IGlzIG5vdCBkZWFkLiBJdCBqdXN0IHNtZWxscyBmdW5ueS4uLg0K
