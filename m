Return-Path: <linux-gpio+bounces-17351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F52A59187
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 11:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155E1188E171
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 10:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8279F225408;
	Mon, 10 Mar 2025 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bSagBFHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFB22EE4;
	Mon, 10 Mar 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603551; cv=fail; b=ahbk86K47YTKHdrPMnADZ0/ZHevO8OYLnytgZ+APAuKUZAp9B7eLL0NGWFwxi2hk99BQ1n+SZvUD06f4I8mBgTWO/0xo8X0ogzKsd83N7QyXsVju5esXuP6R2XqQ0mi/EQoaAS+SgvHrwfgIKj6eSwbBGHiDxx8KL+Cyn19h7aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603551; c=relaxed/simple;
	bh=/jp5wrdPeMnR9PV9nf5cRcBMLuFUEDetgwOwsPEwOvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=swL3vdvM6rQgs6B0cLrcgg2eL4agPBkjtXUQ5fbmLeoAM2z5dY4CnXDKlFbuBZFfHuqzypbFm8/hMc5xd1I0WiVahqkKw+EZqe9HUCrDU8cUQirURwqesQlAdH6yIoc+LYMhv8sr2XZvrKatkCKjA5cBMsyuDbfu+88GlJ5Zn7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bSagBFHA; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMI6NR/sCrgnRbjyTJ4aMYzxEBEoeR9xGHPKXIlJlZdmslqKcxGyJw8LTynt2ve3HGePSulkMPrOFl2fPZQfG+5HalOSqz2peMN1EVJJxPzwqUuCHEGDWYR5nluNyNjE/fFldn3M8hKoyBnr7zKY6EFX4qsjY1/eV3E8Jd3cePhk0U/dau7BxlBULZG6ZnGm1nkXVrTtV5L5WkrTn/dIhhp2ypZxNkmvgFJuMM/5hq7+kSQGDawlwi0t23C2TnHdyBFQFwdJm0vRrra7qThHD90oqEeqgn1GwfKoX/MAH4UOY1IY7usdzBEIp4d4aaAF5Wr7AfhXAXWEm7Vkky75rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jp5wrdPeMnR9PV9nf5cRcBMLuFUEDetgwOwsPEwOvU=;
 b=i3wxNWArJT478uNew6A9+qvBd5kkuVdIeiyjU5Rr5dlMi9X1DD5kJ93ib+rVbIMF93aahfdy70yKaCEdrsA647TmFMf0/kiKwCpEwBeiPiY19DXIAyXHMBasWIfC/2xOAuGBv6mof1maiQzBlmjq29m4/HtnaQp9we1hGU4j206SsYAQ945sgVjAD1lTthQlnnVGPyQmIbj97FawxIar7dPU/tmHz/0KoZuXtVDYNqPMpukf/v/b/UjyaFf2mDT515p5J/ZEnDqTevjxfhMjF0NQPYdwlOeJsCEMrgSWo7ORNwdujkz2W9qylm1Cter90kMfGOr2kTJjobps4oqZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jp5wrdPeMnR9PV9nf5cRcBMLuFUEDetgwOwsPEwOvU=;
 b=bSagBFHA2WijeTELadagp2gJLZTRi0aXzSkyk23vGvgbXoNL8MtnXuDw1s3HfyT1g1JtQkFols8oEjfL2Fluv9iqQ0Ll1Y9RmAdb2y2jAxdfgiJdX0IeAupKsfr2A4YdwZUpSUuhEsWkFjvxyqfnfOQMegR8UB6s11xyHl28CzqdLemTvMUt2J1/po7IaViDLfkSsWGSdaCcRljRYDSIO2xyqON1Omr+ht4OLGexCv8Vd9ITV8//OEE0ls8Al2hC6kMcFuU7K6n0I2Eytlofieo5MAfW3V1oIAUuNH1QJR3xbllIj9z61Mstx2PJ9xmaOhcD9wN7ROil8m2cHjZe7w==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 10:45:46 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 10:45:44 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan
	<saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>, Aisheng Dong
	<aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
	<shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Thread-Index:
 AQHbVqX7U3UKEfrBUUq6t/L7CeKKLbNCozSAgADnVgCAAD9nAIABZDqAgADO7oCABpk3gIAAmxUAgAA1fYCAAVrcAIAA9kwAgBzYYICAABSfQA==
