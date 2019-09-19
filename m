Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFA2B7685
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 11:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388742AbfISJmE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 05:42:04 -0400
Received: from mail-eopbgr10075.outbound.protection.outlook.com ([40.107.1.75]:14175
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388084AbfISJmD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Sep 2019 05:42:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8tYOLvXCZWJxETMQAc0R8SRkKt58yZCB6IPKTpD062+gX7voK+eRd2ywKiJMvGrAWkYc/PGiJx69if1vTdY8N7f4gPl9Iy9L8umH0xP69u5BLN8rTV7h8ZIqP8v5XvW9Wru70zAItHDOYz4lfjuC56lusEYOoYH+u0Q1mLXmip5ohwpfCczjNzkuA+q0rsMCwawuLsz8na7+1/7cvGBUDoYpMDQpANl/wyv3gguPcA/V41tqN1bSySgaWDgE/IMTdsUIWjSpnTuLpgw9L3TNLYktLobd5O7H8Qc+MHVlh+Ve1u3MzFGwvehIctR9zX3GlhEAencavHLMZjYbqg0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHpz0fU3MF0Fw07o7qxsLJvg8LkfeNgSxczHi/OZytc=;
 b=k/ONlPrU+DyLLgvYy02GGBK9f9o/pruyouwbtyHKlyXSjbMiuskMbXuLgwPro37f4GIS2NizpC61rffElBU2mQC3n5dmJCbcqL3Fuq3ohSv5u/jf6PD8/N69RDS6FiJgyASk1nGZz/2Uw0tFDvmfh2cZbTnj+t1tIR5XjhqF/qPgcN9WY3Hpi2z213xza8vnh4T9BGifFugojXV02GidW4SxECkuoUNVq09hwP8SY1lqm+wO2g0Pifinh8c/1JP+XMRj8lPSTDXiKXdhd6S1bw0MSlcHCjuyRyy+jaZKAoQzrr5W8q8PsqoRnBwJ4MQ9uBnVuSBralsk+WYZWxfj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHpz0fU3MF0Fw07o7qxsLJvg8LkfeNgSxczHi/OZytc=;
 b=CMnTuLuNzbgBkB8VHZPe6LaXKYc5EUp1F7dyqa5la8/62GenEu1C+FWzKh/fdPNBQRfzMymQMli0LIIXfHE8piP6TmnChW1toa4SNNDASFJWzaaQPUAbnVbVJQmtT8iiYnF0+v5G/AKqzH33cExGtinbGJ3huDnvFVyX36xJZ5M=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3802.eurprd04.prod.outlook.com (52.134.71.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Thu, 19 Sep 2019 09:41:14 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8958:299c:bc54:2a38%7]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 09:41:14 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] gpio: mxc: Only getting second IRQ when there is more
 than one IRQ
Thread-Topic: [PATCH] gpio: mxc: Only getting second IRQ when there is more
 than one IRQ
Thread-Index: AQHVbrEA0w9OqiFJ5U+3vB4co0AMXacyl1uAgAAnu6A=
Date:   Thu, 19 Sep 2019 09:41:14 +0000
Message-ID: <DB3PR0402MB3916C1DC9F3E83E1C4441679F5890@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1568873377-13433-1-git-send-email-Anson.Huang@nxp.com>
 <CAMpxmJVm+HyKOgoEVnU0tcJ1A4ghGC=Vvf0Kw40Js=O-C_t1=w@mail.gmail.com>
