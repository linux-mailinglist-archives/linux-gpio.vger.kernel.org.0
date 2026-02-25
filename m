Return-Path: <linux-gpio+bounces-32179-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH1sOJEhn2mPZAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32179-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:21:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A0C19A7D1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 17:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B27773012BC0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 16:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2EF3E8C5D;
	Wed, 25 Feb 2026 16:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="EbwvjhAh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641983D7D81;
	Wed, 25 Feb 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036341; cv=fail; b=gG9Aaw3xkDh7A5ryOtQfslMLWJVpFTZ8m6SkdJ6Bi1cH6LuJCezYiReIsBBTsO/GAqxwHirw/BJrj77vcLg9mIpFzm3PK1Dt249wFi5cHV35sptlRZq4Lgr880YTp3RocOMNiMp/hsRAreRg5Q+9YcpF1W3ocaUPKQM5WwDUMeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036341; c=relaxed/simple;
	bh=qa5jP6eZH79gPiCd8MoBSNI33OJQrOYJPuhfmCnJ998=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=cIgHT71bgD+Ko7sFzc2GjvU93Y5sb24VdWVl1cD9Owk4zuUlh4qBpKPaXrmwaNoLApdwwgWNHo3+yPBKuQy3QCwTrG52gPvMLX9q//Rner1Hf3bmTOLummDAdpI5KYEncRtpG83Ovx78oSaQDGD/wYDE9BTovJ3GkXn0SIwmIkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=EbwvjhAh; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1IrCsanflsLmN+bc6OWcOCFw5HIpeq/6UaTUCDadMRmCO718bUN4k6a61BT/ym7mTT/BfcmKHkjh4CFy98cfvn7ZwoyoUzZPbYQ5GvOmWC+IvbchiLYIi2uEymfH5zBLaqN1VvNtid/fEcghIaD/pZy7ZjYe5xxMZSV4cknarW6kpoB2VGEjtk7UpceZ6UG36ZX/TA6MoafvPeNIVRbSJJvO9fhCYuNIczJ8ofBvrO5kK/AJBMbNOJVFobRrlTJPeV03Fg/UhHX7AjBcv5ZHiajAgL64qM+Q0XmPFhxtSbFlB78+rhPzK3hpcZVYDlu/hewgATSnEMiYQIADn6nxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAL0hKF9DqG13t2DzY1X0cFefzLdzBXHOetxmyXbePo=;
 b=tCEb2ZJMrW1gejrORcQCzindkFhxgX1B1SGnOPmQh3dGRL/2iE3i1RsGWdrstuJN+VvD8khHX5REUf5gCsYlPzBb0mHlUjD/7IpTy4VVXvDxNJ7++D1eebqoFcn7sZ9HVhPesWyqRVehtOLnHNmzoVnPeCI17RVpYVbbk3tBq5rS1AjvCJkY/5gkYssMyi6HssaPoTdlWB21ytcEQULqZc98EIddJx8aist83BYxFdKxOt8a7ZKWk6yRK3qJodM/yapHFL/ahNQAuCV9+axddRTu5hjGUIehyJikh5qsTLSfYNfdq/mWmSYhOXptGCELvsbfc/TZBHcXzBffTD4s6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAL0hKF9DqG13t2DzY1X0cFefzLdzBXHOetxmyXbePo=;
 b=EbwvjhAhG1tfT4LWcUs4RInRv7qOYqYgcgYMo/egsrfBMsPtbmE4/oi5bipgH58vVOzIjRLrpuEt4UGCaVdbuoxbtIq5mR0+TAdiprFXVWJBcXBdBNNBJzNm7o/u/2gQ84N5DadxaoMV9H8sz/qtA2uxFve/DzAkbQzqkO8mOkI2B8uBxUqEV0AkLpr/E9BVtqmlouYF6i8kBE73RiwSz6g8WdrvSa91yMHVwm3cofx8YVEqw+BKdnWJ1sca9cziNKSvmDk/NDIJLpxFVYneBQAMpVslQjTLTEtEkrBvSQtUggy6o6DWctApPb4W8yFwKih5aI6/hpt9SuezZfrL4g==
Received: from DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) by AS8PR10MB7474.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ad::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 16:18:43 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::e4) by DUZPR01CA0013.outlook.office365.com
 (2603:10a6:10:3c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 16:18:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 25 Feb 2026 16:18:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 17:20:59 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 17:18:41 +0100
Message-ID: <5e638755-a356-4fe6-af66-f9530d2a5d96@foss.st.com>
Date: Wed, 25 Feb 2026 17:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v5 06/12] drivers: bus: add the stm32 debug bus driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <jens.wiklander@linaro.org>, Etienne Carriere
	<etienne.carriere@foss.st.com>, Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-6-90b670844241@foss.st.com>
