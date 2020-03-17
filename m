Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAA018778D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2020 02:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCQBnV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 21:43:21 -0400
Received: from mail-eopbgr140049.outbound.protection.outlook.com ([40.107.14.49]:62008
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726623AbgCQBnV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Mar 2020 21:43:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLvHHdLMn+uyVv3iLvgGsengNaMAt7iFahYc1b9xJpjoUjbsL8c6XQ9B71/pRhk/oLwVc43IAjdAoaE/Swyc7mCOWvxTGS/WlDZC16+i8ACdn3rG3NZ4rAljSMvGriE+mI4S5//VMoXyJyVXpVtDBkCCojZ4mrv4YfE58dT3BV2Qb2Da/tjbAOTq58GjV/qllbN9kQtfbkpGiKIXbBtQn3nmZneXvE/K0O3fj7SwQLlNlfjcHBJ7p61Gu3Xa9RpPzSPgu6KDZMJgzu7YRczUQSc7Yi+PSeIGjP80oNe5h+riaq0A/bch5JlaK974T79aB+diXVVyu1PmPH2iQczSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjpPiMG0v4kANUg/vdZM4fkyh5Kkv2kMkxAAm5cqWr0=;
 b=HZU61vdmhmptyNufYNR8uIsnsA4FzxfDoMQWbWX6rWEl3nau3MX4cK+xxPfUqltsqKFBSQzC9CjJ8OV3pzMmCLz7+loKnDLKDnx1rFrmYwpUktj+hHY7Jg2pPnfCj6VmZGesR2iGO0xJzr5cUDYojCfbKUh7Q92kXfv2oshXiG5QPZBZT7po+Oh1FwYXs4bNKmZGO4cnvpm1pxZjzXJ1A+614xhzWoNjBRcSBgfOyJDRlQ2K67H8Wyy5YNnMbbbxaLqAoPynZ75rry3YtnEcaSNaQvkN9EqpGn6Wmo11pk0mlSziZqV3UIBPARQCDrNQwzoKuAtTFkr+IyuhOp35bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjpPiMG0v4kANUg/vdZM4fkyh5Kkv2kMkxAAm5cqWr0=;
 b=B+DdGP6rEcCkA/v85XAe0G7cm7CxaqurRZAAG+bXL0HT+UDUtFicbzAUosZM6dMHhJez1waNZ45z2wa9qevYFnZ+OME9Qj5pvma7b9HXwTfFEHPhjjP/j7K4xuoIJuMjbridMiBlEtbBJmf3TAfuWmCUxrDwL7ghDVgAPhql4eY=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5124.eurprd04.prod.outlook.com (20.177.40.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Tue, 17 Mar 2020 01:43:05 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 01:43:05 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Aisheng Dong <aisheng.dong@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
Thread-Topic: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
Thread-Index: AQHV+OhCoWIlKfRHBEqAZhv4+QN6jahGTaKAgAR8rgCAABcfgIABJn0w
Date:   Tue, 17 Mar 2020 01:43:05 +0000
Message-ID: <AM0PR04MB4481E9713BCBF6B0E924750988F60@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
 <1584070036-26447-4-git-send-email-peng.fan@nxp.com>
 <CAK8P3a14BU5uHEqkVyWkeFVmxA1hJifQE+GkXFgmn59s_TL+Rw@mail.gmail.com>
 <AM0PR04MB4481E7BC1DF01CFC975577A088F90@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CAK8P3a2F4oREw8AgNqQo18hLfVG4GcMJ72bST6EBd_KYhsRfsA@mail.gmail.com>
In-Reply-To: <CAK8P3a2F4oREw8AgNqQo18hLfVG4GcMJ72bST6EBd_KYhsRfsA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 000c6652-30f5-4afe-ccd9-08d7ca148995
x-ms-traffictypediagnostic: AM0PR04MB5124:|AM0PR04MB5124:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB512453D506178D711845E67B88F60@AM0PR04MB5124.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(199004)(71200400001)(9686003)(6916009)(8936002)(33656002)(26005)(8676002)(81156014)(186003)(4326008)(54906003)(55016002)(53546011)(86362001)(6506007)(7416002)(81166006)(44832011)(316002)(7696005)(66446008)(66476007)(66556008)(64756008)(66946007)(76116006)(5660300002)(52536014)(2906002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5124;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6C6VFT2qSpuzbrn/bUH8l84S3O1uCi7u4uhXbd6f/CbeCxRNn3SUtWsu1QEIgKjwaWvU1quBJPLmdlfbcO3z+EskQTJ0/uSuDKHevqn9Qso7vxmyQAalINv6VBxuevfrB9JhH6HCpM+N/ilKNebsUWB5lEMFCgC12sF2wg8gn8PDTRuAedXNp4lgVssD7R2Pr1kacjN03wYN3WZAJGhdHqF/a2RVgWQ7uWnuVN79n1YmWLLFFkJYhZ6OaiBddTUQ5YHDBt/NNyjlqY1cnumwLW6FgX6zAX3xxoGUpAnaSKIqZ8TKURhNsdmqc2Dq0Zffi9a1Rxh7BWkk4taEkTFBOU8hZfWT8zy5NiuWniVMyFFlrsSgAyF3bjVIkONhdRayXsEZ+RDU/3qkHwTQPIapWLh64kfASz0lSsc3frQkdYDKWBb15G1O8lHvaPZH3BLe
x-ms-exchange-antispam-messagedata: q1n3qvz/N5N5Oc+0UVdzPF+9aYfACUZbk0n1DTEYdshpLaf5sPwI2ljIsnX20QAxq6CzBCCkf+HvCaLl4OaUzxuntCDWG/WCqzj5XNbF/4hEvaaELySHyHUGh9O3sKXd7gpiDrPNoM85uPhQx5n0CQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000c6652-30f5-4afe-ccd9-08d7ca148995
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 01:43:05.1088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyLzvrrWNYqczCNHnXXNaa4goLML75G6ntoGlPO632Fl3PM2+qa/DLa9YzLZr7yvjK8QCvZmcB2nY9jhY36W9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5124
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQXJuZCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gc29jOiBpbXg6IHNlbGVjdCBB
Uk1fR0lDX1YzIGZvciBpLk1YOE0NCj4gDQo+IE9uIE1vbiwgTWFyIDE2LCAyMDIwIGF0IDc6NDMg
QU0gUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCAzLzNdIHNvYzogaW14OiBzZWxlY3QgQVJNX0dJQ19WMyBmb3IgaS5NWDhNDQo+ID4g
Pg0KPiA+ID4gT24gRnJpLCBNYXIgMTMsIDIwMjAgYXQgNDozNCBBTSA8cGVuZy5mYW5AbnhwLmNv
bT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPg0KPiA+ID4gPg0KPiA+ID4gPiBTZWxlY3QgQVJNX0dJQ19WMywgdGhlbiBpdCBpcyBhYmxl
IHRvIHVzZSBnaWMgdjMgZHJpdmVyIGluIGFhcmNoMzINCj4gPiA+ID4gbW9kZSBsaW51eCBvbiBh
YXJjaDY0IGhhcmR3YXJlLiBGb3IgYWFyY2g2NCBtb2RlLCBpdCBub3QgaHVydHMgdG8NCj4gPiA+
ID4gc2VsZWN0IEFSTV9HSUNfVjMuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBl
bmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+DQo+ID4gPiBBY2tl
ZC1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gPiA+DQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9pbXgvS2NvbmZpZyBiL2RyaXZlcnMvc29jL2lteC9LY29uZmln
DQo+ID4gPiA+IGluZGV4DQo+ID4gPiA+IDcwMDE5Y2VmYTYxNy4uMGI2OTAyNDI5NmQ1IDEwMDY0
NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3NvYy9pbXgvS2NvbmZpZw0KPiA+ID4gPiArKysgYi9k
cml2ZXJzL3NvYy9pbXgvS2NvbmZpZw0KPiA+ID4gPiBAQCAtMjEsNiArMjEsNyBAQCBjb25maWcg
U09DX0lNWDhNDQo+ID4gPiA+ICAgICAgICAgYm9vbCAiaS5NWDhNIFNvQyBmYW1pbHkgc3VwcG9y
dCINCj4gPiA+ID4gICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTVhDIHx8IENPTVBJTEVfVEVTVA0K
PiA+ID4gPiAgICAgICAgIGRlZmF1bHQgQVJDSF9NWEMgJiYgQVJNNjQNCj4gPiA+ID4gKyAgICAg
ICBzZWxlY3QgQVJNX0dJQ19WMw0KPiA+ID4NCj4gPiA+IEl0IHdvdWxkIHNlZW0gc2Vuc2libGUg
dG8gYWxzbyBkcm9wIHRoZSBkZXBlbmRlbmN5IG9uIHRoZSAnZGVmYXVsdCcNCj4gPg0KPiA+IElm
IGRyb3AgZGVmYXVsdCwgd2UgbmVlZCBlbmFibGUgdGhpcyBjb25maWcgb3B0aW9uIGluIEFSTTY0
IGRlZmNvbmZpZywNCj4gPiBJIHdvdWxkIGxlYXZlIGl0IGFzIGlzIGZvciBub3cuDQo+IA0KPiBJ
IG1lYW50IG1ha2luZyBpdCAnZGVmYXVsdCBBUkNIX01YQycgc28gaXQgZ2V0cyBlbmFibGVkIGZv
ciBib3RoIDMyLWJpdCBhbmQNCj4gNjQtYml0IGkuTVggY29uZmlndXJhdGlvbnMsIG5vdCBqdXN0
IDY0LWJpdC4NCg0KVW5kZXJzdGFuZC4gSSdsbCBkcm9wIEFSTTY0IGFuZCBwb3N0IHYyIHdpdGgg
eW91ciBBLWIuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+ICAgICAgIEFybmQNCg==