In-Reply-To: <CAMpxmJVm+HyKOgoEVnU0tcJ1A4ghGC=Vvf0Kw40Js=O-C_t1=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb1cb8b6-fd3d-4ed6-85d1-08d73ce58355
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3802;
x-ms-traffictypediagnostic: DB3PR0402MB3802:|DB3PR0402MB3802:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3802AABCD15C677D8A601A48F5890@DB3PR0402MB3802.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(199004)(189003)(54906003)(6506007)(256004)(52536014)(76176011)(66946007)(44832011)(7736002)(316002)(186003)(74316002)(71200400001)(71190400001)(26005)(99286004)(5660300002)(11346002)(486006)(102836004)(6916009)(9686003)(33656002)(305945005)(7696005)(476003)(446003)(6246003)(478600001)(55016002)(3846002)(6116002)(86362001)(81156014)(81166006)(229853002)(8676002)(66446008)(64756008)(25786009)(66556008)(76116006)(14454004)(8936002)(6436002)(2906002)(4326008)(66476007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3802;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G3n/hQFCo2vh2NEMzvWckJpRIJYl0KOAxnBF7w5ncppdKV+RjCSscQIb5pNwW6TqkuLqDBmGtazGpezBR4tn4DsOq0PWXQyMHWoI4UMhoRkNd46fLFZSVBO6XhGaPIwedl4jeEQ7MBElBjt40qk3qvoBMHYvCBTJ+amTAbqkag17mlqhY/TfzK9pnpcuK7ZkFjwsNUGDN4oMN2XFdqrSsBRGKQGUXztSJWz3Pa4uEn0D5AXXZdIU8gMXNl4MOIT62UCpt+nWDAiXuvShrZp41Gg7LEhh3JKQhGNT1bSuAxrf4fSeSUYgWtBp0ZFmXzJnwVmL9J7qJp5JB0iZibmt1pJinqlc6HYwDb/xF9tFa1ZMr5/u9gjmWZr3Yp0FPXrdrH/uv0II5tRQaiFU2HYPnRtiK+kMsL7yAGujHpR49qA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1cb8b6-fd3d-4ed6-85d1-08d73ce58355
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 09:41:14.3682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgWP+OZ56pGRswosWm+4mj5IZzAbMKoOKm0iHzgpAeUxbK3bZVpxGiYRnb0x8fvoH9FRA+Dd9uCZXeHROEE7Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3802
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGksIEJhcnRvc3oNCg0KPiBjencuLCAxOSB3cnogMjAxOSBvIDA4OjEwIEFuc29uIEh1YW5nIDxB
bnNvbi5IdWFuZ0BueHAuY29tPiBuYXBpc2HFgihhKToNCj4gPg0KPiA+IE9uIHNvbWUgb2YgaS5N
WCBTb0NzIGxpa2UgaS5NWDhRWFAsIHRoZXJlIGlzIE9OTFkgb25lIElSUSBmb3IgZWFjaA0KPiA+
IEdQSU8gYmFuaywgc28gaXQgaXMgYmV0dGVyIHRvIGNoZWNrIHRoZSBJUlEgY291bnQgYmVmb3Jl
IGdldHRpbmcNCj4gPiBzZWNvbmQgSVJRIHRvIGF2b2lkIGJlbG93IGVycm9yIG1lc3NhZ2UgZHVy
aW5nIHByb2JlOg0KPiA+DQo+ID4gWyAgICAxLjA3MDkwOF0gZ3Bpby1teGMgNWQwODAwMDAuZ3Bp
bzogSVJRIGluZGV4IDEgbm90IGZvdW5kDQo+ID4gWyAgICAxLjA3NzQyMF0gZ3Bpby1teGMgNWQw
OTAwMDAuZ3BpbzogSVJRIGluZGV4IDEgbm90IGZvdW5kDQo+ID4gWyAgICAxLjA4Mzc2Nl0gZ3Bp
by1teGMgNWQwYTAwMDAuZ3BpbzogSVJRIGluZGV4IDEgbm90IGZvdW5kDQo+ID4gWyAgICAxLjA5
MDEyMl0gZ3Bpby1teGMgNWQwYjAwMDAuZ3BpbzogSVJRIGluZGV4IDEgbm90IGZvdW5kDQo+ID4g
WyAgICAxLjA5NjQ3MF0gZ3Bpby1teGMgNWQwYzAwMDAuZ3BpbzogSVJRIGluZGV4IDEgbm90IGZv
dW5kDQo+ID4gWyAgICAxLjEwMjgwNF0gZ3Bpby1teGMgNWQwZDAwMDAuZ3BpbzogSVJRIGluZGV4
IDEgbm90IGZvdW5kDQo+ID4gWyAgICAxLjEwOTE0NF0gZ3Bpby1teGMgNWQwZTAwMDAuZ3Bpbzog
SVJRIGluZGV4IDEgbm90IGZvdW5kDQo+ID4gWyAgICAxLjExNTQ3NV0gZ3Bpby1teGMgNWQwZjAw
MDAuZ3BpbzogSVJRIGluZGV4IDEgbm90IGZvdW5kDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9n
cGlvL2dwaW8tbXhjLmMgfCAxMiArKysrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwaW8vZ3Bpby1teGMuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW14Yy5jIGluZGV4DQo+ID4g
NzkwN2E4Ny4uMzliYTdkZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1teGMu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLW14Yy5jDQo+ID4gQEAgLTQyNiw5ICs0MjYs
MTUgQEAgc3RhdGljIGludCBteGNfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+
ICpwZGV2KQ0KPiA+ICAgICAgICAgaWYgKElTX0VSUihwb3J0LT5iYXNlKSkNCj4gPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIocG9ydC0+YmFzZSk7DQo+ID4NCj4gPiAtICAgICAgIHBv
cnQtPmlycV9oaWdoID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKTsNCj4gPiAtICAgICAgIGlm
IChwb3J0LT5pcnFfaGlnaCA8IDApDQo+ID4gLSAgICAgICAgICAgICAgIHBvcnQtPmlycV9oaWdo
ID0gMDsNCj4gPiArICAgICAgIGVyciA9IHBsYXRmb3JtX2lycV9jb3VudChwZGV2KTsNCj4gPiAr
ICAgICAgIGlmIChlcnIgPCAwKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiA+
ICsNCj4gPiArICAgICAgIGlmIChlcnIgPiAxKSB7DQo+IA0KPiBDb3VsZCB5b3UgdXNlIGEgdmFy
aWFibGUgY2FsbGVkIGlycV9jb3VudCBvciBzb21ldGhpbmcgaGVyZT8gVGhpcyAnZXJyJyBpcyBh
DQo+IGNvbmZ1c2luZyBuYW1lIGZvciBhIHZhcmlhYmxlIHRoYXQgY29udGFpbnMgYSB2YWxpZCB2
YWx1ZS4NCg0KQWdyZWVkLCB3aWxsIHNlbmQgb3V0IGEgVjIgcGF0Y2ggdXNpbmcgbG9jYWwgdmFy
aWFibGUgaXJxX2NvdW50IGluc3RlYWQuDQoNClRoYW5rcywNCkFuc29uDQo=
