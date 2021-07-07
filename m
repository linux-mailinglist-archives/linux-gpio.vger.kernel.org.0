Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF093BE5B9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 11:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhGGJnN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 05:43:13 -0400
Received: from mail-eopbgr130058.outbound.protection.outlook.com ([40.107.13.58]:56252
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230429AbhGGJnM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Jul 2021 05:43:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZw53mfXumxYDNWvuQoXykGenSp1IQCipFUYRUp2Xkho0VFt9jcyS8cEgQgx56f2x9PxlM/UVEF9Yp4CfS5uHW2mILvKE+9hgbw3ct/Ez5G5fY2jb4M/VD1ompXn46dTdi0rVmCnD/262/jByrIkvN3NcJ8VDBx+QUEiH24+KT5TVkfNHkEBl2ejPVcr2vHf1d6fRPzQNS8eIldQofY10M4AASIGmaNDyz5/J/SZpTegQsjpKBa3vcHnPhQNDuV7t1X7J7HJQENelKew95go3srEJzFooG9txfqva5/KDHXii606Jl9XernaMEpKoZLKY/Rlej9NjPJFao/hkEMH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHqUUhG0WF2NyLVdNlO5XTrInnBlrgAxjg5Xh27BvWE=;
 b=eH+aMenFSKJMwmZn6TbEmsXNWg9dmyLU/ZHXQu8jugXrt1GZj4mqWUVRW5P/n+ve7aIjSeCmuePe0iD4CCdCmuvWryvgrFZxAdBtWDzf5waNrBHttuuIrPh6KI77Lj2ReHHSGCoIMOR5u6Kaq5AKdGkk9fkDPqrwMR3Redqkt0YEZXjH4IREYu7wG5+6wK6r35bIOhyfXadIdxPLwR+NeTUsnYsefuhCqIrG/OB5lMLd2cmEbm9x6pHB28Z/uyB2Z+I3Vhhl1kNkg55qfpKvQUbdYee3VWt/yvWG0hRyhaeZ8ljgZFLaTVBzbPBK0XBKO5waoRVEFnAVqQTUGRXVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHqUUhG0WF2NyLVdNlO5XTrInnBlrgAxjg5Xh27BvWE=;
 b=A3DECBrF1ILXtDNF0wRz9T2uN1LIcGEpGCrzoKeSmTPwqgszHcholvVvz/xpw4Cfp55lL7pmRLFwbfaeblnOGnfE0xgrKJ6T96RDb8q8BoPwXHP10JQoaPKuqx6mmKE8wKBgBwPzW5e7INvBShQy4/exdVhxfwoqsWlvdn/j5tA=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8744.eurprd04.prod.outlook.com (2603:10a6:10:2e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 09:40:29 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:40:29 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] pinctrl: imx8ulp: Add pinctrl driver support
Thread-Topic: [PATCH v2 2/2] pinctrl: imx8ulp: Add pinctrl driver support
Thread-Index: AQHXW2JwE9wk8vhta0uKJPS2M8P96qs3WSJA
Date:   Wed, 7 Jul 2021 09:40:29 +0000
Message-ID: <DB9PR04MB84770143486760B5A92F0BD1801A9@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210607061041.2654568-1-ping.bai@nxp.com>
 <20210607061041.2654568-2-ping.bai@nxp.com>
In-Reply-To: <20210607061041.2654568-2-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1947daf5-3e94-490d-8254-08d9412b4228
x-ms-traffictypediagnostic: DU2PR04MB8744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB87442FC6CF038175BF18DAE8801A9@DU2PR04MB8744.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EdDO6YPDts1iuar3/9ORWNzf0ZTS/1H206CTsxW1YldCMS9TAQEgr/bY4UJPkkXcXNrY+gvTqn2hNLXTvvCNIanyX5ZZZelbtgmu4xCbp9Jh6GeBBDpKa1Mr/kH8m0ZOKCFyVno+kvXjtamj8D938Jo5N6T744n5FcFLFDWL1t4ubITmIqaQyIyYl0CwYnCp/uMdUSk74HG3rwXPLo1/0qmF7OUDFADOxkhu26i/2P4I16uIQX56uKAeV7ekO4mTW1rhpPviah9SRyMHfAzxf8FdG9rprJsbVRKEOQgaxN4wad526H+ALuTrIGq9HCRX2BH4lL2sUZIOOA9PaNjNtSZ0VjUSgSpoM7GKEsZ40rgQ9OAuKU01DUNGCCTjP7trGir6riK70kbb0263p7x14gllVHOPCbZTQzaoj3MTB73YwquVJVGlrj0G3tQoyoy0UCU6rNmUZtD08u+U7fHB7F5lSG8ImJ/uSg7lcK7DxtgXD6klj+uPH8vimu//SuXsZhK9I0grS6RZ06hJTrnd3ZRAnK8a6FDAo9l5yaUBcg6SYAlVo/Er0e6/6TuRQSbd7vpa4+LaUAxks4h1lF54l8BVHcVDUz5Uhx3P3v69OK6laZRhsyNL6J/TjMWRB98QDAVkH1mLz3TXPtRWEbU5eFXNuPFCrRbXuvdO57xrVpoNXlR0xIz2aAyIpIY8QUdOFGEYCowbOn8/AOHbqxOOxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(6506007)(53546011)(122000001)(54906003)(38100700002)(5660300002)(558084003)(8936002)(55016002)(66556008)(52536014)(2906002)(33656002)(8676002)(4326008)(186003)(478600001)(110136005)(7696005)(71200400001)(66946007)(44832011)(66446008)(76116006)(86362001)(26005)(316002)(66476007)(64756008)(9686003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mi9GNS9tYjlKR2ZFZUhacHRUcUJvaTYrM2lZSW1ZZERFYTY1VXliME00ZG1H?=
 =?utf-8?B?STdaTDhrandUYUVVc2h2REJmd3lGSHc3dHRoT2ovdlZsaFBNU3c2b1RpeDI3?=
 =?utf-8?B?cktLcmtZcnN0Q2ZETkVrQzhhTFM1RmpadmRJTmNxNUgyQUxURXlrOFljMVdZ?=
 =?utf-8?B?cmZvUUNwU1VudVcrNlZiWTNzT0phNy96YWlaeE9RNy9UUGRGMzc2NTkySUtU?=
 =?utf-8?B?WGx0RE16djgzclVuN3FNUzMvdXJ3M1l4NEhlVFZvNkRlK2h3R3JFMFNLcUpt?=
 =?utf-8?B?N0ZWc3VEYWpVUjNBdVpPb2I2bm9EZml6Q3JFa2ZEcXMyQjVCbkkxblVlQXBo?=
 =?utf-8?B?ekZJNkgwc3JSeU5hc1B6NUZ3M2lOdEtnVVRFYlVIMW41ZkRrUXNSZXJjNDV2?=
 =?utf-8?B?ZmdQU09EUnZVRHBQYlNBNzVyeVdHYkE5UzBRVUkzOXpKNGdibEJWdUQ2OUR2?=
 =?utf-8?B?VmsrdDkxSUFzTGR4RGg3aU4yL2lybUYvTGVXTHg2RDVDM3M0NnFtcFpBb1Jx?=
 =?utf-8?B?ZTgycnAwQndjamlMT1dkWmo3K01GNUV0c3BmUTZka2RzVU9PZnQwY3dMTnRQ?=
 =?utf-8?B?TE9ZWGNDVm0xbU9WajR3TTh1RStpajZxak5pSWdxbUxxVlJwSE5CZ0VSNElI?=
 =?utf-8?B?bHRIRGpJRVdXTnNPdTZrN3pITVZsbmJVMC9FVXFXQUdrclU2dW1pQk9pZVpk?=
 =?utf-8?B?eVJFRlhaTENRMnBhcnVtbEwwaWlwbGpndXo0YkxxV2kvbGFGT01JSXpFWnZI?=
 =?utf-8?B?VEtIcVRMTXhqZ25FUHlMN3Rma2VyOXRHREgvR01YdmtMZExjVG5sU2JTbzc3?=
 =?utf-8?B?bGN0bm5iTlU0MHBUVVZqVjczZWNQMnVjS2RvdUt6QVJPd28zd0NLSE9GTmZV?=
 =?utf-8?B?WDdub0xDZTlkd3NseTBGQUl0ZzQvVExWMzBNNVphQnNxMW5SWjNkOGlab3NE?=
 =?utf-8?B?VU1BckVkNGdBVjdSWEJUUUpIM1lSWlNjTDFnL1pKSHFqdVp0Q3NodVZWbzYx?=
 =?utf-8?B?d1pHMnBQNG8wYmZkeWxjRkdFM0pLU3p6cjlMTExma3IwNzZUVkdaSU9iL1dZ?=
 =?utf-8?B?KzVHMVpjVlF0Njh3ajlSY3Vac3JPdko2Sk9BZmFjT1BFMks2b2pNdFFMSnlW?=
 =?utf-8?B?QmVBSFZkUGpodnFBZkNPeGsyUjdsNzRISlE0RnFIZDZXQnFmclJ0WGJSSVJt?=
 =?utf-8?B?eHUrclFOZXV2ZFlkbWFCREY5bVF5QmY2eHNMYWRnWHFEV3gwY0gwanpHelJS?=
 =?utf-8?B?YVZSSk54UmJpN1k1bG4xM1A2dUdTK1d4emtiTlhGY1R5Skx1dTJxbTVhVDJ1?=
 =?utf-8?B?ZUUvbUp3UEJhdU1xOTdWL0lvU09UVE1keG9yWFEzMVhHRmQ0SW16VGZGMkhU?=
 =?utf-8?B?d2kyVVFBc3g3a2lYcXZSbk5vN3VCYWVobG1nUzQwUjNMWU5STEJOSkVEODZ4?=
 =?utf-8?B?bHpkZHpVdVdnd0swa0VRMVp0akdmU0dkMmh0aFpwelB1QVlaSFEwZmJrV0hk?=
 =?utf-8?B?N3pib2tiaEs3c0w1NlJsMS81VUVFM3VsRTBxNkI0NW1EQmt0K0o2dS84Wmlu?=
 =?utf-8?B?YlBoQkg0elFOZlFPUlBJUGpKbUdTOG04RTRrR2ZtSDJvanhjc1owem54cC9u?=
 =?utf-8?B?TmJJbUxyYlRVaStKTTFJbUpGRkdJRndnUlY0alI3ajV2SXNXZzFXNjFtL3Ni?=
 =?utf-8?B?L095MFhjS1c4QmNkbDV6Tmk5c29oU2xoNVBqRTdaUjI4RHQ5SW9oQ09BeENF?=
 =?utf-8?Q?0/pzUa2qMjTNvqGxPuLcWd5TX4prd7ErTL7Ahim?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1947daf5-3e94-490d-8254-08d9412b4228
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 09:40:29.8060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OL/fT3sIbjpELhS++Y5bsuNvLwDnKvhPx9JadCHAb4HaMu2Ffea/6u0QnEAa/f38AqUFQxGpHEy2tn7eeYQSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8744
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVu
ZSA3LCAyMDIxIDI6MTEgUE0NCj4gU3ViamVjdDogW1BBVENIIHYyIDIvMl0gcGluY3RybDogaW14
OHVscDogQWRkIHBpbmN0cmwgZHJpdmVyIHN1cHBvcnQNCj4gDQo+IEZyb206IEFuc29uIEh1YW5n
IDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiANCj4gQWRkIGkuTVg4VUxQIHBpbmN0cmwgZHJpdmVy
IHN1cHBvcnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdA
bnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0K
DQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVn
YXJkcw0KQWlzaGVuZw0K
