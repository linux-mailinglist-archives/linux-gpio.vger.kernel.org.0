Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2ED73C959
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 12:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387560AbfFKKwD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 06:52:03 -0400
Received: from mail-eopbgr40074.outbound.protection.outlook.com ([40.107.4.74]:22631
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387489AbfFKKwC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 06:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPvnWu3FFfI5wL/TOLxlpYANYvESdJTFIUZyEBdJAs0=;
 b=RrepAC0Yn/zUfmOTDtWlMCrkU5d7evKC8+WfXnzqWa1ct/6ILLs8CjGmerbo3AuQKUDNUWcciK8XORCqpagAxWZ85G3pMRbbKVk8ShFyNjTBKzu72oQcxjHg3TjymRwqJ5YKRaI6Kge3FsbUmnWPptRDk4/qVp2IoZwG+RVbtWI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4546.eurprd04.prod.outlook.com (52.135.149.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Tue, 11 Jun 2019 10:51:58 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4%3]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:51:58 +0000
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
Subject: RE: [PATCH 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MN by
 default
Thread-Topic: [PATCH 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MN by
 default
Thread-Index: AQHVFpRvb6leaT2HWESvmvTiSrMpmqaWWUQw
Date:   Tue, 11 Jun 2019 10:51:58 +0000
Message-ID: <AM0PR04MB4211E5EC9392837648BB488880ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <20190530030546.9224-3-Anson.Huang@nxp.com>
In-Reply-To: <20190530030546.9224-3-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d6ea856-371e-4aa6-266a-08d6ee5ad398
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4546;
x-ms-traffictypediagnostic: AM0PR04MB4546:
x-microsoft-antispam-prvs: <AM0PR04MB4546650BB5BC8FCC9710B54B80ED0@AM0PR04MB4546.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:291;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(7416002)(74316002)(3846002)(33656002)(229853002)(6116002)(6436002)(256004)(14444005)(4744005)(71190400001)(66066001)(71200400001)(9686003)(4326008)(25786009)(55016002)(14454004)(8676002)(110136005)(99286004)(2906002)(53936002)(81166006)(8936002)(305945005)(81156014)(7736002)(6246003)(5660300002)(2501003)(476003)(26005)(478600001)(186003)(2201001)(486006)(66476007)(316002)(66446008)(68736007)(446003)(73956011)(86362001)(66946007)(7696005)(66556008)(102836004)(11346002)(76176011)(52536014)(44832011)(6506007)(64756008)(76116006)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4546;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hfC4yn+yl/PtgLd18ttIPEyjk2wZkrYUF4j2g8dUPD9qwTDyFADko8pRaudG71/+p4y86mu6OTnfIi7AOJ7iFqRuZ/8C/s2ez/7XR2oHNMDbopZdgnm7fHJQUyBmJH8zq2Gq8RMG2qm5OXQM98qKBW2Fo65f1wUGSqOiX1poB71avc66AZh2yeBIvBOqawkrPQtDxG++oQLr7gUpVAcUdwUFptLDqmLeAcZHw/bHyfH24dY/ZFAU9G5EeeBr5shQwsGowt3VO8u5WFKJDpvYkt6DbKmQx47JYt6kr0axcD1k4Ozo+v2SQNYZXW1WBSRQGX5vtYQILU68Ii3v+s4NrY4c2Z0b60cvSSv4fWbDSY4iEwczi/+QYeBTKPj1fLWDPSA7mM5l/RCBxEd4WIqHmcuOfGedlqGSOkavUWm0RHY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6ea856-371e-4aa6-266a-08d6ee5ad398
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:51:58.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4546
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIFttYWlsdG86QW5zb24uSHVhbmdAbnhwLmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIE1heSAzMCwgMjAxOSAxMTowNiBBTQ0KPiANCj4gRW5hYmxlIENP
TkZJR19QSU5DVFJMX0lNWDhNTiBieSBkZWZhdWx0IHRvIHN1cHBvcnQgaS5NWDhNTiBwaW5jdHJs
DQo+IGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFu
Z0BueHAuY29tPg0KDQpOaXRwaWNrOiBwbGVhc2UgY2hlY2sgdGhlIGFscGhhYmV0aWNhbCBvcmRl
ciwNCk90aGVyd2lzZToNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0Bu
eHAuY29tPg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg0KPiAtLS0NCj4gIGFyY2gvYXJtNjQv
Y29uZmlncy9kZWZjb25maWcgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYi9hcmNo
L2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnDQo+IGluZGV4IDdjN2I2YjUuLjhkNGYyNWMgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcNCj4gKysrIGIvYXJjaC9hcm02
NC9jb25maWdzL2RlZmNvbmZpZw0KPiBAQCAtMzczLDYgKzM3Myw3IEBAIENPTkZJR19TUElfU1VO
Nkk9eQ0KPiAgQ09ORklHX1NQTUk9eQ0KPiAgQ09ORklHX1BJTkNUUkxfU0lOR0xFPXkNCj4gIENP
TkZJR19QSU5DVFJMX01BWDc3NjIwPXkNCj4gK0NPTkZJR19QSU5DVFJMX0lNWDhNTj15DQo+ICBD
T05GSUdfUElOQ1RSTF9JTVg4TU09eQ0KPiAgQ09ORklHX1BJTkNUUkxfSU1YOE1RPXkNCj4gIENP
TkZJR19QSU5DVFJMX0lNWDhRWFA9eQ0KPiAtLQ0KPiAyLjcuNA0KDQo=
