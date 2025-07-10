Return-Path: <linux-gpio+bounces-23106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61801B0087B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 18:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441DC1CA1359
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA2D2F0041;
	Thu, 10 Jul 2025 16:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a6CV6mon"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01FA2F0025;
	Thu, 10 Jul 2025 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164662; cv=fail; b=ZWgYqxLyS+VYlRKZq50KkvfBTQ7IixolwQtNafzs9nk0W43fwTQMmeq4OXh1Ay/BY2jpCqhB6WNS7FYJA4PxtpM16G7MOkzomFz7Aactb9ufV2QUKb/3+lqr/qt9EFUGqmu1W1IaYyJA9fegteOT47T80jFqtGIOyR9c4DYpt5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164662; c=relaxed/simple;
	bh=n5dDyM6NvF/pvDjhCPMTtp4xO7qjvNoyvhiTKh+6lKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n1quO6EOeRq0sT1ZsuaX90z+7Ggmv1mxfSGVgoLuS6ol/gizdtKUb3nfcyV1fZUuLLv8KCQougLqeaIsCx8g/fu0jJxyoVB08t1T+/z4o6VtdC9xnJyyetahVOrcoLsP7JvpHQR4DZ0lu8ol8bE4YXhHt17glsvuIxn3uxABRlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a6CV6mon; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azPa9ClgL8q63gTlr4aV10P5CqWAk6hgRy7t94TFkhSJNFSFCe2j/L3yHFliPozIsd8WXGaGVuR+5weTmoBFtMxjmpdR6ccWeBflINuMFUSC9yTFPIp7Vorwv7YZalFBqctoQ3eglFyu9erQqDxVHAxhYHhsY9meE4z0rJt5BcYwexQEZ1Up7zSuClpRF13Gq0hvvrF7I2DiJW0jY/6i3Uqq+mVmUEkj7pNqLmyf/BELwol3tHxGr72Cmpp7Rxqz8DMlY1jl4EOhqQerszhu7wx62h67/1AZX5IiP6I7J3nVKJSh3HN6i7gghlbAejr+NkYiwMYuYxxFGZBeViOo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aFCxT7/AoYzVDlSQ8Z2dYbCr+cSK8uA8CzVemgc8cA=;
 b=JYRGBTatCd8vmvnHT19EsKtIOFuHjiLI06Xj9lI9AF6tNsx61p0ICb6u9gNsEfmwHyarPPBqb5tjqGjtP2tFktwmH5HvmjywNiFYk9XnCI0QMLSJoA+SKcQGu1AmuadYmUgeGo/QBs5F6MdTGibO3Qedp1jytSn0e7ecEdU0NyPXpzXXjhwOAJGAGV+DL/Q7FSMVc1QLDHjAxtFJDb2lxE2nm6RxFnHXaDY/q/9KujeJgrUb0y6atZdZHNw9VEG8733WShCIop58RBjSh7DOeXVceMiJQ4oWu4PWWoMQRhGJIweZAwcdtHwTGI8zHIL0bptdkWO19xIvf///18Ta2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aFCxT7/AoYzVDlSQ8Z2dYbCr+cSK8uA8CzVemgc8cA=;
 b=a6CV6moneO0yFcz2Gg4qsQ3cO5jsyffeJZitMrqxcwKE3YhmeGkjjaetPKA3b+lKQrRZil3GHoWdkMLmT7rRWEdSAObVnt2yTOx+JxBpuFtDezqdD/3+b3i/XDVQO1ju5qZELZflv1wCr8w3tAeCEk6zJd/A5889jEiVNYbx5Qbdti6umP/87ywFvk+lQaVYqr10DQCrH3V5iOS1nNiWe752JeRNsgiMnv0sV1tfyqofCdS8TVLpoeOATxpAqGSSenxq8nUFUeqyNJq/r17/PKO0ZWYhhsQFZ9e5kplhZsVKc/SyHsJVMusjCxkkAbt5c15nH6IneQNxta7KXJBkxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 16:24:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 16:24:13 +0000