Date: Mon, 10 Mar 2025 10:45:44 +0000
Message-ID:
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain> <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto> <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus> <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus> <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
In-Reply-To: <Z86w3ZRS6T2MvV3X@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|AS1PR04MB9454:EE_
x-ms-office365-filtering-correlation-id: 78fe80ed-2904-4908-5f7f-08dd5fc0b5f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FeySo3S4mDu6yPz9/kPVAW9TpyzC520a05M985iWrcQ/75//M30MQPOELmLU?=
 =?us-ascii?Q?BhUwZNnQa9QScXY+eE8cuO8dhc43cAJ8EZ+OJSi+M8VwAlOkfEEaS9ktgbKa?=
 =?us-ascii?Q?8ewSZPjZpM5MrVrZXtyvEKDsOxxXK2GxEC+1eayQgK9jG6c39ZxbeCy1IApw?=
 =?us-ascii?Q?Upya692owyhCUEl3e56wKdMRdHlbM2Omr1bunBdUgSOMoiHexHbPvQWzrsT4?=
 =?us-ascii?Q?5T0FqIxrkYfu8JANN8XhhglPPdxLmszNzXyaf9nEM7nf22771v7nEhoLegIY?=
 =?us-ascii?Q?LDNq8/+cnQSP7Ujbmi9Ky8kJmcDCKJ/RTmclrJFlXrUmipi463jDSI956+wN?=
 =?us-ascii?Q?xyK/xE889PUBnezrlpTnjEIrJOICDm+4ofVpSuNi7KvMfXIpleerHYf4AYfL?=
 =?us-ascii?Q?vw/NRU2UuAbGhTmgJRzN6R9eOzhZM1mriUu3zP9L/msUJNkZkg634zEgurvV?=
 =?us-ascii?Q?7ieaWovsVTaxh5azHKMGP9EiN5N1PAGTRBJEtpoKsLAhzovf8r3zj8Yhqczn?=
 =?us-ascii?Q?o7p/Fewc/ypPStqd2/ji3j9toVNUSL/SykGgkMIbPllW75B9VKWegHA0Axbz?=
 =?us-ascii?Q?V+klZccGk2Q1tmsv27rWaZar1Pgadr9WbdyNroqAH3QUI++gp06tvia2ydra?=
 =?us-ascii?Q?MPZCZDet4AhTqwRjKicxtV4Wmbu7BXab/ha98KMjCZzXODG8dElc90D86/yc?=
 =?us-ascii?Q?Mh+NUH1FR+BLsi5bTxhYH2/C6X8WpQ4SuBSpabAyrcvtC+eyRin7dAx1qHBx?=
 =?us-ascii?Q?p1Jmp4GLd4rmHceaeA1Ay9dPLhnuiKU67MOg12riLeOIcIH1/kByPYKzPFq4?=
 =?us-ascii?Q?qVAZtw8nwsz25zSnD0wxTWeU6UyelhDV04dmIGMQpjBvUZGXoIf+EyuFqDWZ?=
 =?us-ascii?Q?ph539bKedRS67etYxsWhigyF2oIF1CpcOYxOzfSctv6xOVzsT0HSPVT1tKxe?=
 =?us-ascii?Q?0kDtaQoRyBumhhPJFudVPbKTPJYJvzY4PHj8tE+WUpKD6p/ugYkCcDFI/g4x?=
 =?us-ascii?Q?RNJlBuCo2/sLjee8vxlA91VZd/iVNROOutaw+ILDneG198esiV+cuTXHTVGx?=
 =?us-ascii?Q?uPBjoR7BMKlp6PS+kXW0Jw8LhApXfGqkgljdfSs/AGm/dyrBdRSbwH33vrD4?=
 =?us-ascii?Q?PHSsO0CfYdfsyk8x/TnjRjSRBjGKRLt++jphNzvWLZwFAT3g/SMjAHrxloRT?=
 =?us-ascii?Q?Xeo1PBm8iAA27LxcrE7efY9HWvAH5SGXbqG9pKYHw+iBFEvu+KNH05Hi9ZCb?=
 =?us-ascii?Q?lCzX7KDPZihBgfFHgp0BZb+/dlIrMSWIC7MHhI79bz1vdAZ7Awgu8nE88RhA?=
 =?us-ascii?Q?soko/PLN3CeAoANzUmpytB+tpD7TNfcYqlKMgz9vbkBNlLvcb1B+E+5QsbyZ?=
 =?us-ascii?Q?ksxwdktRS7Xmu+QrpQbjAzwo+I99auvcoYRu95zsMbBb22NTYw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WOk0N/BsyP/XxnX2Z8Xib7xVNexbMMrVmYc78+ABOvmd40jd7H7LWzSL9094?=
 =?us-ascii?Q?P/ZwqhK0cKznJ9hq6xkBOxrnIfFvysCAw2+GaR5GoGqbg/hKZVvrt8vKu4J3?=
 =?us-ascii?Q?c7+m+rflNHivXCYMM4qwLusF50Gx8BS1P6LURT+cAUcFYKHxGcvJGuoWm/iS?=
 =?us-ascii?Q?E2W7neH+F15x+TzZjNNrfT02/FuafvImopZs1swMjzyhifpv2/UPkZCTcml6?=
 =?us-ascii?Q?imKxj9iVtsd7OrR5PE2/r8QkaOYtwZKGmpt5vNT/KVb6lTgZIth/gQuVjPfd?=
 =?us-ascii?Q?TQKCGyXVstXmYalSnaaSXSvQEe5nUC7VD2ttXVCeq1gFL9FMLTTZHMHe+2Bz?=
 =?us-ascii?Q?L7Ot3N62ZEisefRID598eYhiFT35IUbYtWR5JZCCQHocgYKEmMLUTuTaZNw7?=
 =?us-ascii?Q?JUoYaDYHCBYRNBv5V+bZbi7p4gT2Fll750u/Gw/bvz5S8vjTv1qTb/jADhaQ?=
 =?us-ascii?Q?aFpltJUPDV4XE3sOeM7pnDm4+0yW+gJVjvCDrst+cQKvEWZxKyiS+MP4PkEO?=
 =?us-ascii?Q?rvVgQwPUJL7A/pFjbhCKiGbAfuJSxxlaEDt8gUKP8rVFr0NHFrB/PzZy93CR?=
 =?us-ascii?Q?m/Hsnr77ccI9Xc87eJqBNsQrXhV/UymqgYDP0Ub9iPU/kF4LqnYDwevena7b?=
 =?us-ascii?Q?1yc72pN8mDdaKDnHZGBrEJ/ve4IAoBmwfGaXr0PL3JcgZzN7YTquKPhKCb0P?=
 =?us-ascii?Q?jqcUKKDDAIa+NTeu0eI79ymFnLvqF0Xq66x2+za6up1233U97vt0QAboov3S?=
 =?us-ascii?Q?IT3FBNyGf3D05ewVW42WdJFK129Lonf9XFemePvRIBQVGJvIEnq6Jd8f5G3I?=
 =?us-ascii?Q?pfAbAJdOv6a+vxV+DyG9YHE3XVZY6ewH936rmfArwczpsjDdg0VckTIzifLu?=
 =?us-ascii?Q?aynJkFkv63l4LRMP8yvh8cj6hjab8fyi4PjmA1oqf4NMW1SP7qszXFxPlbPA?=
 =?us-ascii?Q?ueigknMFW/nw1eCg14IUlTMh4DaBxRL+YIJ5HmbrXGptMouOMztb2HUPIs3h?=
 =?us-ascii?Q?4T6Nq6rihel2vF3uYlps80W/dRynG5Vi8IurGIMv16xVEQ9XmhnQc2nUZKDr?=
 =?us-ascii?Q?WeVsdOgWma10Ng3NrfyiIK3gR7ZCMm9Ns1kih+FisTDGyOOgtbp7RIhjjClE?=
 =?us-ascii?Q?xNONXEQpUjv/furTRTYVwLJxYrHH2if06G6gLZxaHV4mUMQlItEdq7ppV3LE?=
 =?us-ascii?Q?LaN8Y+5/XFYNMoTav0muHSkbKDtOn2u66MO7fLVP7en0lIizbM+Uf01C/Ofb?=
 =?us-ascii?Q?Pmmz/dmHIMLulzKFel12IbXHmvessqPRJYohwTI6BOBcG+x3jJXzvC0UGlOl?=
 =?us-ascii?Q?b3RIjscERne9XMLSJuL44IkLAhxc7XPtuwAfPH4/r7Sbv3QMnxfEOsNprVjR?=
 =?us-ascii?Q?N3qLZnIDgX+uTR8Rtgoj/a6AATs9PzmKYqFE2ZF1X8CU57cW0ONFRdVaiAPK?=
 =?us-ascii?Q?GNd4YMYw3UNi/PEgoeBHBM5i8ssYm2HX0tEvwGw9DwWw4S6XXirZwRXJvaXx?=
 =?us-ascii?Q?+IuaL0aVxwYeuvl0TNWFYpXv2Z0D4XB5EnQVDGpqom7ncnAqz5fwBe/YYQ8l?=
 =?us-ascii?Q?bD9T+TN4W5Mn2Clynac=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fe80ed-2904-4908-5f7f-08dd5fc0b5f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 10:45:44.7208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dL7TBMOJK2U/ReT9ed/djcfbs2X+u6z50CiRRp+nHdpJUwCWbE4m3kpwFSQ1evkjDuicLNBSuDgTwDWm+2ZPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454

> Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> fwnode for scmi cpufreq
>=20
> On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
> >
> > Sorry, if I misunderstood.
> >
> > I will give a look on this and propose a RFC.
> >
> > DT maintainers may ask for a patchset including binding change and
> > driver changes to get a whole view on the compatible stuff.
> >
> > BTW, Cristian, Saravana if you have any objections/ideas or would
> take
> > on this effort, please let me know.
> >
>=20
> Can you point me to the DTS with which you are seeing this issue ?
> I am trying to reproduce the issue but so far not successful. I did move
> to power-domains for CPUFreq on Juno. IIUC all we need is both
> cpufreq and performance genpd drivers in the kernel and then GPU
> using perf genpd fails with probe deferral right ? I need pointers to
> reproduce the issue so that I can check if what I have cooked up as a
> solution really works.

This is in downstream tree:
https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/free=
scale/imx95.dtsi#L2971
https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/free=
scale/imx95.dtsi#L3043
https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/free=
scale/imx95.dtsi#L80

we are using "power-domains" property for cpu perf and gpu/vpu perf.

If cpufreq.off=3D1 is set in bootargs, the vpu/gpu driver will defer probe.

Regards,
Peng.

>=20
> --
> Regards,
> Sudeep