Content-Language: en-US
In-Reply-To: <20260123-debug_bus-v5-6-90b670844241@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D12:EE_|AS8PR10MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 560c2460-17ba-4902-8838-08de74898b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	u8kl7YX41tIc6x9XMOaplTircTz/+nvrj1YWtYawl8bo2GXVBD1EqOyM2/gc/3zlRKMWFXWKgLB9sB5zgzF08+oozaQQ04mkvpsC+Wv4fJ1HRNMMUPY70BGfbZ/1QegvnR6hDLLVXkPCtthZWbNjOFqqWz+y0Wbtx2mpMLHT1X3b4yy2I5F2HUVwGzGjXqe3/AAC1pnq2oALaPIIvqQqABzEBifwhgC1/iL8viNDQ3+2+6cfNho3OWAu5onVc5gjeHIPLHLynUS1Z2YE46enLuUvi27x4+kbwlbReLAg60TcrMSVvA56QHCireRANzYeTjPfqNeGnj66sLzZ6vwPaMAC66mocaZBEbWhJthDpyp6PUO7wnmm4jIeaJ6+wp4yDprvxKQ2/geCF3xRe0pMf3Szix/vkLp59Ke9KDb7cCpjEJbcDNDevWSwfJPpTuWr80N1GoD94Dwun5Fi2qGHDmnI8+/LYspPrNMJHFj/cvjmNGc2mn5Onm3sIMl5k3leuj8kV7WuWnKD1LG5MV+HHTjP8+mm9rOxZQuww8uR10MT6qZeM7ntjqgUnSTcov0YX9ZzjDfVaragdcecFyFbOay4cwXScvtFcmA831/rTGPDhn++/pwfgqOqLwmTCflZ/e0C2PLLlUOCZvanHKf2xe/qQAQ9IoAUUori6dB0/PjYdXt7aFYoz/ezvGt6JNhPSzP8AKJc9X45qSUIrrxE7slopGvbXaM4gPlnCnTffL7b+FYzhnpqWv9m18QnL0jTFkbtH7ir/51YEyJy+v6P145VrRHMdLt8uJEVmM1HESquiinJVV9SaWqXHqBU0xvhAbQBVZTE3Hwcbl2vUyv7fUF/N5Niqi9d5yDJ2iVj8Rk=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vxW7MRlGxORvm7wieO/BzQJ3vzwIluMw0CVivEdesq/qZlqnKdcRS7FTcKPzWsCKDJB70UhSM9rk/knecQhaz2vjUcBhJbOjBV+RTd+JfZop4PMKptz7qd/2cr2M8TCK07mPuM7Ot7B4v69AftHVQtKmjpb/BpdG6eAEVrEcucxP/POsemjsvg4leq+Cs8f4XNesXydfDCb8OGkc2oPVI5zrDERO0p6XWx/bItCWIGBPIwhpoWOgglHAj+VcdNw+T+7jSbUZNEs4u4uhvV9/0GpBZkU8LJmcKvDj73PVnyn+Ln4XVRnFtC5MfjtBW3gVJyBxdB/5n/+xjKwxho3ZLcamZXshpYCYx0z/KhkZcRZj9uMld1BdYKpfOauxur0TfKEmJdGJ/exJ+vZsx/0bzwmuH3b02ZjYf/cp9cISqqaDHz6n5KSYZf+srcLPcGbA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 16:18:42.9551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 560c2460-17ba-4902-8838-08de74898b5d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7474
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32179-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email,foss.st.com:mid,foss.st.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 82A0C19A7D1
X-Rspamd-Action: no action



