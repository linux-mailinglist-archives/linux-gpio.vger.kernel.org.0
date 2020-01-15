Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F053C13B704
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 02:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbgAOBfZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 20:35:25 -0500
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:57409
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728874AbgAOBfZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jan 2020 20:35:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8IijXI4Z9StWUo8gherT5j+9BlQmrmRUcfriau1RFwcayOAdKcRGkyLrcO9FkYDx76XVGOvHcebBTBE7f57KzkAOjtUhmWcgJhD9q5f0LRBqXT8/cl+JtTLtrt8nshGdRp3ON5vfjH3lRwfmhsUAWg08zFqFZpq/KGOTFiLNDuFOUMA8Tr3j0BN2OAxo2t63J+DT8W0/vga1ul29L06PG64S+O8Yiqu28vPSIp+l27mcDjOwVCxXCriocCvp3KhJ6ySGTOyDKYpH5eWGClxFWSYBnxY2e16X6QnThAKHNSNRCxcIG5SvAySItozIXB7qyLCwmQ8izRmev4xfj4KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCa7AyxcZ0YlOsjWM9ajEqCJJrUDeANL6DV4Nrk3owc=;
 b=ba+A6KuWNWxkGxICRvUb5SIs2MimMcLew4KV654SAC3ng4TAF7u/ku/7xC+os6+f8gmvdZJ+B1U3BvTLUvnDDwlFIdNGksKJFuuB1LZMI57bWTauav3oOBelPgL/3N3uD1h7aI0+EV40IlHqi70F6UCdUy+48w4LAoOeRovRakTh7mH3IEQbEzeUwWcXbJhp7owVvthq9+nCvtfnVZh4AiHrKk2HCnYPF0RuhiieC/UlWFkEi+oAiX0q5R4ZR6aJXhmNAdinl/tikZ4/wnfDi6BX4ixK24IgJEleyXYbUcZA3nEb2vdOpFZfVPbZocm6PAD+PbmiKqtjey6Tz2Labg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCa7AyxcZ0YlOsjWM9ajEqCJJrUDeANL6DV4Nrk3owc=;
 b=eBYisEFLs+h8pQhFBZtzmFNUosy6hrek8ynPU2Z0MmRvtgI6vK33LAqRKJDH2QM4/T1CIFRkMTDBpDB+lU2FjBGAukRp4qJsFrQvDp70al6ZofRVt2X0Ok8q4v21kOktbCBwFmBL7uNI8IKgVr/ohp6u+2VVfuMMYDMPD5QgWQU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3884.eurprd04.prod.outlook.com (52.134.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 01:35:20 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 01:35:20 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 2/3] dt-bindings: pinctrl: Convert i.MX8MM to
 json-schema
Thread-Topic: [PATCH V2 2/3] dt-bindings: pinctrl: Convert i.MX8MM to
 json-schema
Thread-Index: AQHVx2u+gNLjqXfLGU2kCc4rAZx8Aafq4e4AgAAXFpA=
Date:   Wed, 15 Jan 2020 01:35:20 +0000
Message-ID: <DB3PR0402MB3916419154FCE3FA21DAA5DDF5370@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1578629120-25793-1-git-send-email-Anson.Huang@nxp.com>
 <1578629120-25793-2-git-send-email-Anson.Huang@nxp.com>
 <20200115001152.GA12156@bogus>
