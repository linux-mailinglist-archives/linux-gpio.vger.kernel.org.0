Return-Path: <linux-gpio+bounces-15461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E300EA2A90B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 14:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A2DF7A390B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB3613D897;
	Thu,  6 Feb 2025 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PJcYdYPA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011035.outbound.protection.outlook.com [52.101.65.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433B21CFF7;
	Thu,  6 Feb 2025 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847173; cv=fail; b=lc1XsqhXg8wEmOYD+08sOotlbr0KALOchceRj9Yo3s1KxscwfaYEuFd2spmbsgVfKC3zoyTbLSp2zXybvaBkEUMZOQ4yHHdYl7x3FnHXoA+BCiQzuzhvqVBgNJ0uUADDAq9bmB/rxKxdu3sAAjKp6g62ym3W3n5Ag2GrxxFhtws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847173; c=relaxed/simple;
	bh=k55UPEFrYTSLyiypf4HILUlYOHnIX9Mm86EwuBNUsSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OfMYXok2TlzADgthvACJ7mSytUQQXiMEiMr/pXV77CJT9F0sp/hpAZfosf30a/sk26NhvEMKAxRs8WalZXO+NJsB6Q0ur15GqtsMe7CF0t59dTDN6cCun7xBu5x0JUoqIebxdrUS764W2m2963Ns9CHeHcVp+VTA/989zOXdSkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PJcYdYPA; arc=fail smtp.client-ip=52.101.65.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKphgPiykOX5pv93OANUIwQAwgnfaGMmW9kH8pGq6xSSnzJm4gZN/P+8sEJWmRHPeL2Yf+aQ8xBBGHO0wXL4F75fbBwk0YroqPSYsctweljJc8zojFdG2KYKpKf7InIX8aUg0/k/aFgDupLaV0OHbQajIOsbkmAvbhbpanjGTmGF9Bm3YjTn7QpwV4Tij7waeJwsdtqKFbs0cZz+ikmWkCkx/x0LpC/7ciGeoWP5TRdY4cZJARGufljzxrZ6y2an9zSu3N6QFsQrQsPEpGo3l8+0MXf7beoAZ3qZbnewrAdohEL59rpldH3jCdhLk+596V+6iqB9rLjTwIZuWWeydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hwDFSvXl5S6HeN47+bAm4IHmoRkVQUmhsi8kIBKzi4=;
 b=omoR+BXzUCtNPRE1HQVYN9gxWxL3jahN56SuPn+gWzMhpKx09RyXPDaJF/hy8/GvKKoZ7S4WHdzI1prqeUkfQLzkVXeLUWuPAOHTdzBOpeUGQqmGwLLnTv+wTFnFeLFvre6f3HowR4vPX40iG7kqRKj/tmb5YcP+gPME2DOehMDW+/Z0Wd2Exy+dDxKU+F8Q4kBtsdkdPPz/1LLy9uCqyaYNLVzLQwxtKWWm2c8TnnDqpjTuBtCMXC1opdEDP7eCr5DZxZhceN9eNZvkSXCw04f9j0mocZcGbfr77W1Uk1ufrxjtsaVEvwRp+4VnAubUaX0kMi4YMcL2blYVZmKXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hwDFSvXl5S6HeN47+bAm4IHmoRkVQUmhsi8kIBKzi4=;
 b=PJcYdYPAuZ1EmhGTFh/e0WHOCDWT62O/8gjOFGAaaY05pe5FkhmJxGxTmw2o7oZ0mADwBG1WnRZaUv8FAwZvNfLGu93HPVMoY0aqBfZpbWQ3TYBeyveSgCYTzArMNQTJ47PKie+sojFrbijfkzQ4mZX7ToyeDeQuub2mnVljqRxuS2VhEf17Tb3PGtctP2gI/9De7OY64AwZQcxXwYQr6TQ2sAa4QOq68ng7MmxR3PyTJDFRLrc6aeRVLKL+bD7WoIzWauOTl1sZsK7w3rS7e1pGnPuMnGG+gdE3ueMNkoKEiqu/odx0RSUcB7i7HzbUaD5uxS6FKJCF5Gi+HM880g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10570.eurprd04.prod.outlook.com (2603:10a6:800:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 13:06:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 13:06:06 +0000
Date: Thu, 6 Feb 2025 22:12:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Message-ID: <20250206141248.GB27490@localhost.localdomain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
 <Z6Slq4KjS_RJ3ItB@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6Slq4KjS_RJ3ItB@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10570:EE_
X-MS-Office365-Filtering-Correlation-Id: 752aec2c-ef71-4c51-566e-08dd46af0481
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QbXo59jaQX3vWJpqDRfHAW3g4OUXChl97iWVTn0htGZSsm9Z9IGPLMaq+Siw?=
 =?us-ascii?Q?ZnuLMOiGJv8mS5VDijyMNrFIC0AiIjG8eHvNmCKG53jcj/yjCmS5czMqOUVN?=
 =?us-ascii?Q?X1enjBIiY90jDEdPCNBihDaDwZztBRIwbWhgHZPzT7I8OWw7bTaQ0wPr+FfF?=
 =?us-ascii?Q?NwK0sN5My1KO95wvvlr9PJ+xoYW9MGZz8bs812s2Eh9Fqw2xdp0Eh7fjicZ5?=
 =?us-ascii?Q?DufRaaFnVJ5jGlH5bz5R0jj8QyduIK6GvlXg+Z6z5sXD5EqNZf+51mmsx3+U?=
 =?us-ascii?Q?sLyh0z2QZvJBm6L9HsMqKJoGWi3DkgUckqyjB2rQYVSrm9fPSGdLqMDbLyMd?=
 =?us-ascii?Q?3ZXLdNMRujWKblmot8FQUbBKCxEljJhwDxAsrAv1sBzWpa4ScMT/H2flTsS0?=
 =?us-ascii?Q?fcKqRYAYr3PSzk6p4Q2beige9+t+1/KOH1ninj3sGBaDDM/a69cl+Bp1+8BT?=
 =?us-ascii?Q?x66A0e/lBHdbR7rpnvglKsieTA1lwlbFVwlguKZdXhST+GMw1cuJh8PLTF5V?=
 =?us-ascii?Q?3OPQ74PS0NQ7EkUjOatz5+CapyhOWxmbloLjxvq4BYdmOQ3zoAbFm0VnITyq?=
 =?us-ascii?Q?DIh/i/BOEGI9mA2TUx0Q/NG04qiSXUdxq6+y7cmIJjoOZNPWtEbFzjPGUcq7?=
 =?us-ascii?Q?C47iIFO+CEt0izvYUYih7cBP7ZffmPvIytRPrHSyN+kiaho+SmdhqXbBX4d3?=
 =?us-ascii?Q?uxvOkITAMvXo3zndrXy+ocoyEwvIHwaYLtXC+op5QzyRl9qgSoA05UCsNEpb?=
 =?us-ascii?Q?xzrlpcZEM2v9iS3oaBkRHs1ILKGUhI2w8oso4JF1FcPa+NeF5P3V7NWBHOmd?=
 =?us-ascii?Q?kC5OEOlcEeCQmq0HOQN1Wcb8O7uojBwZj3aedoSCC4xTugvcMHkD2dw558lX?=
 =?us-ascii?Q?sKZfMe4x8jIE/tRUofYQVuSiyYiX+zL9JQ5HG2p8OPFkAvZ0jHq12o5IAFN8?=
 =?us-ascii?Q?WjZYjPhiSYe/k8FMv3lR4yK7cnF9GEa9DBO9vkWEAAn++Nj8rb/QmACDofRy?=
 =?us-ascii?Q?Lznd3TnnklKMaTPVQBNsQCUU4BuRz9uOCmoE7xHmwglUYlh2MwXoRR5Au1ZR?=
 =?us-ascii?Q?ngDgp4mF/SwL+lY8jwEaa/H8lN6Vb2I3oQry6KRayiesa4q1RomkIHXSOrDR?=
 =?us-ascii?Q?s0qrwjBGa3AFwkJIeVeZwdf3MVho+aAjyDT3YUpai2+SHCYRW6mZiV25RPQm?=
 =?us-ascii?Q?0W+2Pu1eTe0Bo/NVgDyUOqQ8iLuggJlFTMo8XJ53esvUybDFuM/TBXvCX5OD?=
 =?us-ascii?Q?Mqx8xQLeMXdilqzy1cO54fZdXvxQzVllPw2PIQ2zOst7pCG7H27NO1S9f2WH?=
 =?us-ascii?Q?/FI1Y1CSUNi97KvwbhmxbVoOfI/VfQvATPOm6mf2trM0w0Y8aYzAsUKMsF+c?=
 =?us-ascii?Q?WY/hqLfEZwTw0GMsPD2sIQZGH3EU7Q9SgAtFUcLXVZIlnSfVf8JW8z1ZXWfl?=
 =?us-ascii?Q?13p1B2He0nuqzNhkwXGHM196XW3BjXKw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ih/a2+vH7kBKT/43ZTu4zn8rs0bxIswxwPDd1s3hr+7g82eg/4OaIxUEY7nY?=
 =?us-ascii?Q?M8L3s074Q2VYNQmbe3Q3MLk5dblLToRC7FNCIIgJ8uhy4CNilBrFzEO4z6mr?=
 =?us-ascii?Q?sh0fZh7LcjDMT4oCJ1XC8yejwQ8ZizRjKPjbYsH4+IBioONkSS8xn8isHZrh?=
 =?us-ascii?Q?bvZnt2cCWnFp/Flk8ZodU+Dh5XIgNuGgMoWZJ2zSgc9m8+IjeWyDpMOJVTp5?=
 =?us-ascii?Q?krKT9PQ3c5NIEbcIKjC1UJpXfc4nPcaopFs8prI5MLeRzrUtmmwHJJKckSUk?=
 =?us-ascii?Q?DszAwgnw5zFTY44EdHTs6QZV8BJWK7k38u/l3FYjpXRmFImCUZKtc/EVb7Bi?=
 =?us-ascii?Q?NZHsiX4K9H+Iw3pGc86gZodM4qUobpbCyBS2BOb9QfNbPUQmgYwazsLQuKdA?=
 =?us-ascii?Q?oOJ0pDfa8Z6XEPvAppMTEq5dXqdmNO1nl66/Jqkru9yRy8wSEBaPFGKB5gQt?=
 =?us-ascii?Q?pyjDpmKjs+DuWSdjQFh5kaWL/sb6d8pChIvTGxhCub7K62i8iMm6PLzFPUO5?=
 =?us-ascii?Q?lTiXqpUFljaq6M4P1R7liJklIQ1+fjAK2wK2exX83DMD8kBOCSiwmTMgAwJc?=
 =?us-ascii?Q?3ig+Bw6XnI3oL/nYjqNFpxriQue/PEe5Bdw67N9MybCeXSHHvS6ssWJ9WhD6?=
 =?us-ascii?Q?Q/Wm2gFJyPOjgTXiZ2dblguIlN8GT9Tiz2qLwTBWOqXbstpiY2LCLfBLgrh3?=
 =?us-ascii?Q?jU/VA5BeRg3A9KsQiWB421iDBhUL4/NbO1H46jlV7nJ9XG10UuHxiHiPGyIL?=
 =?us-ascii?Q?5FNMCxgdAA99j0oDp12vduym1ZeUtE2O2qHaaJzFjVn8afRjf8J1TWMfgLcp?=
 =?us-ascii?Q?Z1rpznb/k6ZW4gI+S6K1S1VPdz8sefNbMjqpvrQz04hTEOu6iX9tADNk5Law?=
 =?us-ascii?Q?ofqAgdWWFMMhUcLGLNvSwnyVFTd5i4Tgi4Cu1E4OmjeNo5agoL11RsDUTtk1?=
 =?us-ascii?Q?TreSjPb0UL2x4YeiCYKnL+j6mBycSSh/ai30R6xTdocI9KtzQpVQtB1ytEZt?=
 =?us-ascii?Q?EcGgRfhCT4EwDMGeHUhA6a2gCawM4liX+3+8404Zytqoy7UOA8lhvM3maTAy?=
 =?us-ascii?Q?/f65m2Tb4Pb2M2453W35Bx5SuoiJ8cn2IO4QrmDqekTVL92QLZpvkAhjbxoa?=
 =?us-ascii?Q?44oy1DaStacTwpcG/FsiU0BaU0ddgSOFRugIFwCtxV9PJEQgD1hzTE+coBR2?=
 =?us-ascii?Q?pMxpXC2EE2lF5JlgH1f1ekqZ2BgAYreY+EYk/y/yWDy72TDUYs8ZSHvHoc1i?=
 =?us-ascii?Q?FlnO1BJK8YxVZlPdNmeDO2qpCbyyQ1SpqJaWGMJtUstdzXNbkQLXLTG8oeU8?=
 =?us-ascii?Q?IA3qApunkmlgBIOIa5g4cEcw9S9B2tAW6I6ip1l98xGjV4Rg7+aLRfN/g0hv?=
 =?us-ascii?Q?De6PRolzaaKXzdJpmKfa2uO5HkbxGrF9nIae+8/1wcv0t9ld9G/fys++OsQ/?=
 =?us-ascii?Q?88fJPxBczj6tH5G34QBvjg8bNHRF4avX+tiK4BNhEHi9U3sZWwemYLHOWSXV?=
 =?us-ascii?Q?OaaT/S1LxVP4idygs1X0GYSJdeXuOcx7cIoHVDA+oQvPqeUFR0qsV9+leBCo?=
 =?us-ascii?Q?rKwwrrYNuzR6CWFgTCteB2xTtdSn2XSEyQ1Xi7Jp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752aec2c-ef71-4c51-566e-08dd46af0481
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 13:06:06.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTmAeUVnw9DxNBBfRmRpp2Np02F5kV9Ub/IsQ0sK8n7KNc7vPcpKwVBX6E0pjCTLBvUk87uVOqIY9ggDTYxyAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10570

On Thu, Feb 06, 2025 at 12:06:03PM +0000, Cristian Marussi wrote:
>On Mon, Jan 20, 2025 at 03:13:30PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>
>Hi,
>
>> There are two cases:
>> pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
>> If both drivers are built in, and the scmi device with name "pinctrl-imx"
>> is created earlier, and the fwnode device points to the scmi device,
>> non-i.MX platforms will never have the pinctrl supplier ready.
>> 
>
>The pinctrl-imx case is an unfortunate exception because you have a
>custom Vendor SCMI driver using a STANDARD protocol: this was never
>meant to be an allowed normal practice: the idea of SCMI Vendor extensions
>is to allow Vendors to write their own Vendor protocols (>0x80) and their
>own SCMI drivers on top of their custom vendor protocols.
>
>This list-based generalization seems to me dangerous because allows the
>spreading of such bad practice of loading custom Vendor drivers on top of
>standard protocols using the same protocol to do the same thing in a
>slightly different manner, with all the rfelated issues of fragmentation
>
>...also I feel it could lead to an umaintainable mess of tables of
>compatibles....what happens if I write a 3rd pinctrl-cristian driver on
>top of it...both the new allowlist and the general pinctrl blocklist
>will need to be updated.
>
>The issue as we know is the interaction with devlink given that all of
>these same-protocol devices are created with the same device_node, since
>there is only one of them per-protocol in the DT....
>
>...not sure what Sudeep thinks..just my opinion...
>
>> Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
>> With both drivers built in, two scmi devices will be created, and both
>> drivers will be probed. On A's patform, feature Y probe may fail, vice
>> verus.
>>
>
>That's definitely an issue much worse than fw_devlink above....we indeed take
>care to pick the right vendor-protocol at runtime BUT no check is peformed
>against the SCMI drivers so you could end up picking up a completely unrelated
>protocol operations...damn...
>
>I think this is more esily solvable though....by adding a Vendor tag in
>the device_table (like the protocols do) you could skip device creation
>based on a mismatching Vendor, instead of using compatibles that are
>doomed to grow indefinitely as a list....
>
>So at this point you would have an optional Vendor and an optional flags
>(as mentioned in the other thread) in the device_table...

This is indeed better.

>
>I wonder if we can use the same logic for the above pinctrl case,
>without using compatibles ?
>I have not really thougth this through properly....

Since i.MX pinctrl driver probe earlier than generic pinctrl scmi driver(
compilation order or whatelse may change the order in future),
so adding a vendor flag to i.MX pinctrl could work for now.

But if order changes..

Anyway I will give a look, then back here.

Thanks,
Peng.

>
>In general, most of these issues are somehow Vendor-dependent, so I was
>also wondering if it was not the case to frame all of this in some sort
>of general vendor-quirks framework that could be used also when there
>are evident and NOT fixable issues on deployed FW SCMI server, so that
>we will have to flex a bit the kernel tolerance to cope with existing
>deployed HW that cannot be fixed fw-wise....
>
>...BUT I thought about this even less thoroughly :P...so it could be just a
>bad idea of mine...
>
>Thanks,
>Cristian