On 1/23/26 11:39, Gatien Chevallier wrote:
> Add the stm32 debug bus driver that is responsible of checking the
> debug subsystem accessibility before probing the related peripheral
> drivers.
> 
> This driver is OP-TEE dependent and relies on the STM32 debug access
> PTA.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   MAINTAINERS                 |   1 +
>   drivers/bus/Kconfig         |  10 ++
>   drivers/bus/Makefile        |   1 +
>   drivers/bus/stm32_dbg_bus.c | 236 ++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 248 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..fd8390e02070 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24698,6 +24698,7 @@ F:	drivers/power/supply/stc3117_fuel_gauge.c
>   ST STM32 FIREWALL
>   M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
>   S:	Maintained
> +F:	drivers/bus/stm32_dbg_bus.c
>   F:	drivers/bus/stm32_etzpc.c
>   F:	drivers/bus/stm32_firewall.c
>   F:	drivers/bus/stm32_rifsc.c
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index fe7600283e70..c9be21d5dfda 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -169,6 +169,16 @@ config QCOM_SSC_BLOCK_BUS
>   	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>   	  which provides clocks for the above.
>   
> +config STM32_DBG_BUS
> +	tristate "OP-TEE based debug access bus"
> +	depends on OPTEE && STM32_FIREWALL
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	help
> +	  Select this to get the support for the OP-TEE based STM32 debug bus
> +	  driver that is used to handle debug-related peripherals on STM32
> +	  platforms when the debug configuration is not accessible by the
> +	  normal world.
> +
>   config STM32_FIREWALL
>   	bool "STM32 Firewall framework"
>   	depends on (ARCH_STM32 || COMPILE_TEST) && OF
> diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> index 8e693fe8a03a..799724cfc2df 100644
> --- a/drivers/bus/Makefile
> +++ b/drivers/bus/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
>   obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
>   obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
>   obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
> +obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
>   obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
>   obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
>   obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
> diff --git a/drivers/bus/stm32_dbg_bus.c b/drivers/bus/stm32_dbg_bus.c
> new file mode 100644
> index 000000000000..9427d4da0da7
> --- /dev/null
> +++ b/drivers/bus/stm32_dbg_bus.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <linux/bus/stm32_firewall_device.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/tee_drv.h>
> +#include <linux/types.h>
> +
> +#include "stm32_firewall.h"
> +
> +enum stm32_dbg_profile {
> +	PERIPHERAL_DBG_PROFILE	= 0,
> +	HDP_DBG_PROFILE		= 1,
> +};
> +
> +enum stm32_dbg_pta_command {
> +	/*
> +	 * PTA_CMD_GRANT_DBG_ACCESS - Verify the debug configuration against the given debug profile
> +	 * and grant access or not
> +	 *
> +	 * [in]     value[0].a  Debug profile to grant access to.
> +	 */
> +	PTA_CMD_GRANT_DBG_ACCESS,
> +};
> +
> +/**
> + * struct stm32_dbg_bus - OP-TEE based STM32 debug bus private data
> + * @dev: STM32 debug bus device.
> + * @ctx: OP-TEE context handler.
> + */
> +struct stm32_dbg_bus {
> +	struct device *dev;
> +	struct tee_context *ctx;
> +};
> +
> +/* Expect at most 1 instance of this driver */
> +static struct stm32_dbg_bus *stm32_dbg_bus_priv;
> +
> +static int stm32_dbg_pta_open_session(u32 *id)
> +{
> +	struct tee_client_device *dbg_bus_dev = to_tee_client_device(stm32_dbg_bus_priv->dev);
> +	struct tee_ioctl_open_session_arg sess_arg;
> +	int ret;
> +
> +	memset(&sess_arg, 0, sizeof(sess_arg));
> +	export_uuid(sess_arg.uuid, &dbg_bus_dev->id.uuid);
> +	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
> +
> +	ret = tee_client_open_session(stm32_dbg_bus_priv->ctx, &sess_arg, NULL);
> +	if (ret < 0 || sess_arg.ret) {
> +		dev_err(stm32_dbg_bus_priv->dev, "Failed opening tee session, err: %#x\n",
> +			sess_arg.ret);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	*id = sess_arg.session;
> +
> +	return 0;
> +}
> +
> +static void stm32_dbg_pta_close_session(u32 id)
> +{
> +	tee_client_close_session(stm32_dbg_bus_priv->ctx, id);
> +}
> +
> +static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
> +{
> +	struct tee_ioctl_invoke_arg inv_arg = {0};
> +	struct tee_param param[1] = {0};
> +	u32 session_id;
> +	int ret;
> +
> +	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
> +		return -EOPNOTSUPP;
> +
> +	ret = stm32_dbg_pta_open_session(&session_id);
> +	if (ret)
> +		return ret;
> +
> +	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
> +	inv_arg.session = session_id;
> +	inv_arg.num_params = 1;
> +	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	param[0].u.value.a = dbg_profile;
> +
> +	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_dbg(stm32_dbg_bus_priv->dev,
> +			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
> +		if (!ret)
> +			ret = -EACCES;
> +	}
> +
> +	stm32_dbg_pta_close_session(session_id);
> +
> +	return ret;
> +}
> +
> +/* Implement mandatory release_access ops even if it does nothing*/
> +static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
> +{
> +}
> +
> +static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
> +{
> +	struct stm32_firewall_controller *dbg_controller;
> +	int ret;
> +
> +	if (!stm32_dbg_bus_priv)
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +				     "OP-TEE debug services not yet available\n");
> +
> +	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
> +	if (!dbg_controller)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
> +
> +	dbg_controller->dev = &pdev->dev;
> +	dbg_controller->mmio = NULL;
> +	dbg_controller->name = dev_driver_string(dbg_controller->dev);
> +	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
> +	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
> +	dbg_controller->release_access = stm32_dbg_bus_release_access;
> +
> +	ret = stm32_firewall_controller_register(dbg_controller);
> +	if (ret) {
> +		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = stm32_firewall_populate_bus(dbg_controller);
> +	if (ret) {
> +		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
> +		stm32_firewall_controller_unregister(dbg_controller);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret) {
> +		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
> +		stm32_firewall_controller_unregister(dbg_controller);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id stm32_dbg_bus_of_match[] = {
> +	{ .compatible = "st,stm32mp131-dbg-bus", },
> +	{ .compatible = "st,stm32mp151-dbg-bus", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
> +
> +static struct platform_driver stm32_dbg_bus_driver = {
> +	.probe = stm32_dbg_bus_plat_probe,
> +	.driver = {
> +		.name = "stm32-dbg-bus",
> +		.of_match_table = stm32_dbg_bus_of_match,
> +	},
> +};
> +
> +static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> +}
> +
> +static void stm32_dbg_bus_remove(struct tee_client_device *tee_dev)
> +{
> +	tee_client_close_context(stm32_dbg_bus_priv->ctx);
> +	stm32_dbg_bus_priv = NULL;
> +
> +	of_platform_depopulate(&tee_dev->dev);
> +}
> +
> +static int stm32_dbg_bus_probe(struct tee_client_device *tee_dev)
> +{
> +	struct device *dev = &tee_dev->dev;
> +	struct stm32_dbg_bus *priv;
> +	int ret = 0;
> +
> +	if (stm32_dbg_bus_priv)
> +		return dev_err_probe(dev, -EBUSY,
> +				     "A STM32 debug bus device is already initialized\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Open context with TEE driver */
> +	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
> +	if (IS_ERR_OR_NULL(priv->ctx))
> +		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
> +
> +	stm32_dbg_bus_priv = priv;
> +	stm32_dbg_bus_priv->dev = dev;
> +
> +	ret = platform_driver_register(&stm32_dbg_bus_driver);

Hello,

Adding Etienne, Cristian and Sudeep.

Since [1], it is impossible to call platform_driver_register()
in a probe() sequence because of the rework of the lock mechanism.
Similar situation can be found for other drivers in this thread.

Here, we want to ensure the OP-TEE debug access service is embedded
and available before probing the platform device part. Therefore, I
cannot simply implement a regular module driver that would have all the
chances to be probed before OP-TEE driver.

This is what motivated this driver architecture. And also
drivers/firmware/arm_scmi/transports/optee.c that is now broken
and make all our platforms fail to boot (reproducible on latest
kernel tag)...

For this driver, I guess I can keep a simple tee bus driver,
completely removing the useless platform device part. But
for the OP-TEE SCMI transport driver, it is more complex.
Previous to the use of platform_driver_register(), a
device link was used. Maybe for the transport, a response on
[1] mail thread would be appropriate.

For this patchset, I will rebase and take care fixing that.

[1]: 
https://lore.kernel.org/all/20260113162843.12712-1-hanguidong02@gmail.com/

Best regards,
Gatien


> +	if (ret) {
> +		stm32_dbg_bus_remove(tee_dev);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
> +	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
> +		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
> +	{}
> +};
> +
> +static struct tee_client_driver stm32_optee_dbg_bus_driver = {
> +	.id_table = optee_dbg_bus_id_table,
> +	.probe = stm32_dbg_bus_probe,
> +	.remove = stm32_dbg_bus_remove,
> +	.driver = {
> +		.name = "optee_dbg_bus",
> +	},
> +};
> +
> +module_tee_client_driver(stm32_optee_dbg_bus_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
> 


