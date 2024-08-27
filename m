Return-Path: <linux-gpio+bounces-9226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D696167D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 20:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4388B1F2163B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 18:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEDA1D1753;
	Tue, 27 Aug 2024 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="chXIEQQ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526964A;
	Tue, 27 Aug 2024 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782349; cv=fail; b=ER+GqnidWCO7fIyfZjMV6eFcxRYm1Ve5/HFV9S9HZOoorJcLgM5YrTrwEEbWD3li72n1vbGOkE1vWFdwWd2UaBWi7gQiajsdqtCMWxn0iX0vtvvkJMW4rO3RaJ2FqrRpL0PXMht+p9Y8LPCrXz5EhmtCaFocajLBVKqRFAxxAjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782349; c=relaxed/simple;
	bh=jSR3gWdp7K/zmX4yvUHvs2YjnKWwDlU8vMvYHsgvSmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NWgBKf5t/hf8JOSibxZiXiggChPR8Yi+/lmNKB3CSqQEwiHFqPsvvD/Q/bYpSt4cLU1LNL+bciIx+yKus7dKoP0qGE2m/J+lXJBsud1DT3/vNNHLczlH9Ma/CrV7HsIhcVhB9WRGXzdux4JCZ4MLDYTAnqVv206OT5bchLeqRpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=chXIEQQ+; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czRPtUlub5rkYFzSY3AK6WRGQcuuHquE69l5UiZXUMLpuaYS4kbt6+PI0aEydur656QTFZBLLFnVVNHf3EBc8JMMS70vHjP/5ixHTCm8/BE64pI+ncAB4cNhqhyXnVDkyezQ2mZ2SNaIKLhrzhheoV+qxsGgfcg9s0P6H88ZkVJLgYlk8B5VsQQtvzPNe6siVTW6dnkT6B2XGJVaCnbkLxc1SxHGwJ1E/uXtFzei021N1Y3ZVSKQoc2d3pJqMzClDTy2ow6kSZjlxTIFHsLoL9XkPaJDxaz6yEXZdrHQToXskPeC8n5ocmlmHt2ACzFiwTrcbldYbL46QUsX8T9GBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRqTCecjGZVImSMv87XrRHUKTRtPb/FfngJQUrSdeEA=;
 b=aArfo8yngSi7wJHbDLAP2rOzkn8lwqfMNLpw0VdXNqmWpUczTxsOrSECMcSsOIChWrB74/xJ9Ufm91R/YM64MIMWnFNnews2XkhEPHKWTZtYaJAy6V+bg6Tohs4PLpyUJ/Ozt71qR/UJRRG8njXZy47xPY4v65Vz0AIViQrPCzVOrbbhtIItnRfldlmB8ce1qcq1tJxmw9L+FNuI+2KUGXmZyIh2x6UjuWQH2qWaPvVNP3caLzrKi9eRA4vLAc113E/ZmJCQoCssgRPcipzGJ5xKbtMDN9vCb19TgdSUnNwmo4OVdUE/8rTt9diq6eAzIa317TsfRJL/HJLiQBN4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRqTCecjGZVImSMv87XrRHUKTRtPb/FfngJQUrSdeEA=;
 b=chXIEQQ+XGRXTUswhxas7WCiohvZ14jhQkOhpoYPZ6aterNB7qgXcR4M2HC80iuw5/ZR+s8EtdqXGcg1QqXW+vj3UqCgL0wo1EG0D069OSk3AD7ikcr0l2hCx8RJgPIbl098hjKOXtWHP/I6Pl44AGD9cs8Po3P7wicLZimMuFvvuNoIBnL2fVbPU5bR4sYB9+S5k9trGjmrQlIbTGxZmnnQjXtbSLu5Ki9d98vB82TNcw8+h9OlPZh5yFKW8aKO53Vpb2mjGiDWYg5v/bOvc3FfL4dQiwDg/v27kqIKe3W0exkTngd1md2MsYBxQoFhnJo/PWbpz6sauHMJ7DyOrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9781.eurprd04.prod.outlook.com (2603:10a6:10:4e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 27 Aug
 2024 18:12:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 18:12:12 +0000
Date: Tue, 27 Aug 2024 14:12:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: David Leonard <David.Leonard@digi.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] pinctrl: ls1012a: Add pinctrl driver support
Message-ID: <Zs4W9EGSCFfxDgq9@lizhi-Precision-Tower-5810>
References: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ffecd6-01ac-441a-654e-08dcc6c3c631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ACpqAnvVK64EZ2/3P2C1AAsfcxbYSh86XFhjk1ImT/VyjjwT8/fXfRI5nGQ3?=
 =?us-ascii?Q?hENETFVghp3Wy0zjEQWeJTlp4sWhyJkN7+jwDrwc1mzL6JsDoZY+6r0pS9zY?=
 =?us-ascii?Q?iVFmn1YdHhFriqoTdbLuyAFr6AaaFYIQxwjngxfbCSiiMKvIP/vBIGGZHG/f?=
 =?us-ascii?Q?RYjFq6lw13CsnWnbvY/Qzv9jJoV1+Iqfgzbwoza2sa63MBMlxcdonBRPY9gF?=
 =?us-ascii?Q?CotVPgtYJoE9Ela+m2F9V79j6YiYQNxQom/3Yi5hSV9Rb+MCZj+82NOIWLLA?=
 =?us-ascii?Q?gY6Rztod5M879IYbl89ukdgtM2WUKztGj/5FOXn9zwG6NDJ/5+JlRRtnQNn/?=
 =?us-ascii?Q?3vMbxqYnCntsvplwhByk5Bke17xdPnGww9aKZJLaCOVcq6QcF6UYRnTNWuSc?=
 =?us-ascii?Q?p+470l6DJigwze5HYjmuA0S5OO2l7dJ3LtyfwJyUdFMKLRYj8zKb/j11nckL?=
 =?us-ascii?Q?W8UQcUan/5iVWP/pGg2Uk+fBUJXa9W98aLMWVK/GR91kxRf9pqjTL0F5Suvk?=
 =?us-ascii?Q?rRAoiYjFnFKt91N5XU8sFq6Mt+Kk/05/e9Q7qb3FIV+uNx3aAuQjVDGGo2AY?=
 =?us-ascii?Q?8cSWOQr7UeEKxGDv8e6DxUnCx2JdXo5JVInH5IsDbGC9yl77m/3lcMg1yN1j?=
 =?us-ascii?Q?Thr6XJMa/cvsp8lq8eeo3P0hliV8F4IzVRlVGqh3ur09GTmOzMTHmBMaeLz0?=
 =?us-ascii?Q?9Tbmc5g/IBTYbkKixO+Skfsdxe/mae8E2r0/eRE0kev6Hs9Vd8WtfglNtMlK?=
 =?us-ascii?Q?GcpmLW9U5N/YeHCuffgFWwHZfVKLA5h7xg33/jaTtN38ognzKmZaIW4dg3ja?=
 =?us-ascii?Q?JIWLGEnlitNpEyKXBavaB9EZbKhh3HQzpE++fG4C1CR8pkn2tqyhbIwhtQbs?=
 =?us-ascii?Q?fDy/4XWCQB7+7UtU2oKBUwHOthJbjqPFO9Fu2O7IlcYcCbtqyAbIRNTZUL4P?=
 =?us-ascii?Q?E6j6GQPPlSSDkMunOANq6qwR0lukX8hpclbA7sWoejcXkesXPy5B3DpoGd9V?=
 =?us-ascii?Q?ODr7LKESb20REP8sL0gXeAECXKm/c5sJ2ZA6wX/BFJX7lLjzYILief/oLd/v?=
 =?us-ascii?Q?O4wna0Amw9e9rE8+sZ+YzQNejl3yntcxVDy3jYhLF+aZRfHP4sQNzqWURWNK?=
 =?us-ascii?Q?VRJkxX3yfe+/DjlDLdO9rHGEkq9V6jmir8dbcYdnvUi0YAR6u0iCW8UvwNAf?=
 =?us-ascii?Q?+ne9irfsStAsg5Gdl6A0o1VYnIEHzAq6L7H7VviPjoqRbch+raN66FQDqLVB?=
 =?us-ascii?Q?uXwep61ziy0W6r4Kv6xpRUeK+uEBUKJ1YgO55OpWbg0LCBnqUjGq8UTQwgtm?=
 =?us-ascii?Q?FO21cE61tZeu7Q3MmH3RL/1m9DWwkOEIjbqG+KBN6+YLvRDVPBlB70GBx2cr?=
 =?us-ascii?Q?OfHOvVNiQOkr4xunjCpipKPdIrAP9jYFYhLqrpzPOaI4O1UJcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SivgXB6ezsqJJ+sMBUSoD1NVBWSbDzIBszrvoq6bVfw08zygrfApSmZrje9i?=
 =?us-ascii?Q?t69ZOfn7Xyy6ZIIX85gIUYGuBNHbCwmk8NAd3MNBYMTTFk+Gj8SF46kUvcQW?=
 =?us-ascii?Q?3T7pJhdUbrbPebW8/QGUqDh9zeaSH4kiLajJWQLoN2mlMng+d71hcbIqHKZU?=
 =?us-ascii?Q?O4QHcJfXXNfc0UQakIUdJUZoU8JfXmQyPfvJmA3P/J8UhRCLuzc56qNYHuh3?=
 =?us-ascii?Q?X9NLk5FOguNdOMMAVgz7q39O5EQYiFDKCv9Mb0s0UFhA8KA5Zrxli/3mqxZL?=
 =?us-ascii?Q?QMhDHK7dJlxVw1qu4uc2HUdaO0mtDAsLSvmBKzpP7k87Om4x/gmJuZHjz/OH?=
 =?us-ascii?Q?5R9nhCVoVfjGQ8MpV39YT+rk3cJ6ymI44qXg+RKWco0hECh+qBG59crJ3lmh?=
 =?us-ascii?Q?f8fZyAYHTceUrQLPRNyK/HjCswMVv8jENXc7MASfETt7UetcLwHYHakVUc7X?=
 =?us-ascii?Q?e4VqYuIAr2EGLioMUXBpK7NtlZiNYmdrjymVGLGQhEXo/KlwNUv9Vt49d4PY?=
 =?us-ascii?Q?1Kqtzxcwqjuja1n700lqY3lF4x63xDioGXhXsXxSqL/BzaqeqGJv0ScP1SHk?=
 =?us-ascii?Q?7EUkZ08NtEvEdq/jbObopjQzUidJz8qZN3++Dv+Odmdq+5SQfoHHSbsTLHvC?=
 =?us-ascii?Q?idFQDfSqOnQcdG/qe2Ifv5oLJYxM4tY5DrUKLS3LW5hW3W3XzdK6BFeFycCp?=
 =?us-ascii?Q?ypfPjNs/NM5teE+KTBd9F82LVe4pPX2J+siAYTEN3gmHnIxjulYEMc7ZavIh?=
 =?us-ascii?Q?d8U23ilji0JE82iLEIpX8Znt1J7Ygn8JQ7RKJxb0WvIbTZDnH7wMxTVZW9Or?=
 =?us-ascii?Q?Z3ndt2mc+7lWzBmpbu9yR8lIfZswbiGM9CfrOATOdOnel4VIt/0ve2gsBy6m?=
 =?us-ascii?Q?fthShOLZSpIiM+blsH2FC4tXcjBSkVoPQOZYGGJhPvxdjF7Hf0ibwtmdha3A?=
 =?us-ascii?Q?uW7GTOOtDcn2MUCpnNmGuvYO30GmRujZjl/GZsKuNvzdfP6vEHRmoTqJzYIz?=
 =?us-ascii?Q?sgln1ZMER8Lzaej+HbT1hZKs45HPtGETffOAt4eWoYnM4EoJ/GEKCrzdeUVF?=
 =?us-ascii?Q?XQuJOcUP3NjcmAXcXOSqFtX1fAzSX+g3jCQZjSIFCOs+4KIpyBe8hbq6E4qc?=
 =?us-ascii?Q?RKg9ywBbie96BTagtEUiRHld8vkANJx55wGGGmon/NeP2s7y8uQzGv0KS+Eg?=
 =?us-ascii?Q?Bw+4ltJ2bPFGSQwRl/R8FBRjE2qjMbICpgIzXxHu32c7zjN+WP1KNxuVjEL+?=
 =?us-ascii?Q?w32/LJGP9aGMZLNbglGZbV07vCNvQMgU8+xD8sV16Uf6vDiJKVAwKiWSC0Lo?=
 =?us-ascii?Q?Vv+KS8a7yNuyAn5Ng0bCGRfw+UuyAW8U0FKJa6ndXhctzETsVvQOdbtO3GmO?=
 =?us-ascii?Q?sq2KTTbyBhZCuExs4fUAy3UrQ4ZcUza0IGOouNXeSliLSg/kvb9IDqDIN4GM?=
 =?us-ascii?Q?uQvoSMFp+BuIcmr/zeLNjUuLdJY1NEJeqLyUN+go+jvFV+1UsKKxI/DvV1sZ?=
 =?us-ascii?Q?1p63pKWZ4djNa+xiGNkTTaylNnqccviRYqztlMVIfKIveGssX81pwqtLgVxY?=
 =?us-ascii?Q?4EnJsaLd0Jp61GuIS2ZA3dGtZC2Qf7+zzqxN36Ep?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ffecd6-01ac-441a-654e-08dcc6c3c631
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 18:12:12.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJQDXK+sS62/OSedArUDilIl8FtL+A9gGDLuhfFLN7tVA0Cd2G39JlngiopUnWUuiLlsNUb5OWWdJKDIWzMIgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9781

