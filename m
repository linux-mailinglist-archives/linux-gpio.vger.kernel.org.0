Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2C8D3C94C
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 12:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfFKKqj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 06:46:39 -0400
Received: from mail-eopbgr60055.outbound.protection.outlook.com ([40.107.6.55]:42885
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728630AbfFKKqj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 06:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsjhyV17m37CgponAPUyhi72H4hVlc4WCE9sH9b1IOA=;
 b=iNSXtZpNMGTNx67n8GhnviFmVFIKolHJNo5swaDejHDWQ9uxZUMyio5RwMIvt7A0NcsOHumWncSWOGe3b6iI1mZB528zmB3MR5BHNXt04f6d2Eer9AUupJczuzLK9o2XL7nMRqYWFGisXZL5yfxuURSrYEwGT2rqh5FYyAoPTt8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4722.eurprd04.prod.outlook.com (20.176.214.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Tue, 11 Jun 2019 10:45:52 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4%3]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:45:52 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
        "olof@lixom.net" <olof@lixom.net>,
        "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/3] pinctrl: freescale: Add i.MX8MN pinctrl driver
 support
Thread-Topic: [PATCH 2/3] pinctrl: freescale: Add i.MX8MN pinctrl driver
 support
Thread-Index: AQHVFpRuRAcdccdgb0qyMoE7LDL/16aWS/3A
Date:   Tue, 11 Jun 2019 10:45:51 +0000
Message-ID: <AM0PR04MB4211964EA3993A99465D861980ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <20190530030546.9224-2-Anson.Huang@nxp.com>
In-Reply-To: <20190530030546.9224-2-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8869f2b7-1dc2-4722-9f2d-08d6ee59f93e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4722;
x-ms-traffictypediagnostic: AM0PR04MB4722:
x-microsoft-antispam-prvs: <AM0PR04MB472223DDEFFB52335A1CC2FE80ED0@AM0PR04MB4722.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(7736002)(2501003)(73956011)(8676002)(8936002)(25786009)(6246003)(33656002)(81156014)(76176011)(86362001)(81166006)(2201001)(26005)(446003)(316002)(99286004)(53936002)(76116006)(66066001)(11346002)(305945005)(6436002)(102836004)(66476007)(476003)(44832011)(5660300002)(486006)(4326008)(74316002)(7696005)(14454004)(66556008)(64756008)(2906002)(256004)(68736007)(66446008)(478600001)(66946007)(186003)(71190400001)(71200400001)(55016002)(229853002)(9686003)(7416002)(3846002)(14444005)(110136005)(52536014)(6116002)(6506007)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4722;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M34l5IPyv7j4LHrBL6//VA29xQ/Si83dIr9BdsZzJGrWMgbvSiQRVC9YQz/Bhg/6JZ9FvPFWGxmwF3n95lzQ4EPtgeKJFZWXNnVyJBVeyBs3Yt3EThqHJTYp/Zl/N0w+wAp9FXo0TZIOpervdl+eM652r7xp+rZgcHiE4ER6lUNpqw6S6ngehe4idHTC7g7rExM5HL0lZiBaMyybLfnoGUn8oBa6whZkmJD52xEN7nARAiTXhGL6q1OqDujJ+1SQN0RaC+Eq4cCZjYYskdR2itBzqEk+pxdSVXBYyqJZVr48vqq5ADZo/MbuOEhuUZQbhQGROkdap+NZB30NiZcMiLdAbGYG8EQXt7AvA/mncActa80IwZ/h4BjPW2tNz18YijCKec1XpJqDXM0e06LZMornPLXsYOqRjdivh6tP2ZU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8869f2b7-1dc2-4722-9f2d-08d6ee59f93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:45:51.9905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4722
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIFttYWlsdG86QW5zb24uSHVhbmdAbnhwLmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIE1heSAzMCwgMjAxOSAxMTowNiBBTQ0KPiANCj4gRnJvbTogQW5z
b24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+IA0KPiBBZGQgdGhlIHBpbmN0cmwgZHJp
dmVyIHN1cHBvcnQgZm9yIGkuTVg4TU4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFu
ZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNj
YWxlL0tjb25maWcgICAgICAgICAgfCAgIDcgKw0KPiAgZHJpdmVycy9waW5jdHJsL2ZyZWVzY2Fs
ZS9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUv
cGluY3RybC1pbXg4bW4uYyB8IDM0OA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCAzNTYgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXg4bW4uYw0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvS2NvbmZpZyBiL2RyaXZlcnMvcGlu
Y3RybC9mcmVlc2NhbGUvS2NvbmZpZw0KPiBpbmRleCBhZWFiMGQ5Li40ZmY1MmZhIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL0tjb25maWcNCj4gKysrIGIvZHJpdmVy
cy9waW5jdHJsL2ZyZWVzY2FsZS9LY29uZmlnDQo+IEBAIC0xMjMsNiArMTIzLDEzIEBAIGNvbmZp
ZyBQSU5DVFJMX0lNWDdVTFANCj4gIAloZWxwDQo+ICAJICBTYXkgWSBoZXJlIHRvIGVuYWJsZSB0
aGUgaW14N3VscCBwaW5jdHJsIGRyaXZlcg0KPiANCj4gK2NvbmZpZyBQSU5DVFJMX0lNWDhNTg0K
DQpOaXRwaWNrOiB0aGlzIHNlZW1zIHNob3VsZCBiZSB1bmRlciBpbXg4bW0gaWYgaW4gYWxwaGFi
ZXRpY2FsIG9yZGVyDQoNCj4gKwlib29sICJJTVg4TU4gcGluY3RybCBkcml2ZXIiDQo+ICsJZGVw
ZW5kcyBvbiBBUkNIX01YQyAmJiBBUk02NA0KPiArCXNlbGVjdCBQSU5DVFJMX0lNWA0KPiArCWhl
bHANCj4gKwkgIFNheSBZIGhlcmUgdG8gZW5hYmxlIHRoZSBpbXg4bW4gcGluY3RybCBkcml2ZXIN
Cj4gKw0KPiAgY29uZmlnIFBJTkNUUkxfSU1YOE1NDQo+ICAJYm9vbCAiSU1YOE1NIHBpbmN0cmwg
ZHJpdmVyIg0KPiAgCWRlcGVuZHMgb24gQVJDSF9NWEMgJiYgQVJNNjQNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL3BpbmN0cmwv
ZnJlZXNjYWxlL01ha2VmaWxlDQo+IGluZGV4IDAyMDIwYTcuLjE4MjI1ZGEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9w
aW5jdHJsL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiBAQCAtMTgsNiArMTgsNyBAQCBvYmotJChDT05G
SUdfUElOQ1RSTF9JTVg2U1gpCSs9IHBpbmN0cmwtaW14NnN4Lm8NCj4gIG9iai0kKENPTkZJR19Q
SU5DVFJMX0lNWDZVTCkJKz0gcGluY3RybC1pbXg2dWwubw0KPiAgb2JqLSQoQ09ORklHX1BJTkNU
UkxfSU1YN0QpCSs9IHBpbmN0cmwtaW14N2Qubw0KPiAgb2JqLSQoQ09ORklHX1BJTkNUUkxfSU1Y
N1VMUCkJKz0gcGluY3RybC1pbXg3dWxwLm8NCj4gK29iai0kKENPTkZJR19QSU5DVFJMX0lNWDhN
TikJKz0gcGluY3RybC1pbXg4bW4ubw0KDQpkaXR0bw0KDQo+ICBvYmotJChDT05GSUdfUElOQ1RS
TF9JTVg4TU0pCSs9IHBpbmN0cmwtaW14OG1tLm8NCj4gIG9iai0kKENPTkZJR19QSU5DVFJMX0lN
WDhNUSkJKz0gcGluY3RybC1pbXg4bXEubw0KPiAgb2JqLSQoQ09ORklHX1BJTkNUUkxfSU1YOFFN
KQkrPSBwaW5jdHJsLWlteDhxbS5vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvZnJl
ZXNjYWxlL3BpbmN0cmwtaW14OG1uLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3Bp
bmN0cmwtaW14OG1uLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4u
NjcxNjFkZg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9mcmVlc2Nh
bGUvcGluY3RybC1pbXg4bW4uYw0KPiBAQCAtMCwwICsxLDM0OCBAQA0KPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAxOC0yMDE5
IE5YUA0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9pbml0Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQoNClRoaXMg
Y291bGQgYmUgb2YuaA0KDQpPdGhlcndpc2U6DQpBY2tlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNo
ZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQo=
