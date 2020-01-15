Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9528B13BAC8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 09:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgAOIRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 03:17:34 -0500
Received: from mail-db8eur05on2074.outbound.protection.outlook.com ([40.107.20.74]:20033
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726088AbgAOIRe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Jan 2020 03:17:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXDw7wAt7dcL/pWVltXflO1MzDEAHmDbIV4sa+ooy0IrhwTIYH6M2Bq4lyjLRA4mXlx3/C5SRaPN+IfzTdUKlocru94E9ldnkqd2rup6ejHhW6w7/cPUWSzWQiC3oZim00FBFqWCjoWQ30Ob6OjP/pI6EOTvRyIu82ejH77ZMhMWL4KD0sqRShlj39v3TndClJduPVarMwaiE+vx6aRN12oWXZ5CHIHURxYy/bpTuuznh4veMPXMYyD8dJiGWf+EUABr+s0mjOhNBUlfzkxzgL3wuv1A2kpy1TahBK086f0EZm12dLWvfIXgib+c7cuPWIwFJzH7RV+8ZfUpXmit9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neKEftfRzlC0yKWe7x7KCSXGuBZ0yPcqU1zxETGmCwo=;
 b=V7cjx2/UY4U+WItGqZAFy9G7r6mb37tBlU8bcazRA6+95GEE/d2LJ0jqCH5NhDZZ5mcAV2A9DxvctDLesNSIphhZAvqz+rtDY+wxLmBWZQQBXbw61jZUaBIYh6CUTNHgF62lNf37SCZyPSUBny7rEcNq/l+lg/8IAQgT0JPlRtJFYM3IXu/JwyExowlJeUHD6SWVPSRxw/eZCGe0QSvtwoT3sxfCSD653V76fA9LmDeRf+szFynneWVJcnTWA9ImgoKcOj+Ab/52vYcAKSLPG6XbGUjX+z10HtmYXE5TZzFVwXns0uS4GYH/XfC4WYYtd1W5qV8los9FZrRR4x6Mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neKEftfRzlC0yKWe7x7KCSXGuBZ0yPcqU1zxETGmCwo=;
 b=lzLnfcAB0hbu1xB4ljO7HF/Gfr6/44DQ3F2+GnNt9IX5eEuMFamWNzSRsGDXbcLiFqX7yT1EbABrHEiBat+ynZM1gIegYAqhArC30MYn8AYGwQFt/yxRFssE6XYHWG5ksD/1v82HoUwV4HGvcp2F+ib75a0YiY8Wc41j8JWsQyc=
Received: from AM6PR0402MB3911.eurprd04.prod.outlook.com (52.133.30.10) by
 AM6PR0402MB3398.eurprd04.prod.outlook.com (52.133.19.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 15 Jan 2020 08:17:28 +0000
Received: from AM6PR0402MB3911.eurprd04.prod.outlook.com
 ([fe80::460:8acd:2cea:5c07]) by AM6PR0402MB3911.eurprd04.prod.outlook.com
 ([fe80::460:8acd:2cea:5c07%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 08:17:28 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 2/3] dt-bindings: pinctrl: Convert i.MX8MM to
 json-schema
Thread-Topic: [PATCH V3 2/3] dt-bindings: pinctrl: Convert i.MX8MM to
 json-schema
Thread-Index: AQHVy0QBdeXjXUsE8EGtOdCk3RtGU6frUUqAgAAPbaA=
Date:   Wed, 15 Jan 2020 08:17:28 +0000
Message-ID: <AM6PR0402MB391182C3F952FE74B58718A4F5370@AM6PR0402MB3911.eurprd04.prod.outlook.com>
References: <1579051845-30378-1-git-send-email-Anson.Huang@nxp.com>
 <1579051845-30378-2-git-send-email-Anson.Huang@nxp.com>
 <20200115071757.bmblie3skdswuj2r@pengutronix.de>
In-Reply-To: <20200115071757.bmblie3skdswuj2r@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [183.192.18.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2c02f898-d025-4741-11b7-08d799935c5c
x-ms-traffictypediagnostic: AM6PR0402MB3398:|AM6PR0402MB3398:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3398667E051139997F71A97CF5370@AM6PR0402MB3398.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10001)(10009020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(8676002)(81166006)(71200400001)(76116006)(45080400002)(5660300002)(66556008)(66446008)(81156014)(66476007)(66946007)(7696005)(8936002)(64756008)(2906002)(54906003)(186003)(478600001)(33656002)(6916009)(44832011)(26005)(9686003)(6506007)(55016002)(7416002)(52536014)(53546011)(4326008)(86362001)(316002)(473944003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR0402MB3398;H:AM6PR0402MB3911.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AQ1GOI1NnFuIWuUQKo4mlfLJr+FsP4WLEGJI0PGsx6x7dt+qnIZ2+pCI8gyqz5EU6HN99hS6/cb813QrH4yasfFr7hCj/7PpmCYY8DiOGFSTcgc3qJwSVgF9kbjwd+Xj3DtWsU/FKljaKiOU3jdmfxGd1BultkM2ssftRcjfdgnceaJQz3FpxZ8p0qlLRppl/CxCn5rqXFW1sN8WYv01dhbZ4gLx3YMqIJOqtoaA/Q0jVnhWE3LJ8sRUjdtYbKFbNC97eNcGDie+ZnwyVPqZFO37HFgd4i6Uu9O+lKS5l+PN2Zy+7RypHVsAkgK6iimsjkELoE6VAE/WH1vXcqp4s7UpF4UJpRzCSrlwRdhh2M8/uU9BaMutAfl2o2eySGBpgrz8elwFCMF/XNBWmNlo2DXc7+OcHHp1/MtLK6nwJRXpaRY+wW7QTeDahiPkK6rUEOQhMyIMdBRmj7hChHddsFL6L/gNRP3JuCyYqVJnxGaSYmamwNMwNrKGJLnLUP/kvcSQDjkCuIc8DfZTkD7go69Y5U6eMP3VH1E9Vx0GlEkDHogMqoVu57qnptHjQyDzoiKy/XJMC0sUg1girD/Cjq4XT4n/LfDV6nnYthFu/f+RemqsVtEEN88obwLPvlgbToG4oQBuD4pV4H5gbxVGTQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c02f898-d025-4741-11b7-08d799935c5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 08:17:28.3175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aE0YGP2lKo7VfgJy9QsYZD+KXjEnnhhBokJtm7Gbz9R3pZggU3plU97OmP7knt+cbSbX/KhQWQy25a/8YH0sUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3398
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIE1hcmNvDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyAyLzNdIGR0LWJpbmRpbmdzOiBw
aW5jdHJsOiBDb252ZXJ0IGkuTVg4TU0gdG8ganNvbi0NCj4gc2NoZW1hDQo+IA0KPiBIaSBBbnNv
biwNCj4gDQo+IE9uIDIwLTAxLTE1IDA5OjMwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4gPiBDb252
ZXJ0IHRoZSBpLk1YOE1NIHBpbmN0cmwgYmluZGluZyB0byBEVCBzY2hlbWEgZm9ybWF0IHVzaW5n
DQo+ID4ganNvbi1zY2hlbWENCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxB
bnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZSBzaW5jZSBWMjoNCj4gPiAJ
LSB0aGUgbGlzZW5jZSBzaG91bGQgYmUgR1BMLTIuMA0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGlu
Z3MvcGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwudHh0ICAgICAgICB8IDM2IC0tLS0tLS0tLS0t
DQo+ID4gIC4uLi9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4bW0tcGluY3RybC55YW1sICAgICAg
IHwgNjkNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDY5
IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKSAgZGVsZXRlIG1vZGUNCj4gPiAxMDA2NDQN
Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1t
LXBpbmN0cmwudHh0DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4bW0tcGluY3RybC55YW1sDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGluY3RybC9mc2wsaW14OG1tLXBpbmN0cmwudHh0DQo+ID4gZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggZTRlMDFjMC4uMDAwMDAwMA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4bW0tcGlu
Y3RybC50eHQNCj4gPiArKysgL2Rldi9udWxsDQo+ID4gQEAgLTEsMzYgKzAsMCBAQA0KPiA+IC0q
IEZyZWVzY2FsZSBJTVg4TU0gSU9NVVggQ29udHJvbGxlcg0KPiA+IC0NCj4gPiAtUGxlYXNlIHJl
ZmVyIHRvIGZzbCxpbXgtcGluY3RybC50eHQgYW5kIHBpbmN0cmwtYmluZGluZ3MudHh0IGluIHRo
aXMNCj4gPiBkaXJlY3RvcnkgLWZvciBjb21tb24gYmluZGluZyBwYXJ0IGFuZCB1c2FnZS4NCj4g
PiAtDQo+ID4gLVJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gLS0gY29tcGF0aWJsZTogImZzbCxp
bXg4bW0taW9tdXhjIg0KPiA+IC0tIHJlZzogc2hvdWxkIGNvbnRhaW4gdGhlIGJhc2UgcGh5c2lj
YWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUNCj4gPiBpb211eGMNCj4gPiAtICByZWdpc3RlcnMu
DQo+ID4gLQ0KPiA+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzIGluIHN1Yi1ub2RlczoNCj4gPiAtLSBm
c2wscGluczogZWFjaCBlbnRyeSBjb25zaXN0cyBvZiA2IGludGVnZXJzIGFuZCByZXByZXNlbnRz
IHRoZSBtdXgNCj4gPiBhbmQgY29uZmlnDQo+ID4gLSAgc2V0dGluZyBmb3Igb25lIHBpbi4gIFRo
ZSBmaXJzdCA1IGludGVnZXJzIDxtdXhfcmVnIGNvbmZfcmVnDQo+ID4gaW5wdXRfcmVnIG11eF92
YWwNCj4gPiAtICBpbnB1dF92YWw+IGFyZSBzcGVjaWZpZWQgdXNpbmcgYSBQSU5fRlVOQ19JRCBt
YWNybywgd2hpY2ggY2FuIGJlDQo+ID4gZm91bmQgaW4NCj4gPiAtICA8YXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBpbmZ1bmMuaD4uIFRoZSBsYXN0IGludGVnZXINCj4gPiBD
T05GSUcgaXMNCj4gPiAtICB0aGUgcGFkIHNldHRpbmcgdmFsdWUgbGlrZSBwdWxsLXVwIG9uIHRo
aXMgcGluLiAgUGxlYXNlIHJlZmVyIHRvDQo+ID4gaS5NWDhNIE1pbmkNCj4gPiAtICBSZWZlcmVu
Y2UgTWFudWFsIGZvciBkZXRhaWxlZCBDT05GSUcgc2V0dGluZ3MuDQo+ID4gLQ0KPiA+IC1FeGFt
cGxlczoNCj4gPiAtDQo+ID4gLSZ1YXJ0MSB7DQo+ID4gLSAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOw0KPiA+IC0gICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3VhcnQxPjsNCj4g
PiAtfTsNCj4gPiAtDQo+ID4gLWlvbXV4YzogcGluY3RybEAzMDMzMDAwMCB7DQo+ID4gLSAgICAg
ICAgY29tcGF0aWJsZSA9ICJmc2wsaW14OG1tLWlvbXV4YyI7DQo+ID4gLSAgICAgICAgcmVnID0g
PDB4MCAweDMwMzMwMDAwIDB4MCAweDEwMDAwPjsNCj4gPiAtDQo+ID4gLSAgICAgICAgcGluY3Ry
bF91YXJ0MTogdWFydDFncnAgew0KPiA+IC0gICAgICAgICAgICAgICAgZnNsLHBpbnMgPSA8DQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIE1YOE1NX0lPTVVYQ19VQVJUMV9SWERfVUFSVDFf
RENFX1JYICAgICAgICAgICAgIDB4MTQwDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIE1Y
OE1NX0lPTVVYQ19VQVJUMV9UWERfVUFSVDFfRENFX1RYICAgICAgICAgICAgIDB4MTQwDQo+ID4g
LSAgICAgICAgICAgICAgICA+Ow0KPiA+IC0gICAgICAgIH07DQo+ID4gLX07DQo+ID4gZGlmZiAt
LWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvZnNs
LGlteDhtbS1waW5jdHJsLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL2ZzbCxpbXg4bW0tcGluY3RybC55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi44YjJkZTkzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2ZzbCxpbXg4
bW0tcGluY3RybC55YW0NCj4gPiArKysgbA0KPiA+IEBAIC0wLDAgKzEsNjkgQEANCj4gPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0t
DQo+ID4gKyRpZDoNCj4gPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4gK2NldHJlZS5vcmclMkZzY2hlbWFz
JTJGcGluY3RybCUyRmZzbCUyQ2lteDhtbS0NCj4gcGluY3RybC55YW1sJTIzJmFtcDtkYXQNCj4g
Pg0KPiArYT0wMiU3QzAxJTdDYW5zb24uaHVhbmclNDBueHAuY29tJTdDNTk0MGJkMzVmYTJiNDMy
Y2NkOTAwOGQ3OQ0KPiA5OGIxMzY2JQ0KPiA+DQo+ICs3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5
YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcxNDY2OTQ5MTQ1ODMxMg0KPiA0JmFtcDtzDQo+ID4NCj4g
K2RhdGE9SnFQQVZhcWMlMkJ2ZEg5VUR5MkVrWUVWZjlzMUlyRHp2Z0xCb3llSmdZbm5BJTNEJmFt
cDtyZXNlDQo+IHJ2ZWQ9MA0KPiA+ICskc2NoZW1hOg0KPiA+ICtodHRwczovL2V1cjAxLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRldmkNCj4gPiAr
Y2V0cmVlLm9yZyUyRm1ldGEtDQo+IHNjaGVtYXMlMkZjb3JlLnlhbWwlMjMmYW1wO2RhdGE9MDIl
N0MwMSU3Q2Fuc29uLmh1YQ0KPiA+DQo+ICtuZyU0MG54cC5jb20lN0M1OTQwYmQzNWZhMmI0MzJj
Y2Q5MDA4ZDc5OThiMTM2NiU3QzY4NmVhMWQzYmMyDQo+IGI0YzZmYTkyDQo+ID4NCj4gK2NkOTlj
NWMzMDE2MzUlN0MwJTdDMCU3QzYzNzE0NjY5NDkxNDU4MzEyNCZhbXA7c2RhdGE9Nm9KTnBiZ0sN
Cj4gJTJGaElOTFINCj4gPiAraiUyQjZrVjhSbndQa2ZjZHVneFUzYUhMWlhMelR0byUzRCZhbXA7
cmVzZXJ2ZWQ9MA0KPiA+ICsNCj4gPiArdGl0bGU6IEZyZWVzY2FsZSBJTVg4TU0gSU9NVVggQ29u
dHJvbGxlcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBBbnNvbiBIdWFuZyA8
QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsgIFBs
ZWFzZSByZWZlciB0byBmc2wsaW14LXBpbmN0cmwudHh0IGFuZCBwaW5jdHJsLWJpbmRpbmdzLnR4
dCBpbg0KPiA+ICt0aGlzIGRpcmVjdG9yeQ0KPiA+ICsgIGZvciBjb21tb24gYmluZGluZyBwYXJ0
IGFuZCB1c2FnZS4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToN
Cj4gPiArICAgIGNvbnN0OiBmc2wsaW14OG1tLWlvbXV4Yw0KPiA+ICsNCj4gPiArICByZWc6DQo+
ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArIyBDbGllbnQgZGV2aWNlIHN1Ym5vZGUn
cyBwcm9wZXJ0aWVzDQo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ICsgICdncnAkJzoNCj4g
PiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFBp
bmN0cmwgbm9kZSdzIGNsaWVudCBkZXZpY2VzIHVzZSBzdWJub2RlcyBmb3IgZGVzaXJlZCBwaW4g
Y29uZmlndXJhdGlvbi4NCj4gPiArICAgICAgQ2xpZW50IGRldmljZSBzdWJub2RlcyB1c2UgYmVs
b3cgc3RhbmRhcmQgcHJvcGVydGllcy4NCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+
ICsgICAgICBmc2wscGluczoNCj4gPiArICAgICAgICBhbGxPZjoNCj4gPiArICAgICAgICAgIC0g
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5DQo+ID4g
KyAgICAgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgICAgICBlYWNoIGVudHJ5IGNvbnNpc3Rz
IG9mIDYgaW50ZWdlcnMgYW5kIHJlcHJlc2VudHMgdGhlIG11eCBhbmQgY29uZmlnDQo+ID4gKyAg
ICAgICAgICBzZXR0aW5nIGZvciBvbmUgcGluLiBUaGUgZmlyc3QgNSBpbnRlZ2VycyA8bXV4X3Jl
ZyBjb25mX3JlZyBpbnB1dF9yZWcNCj4gPiArICAgICAgICAgIG11eF92YWwgaW5wdXRfdmFsPiBh
cmUgc3BlY2lmaWVkIHVzaW5nIGEgUElOX0ZVTkNfSUQgbWFjcm8sIHdoaWNoDQo+IGNhbg0KPiA+
ICsgICAgICAgICAgYmUgZm91bmQgaW4gPGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtbS1waW5mdW5jLmg+Lg0KPiBUaGUgbGFzdA0KPiA+ICsgICAgICAgICAgaW50ZWdlciBDT05G
SUcgaXMgdGhlIHBhZCBzZXR0aW5nIHZhbHVlIGxpa2UgcHVsbC11cCBvbiB0aGlzIHBpbi4NCj4g
UGxlYXNlDQo+ID4gKyAgICAgICAgICByZWZlciB0byBpLk1YOE0gTWluaSBSZWZlcmVuY2UgTWFu
dWFsIGZvciBkZXRhaWxlZCBDT05GSUcgc2V0dGluZ3MuDQo+ID4gKw0KPiA+ICsgICAgcmVxdWly
ZWQ6DQo+ID4gKyAgICAgIC0gZnNsLHBpbnMNCj4gPiArDQo+ID4gKyAgICBhZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJs
ZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
Cj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgICMgUGlubXV4IGNvbnRyb2xsZXIgbm9kZQ0K
PiA+ICsgIC0gfA0KPiA+ICsgICAgaW9tdXhjOiBwaW5jdHJsQDMwMzMwMDAwIHsNCj4gPiArICAg
ICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4bW0taW9tdXhjIjsNCj4gPiArICAgICAgICByZWcg
PSA8MHgzMDMzMDAwMCAweDEwMDAwPjsNCj4gPiArDQo+ID4gKyAgICAgICAgcGluY3RybF91YXJ0
MjogdWFydDJncnAgew0KPiA+ICsgICAgICAgICAgICBmc2wscGlucyA9IDwNCj4gPiArICAgICAg
ICAgICAgICAgIDB4MjNDIDB4NEE0IDB4NEZDIDB4MCAweDAJMHgxNDANCj4gDQo+IFdoeSB3ZSBj
YW4ndCB1c2UgdGhlIHBpbmN0cmwgZGVmaW5lcyBsaWtlDQo+IE1YOE1NX0lPTVVYQ19VQVJUMV9S
WERfVUFSVDFfRENFX1JYIGFueW1vcmU/DQoNClRoZSByZWFzb24gd2h5IEkgcHV0IHRoZSB2YWx1
ZSBOT1QgbWFjcm8gZGVmaW5lIGhlcmUgaXMgdGhlIGhlYWRlciBmaWxlIGlzIHB1dA0KaW4gYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvIGZvbGRlciByYXRoZXIgdGhhbiBpbmNsdWRlL2R0
LWJpbmRpbmcvcGluY3RybC8sDQpzbyB3aGVuIHVzaW5nIG1hY3JvIGRlZmluZSwgbmVlZCB0byBp
bmNsdWRlIHRoZSBoZWFkZXIgZmlsZSB1c2luZyBhYnNvbHV0ZSBwYXRoIA0KYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvLCBJIHRoaW5rIGl0IGlzIE5PVCB0aGF0IGdvb2QsIHNvIEkgcHV0
IHRoZSB2YWx1ZSBoZXJlIGRpcmVjdGx5Lg0KDQpBbnNvbi4NCg0K