In-Reply-To: <20200115001152.GA12156@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5eacba55-79a1-487b-89ec-08d7995b2ed4
x-ms-traffictypediagnostic: DB3PR0402MB3884:|DB3PR0402MB3884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB38848C89DC01EB6B1433D926F5370@DB3PR0402MB3884.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(76116006)(9686003)(86362001)(55016002)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(2906002)(6916009)(478600001)(44832011)(71200400001)(8676002)(81156014)(8936002)(81166006)(316002)(7416002)(54906003)(7696005)(186003)(6506007)(5660300002)(33656002)(26005)(52536014)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3884;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmvHxOED3SYdjXePOMY+jIOudN2Wie2wABRcmU1uyLPqHgAf3UFNrSyNheM0nzf0+mwOhJ+akL0s18RQ/zmmtxxV+U3PYKve+a5FEnTuIZHe7oUeU5zVL/JK+BRxQ33zfeRXkXI1ECtgWZYKsQ3G0fx2Pl3gHyORm7j4u4rwo6E+/k+SZc6BjG/i/62Jnbeh9AwRUgDlFqtwSlpkME3ZDdwNtkyKAEjA53/PKX1JTFVnWsqQf/zFrIpXWiX04mbu24ymQOpd+m8p5yj4ewBAIPUZIl+N3kk4MogsB4DwaKF4qmbc3PAMmqcPmMLbxnAxOdWKb7ue4i9LnEgNDUoRVQsdItT3pyt8dngmj+tbU4v6N3vIYG2nvoKga3UtTcGr6s3fJm6XdTFFJBEsPCNUqaL0LfK2kIvCD9PqQTWyamzgxT9dOqn79SruI5HrfIpqC+QuX7exVuYWIR6WCyLDxX2QuypLvmgHBlKDG2pf0Kx9C3YbwmjUg1poombdYquE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eacba55-79a1-487b-89ec-08d7995b2ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 01:35:20.0890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWTgigOREiZkff2iVy/j9kSitmH88vvSYPHsc6sJkwwxFrCHWdsrRfoR79pG5lg5wQXJFy9VED56nM7K7jpScA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3884
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIFJvYg0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMi8zXSBkdC1iaW5kaW5nczogcGlu
Y3RybDogQ29udmVydCBpLk1YOE1NIHRvIGpzb24tDQo+IHNjaGVtYQ0KPiANCj4gT24gRnJpLCBK
YW4gMTAsIDIwMjAgYXQgMTI6MDU6MTlQTSArMDgwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4g
Q29udmVydCB0aGUgaS5NWDhNTSBwaW5jdHJsIGJpbmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdCB1
c2luZw0KPiA+IGpzb24tc2NoZW1hDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIHNpbmNlIFYxOg0K
PiA+ICAgICAgICAgLSB1c2UgImdycCQiIGluc3RlYWQgb2YgIi1ncnAkIjsNCj4gPiAgICAgICAg
IC0gdXNlIHNwYWNlIGluc3RlYWQgb2YgdGFiIGZvciAicmVmJCI7DQo+ID4gCS0gYWRkIG1pc3Nl
ZCAicmVnIiBwcm9wZXJ0eTsNCj4gPiAgICAgICAgIC0gcmVtb3ZlIHRoZSAibWF4SXRlbSIgZm9y
ICJmc2wscGlucyIgdG8gYXZvaWQgYnVpbGQgd2FybmluZywgYXMgdGhlDQo+IGl0ZW0gbnVtYmVy
IGlzIGNoYW5nYWJsZS4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlt
eDhtbS1waW5jdHJsLnR4dCAgICAgICAgfCAzNiAtLS0tLS0tLS0tLQ0KPiA+ICAuLi4vYmluZGlu
Z3MvcGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwueWFtbCAgICAgICB8IDY5DQo+ICsrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAz
NiBkZWxldGlvbnMoLSkgIGRlbGV0ZSBtb2RlDQo+ID4gMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlteDhtbS1waW5jdHJsLnR4dA0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlteDht
bS1waW5jdHJsLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvZnNsLGlteDhtbS1waW5jdHJsLnR4dA0KPiA+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IGU0ZTAxYzAuLjAwMDAwMDANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwudHh0DQo+ID4gKysr
IC9kZXYvbnVsbA0KPiA+IEBAIC0xLDM2ICswLDAgQEANCj4gPiAtKiBGcmVlc2NhbGUgSU1YOE1N
IElPTVVYIENvbnRyb2xsZXINCj4gPiAtDQo+ID4gLVBsZWFzZSByZWZlciB0byBmc2wsaW14LXBp
bmN0cmwudHh0IGFuZCBwaW5jdHJsLWJpbmRpbmdzLnR4dCBpbiB0aGlzDQo+ID4gZGlyZWN0b3J5
IC1mb3IgY29tbW9uIGJpbmRpbmcgcGFydCBhbmQgdXNhZ2UuDQo+ID4gLQ0KPiA+IC1SZXF1aXJl
ZCBwcm9wZXJ0aWVzOg0KPiA+IC0tIGNvbXBhdGlibGU6ICJmc2wsaW14OG1tLWlvbXV4YyINCj4g
PiAtLSByZWc6IHNob3VsZCBjb250YWluIHRoZSBiYXNlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNp
emUgb2YgdGhlDQo+ID4gaW9tdXhjDQo+ID4gLSAgcmVnaXN0ZXJzLg0KPiA+IC0NCj4gPiAtUmVx
dWlyZWQgcHJvcGVydGllcyBpbiBzdWItbm9kZXM6DQo+ID4gLS0gZnNsLHBpbnM6IGVhY2ggZW50
cnkgY29uc2lzdHMgb2YgNiBpbnRlZ2VycyBhbmQgcmVwcmVzZW50cyB0aGUgbXV4DQo+ID4gYW5k
IGNvbmZpZw0KPiA+IC0gIHNldHRpbmcgZm9yIG9uZSBwaW4uICBUaGUgZmlyc3QgNSBpbnRlZ2Vy
cyA8bXV4X3JlZyBjb25mX3JlZw0KPiA+IGlucHV0X3JlZyBtdXhfdmFsDQo+ID4gLSAgaW5wdXRf
dmFsPiBhcmUgc3BlY2lmaWVkIHVzaW5nIGEgUElOX0ZVTkNfSUQgbWFjcm8sIHdoaWNoIGNhbiBi
ZQ0KPiA+IGZvdW5kIGluDQo+ID4gLSAgPGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtbS1waW5mdW5jLmg+LiBUaGUgbGFzdCBpbnRlZ2VyDQo+ID4gQ09ORklHIGlzDQo+ID4gLSAg
dGhlIHBhZCBzZXR0aW5nIHZhbHVlIGxpa2UgcHVsbC11cCBvbiB0aGlzIHBpbi4gIFBsZWFzZSBy
ZWZlciB0bw0KPiA+IGkuTVg4TSBNaW5pDQo+ID4gLSAgUmVmZXJlbmNlIE1hbnVhbCBmb3IgZGV0
YWlsZWQgQ09ORklHIHNldHRpbmdzLg0KPiA+IC0NCj4gPiAtRXhhbXBsZXM6DQo+ID4gLQ0KPiA+
IC0mdWFydDEgew0KPiA+IC0gICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiAt
ICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF91YXJ0MT47DQo+ID4gLX07DQo+ID4gLQ0KPiA+
IC1pb211eGM6IHBpbmN0cmxAMzAzMzAwMDAgew0KPiA+IC0gICAgICAgIGNvbXBhdGlibGUgPSAi
ZnNsLGlteDhtbS1pb211eGMiOw0KPiA+IC0gICAgICAgIHJlZyA9IDwweDAgMHgzMDMzMDAwMCAw
eDAgMHgxMDAwMD47DQo+ID4gLQ0KPiA+IC0gICAgICAgIHBpbmN0cmxfdWFydDE6IHVhcnQxZ3Jw
IHsNCj4gPiAtICAgICAgICAgICAgICAgIGZzbCxwaW5zID0gPA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICBNWDhNTV9JT01VWENfVUFSVDFfUlhEX1VBUlQxX0RDRV9SWCAgICAgICAgICAg
ICAweDE0MA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBNWDhNTV9JT01VWENfVUFSVDFf
VFhEX1VBUlQxX0RDRV9UWCAgICAgICAgICAgICAweDE0MA0KPiA+IC0gICAgICAgICAgICAgICAg
PjsNCj4gPiAtICAgICAgICB9Ow0KPiA+IC19Ow0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4bW0tcGluY3RybC55
YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2ws
aW14OG1tLXBpbmN0cmwueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMC4uYTNjNDI3NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwueWFtDQo+
ID4gKysrIGwNCj4gPiBAQCAtMCwwICsxLDY5IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCj4gDQo+IFNvcnJ5LCBvbmUgb3RoZXIgdGhpbmcuDQo+
IA0KPiBZb3UncmUgZ29vZCB3aXRoIEdQTHY5PyBQbHVzIHRoaXMgaXMgYSBsaWNlbnNlIGNoYW5n
ZS4gRG8geW91IGhhdmUgcmlnaHRzIHRvDQo+IGRvIHNvIGFzIHNvbWUgb2YgdGhpcyBjb21lcyBm
cm9tIHRoZSBvbGQgYmluZGluZyBkb2M/IElmIHlvdSBkbywgdGhlbiBtYWtlDQoNClllcywgaXQg
c2hvdWxkIGJlIEdQTC0yLjAsIHdpbGwgZml4IGl0IGluIFYzLg0KDQpUaGFua3MsDQpBbnNvbg0K
