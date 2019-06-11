Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDE83C7F2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 12:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403883AbfFKKAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 06:00:40 -0400
Received: from mail-eopbgr40073.outbound.protection.outlook.com ([40.107.4.73]:19353
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727726AbfFKKAk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jun 2019 06:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKCs/l8ReRm7UvPlza56Cg9JjVoAdj9dZGcz0xpJ7D8=;
 b=fEkLdMkAnqv85SCNscXyrEcC4T1WusPf5l1aD2KER8YI9g7AZ+JkbH4d8Qn3l1OK4ghxPl9uKR9BgQ+RzHGk8rulZ7n6lbixmwxwiqwBkgL9+/mWABPExeu+i/Cs3YcxoYP8pkM4GAKLDKGgugaO/qDp6fEA87IJWcVVOdCdwpI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4689.eurprd04.prod.outlook.com (20.176.214.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Tue, 11 Jun 2019 10:00:36 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4%3]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:00:36 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for i.MX8MN
Thread-Topic: [PATCH 1/3] dt-bindings: imx: Add pinctrl binding doc for
 i.MX8MN
Thread-Index: AQHVFpRumCyIBeRsW0uQNvKpc4bmq6aQvAOAgAWFwOA=
Date:   Tue, 11 Jun 2019 10:00:36 +0000
Message-ID: <AM0PR04MB421171336B9206D02FF6514080ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190530030546.9224-1-Anson.Huang@nxp.com>
 <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
In-Reply-To: <CACRpkdY-35o378Ka+4bgeSPjmq6P8DM872sgTxq2X3dDP9XZHQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c088463-e407-42fa-55c7-08d6ee53a6b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4689;
x-ms-traffictypediagnostic: AM0PR04MB4689:
x-microsoft-antispam-prvs: <AM0PR04MB4689D219E6146588739A2F3B80ED0@AM0PR04MB4689.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(376002)(136003)(366004)(39860400002)(189003)(199004)(486006)(52536014)(71200400001)(71190400001)(68736007)(25786009)(446003)(6436002)(11346002)(476003)(229853002)(53936002)(316002)(55016002)(54906003)(9686003)(44832011)(110136005)(256004)(3846002)(5660300002)(6116002)(7416002)(26005)(478600001)(14454004)(4326008)(186003)(53546011)(33656002)(6506007)(6246003)(2906002)(305945005)(73956011)(66946007)(81156014)(8676002)(66476007)(64756008)(66446008)(8936002)(86362001)(66556008)(76116006)(74316002)(7696005)(66066001)(81166006)(76176011)(99286004)(102836004)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4689;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nmod2sVtLKZTvzkJB/cXomYqiaiDfhS2NSeqH+ZvQbuuEiwmu3W8IHUFaH/zt0wZcZpIEKF2l0ALwVrvFUEGTOgtvOo71vnZZLgt6wVeOW2AbtAGX/E//cWgHlXfAUr2izabkR7YW6BhOudK0gItqEt4p7bmwaIrRUv+vj6ja+ju3BOejnFYXl91KmExKPzLtFvHd47gUdzrebDzCBYJLCop+PhWiq/E5/5ZDCLr6INxcO0T3OonBftrsEKCTlwQhXMpvEPH2vcLtmC5odANpH+5tQ5T4x3VKULGlKQnrKfbc8S412gta4+OEMW55YF5MoLYtO8JxoyRUSvHHvXnjZCoKC1c8qgPeiXo03r3egDMwC71hLZ+z3OqIbimerM5pt/D4Ffm8o/8p6ZYICaI//cnD1FEQ+G/bxkdWnnFVEY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c088463-e407-42fa-55c7-08d6ee53a6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:00:36.4311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4689
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBMaW51cyBXYWxsZWlqIFttYWlsdG86bGludXMud2FsbGVpakBsaW5hcm8ub3JnXQ0K
PiBTZW50OiBTYXR1cmRheSwgSnVuZSA4LCAyMDE5IDU6MDQgQU0NCj4gDQo+IE9uIFRodSwgTWF5
IDMwLCAyMDE5IGF0IDU6MDQgQU0gPEFuc29uLkh1YW5nQG54cC5jb20+IHdyb3RlOg0KPiANCj4g
PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCBi
aW5kaW5nIGRvYyBmb3IgaS5NWDhNTiBwaW5jdHJsIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiANCj4gTG9va3MgbW9z
dGx5IE9LIHRvIG1lLCBidXQgSSdkIGxpa2UgdGhlIG1haW50YWluZXJzIHRvIHJldmlldywgc28g
RG9uZyBldCBhbA0KPiBwbGVhc2UgbG9vayBhdCB0aGlzIQ0KPiANCj4gPiArUmVxdWlyZWQgcHJv
cGVydGllczoNCj4gPiArLSBjb21wYXRpYmxlOiAiZnNsLGlteDhtbi1pb211eGMiDQo+IA0KPiBT
byBzaG91bGQgdGhpcyBub3QgYmUgIm54cCxpbXg4bW4taW9tdXhjIg0KPiBvciAibnhwLGZyZWVz
Y2FsZS1pbXg4bW4taW9tdXhjIiBvciBzb21ldGhpbmcgdGhlc2UgZGF5cz8gVGhlIHZlbmRvciBu
YW1lDQo+IGlzIG54cCBpcyBpdCBub3QuDQo+IA0KPiBJIHdhcyBjb21wbGFpbmluZyB0byB0aGUg
RFQgbWFpbnRhaW5lcnMgYXQgb25lIHBvaW50IHRoYXQgdGhlc2UgY29tcGFuaWVzDQo+IHNlZW0g
dG8gYnV5IGVhY2ggb3RoZXIgbGVmdCBhbmQgcmlnaHQgc28gdGhpcyB2ZW5kb3Igbm9tZW5jbGF0
dXJlIGlzIGR1YmlvdXMsDQo+IGJ1dCBJIGd1ZXNzIGF0IGxlYXN0IGl0IHNob3VsZCByZWZsZWN0
IHRoZSB2ZW5kb3IgdGhhdCBwcm9kdWNlZCB0aGUgY2hpcCBvcg0KPiBzb21ldGhpbmcuDQo+IA0K
PiBJZiBldmVyeW9uZSBpcyBoYXBweSB3aXRoICJmc2wsKiIgSSB3aWxsIG5vdCBjb21wbGFpbiB0
aG91Z2guDQo+IChpLmUuIGlmIHRoZSBtYWludGFpbmVycyBBQ0sgaXQuKQ0KDQpXZSBwcmVmZXJy
ZWQgdG8ga2VlcCAiZnNsLCoiIGZvciBGcmVlc2NhbGUgaS5NWCBwcm9kdWN0IGxpbmUgYWNjb3Jk
aW5nIHRvIGxhc3QgZGlzY3Vzc2lvbi4NCkFuZCB3ZSBhbHJlYWR5IGRpZCB0aGlzIHdheSBmb3Ig
bW9zdCBpLk1YIGRldmljZXMuDQoNClNvOg0KQWNrZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVu
Zy5kb25nQG54cC5jb20+DQoNCihSb2IsIHBsZWFzZSBsZXQgdXMga25vdyBpZiB5b3UgaGF2ZSBk
aWZmZXJlbnQgaWRlYSkNCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4gDQo+IFlvdXJzLA0K
PiBMaW51cyBXYWxsZWlqDQo=
