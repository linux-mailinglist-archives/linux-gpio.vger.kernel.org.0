Return-Path: <linux-gpio+bounces-22079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83CAE6C75
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 18:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C36A4A25D4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 16:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687012E2EEE;
	Tue, 24 Jun 2025 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pm16jtSP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A2E1j3Dy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429F0307482;
	Tue, 24 Jun 2025 16:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782831; cv=fail; b=R4uyOFjfuw8cUrwqZtUq8NnDHywkwQKtpkMlfN4XjdMxr8gVkKKq7MrKqzD7GPC9ZtQ0O1lz/1Tec7vdG70ncuimp+uch5TAZBRuJCZI7SC3GBkFfCmFzjFn35R+DwJfvOnUB3qYaXxK/CdSyX+gTA8Oy/oZJbDoZ6KOnKVgih4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782831; c=relaxed/simple;
	bh=Lq02ZTJ1ZA9FOQwUAVKziSs/2ifJsCgbOI85FewAar4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAq8nlp6RJo3lHjp+h7fv/FFgasau4mBHcam/yLwbP+TCLLq5GlCRvep75NOsXUJ6YlI/8CV/tW62P5xcwJBy6yH7xH3ZJjT3dB/NqwMn5wx64w9cuFzOF/3s57anSV0z9oe4URrhzA+fpWoPciZqVZaM0BlMct2mAz4tj3cWL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pm16jtSP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A2E1j3Dy; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFkC2d004868;
	Tue, 24 Jun 2025 11:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=d3xUs7/QH36EumsRUg
	tEAnuG3e/09qoWa1IDz0zFh38=; b=Pm16jtSPltgWA/T8ICT5b4aHLbwxC5r0Mg
	+U6Fg3+cjY0myiuOcxatYw5Ur+4dck6nAB+LjQTq4UxOD1usBokKGF7eh9VQBEN2
	+vInb+DpCZZT1YHKCPRWCX9xYSD6i5/2ArGfihU7YC4RyIDn0On5xNEjTjwRFGUU
	XpEFGgfn8JRzTnerq3ygQ/VA7swUVhJw83wC/NKnwaavyQwDtOUdDlJOvX2ZB5aD
	jv+6+98qEIpqg3vDTZCBqgHEK8gCONhbQH8bAhOBrTp3WfRMwFcLUMWtS3UfH6sw
	vRur6IVpPKKmiSSLPSzb7/0QRhmRvxvYyD35ZyvKMBTBN1CtmfGg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2115.outbound.protection.outlook.com [40.107.94.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyuhxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 11:33:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfoUosT2ZumJ01PICf4S0MuoH/1NMxPKTE1q6G5RDHf/6JuGzNAbmxYkWjnPYrl5k7IjdcntiJhuAXkqxRGLLdbGtpZCkCJUGNDvIbhpq2uTglH6Lgdfy9ls0BdJA1lsycX1NpoiQS5n2r7OByRrP/eZjk7qQLf81uN5y+qn0IGKBzp1N+rnKk30DpYXC5wguWbrUx04LklIiRRgfS6aDdpj7lfFEmG8TYzi4Z9s+QmOjsWN5RB+Gj5J6HBe1S2IH/NR0JGddh5iCTgsHtC07LAWKGBkTcvtlzwF04xmVDUdkXEeE5tbSfEy1vaiDDQuJZPVtiRP6885+7fQlbLyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3xUs7/QH36EumsRUgtEAnuG3e/09qoWa1IDz0zFh38=;
 b=JJG4p/Op25MO3RFcE7kzdHnBE/V/wEtY5+wyCFsgWhccaZVC45dor0RwChLMpoWB1vtengTBO2KC7O8q+x2Ji5VH3Kz3DfnnqQQ7HDB+T6D6c2nM1rroziF+jtFkFTvXz9/6hAPWMwjX4z3ntvM4Sz25wPH5vav6r92b680P6rtXInbIMcLNwWTh1rjHZAazK9KUdWKUc2LyFXWmm+0A8JFy07Cp9ZXoc/yMejhdtotF8ib1RupYPSrrJxDfgGumAcvMm3GgmoHF4oDJ+xXraWYaHGsJMZ8MkAElzbIsd452hzatAo7wh7nAhoABu/Y5WusqfSiiuWcdsYvrKzHhBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arm.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3xUs7/QH36EumsRUgtEAnuG3e/09qoWa1IDz0zFh38=;
 b=A2E1j3DyJASQCPDucv2DFtSQjsaGsLU4/fUPN+RkA9+1t2ZzpdkuZaZzlRQ7kYE7w9Ro2jgEBNoF4ooXLb+5K5JOMBtHn6njvZbmcH9ArHqlJ4MZ3YCWNaupTHQ7v5cIHsrZYkf2yF5Xieppq6dHl15zd+IJcu0Hl3ifJlFa8nw=
Received: from BL1PR13CA0029.namprd13.prod.outlook.com (2603:10b6:208:256::34)
 by IA1PR19MB8977.namprd19.prod.outlook.com (2603:10b6:208:592::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 24 Jun
 2025 16:33:06 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::d6) by BL1PR13CA0029.outlook.office365.com
 (2603:10b6:208:256::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Tue,
 24 Jun 2025 16:33:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 16:33:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E688F406541;
	Tue, 24 Jun 2025 16:33:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CB0C982024A;
	Tue, 24 Jun 2025 16:33:03 +0000 (UTC)
Date: Tue, 24 Jun 2025 17:33:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, broonie@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
        linux-samsung-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 5/6] ARM: s3c: crag6410: use generic device
 properties for gpio-mmio
Message-ID: <aFrTPd1qCPDjtZuo@opensource.cirrus.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-gpio-mmio-pdata-v1-5-a58c72eb556a@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|IA1PR19MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 785992ec-5e4a-45a0-41a9-08ddb33ccb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K3BX2UA6HZYXBf8vgybyzMD/bezGcn/s5JPLbvbLgjbA4llOeW8+S2xuogEM?=
 =?us-ascii?Q?tbWr/S6+R0fu7Ozu1FZjr/QqDNvdOe1QVmsJS/TKlJGDew+AySBqu9TAj0Db?=
 =?us-ascii?Q?ubgOFTT6nQuxU9q7UrojmXRjNexa7VEko/OLxUny8KmHAKFs/BfwiN6Grjz8?=
 =?us-ascii?Q?YO6G217ugZUJoV+2NBMPrTQ/G5HlpUMKzBhCaOgaS9odxnz2pPfsFW6QzIQb?=
 =?us-ascii?Q?gF1rfrqVmCErpAc3442BTIOAzwmAih3zQh2LvvDK7g18vwJwblKi6HIl/4Rk?=
 =?us-ascii?Q?sj24eLNxdTpLQlN2w/Hu8CzkiNOdxTBt8GNidxgbSJJudX9quxwA2T/rQdrg?=
 =?us-ascii?Q?0+mdp6L+CYva7puqfJQQprmf95cL/8eA2hqohGkggIBG69/U7yzabdXLUdWM?=
 =?us-ascii?Q?LeCuLqUvmbUkIIpkxbPhr8OAlX1jf7eBBE1Xj1Jsbarie1ksycWdgG5NLSBh?=
 =?us-ascii?Q?XwiKRt0phNvtFbkXdR7beUuHld0zf9as+Xw0VE2uxocThZNVmDJLTP196q9X?=
 =?us-ascii?Q?4oFTHsGfhNP3RMwDN9YsUEouDXzwiJfZIOVfH6oLjFN5DfY2Iakv824yxX4+?=
 =?us-ascii?Q?FgS56G3m1YuhsWqc+qe//1VwPLjlf1jx8Xo5rAOp84MqvO35dXjYvo9nMJjw?=
 =?us-ascii?Q?8gQxP94WOldDZuzQW4EMMz14ztegXyVFUExy8VoAcOhUoSZwbCt7kXN2pNrN?=
 =?us-ascii?Q?Usn/MNkU7VhSZlAe8b/Ntd1Tk5jmJhK5Go3UE5ptd8ZRW/xMHnyOqYsZqkOf?=
 =?us-ascii?Q?cQjo98H+HkarPrWRqNsHcHNUH0bmY7sSWkvZN4SaU2PpjAUgh/Zxut8gKfAi?=
 =?us-ascii?Q?PBqAnlDZgDNUj0JiUJatqpfiFsFjdRXp81Zo4pAhlvag9R/H1Nx5KtV3UcIK?=
 =?us-ascii?Q?aHWS5r84zV+iJcTBHxvZEnrBFleaz1T5FHHogFGp7OTYu330w3/rkaYxN+as?=
 =?us-ascii?Q?tng1TcJpIFeVMB+tb+Bm8+IMKONDQYVMNne4Kkahk3E9NtvO5irqtUGMsQDq?=
 =?us-ascii?Q?YT8NVUFoM0NZBmCg9avwY45UY6S9gBydORoxXX7GxJpvIOXGCLMN7NHM3ea+?=
 =?us-ascii?Q?kJ5t0ipruLu79og72bWD4aOe+53V6OsXkVMPnalLrPXc284Rb344VIgCphs6?=
 =?us-ascii?Q?kepqjZBGHWSHAHryTtJT800zRrXTXpkHuO+lauN4XDgXxYfPl4qpY+Itoq9g?=
 =?us-ascii?Q?n+IZPrawBfEFLIUM5rpVrQbFzVlRN4dMWFUvu72EvjEO5CTMOEUqIDcnogJw?=
 =?us-ascii?Q?GxbSv5cAFfdp40zXeYIAswKL3OdHxmhvJE8T1Y7Lqys0p75jSDD02kHrgFk5?=
 =?us-ascii?Q?hOVij4GyLXYaCcQ4e9yGgCgpPnAhegOozzpsvWppWGsKtOiPDmScrVfSRJ3K?=
 =?us-ascii?Q?XR3IHb24gz5qEPsHP/DKhpim7lXNw9MKEaDGlrEnJAl3bqf54qTo62UvygZj?=
 =?us-ascii?Q?kOBumMk6kw1kuoiYxlWj7ZNPRSK4dqovvsEqueZ1tnbZCjfrvqBDk/wdtzXF?=
 =?us-ascii?Q?V9Yxa71MuXswgND9BS6DNjX1csE0S1iCoIfY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 16:33:04.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 785992ec-5e4a-45a0-41a9-08ddb33ccb85
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8977
X-Proofpoint-GUID: ZQt-f-3nz8359pso-uLaADZgX12VTExO
X-Proofpoint-ORIG-GUID: ZQt-f-3nz8359pso-uLaADZgX12VTExO
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685ad34c cx=c_pps a=hUWYbYsE//NbN4hV8CcKzg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=mHJfey2NssgqMvmkAUYA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzOCBTYWx0ZWRfX9I7CoQVwd/PO sB8KgU4hvgDyB6KsZwhuekZUgRNJaUAps0dEIyU4C/lOx1ADvwfiU0Cy7qItqaW/5JtSlqeV8dA swau5i9YCpCF2RtWy3tjIm5oei73RSl8dp3LDVEf7WcY7RMV5F4u+x3HUjKb0hSZJHTZm8DJcDf
 fY/7BmvGogeDknETIbWVmRDpl8zkkHaTVD6NciuNPc5NnOeaMgv7snUJDwmHtoQH+YNqzxRfyJY sbgsw1qLX8Gl/1QLrHS+t/bGBJbsVkptp6C2A7Zn6o43JNzXZyQuhAn5sS3Wwis78qI8VEg7QJx kn0+fSLot/9fKwS9aVEijpzB6/68fpwoB3lpnTGzlplOP1nl2iyzKeSs8JuezrDMiBDCvdKUUbZ
 UZvTtciZNEkMJMis/4/EhGw7QwXpdWeM6arIt1IYmm1db4EKhWPeZawpUOEEDuj4ns7qMveh
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 24, 2025 at 03:19:16PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The GPIO device in crag6410 is registered with struct bgpio_pdata passed
> as platform_data to the gpio-mmio driver. We want to remove the
> bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
> get the relevant values from the software node. Set up device properties
> and switch to using platform_device_info to register the device as
> platform_add_devices() doesn't allow us to pass device properties to the
> driver model.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

+ Broonie, as I think he might still use Cragganmore for testing.

But from my side I think it looks fine to me.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

>  arch/arm/mach-s3c/mach-crag6410.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
> index e5df2cb51ab27896d9dd80571f421e959db1fd1e..028169c7debf325ab6f51475d3595b92b1307189 100644
> --- a/arch/arm/mach-s3c/mach-crag6410.c
> +++ b/arch/arm/mach-s3c/mach-crag6410.c
> @@ -252,14 +252,17 @@ static struct resource crag6410_mmgpio_resource[] = {
>  	[0] = DEFINE_RES_MEM_NAMED(S3C64XX_PA_XM0CSN4, 1, "dat"),
>  };
>  
> -static struct platform_device crag6410_mmgpio = {
> +static const struct property_entry crag6410_mmgpio_props[] = {
> +	PROPERTY_ENTRY_U32("gpio-mmio,base", MMGPIO_GPIO_BASE),
> +	{ }
> +};
> +
> +static struct platform_device_info crag6410_mmgpio_devinfo = {
>  	.name		= "basic-mmio-gpio",
>  	.id		= -1,
> -	.resource	= crag6410_mmgpio_resource,
> -	.num_resources	= ARRAY_SIZE(crag6410_mmgpio_resource),
> -	.dev.platform_data = &(struct bgpio_pdata) {
> -		.base	= MMGPIO_GPIO_BASE,
> -	},
> +	.res		= crag6410_mmgpio_resource,
> +	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
> +	.properties	= crag6410_mmgpio_props,
>  };
>  
>  static struct platform_device speyside_device = {
> @@ -373,7 +376,6 @@ static struct platform_device *crag6410_devices[] __initdata = {
>  	&crag6410_gpio_keydev,
>  	&crag6410_dm9k_device,
>  	&s3c64xx_device_spi0,
> -	&crag6410_mmgpio,
>  	&crag6410_lcd_powerdev,
>  	&crag6410_backlight_device,
>  	&speyside_device,
> @@ -871,6 +873,7 @@ static void __init crag6410_machine_init(void)
>  
>  	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
>  	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
> +	platform_device_register_full(&crag6410_mmgpio_devinfo);
>  
>  	gpio_led_register_device(-1, &gpio_leds_pdata);
>  
> 
> -- 
> 2.48.1
> 