On Tue, Aug 27, 2024 at 12:05:24PM +1000, David Leonard wrote:
>
> Add QorIQ LS1012A pinctrl driver, allowing i2c-core to exert
> GPIO control over the second I2C bus.
>
> Signed-off-by: David Leonard <David.Leonard@digi.com>
> ---

Why not use pinctrl-single ?

You can ref arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi

It did similar thing to use GPIO recover i2c bus.

Just need change dts file.

Frank


>  drivers/pinctrl/freescale/Kconfig           |   8 +
>  drivers/pinctrl/freescale/Makefile          |   1 +
>  drivers/pinctrl/freescale/pinctrl-ls1012a.c | 381 ++++++++++++++++++++
>  3 files changed, 390 insertions(+)
>  create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1012a.c
>
> diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
> index 3b59d7189004..a2038042eeae 100644
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
> @@ -209,6 +209,14 @@ config PINCTRL_IMX93
>  	help
>  	  Say Y here to enable the imx93 pinctrl driver
>
> +config PINCTRL_LS1012A
> +	tristate "LS1012A pinctrl driver"
> +	depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	help
> +	  Say Y here to enable the ls1012a pinctrl driver
> +
>  config PINCTRL_VF610
>  	bool "Freescale Vybrid VF610 pinctrl driver"
>  	depends on SOC_VF610
> diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
> index d27085c2b4c4..6926529d8635 100644
> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_PINCTRL_IMX25)	+= pinctrl-imx25.o
>  obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
>  obj-$(CONFIG_PINCTRL_IMXRT1050)	+= pinctrl-imxrt1050.o
>  obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
> +obj-$(CONFIG_PINCTRL_LS1012A)	+= pinctrl-ls1012a.o
> diff --git a/drivers/pinctrl/freescale/pinctrl-ls1012a.c b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
> new file mode 100644
> index 000000000000..d4c535ed6c07
> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller for NXP QorIQ LS1012A.
> + *
> + * Copyright (c) 2024 Digi International, Inc.
> + * Author: David Leonard <David.Leonard@digi.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/of.h>
> +#include <linux/io.h>
> +#include <linux/regmap.h>
> +#include <linux/platform_device.h>
> +#include <linux/sys_soc.h>
> +
> +struct ls1012a_pinctrl_pdata {
> +	struct pinctrl_dev *pctl_dev;
> +	void __iomem *cr0mem;
> +	bool big_endian;
> +	u32 ssc;
> +};
> +
> +/* Bitfield macros for masks and values that follow the datasheet's
> + * bit numbering schemes for registers of different bit-endianess. */
> +#define BITV_BE(hi, v)	((v) << (31 - (hi) % 32))
> +#define BITM_BE(hi, lo)	(((1 << ((hi) - (lo) + 1)) - 1) << (31 - (hi) % 32))
> +#define BITV_LE(lo, v)	((v) << ((lo) % 32))
> +#define BITM_LE(lo, hi)	(((1 << ((hi) - (lo) + 1)) - 1) << ((lo) % 32))
> +
> +/* SCFG PMUXCR0 pinmux control register */
> +#define SCFG_PMUXCR0			0x430
> +#define QSPI_MUX_OVRD_MASK		BITM_BE(0, 0)	/* [0] */
> +#define QSPI_MUX_DISABLE		BITV_BE(0, 0)	/*  use RCW */
> +#define QSPI_MUX_ENABLE			BITV_BE(0, 1)	/*  use PMUXCR0 */
> +#define QSPI_DATA0_GPIO_OVR_MASK	BITM_BE(1, 1)	/* [1] */
> +#define QSPI_DATA0_GPIO_SEL_SPI		BITV_BE(1, 0)	/*  DATA0,SCK,CS0 */
> +#define QSPI_DATA0_GPIO_SEL_GPIO	BITV_BE(1, 1)	/*  GPIO1[4,11,5] */
> +#define QSPI_DATA1_GPIO_OVR_MASK	BITM_BE(3, 2)	/* [3:2] */
> +#define QSPI_DATA1_GPIO_SEL_SPI		BITV_BE(3, 0)	/*  DATA1 */
> +#define QSPI_DATA1_GPIO_SEL_GPIO	BITV_BE(3, 1)	/*  GPIO1[12] */
> +#define QSPI_IIC2_OVR_MASK		BITM_BE(5, 4)	/* [5:4] */
> +#define QSPI_IIC2_SEL_GPIO		BITV_BE(5, 0)	/*  GPIO1[13,14] */
> +#define QSPI_IIC2_SEL_I2C		BITV_BE(5, 1)	/*  SCL,SDA (rev0) */
> +#define QSPI_IIC2_SEL_SPI		BITV_BE(5, 2)	/*  DATA2,DATA3 */
> +
> +/* RCW SoC-specific configuration (read-only) */
> +#define DCFG_RCWSR			0x100
> +#define SOC_SPEC_CONFIG			416		/* word 13 */
> +#define DCFG_SSC_REG			(DCFG_RCWSR + SOC_SPEC_CONFIG / 8)
> +#define SSC_DATA0_GPIO_MASK		BITM_LE(421, 421)
> +#define SSC_DATA0_GPIO_SEL_SPI		BITV_LE(421, 0)	/*  DATA0,SCK,CS0 */
> +#define SSC_DATA0_GPIO_SEL_GPIO		BITV_LE(421, 1)	/*  GPIO1[11,4,5] */
> +#define SSC_DATA1_GPIO_MASK		BITM_LE(422, 423)
> +#define SSC_DATA1_GPIO_SEL_SPI		BITV_LE(422, 0)	/*  DATA1 */
> +#define SSC_DATA1_GPIO_SEL_GPIO		BITV_LE(422, 2)	/*  GPIO1[12] */
> +#define SSC_IIC2_MASK			BITM_LE(424, 425)
> +#define SSC_IIC2_SEL_GPIO		BITV_LE(424, 0)	/*  GPIO1[13,14] */
> +#define SSC_IIC2_SEL_I2C		BITV_LE(424, 2)	/*  SCL,SDA */
> +#define SSC_IIC2_SEL_SPI		BITV_LE(424, 1)	/*  DATA2,DATA3 */
> +#define SSC_IIC2_SEL_GPIO_RESET		BITV_LE(424, 3)	/*  GPIO1[13],RESET_REQ_B*/
> +
> +const struct pinctrl_pin_desc ls1012a_pins[] = {
> +	PINCTRL_PIN(60, "QSPI_A_DATA3/GPIO1_14/IIC2_SDA/RESET_REQ_B"),
> +	PINCTRL_PIN(61, "QSPI_A_DATA1/GPIO1_12"),
> +	PINCTRL_PIN(62, "QSPI_A_SCK/GPIO1_04"),
> +	PINCTRL_PIN(122, "QSPI_A_DATA2/GPIO1_13/IIC2_SCL"),
> +	PINCTRL_PIN(123, "QSPI_A_DATA0/GPIO1_11"),
> +	PINCTRL_PIN(124, "QSPI_A_CS0/GPIO1_05"),
> +};
> +
> +static const unsigned int qspi_1_grp[] = { 62, 123, 124 };
> +static const unsigned int qspi_2_grp[] = { 61 };
> +static const unsigned int qspi_3_grp[] = { 122, 60 };
> +
> +#define GRP_qspi_1	0	/* SCK,CS0,DATA0 */
> +#define GRP_qspi_2	1	/* DATA1 */
> +#define GRP_qspi_3	2	/* DATA2,DATA3 */
> +#define _GRP_max	3
> +
> +#define _PINGROUP(name) \
> +	[GRP_##name] = PINCTRL_PINGROUP(#name "_grp", name##_grp, ARRAY_SIZE(name##_grp))
> +static const struct pingroup ls1012a_groups[] = {
> +	_PINGROUP(qspi_1),
> +	_PINGROUP(qspi_2),
> +	_PINGROUP(qspi_3),
> +};
> +
> +
> +static void ls1012a_write_cr0(struct ls1012a_pinctrl_pdata *pd, u32 val)
> +{
> +	if (pd->big_endian)
> +		iowrite32be(val, pd->cr0mem);
> +	else
> +		iowrite32(val, pd->cr0mem);
> +}
> +
> +static u32 ls1012a_read_cr0(struct ls1012a_pinctrl_pdata *pd)
> +{
> +	return pd->big_endian ? ioread32be(pd->cr0mem) : ioread32(pd->cr0mem);
> +}
> +
> +static int ls1012a_get_groups_count(struct pinctrl_dev *pcdev)
> +{
> +	return ARRAY_SIZE(ls1012a_groups);
> +}
> +
> +static const char *ls1012a_get_group_name(struct pinctrl_dev *pcdev,
> +	unsigned int selector)
> +{
> +	return ls1012a_groups[selector].name;
> +}
> +
> +static int ls1012a_get_group_pins(struct pinctrl_dev *pcdev,
> +	unsigned int selector, const unsigned int **pins, unsigned int *npins)
> +{
> +	*pins = ls1012a_groups[selector].pins;
> +	*npins = ls1012a_groups[selector].npins;
> +	return 0;
> +}
> +
> +static const struct pinctrl_ops ls1012a_pinctrl_ops = {
> +	.get_groups_count = ls1012a_get_groups_count,
> +	.get_group_name = ls1012a_get_group_name,
> +	.get_group_pins = ls1012a_get_group_pins,
> +	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
> +	.dt_free_map = pinconf_generic_dt_free_map,
> +};
> +
> +static const char * const i2c_groups[] = { "qspi_3_grp" };
> +static const char * const spi_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
> +static const char * const gpio_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
> +static const char * const gpio_reset_groups[] = { "qspi_3_grp" };
> +
> +#define FUNC_i2c	0
> +#define FUNC_spi	1
> +#define FUNC_gpio	2
> +#define FUNC_gpio_reset 3
> +#define _FUNC_max	4
> +
> +#define _PINFUNC(name) \
> +	[FUNC_##name] = PINCTRL_PINFUNCTION(#name, name##_groups, ARRAY_SIZE(name##_groups))
> +static const struct pinfunction ls1012a_functions[] = {
> +	_PINFUNC(i2c),
> +	_PINFUNC(spi),
> +	_PINFUNC(gpio),
> +	_PINFUNC(gpio_reset),
> +};
> +
> +static int ls1012a_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	return ARRAY_SIZE(ls1012a_functions);
> +}
> +
> +static const char *ls1012a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
> +{
> +	return ls1012a_functions[func].name;
> +}
> +
> +static int ls1012a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
> +	const char * const **groups,
> +	unsigned int * const ngroups)
> +{
> +	*groups = ls1012a_functions[func].groups;
> +	*ngroups = ls1012a_functions[func].ngroups;
> +	return 0;
> +}
> +
> +/*
> + * LS1012A
> + *    Group: qspi_1             qspi_2      qspi_3
> + *           ================== =========== =============
> + *    Pin:   62    123    124   61          122    60
> + *           ----- ------ ----- ----------- ------ ------
> + * i2c                                      SCL    SDA    (RCW only)
> + * spi       SCK   DATA0
> + * spi       SCK   DATA0        DATA1
> + * spi       SCK   DATA0        DATA1       DATA2  DATA3
> + * gpio      GPIO4 GPIO11 GPIO5
> + * gpio                         GPIO12
> + * gpio                                     GPIO13 GPIO14
> + * gpio_reset                               GPIO13 REQ_B  (RCW only)
> + */
> +
> +static const struct ls1012a_func_mux {
> +	u32 cr0mask, cr0; /* mux control */
> +	u32 sscmask, ssc; /* equivalent in RCW */
> +} ls1012a_func_mux[_FUNC_max][_GRP_max] = {
> +	[FUNC_i2c] = {
> +		[GRP_qspi_3] = {
> +			.sscmask = SSC_IIC2_MASK,
> +			.ssc =     SSC_IIC2_SEL_I2C,
> +		},
> +	},
> +	[FUNC_spi] = {
> +		[GRP_qspi_1] = {
> +			.cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
> +			.cr0 =     QSPI_DATA0_GPIO_SEL_SPI,
> +			.sscmask = SSC_DATA0_GPIO_MASK,
> +			.ssc =     SSC_DATA0_GPIO_SEL_SPI
> +		},
> +		[GRP_qspi_2] = {
> +			.cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
> +			.cr0 =     QSPI_DATA1_GPIO_SEL_SPI,
> +			.sscmask = SSC_DATA1_GPIO_MASK,
> +			.ssc =     SSC_DATA1_GPIO_SEL_SPI,
> +		},
> +		[GRP_qspi_3] = {
> +			.cr0mask = QSPI_IIC2_OVR_MASK,
> +			.cr0 =     QSPI_IIC2_SEL_SPI,
> +			.sscmask = SSC_IIC2_MASK,
> +			.ssc =     SSC_IIC2_SEL_SPI,
> +		},
> +	},
> +	[FUNC_gpio] = {
> +		[GRP_qspi_1] = {
> +			.cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
> +			.cr0 =     QSPI_DATA0_GPIO_SEL_GPIO,
> +			.sscmask = SSC_DATA0_GPIO_MASK,
> +			.ssc =     SSC_DATA0_GPIO_SEL_GPIO,
> +		},
> +		[GRP_qspi_2] = {
> +			.cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
> +			.cr0 =     QSPI_DATA1_GPIO_SEL_GPIO,
> +			.sscmask = SSC_DATA1_GPIO_MASK,
> +			.ssc =     SSC_DATA1_GPIO_SEL_GPIO,
> +		},
> +		[GRP_qspi_3] = {
> +			.cr0mask = QSPI_IIC2_OVR_MASK,
> +			.cr0 =     QSPI_IIC2_SEL_GPIO,
> +			.sscmask = SSC_IIC2_MASK,
> +			.ssc =     SSC_IIC2_SEL_GPIO,
> +		},
> +	},
> +	[FUNC_gpio_reset] = {
> +		[GRP_qspi_3] = {
> +			.sscmask = SSC_IIC2_MASK,
> +			.ssc =     SSC_IIC2_SEL_GPIO_RESET,
> +		},
> +	},
> +};
> +
> +static int ls1012a_set_mux(struct pinctrl_dev *pcdev,
> +	unsigned int func, unsigned int group)
> +{
> +	struct ls1012a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
> +	const struct ls1012a_func_mux *fm = &ls1012a_func_mux[func][group];
> +	u32 cr0 = ls1012a_read_cr0(pd);
> +
> +	if (!fm->cr0mask) {
> +		if ((pd->ssc & fm->sscmask) != fm->ssc)
> +			return -EOPNOTSUPP;
> +		cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_DISABLE;
> +	} else {
> +		cr0 = (cr0 & ~fm->cr0mask) | fm->cr0;
> +		if ((pd->ssc & fm->sscmask) != fm->ssc)
> +			cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_ENABLE;
> +	}
> +	ls1012a_write_cr0(pd, cr0);
> +	return 0;
> +}
> +
> +static void ls1012a_init_mux(struct ls1012a_pinctrl_pdata *pd)
> +{
> +	unsigned int func, group;
> +	const struct ls1012a_func_mux *fm;
> +	u32 cr0;
> +
> +	cr0 = ls1012a_read_cr0(pd);
> +	if ((cr0 & QSPI_MUX_OVRD_MASK) == QSPI_MUX_DISABLE) {
> +		/*
> +		 * Prepare a disabled MUXCR0 to have a same/similar
> +		 * configuration as RCW SSC, and leave it disabled.
> +		 */
> +		for (func = 0; func < _FUNC_max; func++) {
> +			for (group = 0; group < _GRP_max; group++) {
> +				fm = &ls1012a_func_mux[func][group];
> +				if (fm->sscmask &&
> +				    fm->ssc == (pd->ssc & fm->sscmask)) {
> +					cr0 &= ~fm->cr0mask;
> +					cr0 |= fm->cr0;
> +				}
> +			}
> +		}
> +		ls1012a_write_cr0(pd, cr0);
> +	}
> +}
> +
> +static const struct pinmux_ops ls1012a_pinmux_ops = {
> +	.get_functions_count = ls1012a_get_functions_count,
> +	.get_function_name = ls1012a_get_function_name,
> +	.get_function_groups = ls1012a_get_function_groups,
> +	.set_mux = ls1012a_set_mux,
> +};
> +
> +static struct pinctrl_desc ls1012a_pinctrl_desc = {
> +	.name = "ls1012a",
> +	.pins = ls1012a_pins,
> +	.npins = ARRAY_SIZE(ls1012a_pins),
> +	.pctlops = &ls1012a_pinctrl_ops,
> +	.pmxops = &ls1012a_pinmux_ops,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int ls1012a_pinctrl_probe(struct platform_device *pdev)
> +{
> +	struct ls1012a_pinctrl_pdata *pd;
> +	int ret;
> +	u32 dcfg_ssc;
> +	struct regmap *dcfg_regmap;
> +
> +	pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
> +	if (!pd)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, pd);
> +
> +	pd->big_endian = device_is_big_endian(&pdev->dev);
> +
> +	/* SCFG PMUX0 */
> +	pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pd->cr0mem))
> +		return PTR_ERR(pd->cr0mem);
> +	dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
> +		pd->big_endian ? "be" : "le");
> +
> +	/* DCFG RCW SSC */
> +	dcfg_regmap = syscon_regmap_lookup_by_phandle(
> +		dev_of_node(&pdev->dev), "dcfg-regmap");
> +	if (IS_ERR(dcfg_regmap)) {
> +		dev_err(&pdev->dev, "dcfg regmap: %pe\n", dcfg_regmap);
> +		return -EINVAL;
> +	}
> +	ret = regmap_read(dcfg_regmap, DCFG_SSC_REG, &dcfg_ssc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "dcfg-regmap read: %d\n", ret);
> +		return ret;
> +	}
> +	pd->ssc = swab32(dcfg_ssc); /* untwist RCW fields */
> +
> +	dev_dbg(&pdev->dev, "dcfg ssc = %08x (grp1=%s grp2=%s grp3=%s)\n",
> +		pd->ssc,
> +		(pd->ssc & SSC_DATA0_GPIO_MASK) == SSC_DATA0_GPIO_SEL_SPI ? "spi" : "gpio",
> +		(pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_SPI ? "spi"
> +		: (pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_GPIO ? "gpio"
> +		: (pd->ssc & SSC_DATA1_GPIO_MASK) == 0x80 ? "10" : "11",
> +		(pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_GPIO ? "gpio"
> +		: (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_I2C ? "i2c"
> +		: (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_SPI ? "spi"
> +		: "gpio+reset");
> +
> +	ls1012a_init_mux(pd);
> +
> +	ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1012a_pinctrl_desc,
> +		pd, &pd->pctl_dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
> +
> +	pinctrl_enable(pd->pctl_dev);
> +	return ret;
> +}
> +
> +static const struct of_device_id ls1012a_pinctrl_match_table[] = {
> +	{ .compatible = "fsl,ls1012a-pinctrl" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver ls1012a_pinctrl_driver = {
> +	.driver = {
> +		.name = "ls1012a_pinctrl",
> +		.of_match_table = ls1012a_pinctrl_match_table,
> +	},
> +	.probe = ls1012a_pinctrl_probe,
> +};
> +
> +builtin_platform_driver(ls1012a_pinctrl_driver)
> +
> +MODULE_DESCRIPTION("LS1012A pinctrl driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