Date: Thu, 10 Jul 2025 12:24:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com,
	mbrugger@suse.com, Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	ping.bai@nxp.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	srini@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s32@nxp.com,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 04/12] pinctrl: s32cc: small refactoring
Message-ID: <aG/pJjkBCq28mzMb@lizhi-Precision-Tower-5810>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-5-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-5-andrei.stefanescu@oss.nxp.com>
X-ClientProxiedBy: AS4P190CA0049.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 3552df5a-df59-4eb8-371e-08ddbfce3534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jKpvNXTKwRX02lrlraV2MSzwMv0K9/KSPmKagrZESa5d/K2PNNPQAu+HK6XM?=
 =?us-ascii?Q?C5yfz3Ba2ZqRyq7VsgLywaLV2qdrwVBt/f/FVkWRRRtOHOS1eVR6h5oO0Vth?=
 =?us-ascii?Q?vkx1sGerNszD12mVmiUDF+qAhG2RLvwd3xd9e3PgYJRqQ25NHCkFTnv/PkCp?=
 =?us-ascii?Q?HEKNZDuSIj+LH91b46+mpKskFvWLnWtt2BwA6wwQ8Jua/+FsV2ctfve4Bex1?=
 =?us-ascii?Q?iPqJt3lIkPcnLGcoaMVMYoOiH2EfpBPJ9eOjXeh23q6qm0Ivwk/Z4WSZd1N2?=
 =?us-ascii?Q?1mgVlDYEGg2CnApLN/ci9DdIg7WDj/fA/xFm4peBpQDsF4DzWU9UZR3hd8eM?=
 =?us-ascii?Q?WEBc6vA9peFRcy6oyxZ5+d9JKh5uz+RjdMwKucZbyuRze6dvTiOl2iwGgAMB?=
 =?us-ascii?Q?Pz0jyVhmgv7D5lIhY4LzYNyNYFZbzy5YZYfP0AQz9KHm3L+IWZA2y3pq+g9S?=
 =?us-ascii?Q?yK+QS66E1qR3ILnYJBubeOR2oBABNjGh+qWtQempJGcvOo/G/2C9elNp63kv?=
 =?us-ascii?Q?Feak22wwJ3zeaUsOiS6g2yIX2SQTwjLL+tnDIN4u/GSPtz5VSk1gc3q2fGyk?=
 =?us-ascii?Q?+whQ51Y+kK7so1BwY2zYbVfibKjfRpCkNj4Y3DEfSkvUmewT646xmwRXqlnt?=
 =?us-ascii?Q?LO6FhW06d0804Sa5xQZ7esMO4faI7cGrZDxMGNiZMHsQ8aCBeRQhiM1RXBGf?=
 =?us-ascii?Q?c/OKYD1upVVKzNmBI2VchWjLATDDLL5vl+6Akh1T30tzopvvNBennSwRz9Xy?=
 =?us-ascii?Q?FiRh8vu+zpkRIR1XYeOtDv39NFn0MK9BtCogH8aZPdwabO21Odb2ewKSq9g/?=
 =?us-ascii?Q?CDPIAJCNdaFqpcGYysvQpKhvCrLrQdBN6pZ/3ix4HWxtuzgo0w4vLa1pNvLb?=
 =?us-ascii?Q?5EnNG8XLptTYBSGcFXOmHBAiBUUZ4ie8Dv302aXmRAp6JkuEHceZfqnpEmUx?=
 =?us-ascii?Q?/Xu7VXszuJCdIDGawv05VGfljg1woUdIJyt4v1hp9utgvPAC+0tuRbCchxHM?=
 =?us-ascii?Q?Tc2Ul3l/JHonzUlWWzPugEKa1rSpqHDTlFstxy90DgWE7Q6eWvMTqHxc4usK?=
 =?us-ascii?Q?RGvxnw3l8YrDRH7tIk3vacRTYlVJMuqfMyd/uzS5kE1Unc3JXxo7+5QGwG2r?=
 =?us-ascii?Q?siQ/crrCJUjH/6aMekBahaRPdqFQR1X5LFK9q/oi3/7MDnLHB8zCZZVkLIFs?=
 =?us-ascii?Q?t4qJ7uQ68Ayts0t6aLpSCFGZe4eJPx+kqjclE+61o27Eb0QxjweSRilRrtcY?=
 =?us-ascii?Q?9l6koHxP4YaSgT5d17n429t2w0S032QFlfZb4GvCyQp67P7HQdEkzWFqxXEI?=
 =?us-ascii?Q?JGqciSqHobvb4AI9KAozMjwoOzneKyhE4tczK7bvTak6VjJ+xjYjH9xhhNax?=
 =?us-ascii?Q?MBzNgY5YCIVGOXis7byuCqYcgzy0qELyU26ZH/EfinKAZy8KFsW9YgprPrPA?=
 =?us-ascii?Q?dvtaA2cdpfqg7zHljGPUOXquwbBlFgYhMHyveBi8AL7gYXwaijrt4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ajCcSAxbTCUFJ+hUEluCybF0z+yo26ewKsFRKyJ3DFEFyx/nneACP9zTFg3?=
 =?us-ascii?Q?KYDcW2wEveKuB9Zkrvv4h2mIDqmzUjjNUirlfTVYAB9J+vybZO3LDtmxaihT?=
 =?us-ascii?Q?04gXCMO0nGS5BezEixemGTtDOrpjNDHodK/ZQ7849kauhISHeJyIEStr5keR?=
 =?us-ascii?Q?BJTQJ5FIXqfzlAaEAE6uE/GkgvTsfxj0MmsTctm1bmdVrRNRC0kCQebpzdAL?=
 =?us-ascii?Q?rCLzUusrMjv9CkfJkIqgDiGpuYqJEwGIfC92w4yac1fYkbcfUmsoqqL2FSca?=
 =?us-ascii?Q?ssZzQ5MWX8HMPxdNvGfwHYG/4TgUsMbDCGsUJcFBZMOWTbI0uwEVGb+CkbpK?=
 =?us-ascii?Q?D31MI21ZbxSlmE3CuwsRUfY/+umm9sc4PE901dioYBDXXqZnw9qgCd9bx7yc?=
 =?us-ascii?Q?BQfnLmhTmpAXQDQ29R/wLz1DJ6ooitXFPCZAlqoTi51b6LKJI2fBnYHY3Gnn?=
 =?us-ascii?Q?ZvLi4hlVbUzXQtqL9t7YwlJbHsAdDswjK8JFtqcMMWvfp0wsD1kZnRsFR3Zp?=
 =?us-ascii?Q?6P2E20G3ig1hMGWdyynNImny2EhZluinNjwF4zZBZHY70F7io/2LsveKMuY/?=
 =?us-ascii?Q?VY3Xslz0ZOgxqjeb9iSKmzb42WKdmNB86kVwwP/c4+FfnQNFaYCqjU/10ik8?=
 =?us-ascii?Q?zn4ocvbc4eOK2lvGQ/cUzXJgJ+FE811oXp+/geBGWdWlc8hTh1NUe5C2xCK7?=
 =?us-ascii?Q?cKPmTVxAw/t5sBeeKsE3IPimg0jVdGywffjW+KMbk/6qTkdt2OMUVy9TvSIR?=
 =?us-ascii?Q?cuTjjrBsRYTQHVz949oHcOY19C4djEYtzhc4/i7q6/6HwrMdcAxNrsfvQw2p?=
 =?us-ascii?Q?8/VzCU55fx7I/SNhvFjo8fGO/KJcMBiAts6Q9+wHbs31D+xDUE35y10nGyIl?=
 =?us-ascii?Q?qoDj+EuSJmwfq4POkLxBRSYj6XTdOoQUGE2ggB+hT+eCzor0fPepD7zZEzGM?=
 =?us-ascii?Q?+u0Gl3Bcn3ive1EBIle0Yrq21ZOe2u41OWGuQ+9CJg4OUDHrlNm284QXxy+B?=
 =?us-ascii?Q?xxO9qAJqKDJrvDKqiu3erE+o50YXOMejmP61QZ5Ak/IZXuSCXv33yQXx3lC5?=
 =?us-ascii?Q?w447w7QBcUkaLPUY3da6YosniWcF4boYBvSa7GMvGWydYMUvoCjdDfuLjb7P?=
 =?us-ascii?Q?4x+86Qg35hdIS6Aq7HXhOfOQRyWxj2R/sDIIHc2vHZCFxFx5q0w6zYEJo0F6?=
 =?us-ascii?Q?G1iGQbl/d2l2nWxJ96+g4QgiKZdC/9thLyumDl2BX+75MEq8jz2IlP1dLqAE?=
 =?us-ascii?Q?Ase2aLG0YYpqme+8EDJEYTZqVSbUxcDnklKX7SKZqogDQgA1fMGYgMVJQ+Fp?=
 =?us-ascii?Q?CH5so5xcFNFil/cn2FbrMhH0jdhi7zcawObXt0DowpDjbdTE5mIsLkvpXpkh?=
 =?us-ascii?Q?nBP62RhvSL0wM27Gkiu7aCXLL5Cye1pSkuO9sNAQLkkBsRTdN/tGgny20Lla?=
 =?us-ascii?Q?1KKcPQN4AzvFaLjE1qysV0ybQrTWaAWjP+gMcMZPMS9J6s361xH2FjqdF6Sz?=
 =?us-ascii?Q?6gECbND7GW6HfcoUA/vuMyTXSSJAYQsjPwsfL6VcrUjAmYvcKMIjORYaacgH?=
 =?us-ascii?Q?Uc5qxJET2CXJgSUateNcbaDo2xE9d9VUF/GdIvxc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3552df5a-df59-4eb8-371e-08ddbfce3534
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:24:13.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rulmKn0qnA9S0jt7fDUHupTRBfdS1Qzno7AnxDpDbOXQM03mxmRBtRvnwGeSkBxYyYRgq/UHs5+fkHu+z4jPww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

