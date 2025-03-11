Return-Path: <linux-gpio+bounces-17410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CCA5BAE7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 09:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20CF3AE134
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 08:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0516C222596;
	Tue, 11 Mar 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BancPEqz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2045.outbound.protection.outlook.com [40.107.103.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6C1E9B20;
	Tue, 11 Mar 2025 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741682180; cv=fail; b=cAngS+P5UQB27mEfaVrSA8sevtxO6ytG2rOtjHrCAcmMUTFrc+wz1RLiiLVnIn1W9O17I9Ak9X5hHQ2X0ZNwJ3FKmDqu97TJS4wpRlWHpxGtnjTafgxXwJrlSrxzuTf8TOu5CgaCeYwvt9tylwXTR6+/tzpPQoorCXbh9xd6jF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741682180; c=relaxed/simple;
	bh=J9uENvNYDf7j0+WnEeneS0DP8Vr5erkic0ORQwy1r/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CKKSZb/E83yJ+IlA7QLH/izEvDenUX59ANMUNq0GoR9jg66JIcl0KQraNgUkoPgn5+5MHwNJvsWMLdjTBkE1kqBlbUFLVqgHENFlcVVGbztS3eCQDaTo3DMENw/71qSvriJrdv68iDibJ8R4xOLR6YyRnOBkB22OEedZK1VRgd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BancPEqz; arc=fail smtp.client-ip=40.107.103.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlyYKjQA9FzvT1jBhu8hVpMjqIwASdK9dYz8AWOHJSvMMhgWEimOQSk+3yU83CL6jOWnsNvumlyAbI1eNjbqaob7rE2LHQh0WQRnN/naSELXbqAU05rVMaVZS+LLSUBHfyJ+mAcsyUVpGtGr+BBUSDecr8cjxkkkvMn6VOEiFpiQgEif6emH/JkJ6e29AufVAKOGYTk1FVZseOGHGMZNrCM5EHSK+eB0BmTKqquEsepbJ5bl8jXChZM0rQRnbQs69J2T8cj/xZvdnZemHsR/oM30Y/XmuRM19NB2eFCLmpsLSSthFd+1oIw5SmacHhUEOMn0aaToXvG6Q+TocXfoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9uENvNYDf7j0+WnEeneS0DP8Vr5erkic0ORQwy1r/4=;
 b=qSG/oQAjx/P5W3bFxeLZjSbajkZhMyTr2SskRY5OIBjGkShGl7rpbJW5eW2mjkoHtV/LE0rNQmBVK3krwFT6kxgYfgG0av/B5Fef3SfbHC1zI9BnFwKpUMRpg0ShLhw5TJADgF0kJrFjYsySTmpQXRVzpxNxadO0APppBUZQf4rBhgNpVlxwN99e5Phmhz3SWHotg61k0FqSzDj7O1RG4HLFjhntTgw4txuEsRai3ruixeS+LFGQ4psxhDuETjnLFpAcJDOgBAAO75M8ONSPGzE2EkYvsJlQXYR0KdDq76Q0I3KCbKwGi6P7JgbHK87fwaN+UWrC74aoztM7lKgHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9uENvNYDf7j0+WnEeneS0DP8Vr5erkic0ORQwy1r/4=;
 b=BancPEqzzs3mFFAv2qTw/3n1Lcyw71PvJtrIJESvRw3t9P49O0ABnGAfH66+pvnYPeo8J36C+D8dh0rR/bzWOuBcLJDOczvdbJf7cXzPdfcOLgkb6cdK7kkcZMYfvTRqVJxExLgfy6xP9ReYv+BX1ZBY4CJyw0tUtb8nDuil2jb10NpVGlg/p+YQahDkZeIwRTU47qHIRSaQqbwIrc0S8HtuPEXGCFgRKw0rKq9ZKXO1HbjW1/3PhhF5LS0E3yXeXa/oUL/pVeiSO565DhLBZmJUiPoRZP8UdS6Lv8r4SQSqLkxozmTetdFIX7SYsACwrHGW6xYQ0Rce5fBPey2paQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:36:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:36:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Saravana Kannan <saravanak@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
	<linus.walleij@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, Fabio
 Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai
	<ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Index:
 AQHbVqX7U3UKEfrBUUq6t/L7CeKKLbNCozSAgADnVgCAAD9nAIABZDqAgADO7oCABpk3gIAAmxUAgAA1fYCAAVrcAIAA9kwAgBzYYICAABSfQIAAFXCAgAAcjQCAATyK0A==
Date: Tue, 11 Mar 2025 08:36:13 +0000
Message-ID:
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto> <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus> <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus> <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus> <Z87sGF_jHKau_FMe@bogus>
In-Reply-To: <Z87sGF_jHKau_FMe@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DUZPR04MB9948:EE_
x-ms-office365-filtering-correlation-id: 80fca4bb-d1e5-4529-5fdb-08dd6077c8a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TJWkU+qMVXn1xJVgd5DK0PnNsLZjjzYVitko8K5pqWU7ZX60JR6lfRr3qfSG?=
 =?us-ascii?Q?BxXL7hvQbwNSJ4EzleI1xgNUbVD2nSA7/BouqRAIU98tFFRa04j32H6yDDiH?=
 =?us-ascii?Q?MNBw+Hwlxz/Zw/wbkKrzgtYTsLiFPblLxomzCXrgHonUChefE8etG02vhMlU?=
 =?us-ascii?Q?/4BuDm6Y4HrNJ8ENfqOCdR5TftKtScPhi83z7H0sqqPuX//jdkf/u0wekNix?=
 =?us-ascii?Q?oW7D4yuXLlAZcBOT0RD8nVxhL+s/eB/V3VZ3Vyhgmgmp6oBWdJZydi+KQgBU?=
 =?us-ascii?Q?cUsjf0BhX38FWq8uSYhKGhNTwYsRoM3Wn2j2ZKUVfOmAEZ8GZO34YZ474nzl?=
 =?us-ascii?Q?wBqetVDV0uUw3ExBdNeL3kVQyj0UXaJFusgFOUrZ0BSnID/lKsrEkaqNvYGV?=
 =?us-ascii?Q?uOm6aZvNCqFQMzUARHxNYOiAcYSgP4z70IraTmoMRr3nxxYHjljDhz3xW7S5?=
 =?us-ascii?Q?quLOzNmWtuMkU1vXY3knUvuUEE+ZEilj+/6DqTRof7jQglXcusXlcsi6cVu+?=
 =?us-ascii?Q?lmtXyDVfgUyxOl15KcVoxSk5rCICb9c9jXpoGXEugZaQ8yoUoEiE997j6BVh?=
 =?us-ascii?Q?XRz67vyPIFJgZlHGm7qFQh8e7YvbPI/8ypsziIe3RnPAonqr49aHDzPfA8MX?=
 =?us-ascii?Q?1OUF0zs2N5ewak+gjfYS7wdrLDt/4P7IV5T0vt1HEgSS5fZrqpcHsDQlBDNP?=
 =?us-ascii?Q?bM4g/zqg989Z1BVUuoTX1V6OSix6wDlVDOvgRqTPZdRt2FBodg2k7CNL+tEG?=
 =?us-ascii?Q?ewrrY5gEd+yR4thlWFuqc3C47CF69PmdhddvQrurB7z3I3nV5gxadW8seGZh?=
 =?us-ascii?Q?ZF0645SMWu7R1eEIX2ZVHfodhrTpb7e1LZi3z6mC9ixYA84RRNjQYPDrmG0g?=
 =?us-ascii?Q?jBbDPZHbZBEIjuG/5juOoPeJa7d/lygM7m5xlkWTdlKdUgOa0W4VRKi//qb1?=
 =?us-ascii?Q?dNPl5hNWbOfIFTgADIQBe6Hfo4CrfrPbZrv5HjtFSeBdhjsIowhqUeEGxpLt?=
 =?us-ascii?Q?f713YbawhXCPQBpoFKbA/4v+QwFfxcaclUKBJaysRpNCKQ0401NJku+XL2Si?=
 =?us-ascii?Q?Mm6j+aaJfjcXKAVfamqZfzfF0ntjroJrUL5lPYlVo+XjEZ1HQlSKLTY50ZUM?=
 =?us-ascii?Q?5pF09FLodPnig0YGoEAQFowK02x/UD6KusB0Ot2d5dpLgY7hvc0S2tyGa2+u?=
 =?us-ascii?Q?Cf8mn5iEbNXM9BB0sIogT35FoKd2ZxB15sx9S7rBls6Ts5cyEOICJgmF+4V7?=
 =?us-ascii?Q?U/3SqlOFX0/l1fVYogIw+OeqbfGaYlthccAVm+xLDc/a0kPstADRc5Mmdyf0?=
 =?us-ascii?Q?uV3dy2+MV6Ht7sNtFrLYk9WxFKBo1oSTWM/8+3wTMmI+S6sbJWkYAvt+/Qdw?=
 =?us-ascii?Q?ZMjnRB7KUekDic8g6RmIZhR6vjNO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YbMjyadvXz/Xutw+2DsFLgzBy896MnQTGvM4Nms/yAxaA4s/YTx+uuKYURN9?=
 =?us-ascii?Q?L0dYmqA7EL36NzCqvW/sLmR2TT167DKQ97T28fYsngdLeSNLVDUiMSFAjkjp?=
 =?us-ascii?Q?gBH1VvId8ug/GyjoV0xVcQvkxxNsKwdKEyDrYguJnfujbMAIEM+fPJ4QoTen?=
 =?us-ascii?Q?0nmjSzVNJaT7gXezcW8xlXMXTCieXZjFx2xqhm6/Bff1S3NzT3jbfw32mb9F?=
 =?us-ascii?Q?w/yQYZZKRCujAvQx3tSiS5jCKdTuDd2mdC/5JvHteFxRd1Kl7A7gtBDVANcK?=
 =?us-ascii?Q?Cg0BeTpMjgybGyn81866vMGVyxgxp2SPexTKlYOTYFGwfkqCPh82hELzFqkb?=
 =?us-ascii?Q?uYgcw4tnonQx3EAMWTv0WurCWjyaefmrzazd++UP4IDdbcMVGBgKvJ0MlohL?=
 =?us-ascii?Q?MH1GPcbvmFpjn7ApBs5jRwxD13rZkCc7n2wfBRMsc6OOUA8FDHFVE/8U8z/R?=
 =?us-ascii?Q?R4a27qwQVb9pF/gFdJdihtxMHx0TBNCMOJ8+gEMmt5cktMBl1QwP7EKIqqQl?=
 =?us-ascii?Q?YhV3NZeRatgV93OhFlFroWTaacW+wY8/by2tYMYi29dsCYCRDCMMelChInvA?=
 =?us-ascii?Q?PoZuqgSoFqFcywFHRu2dZ5b7u2DVmuICW+YYqaX1zTJDsqy2FYU7wdTUIXy8?=
 =?us-ascii?Q?owZ3vWPeUBFBRDjpHlajDsGC2AI/vygx7KtOekeCvd0JXyDS0HyDJSJEL6P+?=
 =?us-ascii?Q?RzaglqmN5rz2SxQnv4P64jyURJ4mPVgKZF6bXEl92hqsSylGjLW2nr4GYpc+?=
 =?us-ascii?Q?yDvjrHhOJr2XuJBnTD8ah7Gwo5t/NhV4g30TAvV65WjuhNj1m0G1esUW+Pc5?=
 =?us-ascii?Q?6Qjj49+SUfiS8W55KNo8KfJM0kBSwVRhN6YQbcuEZPpbU6OdkXVJ8NddkmyD?=
 =?us-ascii?Q?0fMdSkffAC6ve/TjrsAmco0Be/n23D39Mk9TsBQqwvSq7/ZW5MyD3LCa3ygO?=
 =?us-ascii?Q?26sFq1o/OyPaWKYur8q+QF4zVFC/yU1LNOtGGVdt4RlXQPrmdwAnyC2UCL3g?=
 =?us-ascii?Q?WouFjPFLjWOxT73IpgKZCAyTvVw3UJaKa4IvpQ1BWeb4t9L/pxR7snM0Sf+o?=
 =?us-ascii?Q?qMDHlPiePxS74McxoNSkQCyqlVqpudnPeK358mZj07wUt1tCCoFZOpKsrs8d?=
 =?us-ascii?Q?NsjjhTid3u8lnNhHWXM/k2SlJep2Y5Ii7Rfsv8x+JJRwXN5Qdopw2zrz7mAM?=
 =?us-ascii?Q?0qGePL0alCAXdMd4qozXn13Yr4axwdpLwCSaztZSX2xDxNyhQXsK+g89ECah?=
 =?us-ascii?Q?exMH8VUECn4oBFs6E0COo/Tq3R12g58JWwK7V3XYk/k/R6xI41FQbLrL8uxl?=
 =?us-ascii?Q?ysw/mwVMOSDPYpYzB0aOgXKsugjqm8pBtzyO+v/uzvo3MS1CFDfic+c/++W3?=
 =?us-ascii?Q?UVJDMFdFW5LqZHSuSUVSWj6+hiF70onc0zcK2hp9Kd5r1SeM9Qc+xtfuO5bc?=
 =?us-ascii?Q?mnL9r4ZSilHUnWFfo76YU/t+YZJwcWJa6AaROAOwNZja/9Zjv+yb4VzFANeI?=
 =?us-ascii?Q?oOXHTW6r4kxYj/7GBJHjhHPtrn4Tqx0g/Lhh2X5DlF1SEpLhXjKciHgdwuO1?=
 =?us-ascii?Q?01hUTizuprdtMOhG4VI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fca4bb-d1e5-4529-5fdb-08dd6077c8a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 08:36:13.9501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e3gt/B5Q1bbP0a8nY+n3ts1xgvrYVt8YTwTcOLMRVoJgwgDL4x2BwfYLQm55JkWz3LEdWaL1WLFISt81zRAkUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948

> Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> fwnode for scmi cpufreq
>=20
> On Mon, Mar 10, 2025 at 11:59:33AM +0000, Sudeep Holla wrote:
> > On Mon, Mar 10, 2025 at 10:45:44AM +0000, Peng Fan wrote:
> > > > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> > > > fwnode for scmi cpufreq
> > > >
> > > > On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
> > > > >
> > > > > Sorry, if I misunderstood.
> > > > >
> > > > > I will give a look on this and propose a RFC.
> > > > >
> > > > > DT maintainers may ask for a patchset including binding change
> > > > > and driver changes to get a whole view on the compatible stuff.
> > > > >
> > > > > BTW, Cristian, Saravana if you have any objections/ideas or
> > > > > would
> > > > take
> > > > > on this effort, please let me know.
> > > > >
> > > >
> > > > Can you point me to the DTS with which you are seeing this issue ?
> > > > I am trying to reproduce the issue but so far not successful. I
> > > > did move to power-domains for CPUFreq on Juno. IIUC all we
> need is
> > > > both cpufreq and performance genpd drivers in the kernel and
> then
> > > > GPU using perf genpd fails with probe deferral right ? I need
> > > > pointers to reproduce the issue so that I can check if what I have
> > > > cooked up as a solution really works.
> > >
> > > This is in downstream tree:
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> gi
> > > thub.com%2Fnxp-imx%2Flinux-imx%2Fblob%2Flf-
> 6.6.y%2Farch%2Farm64%2Fbo
> > >
> ot%2Fdts%2Ffreescale%2Fimx95.dtsi%23L2971&data=3D05%7C02%7Cpe
> ng.fan%40
> > >
> nxp.com%7C72778d531e944c7214ca08dd5fd95012%7C686ea1d3bc2
> b4c6fa92cd99
> > >
> c5c301635%7C0%7C0%7C638772109152491267%7CUnknown%7CT
> WFpbGZsb3d8eyJFb
> > >
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
> joiTWFpb
> > >
> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DnHFiE5qD7NpmdGmj
> SUL0mIdOq8P4W
> > > ErqVq8xE%2Fb3WM0%3D&reserved=3D0
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> gi
> > > thub.com%2Fnxp-imx%2Flinux-imx%2Fblob%2Flf-
> 6.6.y%2Farch%2Farm64%2Fbo
> > >
> ot%2Fdts%2Ffreescale%2Fimx95.dtsi%23L3043&data=3D05%7C02%7Cpe
> ng.fan%40
> > >
> nxp.com%7C72778d531e944c7214ca08dd5fd95012%7C686ea1d3bc2
> b4c6fa92cd99
> > >
> c5c301635%7C0%7C0%7C638772109152521215%7CUnknown%7CT
> WFpbGZsb3d8eyJFb
> > >
> XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI
> joiTWFpb
> > >
> CIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DM4LJumL6y9bQ%2FL
> ocPvlNiMnCFtO
> > > vODYNrC0DGbbydxY%3D&reserved=3D0
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F
> gi
> > > thub.com%2Fnxp-imx%2Flinux-imx%2Fblob%2Flf-
> 6.6.y%2Farch%2Farm64%2Fbo
> > >
> ot%2Fdts%2Ffreescale%2Fimx95.dtsi%23L80&data=3D05%7C02%7Cpeng
> .fan%40nx
> > >
> p.com%7C72778d531e944c7214ca08dd5fd95012%7C686ea1d3bc2b4
> c6fa92cd99c5
> > >
> c301635%7C0%7C0%7C638772109152541725%7CUnknown%7CTWF
> pbGZsb3d8eyJFbXB
> > >
> 0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWFpbCI
> > >
> sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DVpxcGrB6Dnr9yCO%2F
> wl8sEw1LYSlX5
> > > nPHqnlJ5mKm%2B7A%3D&reserved=3D0
> > >
> > > we are using "power-domains" property for cpu perf and gpu/vpu
> perf.
> > >
> > > If cpufreq.off=3D1 is set in bootargs, the vpu/gpu driver will defer
> probe.
> > >
> >
> > OK, does the probe of these drivers get called or they don't as the
> > driver core doesn't allow that ? I just have a dummy driver for mali
> > on Juno which just does dev_pm_domain_attach_list() in the probe
> and
> > it seem to succeed even when cpufreq.off=3D1 is passed. I see
> > scmi-cpufreq failing with -ENODEV as expected.
> >
> > I need to follow the code and check if I can somehow reproduce. Also
> > are you sure this is not with anything in the downstream code ? Also
> > have you tried this with v6.14-rc* ? Are you sure all the fw_devlink
> > code is backported in the tree you pointed me which is v6.6-stable ?
> >
>=20
> I even tried the above branch, but no luck. The above is neither latest
> stable version nor pure stable. It has few extra patches backported
> though IIUC. Anyways any pointers to enable me to reproduce the
> issue would be much appreciated.

I will setup test based latest linux-next and share results. Please wait.

Thanks,
Peng.
>=20
> --
> Regards,
> Sudeep

