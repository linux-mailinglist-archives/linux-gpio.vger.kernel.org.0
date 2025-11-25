Return-Path: <linux-gpio+bounces-29052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24EC82FD3
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 02:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 958FB4E4B7F
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 01:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DFB202F70;
	Tue, 25 Nov 2025 01:10:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023105.outbound.protection.outlook.com [52.101.127.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160E191484
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 01:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764033034; cv=fail; b=LyHUW6n/kkV6mlP+cI0oK8pBAXcv2bK8UgKT0i5IemL66LhTj5N/4O0lqKTSlf0SEI1sLiKFdRHnxRNN0N/J7XTvSUAH+xWihj1drkMXe5Kh4GcYJwGkLFvJReFa+W5hE8lXmmPSQTpeFLEFneH56/i1Zx1qD3kydPEfuy9hqC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764033034; c=relaxed/simple;
	bh=CAubCabMjEBGbjdRQ+eHKnFpfU8SPsGZPrBxQGb3r4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdDtIfNg0uBGjxppwHLPNUJ8C9RGNctm1dqHoqrda5omqXpVToefZBk290PLGApB47fCKdJAu7PKTqaITmDVrWqPhT/qULOb6yMp15GnJLXI4M5lR3t7KQSh7dCLkX7EjMHFuC0b9vTjtgYr75fERmPgLrmXvOMRH4/yxhIv0x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfLqh3NJSb/jhZ2jY9yGgckgI0N+vc+VJnJ6mCW/omUNjMfTdTVjfWj5WBwgRAAGU8yYrJbJ0HWVf243xa3n9lyXAjP7gejOxrJwINubaG5gSx9EMI/o6vZl+qncldl1KOl+NvwjrVvarAVivLWRjqf8Ed4GgBKy7YSBKJ+WAhUzhuuls3G1c3vdaf+ThzUxVVhoHaSoE7BBr4WuGY4LEuuf8oh7D4SzqOBlFJSgHSDc0ZWPGU8/R4Iq1XT8E84NXOHdAEanXqB1tbyQGbFf2UoBFcEaLk+M7xX/eDLGrq7CAJ2sJRmizqq45mYox6KNZCcvfad1zCuwDii1sHPVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnn3aDwnSkWhUhscAG8c8qaq4wMHbsl6nmY1p/YznJs=;
 b=SCiQ7qkTzXWkszT2uJ90uJxKCGTnPj1jTbvXoS4u34LU8RRus7k6AUl23iFS3cFT/fKaMqZOID7djk0ZEI0FezMbxUwLX94AGmccUnZtNAYanbJB7fwTF+uDmXXFTHxNYgZfLF7U3BidCgR7FWoH6ma2rcb05R8zEgl7n9wrLZrYBZU24NbVJunDnXIbJdB7EnZ+T2bWLcJwClsvlfRItWrGkTJ+4b+RfqOdYOqb0euHoFAUoB3awpqQSbksOr/v/yZP3X7JCnnLG2WPIhwZJVStT38sgxTYDTm4HCL1dTzS0itG57LfH4ceDxH14aBV/cZ7ISkeyv0pt6M3JSzM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0056.apcprd02.prod.outlook.com (2603:1096:4:54::20) by
 KL1PR06MB6257.apcprd06.prod.outlook.com (2603:1096:820:d1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.16; Tue, 25 Nov 2025 01:10:27 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:54:cafe::f9) by SG2PR02CA0056.outlook.office365.com
 (2603:1096:4:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 01:10:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 01:10:26 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 43BC840A5BD7;
	Tue, 25 Nov 2025 09:10:26 +0800 (CST)
Date: Tue, 25 Nov 2025 09:10:20 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cix: Fix obscure dependency
Message-ID: <aSUB_C5H2sXxVXXo@nchen-desktop>
References: <20251124-cix-deps-v1-1-fe603dfe86ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-cix-deps-v1-1-fe603dfe86ef@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|KL1PR06MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d42cffc-f983-4ae5-b3e5-08de2bbf6b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wRgMwyV3atKLUtks/G+xofFyrF6T03K4HsS+kHi4s6Pm+vp2y+456xdB2GMQ?=
 =?us-ascii?Q?vh2jHu4yf2doAzRlukYhaSl2fW6cJM56KFvxAFasxLvcBGymuIZGNadxC2CF?=
 =?us-ascii?Q?d4nTkqrfpqDQaobIedZ7iYqPl5Jr+/D1Uddo88lpxqqpdGZf1WNRKSu9BIVo?=
 =?us-ascii?Q?BWrgGA1LiHPfT0ASW9fc0UVMa/yWopgtaGuaKv+55+Q5youh6T1ct6cZUOy2?=
 =?us-ascii?Q?axEUwDqRjQ2umaLvN72c2IX8qZY8K8ToyMrnCp6KGVPpMZs3fU10OgPtS3gh?=
 =?us-ascii?Q?350PQ38TtGbouPmql17PzakVFpZButjSdZd9KYUxo0DTpN9ecJWJbkgRh4x5?=
 =?us-ascii?Q?Y0bOnRLLnxtlJNFhYRYOmerCZpMd2tV2e9MmVyyurV3eF9l2yjmUXbG0sA86?=
 =?us-ascii?Q?8LLEL0MH24hkoNNFAbHAYkQq8sTcLBfAAvle7KTbO0mBYfy1SnnmeZqW2Qub?=
 =?us-ascii?Q?TC2sbWOGsweXLARvUSCCcf2rKGgFeZ9VhscXOsfZ2rrqavFPdqGYKTNXL06f?=
 =?us-ascii?Q?oEeCeY9RzSJXhMyzQGTFm620zV9mN5aSldglYwTXgEWvVq0QO4KZ5H6GakMy?=
 =?us-ascii?Q?V0q9s8wykaS9CuwR9dQ5mpVEPIK5gvDF+9gViZI3sN6jSgDjAVceUZEoi/CR?=
 =?us-ascii?Q?jIHLpD7G0OaKzroJRbNwyp77jdt8Uw/8pvm6mAmwulWKWSZ37ZTSkrCZ1DTQ?=
 =?us-ascii?Q?gdXDIAmq6SY+qwmSan8/+0JCQz64jfcV4QPtlDlf/z+IKFBh6ZvP5VGaFJG/?=
 =?us-ascii?Q?InUhjEt26VPmpmNGBCozg8RIDVimUm1KSwNOah2xpCs29I8PTJBJKG/WddUa?=
 =?us-ascii?Q?1rghqBP3yXLLuKVQhzsGPoA2DMFN0D+nR8nrujKRCg87Yv3+M6vgWNFtlMwF?=
 =?us-ascii?Q?kWDLraH980OXy9Xi6IyRRG690JdHt6BuhWdueknYXoGUkOpGyj/wQ4h2CeVB?=
 =?us-ascii?Q?9wr0++PqWB3lgk7L/dblt7pJaq0E3Zu8uFd7TT2/iOZu9Dk0umQFMb1JFyjS?=
 =?us-ascii?Q?PQZ15FftMg6C21dydPK9Sv6XDf6sKRGgMlBeusCsE6hxgrC34DSZ0RqE9z9N?=
 =?us-ascii?Q?8XOhshDoMPSgEqd5td/u2iBPBk7qkZfydAWuxisr5qAuj1Q4SCKXB8zZSK/d?=
 =?us-ascii?Q?RXc1C3cT21ebz5E0N6+yU6e3zbJYzNGey5LcXIHfONNL6EorSHR5SI/QCP77?=
 =?us-ascii?Q?966GkBZmR0OJT7LhXAcnQwQNLKJ6FEtCTSDNuHtRLNXEhg+pDem1y8/k3tFh?=
 =?us-ascii?Q?q7ymyqGeMbJ3lcsU8HAPguYKzbPIDep6I3GwFJkHxPNWa6fnfLE1wzrvRNj2?=
 =?us-ascii?Q?hTybQYW/XEKT2nsru4X+vByTaWBC2ifYKC5BQl/rHgmTOyI9lKk3lsQzyLc2?=
 =?us-ascii?Q?gchMOrlpLMWvV7HYh8xdnswR+ImOQwiN6pvzecb7ialZNRgXA1Uv8Sj3bEhu?=
 =?us-ascii?Q?WfueGdAldGCdpTlibLKSjsgeJyjCM3BCvC51MAxG8GB4nRvN6xpDJGMD3c8M?=
 =?us-ascii?Q?a13frT7lxA4QDK+zRI3LNLrtGY4kOCUXMWpCrQYcN2rH8QUHA745qpJHIBfj?=
 =?us-ascii?Q?3aS9GuyV3lih1cS7GTw=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 01:10:26.9560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d42cffc-f983-4ae5-b3e5-08de2bbf6b3e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6257

On 25-11-24 15:35:16, Linus Walleij wrote:
> EXTERNAL EMAIL
> 
> When compile-testing for UM-Linux the build fails because
> we don't have IOMEM.
> 
> Add an explicit dependency.
> 
> Fixes: 920500c5fe66 ("pinctrl: cix: Add pin-controller support for sky1")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Peter Chen <peter.chen@cixtech.com>

Peter
> ---
>  drivers/pinctrl/cix/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/cix/Kconfig b/drivers/pinctrl/cix/Kconfig
> index 455120dd7318..1529b1af6388 100644
> --- a/drivers/pinctrl/cix/Kconfig
> +++ b/drivers/pinctrl/cix/Kconfig
> @@ -9,6 +9,7 @@ config PINCTRL_SKY1_BASE
>  config PINCTRL_SKY1
>         tristate "Cix Sky1 pinctrl driver"
>         depends on ARCH_CIX || COMPILE_TEST
> +       depends on HAS_IOMEM
>         select PINCTRL_SKY1_BASE
>         help
>           Say Y here to enable the sky1 pinctrl driver
> 
> ---
> base-commit: da53dcd54cc35efa7a8236846bb39d40deeee034
> change-id: 20251124-cix-deps-6f942ccd16e3
> 
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
> 

-- 

Best regards,
Peter