On Thu, Jul 10, 2025 at 05:20:27PM +0300, Andrei Stefanescu wrote:

Subject need descript what actually you did. "small refactoring" means
nothing.

Use dev_err_probe() simplify code and fix error message/comments.

> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path. Moreover, add/fix some comments and print
> statements.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  drivers/pinctrl/nxp/pinctrl-s32cc.c | 106 +++++++++++++++-------------
>  1 file changed, 55 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> index 501eb296c760..c90cd96a9dc4 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
> @@ -2,7 +2,7 @@
>  /*
>   * Core driver for the S32 CC (Common Chassis) pin controller
>   *
> - * Copyright 2017-2022,2024 NXP
> + * Copyright 2017-2022,2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
>   */
> @@ -60,14 +60,20 @@ static u32 get_pin_func(u32 pinmux)
>  	return pinmux & GENMASK(3, 0);
>  }
>
> +/**
> + * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
> + * @map: regmap used for this range
> + * @pin_range: the pins controlled by these registers
> + * @name: name of the current range
> + */
>  struct s32_pinctrl_mem_region {
>  	struct regmap *map;
>  	const struct s32_pin_range *pin_range;
>  	char name[8];
>  };
>
> -/*
> - * Holds pin configuration for GPIO's.
> +/**
> + * struct gpio_pin_config - holds pin configuration for GPIO's
>   * @pin_id: Pin ID for this GPIO
>   * @config: Pin settings
>   * @list: Linked list entry for each gpio pin
> @@ -78,21 +84,23 @@ struct gpio_pin_config {
>  	struct list_head list;
>  };
>
> -/*
> - * Pad config save/restore for power suspend/resume.
> +/**
> + * struct s32_pinctrl_context - pad config save/restore for suspend/resume
> + * @pads: saved values for the pards
>   */
>  struct s32_pinctrl_context {
>  	unsigned int *pads;
>  };
>
> -/*
> +/**
> + * struct s32_pinctrl - private driver data
>   * @dev: a pointer back to containing device
>   * @pctl: a pointer to the pinctrl device structure
>   * @regions: reserved memory regions with start/end pin
>   * @info: structure containing information about the pin
> - * @gpio_configs: Saved configurations for GPIO pins
> - * @gpiop_configs_lock: lock for the `gpio_configs` list
> - * @s32_pinctrl_context: Configuration saved over system sleep
> + * @gpio_configs: saved configurations for GPIO pins
> + * @gpio_configs_lock: lock for the `gpio_configs` list
> + * @saved_context: configuration saved over system sleep
>   */
>  struct s32_pinctrl {
>  	struct device *dev;
> @@ -123,13 +131,13 @@ s32_get_region(struct pinctrl_dev *pctldev, unsigned int pin)
>  	return NULL;
>  }
>
> -static inline int s32_check_pin(struct pinctrl_dev *pctldev,
> -				unsigned int pin)
> +static int s32_check_pin(struct pinctrl_dev *pctldev,
> +			 unsigned int pin)
>  {
>  	return s32_get_region(pctldev, pin) ? 0 : -EINVAL;
>  }
>
> -static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
> +static int s32_regmap_read(struct pinctrl_dev *pctldev,
>  			   unsigned int pin, unsigned int *val)
>  {
>  	struct s32_pinctrl_mem_region *region;
> @@ -145,7 +153,7 @@ static inline int s32_regmap_read(struct pinctrl_dev *pctldev,
>  	return regmap_read(region->map, offset, val);
>  }
>
> -static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
> +static int s32_regmap_write(struct pinctrl_dev *pctldev,
>  			    unsigned int pin,
>  			    unsigned int val)
>  {
> @@ -163,7 +171,7 @@ static inline int s32_regmap_write(struct pinctrl_dev *pctldev,
>
>  }
>
> -static inline int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
> +static int s32_regmap_update(struct pinctrl_dev *pctldev, unsigned int pin,
>  			     unsigned int mask, unsigned int val)
>  {
>  	struct s32_pinctrl_mem_region *region;
> @@ -236,10 +244,10 @@ static int s32_dt_group_node_to_map(struct pinctrl_dev *pctldev,
>  	}
>
>  	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
> -	if (ret) {
> -		dev_err(dev, "%pOF: could not parse node property\n", np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "%pOF: could not parse node property\n",
> +				     np);
>
>  	if (n_cfgs)
>  		reserve++;
> @@ -321,7 +329,7 @@ static int s32_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
>  	/* Check beforehand so we don't have a partial config. */
>  	for (i = 0; i < grp->data.npins; i++) {
>  		if (s32_check_pin(pctldev, grp->data.pins[i]) != 0) {
> -			dev_err(info->dev, "invalid pin: %u in group: %u\n",
> +			dev_err(info->dev, "Invalid pin: %u in group: %u\n",
>  				grp->data.pins[i], group);
>  			return -EINVAL;
>  		}
> @@ -475,8 +483,8 @@ static int s32_get_slew_regval(int arg)
>  	return -EINVAL;
>  }
>
> -static inline void s32_pin_set_pull(enum pin_config_param param,
> -				   unsigned int *mask, unsigned int *config)
> +static void s32_pin_set_pull(enum pin_config_param param,
> +			     unsigned int *mask, unsigned int *config)
>  {
>  	switch (param) {
>  	case PIN_CONFIG_BIAS_DISABLE:
> @@ -762,15 +770,15 @@ static int s32_pinctrl_parse_groups(struct device_node *np,
>  	grp->data.name = np->name;
>
>  	npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));
> -	if (npins < 0) {
> -		dev_err(dev, "Failed to read 'pinmux' property in node %s.\n",
> -			grp->data.name);
> -		return -EINVAL;
> -	}
> -	if (!npins) {
> -		dev_err(dev, "The group %s has no pins.\n", grp->data.name);
> -		return -EINVAL;
> -	}
> +	if (npins < 0)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to read 'pinmux' in node %s\n",
> +				     grp->data.name);
> +
> +	if (!npins)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "The group %s has no pins\n",
> +				     grp->data.name);
>
>  	grp->data.npins = npins;
>
> @@ -811,10 +819,9 @@ static int s32_pinctrl_parse_functions(struct device_node *np,
>  	/* Initialise function */
>  	func->name = np->name;
>  	func->ngroups = of_get_child_count(np);
> -	if (func->ngroups == 0) {
> -		dev_err(info->dev, "no groups defined in %pOF\n", np);
> -		return -EINVAL;
> -	}
> +	if (func->ngroups == 0)
> +		return dev_err_probe(info->dev, -EINVAL,
> +				     "No groups defined in %pOF\n", np);
>
>  	groups = devm_kcalloc(info->dev, func->ngroups,
>  				    sizeof(*func->groups), GFP_KERNEL);
> @@ -885,10 +892,9 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  	}
>
>  	nfuncs = of_get_child_count(np);
> -	if (nfuncs <= 0) {
> -		dev_err(&pdev->dev, "no functions defined\n");
> -		return -EINVAL;
> -	}
> +	if (nfuncs <= 0)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "No functions defined\n");
>
>  	info->nfunctions = nfuncs;
>  	info->functions = devm_kcalloc(&pdev->dev, nfuncs,
> @@ -918,18 +924,17 @@ static int s32_pinctrl_probe_dt(struct platform_device *pdev,
>  int s32_pinctrl_probe(struct platform_device *pdev,
>  		      const struct s32_pinctrl_soc_data *soc_data)
>  {
> -	struct s32_pinctrl *ipctl;
> -	int ret;
> -	struct pinctrl_desc *s32_pinctrl_desc;
> -	struct s32_pinctrl_soc_info *info;
>  #ifdef CONFIG_PM_SLEEP
>  	struct s32_pinctrl_context *saved_context;
>  #endif
> +	struct pinctrl_desc *s32_pinctrl_desc;
> +	struct s32_pinctrl_soc_info *info;
> +	struct s32_pinctrl *ipctl;
> +	int ret;
>
> -	if (!soc_data || !soc_data->pins || !soc_data->npins) {
> -		dev_err(&pdev->dev, "wrong pinctrl info\n");
> -		return -EINVAL;
> -	}
> +	if (!soc_data || !soc_data->pins || !soc_data->npins)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Wrong pinctrl info\n");
>
>  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
>  	if (!info)
> @@ -964,16 +969,15 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>  	s32_pinctrl_desc->owner = THIS_MODULE;
>
>  	ret = s32_pinctrl_probe_dt(pdev, ipctl);
> -	if (ret) {
> -		dev_err(&pdev->dev, "fail to probe dt properties\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Fail to probe dt properties\n");
>
>  	ipctl->pctl = devm_pinctrl_register(&pdev->dev, s32_pinctrl_desc,
>  					    ipctl);
>  	if (IS_ERR(ipctl->pctl))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
> -				     "could not register s32 pinctrl driver\n");
> +				     "Could not register s32 pinctrl driver\n");
>
>  #ifdef CONFIG_PM_SLEEP
>  	saved_context = &ipctl->saved_context;
> --
> 2.45.2
>

