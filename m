Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B847B104E14
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 09:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfKUIfv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 03:35:51 -0500
Received: from mail-eopbgr760087.outbound.protection.outlook.com ([40.107.76.87]:37614
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726546AbfKUIfu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Nov 2019 03:35:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIdUGLVAHG57CKy4bSX0+pLFaeJRZq/yuASMJqwGeHNi/G4E2dG+Pbu2dkiu6QfIiFce8RFuc1pmBxABnIQYQtdaLXeTAyQi2ugX3KKXhu1BCedwQLG9LRQAYY2IG0Vy3T32ehT12dxknigLDz3UPNeNDjm3j+9taUVXoL7jecT3JKCBtnHtVHMbmi9SfeqP82liUblMcpsjlsBo+tScxouKPcv7ZOGQidIMB7wdo5EPMk1aSRAknyW4+knwjhDwBLA1IRfnRD1OLfK4bSSThu7qVn/YZI0FuePem1F1g0WT78w4YW0NvLDHbu2nBdleWGwyYwSrYSWwxAe39dwIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Sn0OSbRmZMqOfWAigYtrtVnYBqlhloFuzpBZkCY7os=;
 b=EI3TcoAdREbqyQzZ+reVLJbkAz6UrdRlZvMW3c77EVTPPg53JbirAThRg9GSqkdAHQEctJQC3wTcqasEv2zxMWcUdZsSAemrNGQ/0Ip2yOFm2yWXFUZ4puik55D8yutNhxK+YIsjemDZwEhAkVbxEFwjylcbqOjjwTbNOBh4Efd7ldY3+M7vlwPWjm56rM5cUQxKs4HZbycrsBcK1ksWNTisUUYqL/5DQrz4YPO2MmwG3hodR+KAjDwRSynpBTR31WpTVk1LTbc/Fhvs3trn1zsK793TugbLHi9StJG0XVgakgFIKzMkqKAEQXEv/v79s84FIK+eyNcWGP0R70xbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Sn0OSbRmZMqOfWAigYtrtVnYBqlhloFuzpBZkCY7os=;
 b=GNQ+AUled/o9fM5I7VfBKGjQt4S06aui+fc3m8qwOiXL+Uzst0noXKbPsBX+Jlgv/uZc5B7Muoozfy9RwFu4T8CJG16fbOZ8BmKEhAOyaBI66LQW9psNLB5uqPiVKTgf/2kMfl6NOjQYeKSs4C3Yr6AUj4EpE19KnCQE8SERTug=
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3701.namprd13.prod.outlook.com (20.180.14.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8; Thu, 21 Nov 2019 08:35:45 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::853e:1256:311e:d29%7]) with mapi id 15.20.2474.018; Thu, 21 Nov 2019
 08:35:45 +0000
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
Subject: RE: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
Thread-Topic: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
Thread-Index: AQHVn3AJHBiRD+wuIUSzxWzN0+e/fqeT3o6AgAFvDhA=
Date:   Thu, 21 Nov 2019 08:35:44 +0000
Message-ID: <CH2PR13MB33682B1E7B40DC5C2FD1094C8C4E0@CH2PR13MB3368.namprd13.prod.outlook.com>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
 <5ec51559d8b4cd3b8e80943788b52926@www.loen.fr>
