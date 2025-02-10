Return-Path: <linux-gpio+bounces-15656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF1A2ED67
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 14:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69FFC1887535
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2025 13:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A2E224899;
	Mon, 10 Feb 2025 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BQe9R57P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2087.outbound.protection.outlook.com [40.107.104.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14F14A629;
	Mon, 10 Feb 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193561; cv=fail; b=lhRj7Wkc6fyxPf3K5rOAhIJgBYIqZB4EoRC0oePCcEpQk17nDiXhEhTdSKec4yYgCdLxDeAMthAiH+Qg/U5SsX1HX56HtlyB5zcusBxg/vC6QpnNIj+K+NyMWs2QGiexivKhkYNSfi2L/BWBAbGKfzeXesmh87O4edfUWdEc3DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193561; c=relaxed/simple;
	bh=HPG9Tcc3HjH/+JYrDAWmgpmIwPyjXt5n0VgU1rMtAvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rJOt3T8mSmcTdoTLRKbSXIeaZy62AuzR6VTshd3yH6gy5uxG/dBHVO9F5RRHMcKwUYaBxwWapeAgThcd75WRoRZJxcpgUkIxx4ggZQVdwYYrA76PWZwkXgNdeCySNk6AH1p+FeVmsS2FFHl7YTA13Wi5t2ryX0pyqi5xDFglfjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BQe9R57P; arc=fail smtp.client-ip=40.107.104.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTIOGc9NN+o1vzTVfltrBOjDZHxZCj9JAGsLV7yp/3/LiXY8d/C/3kHKbYQe8V9aIpCcTpv1Cual3r+Y88DYgrEfgkTs3DdEIhMLkkEk1BcGOH9zJCOHfBotEXqnv2gT/elQm2Khs5fvPV35xVuxTBfPNZu2Xfrfz6kjdEBkLB1OzXd0NBPrFpd+vyo08x6tTH6g7gfsFfFSfPViTh4+tKTqTpq/1gCNhRJk7c5ELMUCf/o25ZWORdPT72ZuuOhe50p4ySgm2DdIuZ4f7kyY4AeRV4Asj5hlqq+1jELfseI79iDEgxN8+DUu92B/E74U9KFkD/uj5DOp8OuWckvzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiu/0Hfm9iMziAj3gQU+Q51eEJp4Q2/pAljplbQUWks=;
 b=oUVQAON5/YSGpgiB933lnVZY2gDbuyeyPI/KHA60kxtJmtinMT5mJqLbcb1l8/qyV3YXpeejD+dqJiwBCw8mmAiVcZjR6VwyLpqXk7HZk8K+yM7at0LVBom+uWlbPwCXAQYzr2eGUSqASmfX0etVRSb7sUHcotQVcg5pakwg79L1ovHivKGCOEkirOwfLfgGWAA1IeS6xEK4t3JSrG7uKvoJ/zvfYVqbiW1cvCV84ZE+o+lCk3IS6Rnsby8ODx2HzL6F3c3tbQIQ97LfUK5fI/P0B3DGsf6oV5BwTcjldFqzIDeBsVMxQUb0APvMUrMOoe50h1gR6XPo2dtlkdvD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiu/0Hfm9iMziAj3gQU+Q51eEJp4Q2/pAljplbQUWks=;
 b=BQe9R57Pgh6n//PI1GTpznmWEQrX0o4TXPNKs4YH4mj/Xs+KmpbZl1fc+0fJD4+CezvzM7umRRUYNaEee73/EoEHHGTrXbsTXuO/8OvCHTkLYI2CezRB6rt++uh3jeYlQ9erJOm6gK7p3nBaId8UX1f6GmdY9N/0gcCgesPRCT4WbbPM02KitINRYZ0fzsnwRHaGF/iQt+jCyRnRxmUKok3UcNUY3TFAo6DYfBW2F7QNCu0mRQcN2OMZ7T9hsO1sSy52nchja4IQTOdEGjCzvGcBpf2LrRpRcGC3BJozFksfDVaoyMRXLWnT/96jLTxE4lVg1Hhe0RN3C/t000yytA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 13:19:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 13:19:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Saravana Kannan
	<saravanak@google.com>, Linus Walleij <linus.walleij@linaro.org>, Aisheng
 Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
	<shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Thread-Topic: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Thread-Index: AQHbawr1A1AsDxfmd0qSLN9sYWQ9t7M6SOaAgAZYiNA=
Date: Mon, 10 Feb 2025 13:19:14 +0000
Message-ID:
 <PAXPR04MB8459A3750512708D2972687388F22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com> <Z6Slq4KjS_RJ3ItB@pluto>
In-Reply-To: <Z6Slq4KjS_RJ3ItB@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8700:EE_
x-ms-office365-filtering-correlation-id: ca665c1a-a349-4e55-35c5-08dd49d583f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aKaQfu/vt/JWgY0O502TqU6GUiOE/81jPCEewngwTqkyAzwVsKGAXJPd2Q0q?=
 =?us-ascii?Q?G450tsSYKZ83wt18TLV+C4dDifH2zLgze0okEXf68d4OkzR/L+beLo/THud4?=
 =?us-ascii?Q?G7QSmyEymmS2pR6dQQrtSSZkypDgpRboEZR4uhSCZ9Amds9k7bW4rgDzgQTR?=
 =?us-ascii?Q?/NvRu8LOjoD1nxIBeWWicmuxcji+m+rOqdQQqFUgycf1/V66FJiw7VFMmw0c?=
 =?us-ascii?Q?buEpudF7SbFqQAiatdbAXFhnq5FwbIzBbqvId+uaJd9HhjV6p1OyNNUf0r/d?=
 =?us-ascii?Q?KKvb3nvmQb+bUxY1VSDyvGST5kBbFod9MiFZGb6QRECYF3wNoXBl5uCVV/y/?=
 =?us-ascii?Q?1QXHL27KQxeYdBf6K1KhePV+4cr+SWJjflzEgwIxDJOfkmgjnbZXpqxzQJUX?=
 =?us-ascii?Q?0w8JxeHgX8LUdLPibG1cCnN0pU9Z7ZjQRlsXJKPeKJTbkVnLFh5wEVWLGCqj?=
 =?us-ascii?Q?BS/uq6cE25jsOfVQPvVwcuZm4f569ddncEjAsfsawHzYfve82V1w+mkLOmCi?=
 =?us-ascii?Q?SAfjzSS7z37BLsZGoNL8093Ws6f3dKuoBslPEqYoTpwk/thuHc+NsAXZ46gS?=
 =?us-ascii?Q?8c+bL5exxhjLC1Gyvh+NKuqzy7NVPJU9El3wUtrCuj1vFJJj9hYr517Hwtkf?=
 =?us-ascii?Q?oxu57q0SzcsBYx+M+N7GBdb7dTbak4/jEaf52hqXwWJk4kt1dU9J3wQgRO/a?=
 =?us-ascii?Q?lApMUD092CkfEaZ5MWVM1+HRtb+ZBFuG7vhHMQrnVdd09QzzHojXkGRtcd36?=
 =?us-ascii?Q?Wsax96TEN1lYTcWiEXmhp3wXNec8DKGlECYCN0oqOkXEjaCu9YoLs75TbLT/?=
 =?us-ascii?Q?8lFWW+cOTvFeCDJ8C77JloRWZF3jKGBF3ZNv4Iigzt4WrNz5uFIznqZq8hVo?=
 =?us-ascii?Q?K5Jka57X+JhCrJIFYIhvuNGlRATq7k7puVANWlfCEHKlTFMzBL6PvSD+vpxU?=
 =?us-ascii?Q?8dVfAsDDyAcBnH84g1ifjBFBRYK2fp8uienxrOMCmx4XpsQel8t5nvqL+A7v?=
 =?us-ascii?Q?yE4l1Bhja8EGOe9MjnVn8HfwpTaikVJggw/bQOBIM6y+eTctZ5pJhR1pewUN?=
 =?us-ascii?Q?y5q3WNwrapEK3AGDGdt5l9gVhBkcHv8DsEDAqS975lHbYQIckZLxyNkFLTOz?=
 =?us-ascii?Q?A4UGxp0LoUqP0FST68zGPOIa5epAm1U/N4AKiCREC4s0glevDaJiISLWNqM4?=
 =?us-ascii?Q?QdJrqzXb0q1Aa836Y9EWv9RlbxhqNbAJEPCZ9XcpddXqRY79ENS2rk5qhXez?=
 =?us-ascii?Q?NiCRVtgECRvyJSG0J2uFa6CcAyQ7t1Zk7dHW/izMCpdhfZcwNUwRWv+cCrO2?=
 =?us-ascii?Q?1AK3Qkq4UrkyZQXw44fnPOgExGtDkxiHkLxfLjzaIC8uTamwAcnAhSlds1qm?=
 =?us-ascii?Q?oCDyOGbvRSNjyK+/08rxJf6zyvF6N1BuqFj/GYHrsh7E8vEuIw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Dp6QSJVhIOAd56ZVWIJidkOYaNCLaH0AImUnQYaeiMpyNNdl70Q2JAfE378j?=
 =?us-ascii?Q?mfwjpP9At+scDzanjGwjQCGBCdeesMwJ6yekA5ReT36fS816xjQXhUjrRosu?=
 =?us-ascii?Q?geeQtsIYQUIftgu0qNcjIADu7w1WD+nj7C7JOTr0RzkE1wDOp+25iEXL0Ljr?=
 =?us-ascii?Q?zWLP1gRf8He7unWTg3ZYNUBRLU6qRkpOdhWw2ZDbHD6Wh5t9KymCSlZZLI9f?=
 =?us-ascii?Q?CXOXI5txfaoG8nm+qoOZQEFTfr16woApbrCgy7lDrcMPZIKX0IC+rcnEeQpA?=
 =?us-ascii?Q?76e3+TGxhm1EmIz69ojzTSCx9vECqO5Wq6cgpklfkxdCeCofEM6A0NWj7HKe?=
 =?us-ascii?Q?CnY8SiFUfDe5nB8iT9ws4j+v3waJ/mt8RcVrNuhRI2NbK44osOK8CxdLH4bO?=
 =?us-ascii?Q?Z0bzBnSmGzEMRY9PhXPlTkPt7dKpu/YqqRWv6eVSCT81b/I7b/CA0OyGHD/L?=
 =?us-ascii?Q?xc/GDI+q//eUfAtVEqs1vfWY6XMPeCqYp+e+Kz7jSULQ6o7LYTKV1TTEb3fU?=
 =?us-ascii?Q?3joBkAYEoZqZC5N9bBwEfCvbIcu02V3Ri5Tly6n77fa/wNrCkqGOtzSBlsqG?=
 =?us-ascii?Q?cnuzui/lGzftc1dYja4W6Fnfr44/qXuU9W/IGUWaCzP0nAS2LUJb2CksTf2J?=
 =?us-ascii?Q?ROJ5ahXzBqJ+TjSVNxLBR9o+iGgvkq8toHZoUv6cbQ/+kGqJaXnDpaaurdTB?=
 =?us-ascii?Q?AHlk8pRfxzf93cTTzx4jPyiVM4r5THzAhoEaZ1uNAXqSHUbT+/uLm8/Hsika?=
 =?us-ascii?Q?1WisAht72fi5Yerqc2FzqxkayIlJtJHwz3h0QBnXuvXRmNR4ElJrB8PJCM5Y?=
 =?us-ascii?Q?BVEUIuBoLys5FtruqN4hXCgXrssUu7zHVYoHCN7zk5BnaeB/1pG/+GVJXpJQ?=
 =?us-ascii?Q?uzF8Dp3chY5SlYjKL+ddRORhR1TiI0wkdfOmTy/NxIZFF1CbLe1sFcbMsbeO?=
 =?us-ascii?Q?NRghGLE9M6hLgo2Z3azZtwG1uzCYdf3pacfq+y8lQK8+hc5EqmnsMFUHZZNp?=
 =?us-ascii?Q?t9dcbeZShXIM8PX7baT6gC3iMiRW7wRr5MYT0qbox0qaJ67jMhRZtu1vOUQa?=
 =?us-ascii?Q?cCEPkzxLikOLR1qK7moMQ8kuyinGrKFeohMn7AFErwS0hv4ZqwlrvAz4tz+9?=
 =?us-ascii?Q?oRzk3uAvzAa56b2BfoVbGCCA60X3QtqUgZgomWAn6/Ah+EdiBnJkdpEIJ3N1?=
 =?us-ascii?Q?65zPhELG02nlkhJ2MVtNn88TjZQW/9Y6DCi6TDkHwzlV+BEJ4rMB/4/ND6qi?=
 =?us-ascii?Q?9DBFoXTKhSwoWNMGwspKqp0ytBjSOEzKQlr5A6gvepojG55xdi7XSUPozEqT?=
 =?us-ascii?Q?AARxwphgwFrRuU1iMhEB50E4asKyOTJ96A/OtxdSapjFI12rduiMdgNv3S7e?=
 =?us-ascii?Q?PvQG20J1HY2N8z2Zv6kCJJZ+RF5vjVEJkGuSSz+s6/XLqTri4C1YV2RuGmAp?=
 =?us-ascii?Q?Koa/X0JUGU4CHEXqaRnjA4pr29SMjqijIOTZutnaebaxIkLjCiRS3vdukKrL?=
 =?us-ascii?Q?H2RmgfkJoAn+LMVVayqoU+oIGhqM0UQCa8TM1IokbUqNUGzgvA/wCtJrPmY8?=
 =?us-ascii?Q?2IPQTmNVZ0CWezerewI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ca665c1a-a349-4e55-35c5-08dd49d583f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 13:19:14.6893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: By7jbfjNvGwb/SqQnc/JHNtIV8GoNECao5oQdL4IEbYSSOHL+JiTmoVGPZAwYx5nz1trslIuAdHLuRp9NWePFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8700

Hi Cristian, Sudeep,=20

> Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add
> machine_allowlist and machine_blocklist
>=20
> On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
>=20
> Hi,
>=20
> > There are two cases:
> > pinctrl-scmi.c and pinctrl-imx-scmi.c, both use
> SCMI_PROTOCOL_PINCTRL.
> > If both drivers are built in, and the scmi device with name "pinctrl-
> imx"
> > is created earlier, and the fwnode device points to the scmi device,
> > non-i.MX platforms will never have the pinctrl supplier ready.
> >
>=20
> The pinctrl-imx case is an unfortunate exception because you have a
> custom Vendor SCMI driver using a STANDARD protocol: this was never
> meant to be an allowed normal practice: the idea of SCMI Vendor
> extensions is to allow Vendors to write their own Vendor protocols
> (>0x80) and their own SCMI drivers on top of their custom vendor
> protocols.
>=20
> This list-based generalization seems to me dangerous because allows
> the spreading of such bad practice of loading custom Vendor drivers on
> top of standard protocols using the same protocol to do the same thing
> in a slightly different manner, with all the rfelated issues of
> fragmentation
>=20
> ...also I feel it could lead to an umaintainable mess of tables of
> compatibles....what happens if I write a 3rd pinctrl-cristian driver on
> top of it...both the new allowlist and the general pinctrl blocklist will
> need to be updated.
>=20
> The issue as we know is the interaction with devlink given that all of
> these same-protocol devices are created with the same device_node,
> since there is only one of them per-protocol in the DT....
>=20
> ...not sure what Sudeep thinks..just my opinion...
>=20
> > Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
> > With both drivers built in, two scmi devices will be created, and both
> > drivers will be probed. On A's patform, feature Y probe may fail, vice
> > verus.
> >
>=20
> That's definitely an issue much worse than fw_devlink above....we
> indeed take care to pick the right vendor-protocol at runtime BUT no
> check is peformed against the SCMI drivers so you could end up picking
> up a completely unrelated protocol operations...damn...
>=20
> I think this is more esily solvable though....by adding a Vendor tag in
> the device_table (like the protocols do) you could skip device creation
> based on a mismatching Vendor, instead of using compatibles that are
> doomed to grow indefinitely as a list....
>=20
> So at this point you would have an optional Vendor and an optional
> flags (as mentioned in the other thread) in the device_table...
>=20
> I wonder if we can use the same logic for the above pinctrl case,
> without using compatibles ?
> I have not really thougth this through properly....
>=20
> In general, most of these issues are somehow Vendor-dependent, so I
> was also wondering if it was not the case to frame all of this in some
> sort of general vendor-quirks framework that could be used also when
> there are evident and NOT fixable issues on deployed FW SCMI server,
> so that we will have to flex a bit the kernel tolerance to cope with
> existing deployed HW that cannot be fixed fw-wise....

I just have a prototype and tested on i.MX95. =20

How do you think?

Extend scmi_device_id with flags, allowed_ids, blocked_ids.
The ids are SCMI vendor/subvendor, so need to use compatible
anymore.

/* The scmi device does not have fwnode handle */                          =
                        =20
#define SCMI_DEVICE_NO_FWNODE   BIT(0)                                     =
                        =20
                                                                           =
                        =20
struct scmi_device_vendor_id                                               =
                        =20
{                                                                          =
                        =20
        const char *vendor_id;                                             =
                        =20
        const char *sub_vendor_id;                                         =
                        =20
};                                                                         =
                        =20
                                                                           =
                        =20
struct scmi_device_id {                                                    =
                        =20
        u8 protocol_id;                                                    =
                        =20
        const char *name;                                                  =
                        =20
        u32 flags;                                                         =
                        =20
        /* Optional */                                                     =
                        =20
        struct scmi_device_vendor_id *blocked_ids;                         =
                        =20
        struct scmi_device_vendor_id *allowed_ids;                         =
                        =20
};

In scmi_create_device, check block and allowed.

struct scmi_device *scmi_device_create(struct device_node *np,
-                                      struct device *parent, int protocol,
+                                      struct device *parent,
+                                      struct scmi_revision_info *revision,
+                                      int protocol,
                                       const char *name, u32 flags)
 {
        struct list_head *phead;
@@ -476,8 +494,16 @@ struct scmi_device *scmi_device_create(struct device_n=
ode *np,
=20
        /* Walk the list of requested devices for protocol and create them =
*/
        list_for_each_entry(rdev, phead, node) {
+               struct scmi_device_vendor_id *allowed_ids =3D rdev->id_tabl=
e->allowed_ids;
+               struct scmi_device_vendor_id *blocked_ids =3D rdev->id_tabl=
e->blocked_ids;
                struct scmi_device *sdev;
=20
+               if (blocked_ids && __scmi_device_vendor_id_match(revision, =
blocked_ids))
+                       continue;
+
+               if (allowed_ids && !__scmi_device_vendor_id_match(revision,=
 allowed_ids))
+                       continue;
+
                sdev =3D __scmi_device_create(np, parent,
                                            rdev->id_table->protocol_id,
                                            rdev->id_table->name,

In for cpufreq, use below to set device node.
+static int
+__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *n=
p,
+                      int protocol, const char *name, u32 flags)
+{
+       if (flags & SCMI_DEVICE_NO_FWNODE) {
+               scmi_dev->dev.of_node =3D np;
+               return 0;
+       }
+
+       device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
+
+       return 0;
+}

Are these looks good? I could post the patchset later to see whether Sudeep
has any more comments on the current patchset or the new proposal.

BTW: I also pushed patch to
https://github.com/MrVan/linux.git  branch: b4/scmi-fwdevlink-v2
and=20
Following Dan's suggestion to merge patch 2-4.

Thanks,
Peng.

>=20
> ...BUT I thought about this even less thoroughly :P...so it could be just=
 a
> bad idea of mine...
>=20
> Thanks,
> Cristian