In-Reply-To: <5ec51559d8b4cd3b8e80943788b52926@www.loen.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
x-originating-ip: [114.143.65.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 401f03cb-132e-4d51-f171-08d76e5dcd35
x-ms-traffictypediagnostic: CH2PR13MB3701:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR13MB3701A082B564FE78E21731848C4E0@CH2PR13MB3701.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39840400004)(396003)(346002)(376002)(366004)(136003)(13464003)(189003)(199004)(446003)(76116006)(229853002)(52536014)(6116002)(256004)(14444005)(305945005)(186003)(7736002)(26005)(3846002)(74316002)(66066001)(8676002)(81166006)(11346002)(4326008)(76176011)(8936002)(86362001)(25786009)(53546011)(102836004)(81156014)(6506007)(7696005)(44832011)(71200400001)(4001150100001)(33656002)(54906003)(5660300002)(6246003)(107886003)(2906002)(478600001)(55016002)(64756008)(316002)(14454004)(9686003)(66476007)(66556008)(71190400001)(66446008)(99286004)(7416002)(6916009)(66946007)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3701;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /HcBd7ADO5gnTAHnfOjeQEtjACQtFbmNT+WE7w2P6nmQqNRLAkM/IQ00j7qX+WjIxZGysYL3joXGp5IgjRHC0W9ICCrPps6qoR51bTRyj5an0gtNHSYJududOCAYxBor9cw3UCACXY84batAZ0wunzEcCaLvXHZoHttpVuAX1r3vA8OFH23XckF5sqnv4mB8jYmHiFRo84XPcwOcWzKk4sYdcLXTo4XQEuvA4zNDY442cxDg8vP1u/jfRt7/HwdmdkenzVM8MLahrdOM+cIUD3XnNw99FUvZCMjrUV7nVTquKrndKT0FxsOBRRVE8mdHg2vKm9XfifXDIUT5/f7Meh7t6AsMlLk1OEhHw62CI8eIbX/5lSj/fXDvIP66SEX/mfySjqpNpEgIvM7vrE4Dyrv2hkdKQwcLZQDJuFSavgwDaEQvRyOGVU8jesAefcuc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401f03cb-132e-4d51-f171-08d76e5dcd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 08:35:44.8443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h46K2nORX+uV8wxgeIzakpLGfcIlOW2nKvbpYh0MpYOjVSaEZhsTe7JLwe4bVVQv6YeyzMtcZ0simxoQfVad7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3701
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJjIFp5bmdpZXIgPG1hekBr
ZXJuZWwub3JnPg0KPiBTZW50OiAyMCBOb3ZlbWJlciAyMDE5IDE2OjA5DQo+IFRvOiBZYXNoIFNo
YWggPHlhc2guc2hhaEBzaWZpdmUuY29tPg0KPiBDYzogbGludXMud2FsbGVpakBsaW5hcm8ub3Jn
OyBiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsu
cnV0bGFuZEBhcm0uY29tOyBwYWxtZXJAZGFiYmVsdC5jb207IFBhdWwNCj4gV2FsbXNsZXkgKCBT
aWZpdmUpIDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+OyBhb3VAZWVjcy5iZXJrZWxleS5lZHU7
DQo+IHRnbHhAbGludXRyb25peC5kZTsgamFzb25AbGFrZWRhZW1vbi5uZXQ7IGJtZW5nLmNuQGdt
YWlsLmNvbTsNCj4gYXRpc2gucGF0cmFAd2RjLmNvbTsgU2FnYXIgS2FkYW0gPHNhZ2FyLmthZGFt
QHNpZml2ZS5jb20+OyBsaW51eC0NCj4gZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgU2FjaGluIEdoYWRpDQo+IDxzYWNoaW4uZ2hhZGlA
c2lmaXZlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzVdIGdlbmlycTogaW50cm9k
dWNlIGlycV9kb21haW5fdHJhbnNsYXRlX29uZWNlbGwNCj4gDQo+IE9uIDIwMTktMTEtMjAgMDY6
NTksIFlhc2ggU2hhaCB3cm90ZToNCj4gPiBBZGQgYSBuZXcgZnVuY3Rpb24gaXJxX2RvbWFpbl90
cmFuc2xhdGVfb25lY2VsbCgpIHRoYXQgaXMgdG8gYmUgdXNlZA0KPiA+IGFzIHRoZSB0cmFuc2xh
dGUgZnVuY3Rpb24gaW4gc3RydWN0IGlycV9kb21haW5fb3BzIGZvciB0aGUgdjIgSVJRIEFQSS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhc2ggU2hhaCA8eWFzaC5zaGFoQHNpZml2ZS5jb20+
DQpbLi4uXQ0KPiA+DQo+ID4gIC8qKg0KPiA+ICsgKiBpcnFfZG9tYWluX3RyYW5zbGF0ZV9vbmVj
ZWxsKCkgLSBHZW5lcmljIHRyYW5zbGF0ZSBmb3IgZGlyZWN0IG9uZQ0KPiA+IGNlbGwNCj4gPiAr
ICogYmluZGluZ3MNCj4gPiArICoNCj4gPiArICogRGV2aWNlIFRyZWUgSVJRIHNwZWNpZmllciB0
cmFuc2xhdGlvbiBmdW5jdGlvbiB3aGljaCB3b3JrcyB3aXRoDQo+ID4gb25lIGNlbGwNCj4gDQo+
IG5pdDogdGhlIHdob2xlIHBvaW50IG9mIHRoZSAnbmV3JyB0cmFuc2xhdGUgZnVuY3Rpb24gaXMg
dGhhdCB0aGV5IGFyZQ0KPiBmaXJtd2FyZS1hZ25vc3RpYy4gSnVzdCBkcm9wIHRoZSBEVCByZWZl
cmVuY2UgaGVyZS4NCg0KT2sgc3VyZS4NCg0KPiANCj4gPiArICogYmluZGluZ3Mgd2hlcmUgdGhl
IGNlbGwgdmFsdWVzIG1hcCBkaXJlY3RseSB0byB0aGUgaHdpcnEgbnVtYmVyLg0KPiA+ICsgKi8N
Cj4gPiAraW50IGlycV9kb21haW5fdHJhbnNsYXRlX29uZWNlbGwoc3RydWN0IGlycV9kb21haW4g
KmQsDQo+ID4gKwkJCQkgc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYywNCj4gPiArCQkJCSB1bnNp
Z25lZCBsb25nICpvdXRfaHdpcnEsDQo+ID4gKwkJCQkgdW5zaWduZWQgaW50ICpvdXRfdHlwZSkN
Cj4gPiArew0KPiA+ICsJaWYgKFdBUk5fT04oZndzcGVjLT5wYXJhbV9jb3VudCA8IDEpKQ0KPiA+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ICsJKm91dF9od2lycSA9IGZ3c3BlYy0+cGFyYW1bMF07
DQo+ID4gKwkqb3V0X3R5cGUgPSBJUlFfVFlQRV9OT05FOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4g
K30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwoaXJxX2RvbWFpbl90cmFuc2xhdGVfb25lY2VsbCk7
DQo+ID4gKw0KPiA+ICsvKioNCj4gPiAgICogaXJxX2RvbWFpbl90cmFuc2xhdGVfdHdvY2VsbCgp
IC0gR2VuZXJpYyB0cmFuc2xhdGUgZm9yIGRpcmVjdCB0d28NCj4gPiBjZWxsDQo+ID4gICAqIGJp
bmRpbmdzDQo+ID4gICAqDQo+IA0KPiBDYW4geW91IHBsZWFzZSBhbHNvIHVwZGF0ZSAocG90ZW50
aWFsbHkgaW4gYSBzZXBhcmF0ZSBwYXRjaCkgdGhlDQo+IHBvdGVudGlhbA0KPiB1c2VycyBvZiB0
aGlzPyBJIG1lbnRpb25lZCB0aGUgbnZpYyBkcml2ZXIgbGFzdCB0aW1lLi4uDQo+IA0KDQpPaywg
SSB3aWxsIHNlcGFyYXRlIG91dCB0aGlzIHBhdGNoIGZyb20gdGhlIHBhdGNoc2V0IGFuZCBzZW5k
IGl0IGluZGl2aWR1YWxseSBhbG9uZyB3aXRoIHBvdGVudGlhbCB1c2VycyBvZiBpdC4NClRoYW5r
cyBmb3IgeW91ciBjb21tZW50cw0KDQotIFlhc2gNCg0K
