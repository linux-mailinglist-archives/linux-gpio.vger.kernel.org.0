Return-Path: <linux-gpio+bounces-25600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E082AB43ED7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D885618861F6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 14:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3F430E85F;
	Thu,  4 Sep 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="L3WYwSCT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD482307ADD;
	Thu,  4 Sep 2025 14:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996158; cv=fail; b=B3NpsM0MQ9LWGQugj00xDKYwpM6/94ZQsAc10HczEk69o5DTv8K6giZN24ddAxfgrA/4OQ36v9qQ1cxJrgJAHVHFN32mBgyshLAucS3O71e71UUx7Y6y/xEXS31Aur1c+f5S5phqhQwtBdjWyZtueNJXhXAWh9K+Ve/ZF9zbg4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996158; c=relaxed/simple;
	bh=sbwOHE6GtW724lR0gir7jMNZX3lMzqLRZxFrYgOJnWE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evTX56cRDNHKAysqD8wUQEkizDizof8f9gqZaJCDTdvS/IkC9ANpF/DUmSAm/l5H4hSFAPsBBzLHQyjiy1YEh9IhfqnHjW6v5/fog7IwnUt/J0Vx95VXz+nTnCmXGGzOhv48cS0aw7D4qUFjIsUBOuNVyKTNgDQppiM2OUdySn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=L3WYwSCT; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D64Z9Lur+ciJH+BsNrniAR+5y8uKqS3kkawzQPUhAQwm4K9GXJeBLp3U8ho+53HULSgjXGVfiUG3Dbh5FJAspBzCbhVSop/GyGe9hu3t4zTFrgnJAXqohw/XF5m6SQXMrj+xqebAXSyP7bLkuvwjJSo7/t8dhqSgepFbHyoz5nThkh8AATtFMayKprCuaEd+4UIakgVtWj/YQiTpw8I8cb90FxVbHUSKuNepPeIvztqQiCWT9Bvx0+zoF8gxSE4vLTWeqIZ0DqTOUjDCIya8ZvGuAzMLOYlc/hFcY+jSuw4g4bbUxaWO/t7U2w7rRAc1X6Y4Lc7fNx3itkicWh/d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9XuFjQYH7zkwT/vUCHWyQ6fWYvOgOMbcp7P/Xgr2gI=;
 b=wqXGu9Z7YnfTv0AVGe3VETJnpU5lB3Cdzbm0MFBglR2bRN07VaLjajW4XFlt2w9m1KygW9ZfDiWRNGfMWprUVAOmP+k8sgrByYQFmUAJCnfhvGtKFWm65Pm8aIxXvgcjkEH5qvzAHpd7ieaTHpqfxpCzRJ1yDeJFvSCg6CqcUnRAvIeSeyazArx5jVnmujvJIFliET6Wvg7zt4NP+qJ0gzC7PTmB+xUxNCcjB81cffVB/0HHerTUVv+8Irm4rFWnHbSI//u74XbWscCHY31M0+Bb0Pel4HYIXe0WRR+0FbmMW2MgFr3R31NEVF+Iyl6HRooRqW+EIsMJ+2i7AHKOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=arm.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9XuFjQYH7zkwT/vUCHWyQ6fWYvOgOMbcp7P/Xgr2gI=;
 b=L3WYwSCTArwuRMqJczRKEwBrNzsG/oD3s/CKN5fn7W3iuhZc6a6Q3ZZyQFm9+DeeQFOs44KN2WLSDnXBXEM8B2Rn5RibVn1YS3O/Hk9EzU4f6ANNB4He7RHrQSiYlO5pebaQxID1S6dBvZ6I50T6HeIgtBQoyXb3kdSVbuClKkk=
Received: from AS4P195CA0048.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::23)
 by AM0PR02MB5939.eurprd02.prod.outlook.com (2603:10a6:208:187::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 14:29:13 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:65a:cafe::f1) by AS4P195CA0048.outlook.office365.com
 (2603:10a6:20b:65a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 14:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 14:29:13 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Thu, 4 Sep
 2025 16:29:09 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 4 Sep 2025 16:29:09 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DD8981490;
	Thu,  4 Sep 2025 16:29:09 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id D823D601BA; Thu,  4 Sep 2025 16:29:09 +0200 (CEST)
Date: Thu, 4 Sep 2025 16:29:09 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Ravi Patel <ravi.patel@samsung.com>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <shradha.t@samsung.com>, <inbaraj.e@samsung.com>,
	<swathi.ks@samsung.com>, <hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 4/6] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Message-ID: <aLmiNQIsgBuDfLcX@axis.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054254epcas5p24db87bd64fc57a25b17c51e608f15e7b@epcas5p2.samsung.com>
 <20250901051926.59970-5-ravi.patel@samsung.com>
 <5543f849-2be7-459f-8600-d236625cc8f8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5543f849-2be7-459f-8600-d236625cc8f8@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|AM0PR02MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: d9791b69-f702-453b-cd20-08ddebbf6bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NUaa3e1Hv+PChXMbjqD2G3PVhS4+jM2MfDbef7UCK4LpxfrfMIIr3ixK3+Qz?=
 =?us-ascii?Q?khcqCld95+KFpJZbD7u5UDu53VXrRTxy5V4IOy2x3AI4Io22M6iF+pwpRHEE?=
 =?us-ascii?Q?8rpIqIqTrxzofwxhNCUcU1B0F1NEDDbXpJzrhfJzZCmlFKted56vyIfibCAa?=
 =?us-ascii?Q?FnB+7bd7aDRwosrJteiJKZq8E8Sd48NFtNMamosZnQ1lpKvJZfC51qgvjJ8v?=
 =?us-ascii?Q?hQubnds1FaJbrNngV/P3Z03jzIDFcAnuoGf9n7ryGMPUeEeGC++P01c5H47s?=
 =?us-ascii?Q?fEV7QQSLZ6x71PHHWSDpiOwyjDZ6ySDBGe0gQo5yrYfY9TJpBKMfKuEECwHj?=
 =?us-ascii?Q?G8omDPXAwt1BCVAET64OEspTU4yckgHBbmrKrG0LwBNH3V+mHkKaH3NWI9gS?=
 =?us-ascii?Q?dvJggpTyCLntIdiNAUIRUS6ZQCK+fv3AocysNI96WZh6UL7Dt41ZUm+PXEEm?=
 =?us-ascii?Q?Krso1carUzuEduBs+VJjmqDSJBe89X99vXPPuok/mfSKqozFF8q6zNjAEkDU?=
 =?us-ascii?Q?730up0wa+udBsL7VvpNTPCe5gjdIxhSSNHf4q6E4yKb6RxE7bE1kIGyp/EE4?=
 =?us-ascii?Q?7tqD3jlXWN2fwl+W/L6UWlfGxhBagiS2qmMkCTsu9yMwCYQEHNsUrDPFUmO2?=
 =?us-ascii?Q?UqIEK83hVz52/+QlLl48yfe5Z2FFg+mQLcrCmDC7enXRsLZbDP8EhABlFIN6?=
 =?us-ascii?Q?+zbmP7kNF89ZUBSr+cWS4irmjlshdfHSwxgVtm4//7750JCOB/1LTWhZsPmP?=
 =?us-ascii?Q?pfb5/SGNpO7HnZMCCfQOBsVjvv4NKVph1lITOxaBDYKnYHLsrQJpYzefWyt8?=
 =?us-ascii?Q?eHJKKgJeEeF/J2Hd+SiR9JDuxjZmBMJT8gTi4hiHNf4KwqA3M0/tlg6BwMe+?=
 =?us-ascii?Q?3OH8WscwOpKACtBsIJCXOp6bofNO72nMmOuYHZPCst8f2LO5S/+mpr07qfsT?=
 =?us-ascii?Q?tilBt2vhOHFmJaD/5f7CsFlZPHZjTbSd/Jqt9PzAVZqMKLHqCrR83mYKcLgf?=
 =?us-ascii?Q?PExlGz9SgB8SjGvH2/lfiRkD7ZfuWf1rcTn1UyLTjNTOxjoBHwhoV5tKFKB4?=
 =?us-ascii?Q?15qNkFdhbHSmnHPKafmsSDp2T0WWXBjGMdyVAZqN0Z8QB6kjOlylDoDWcNzv?=
 =?us-ascii?Q?45i0Ei22hfvMdvIW94oSeaIbyDequ/cCodQO1bNVHFUdHQoSID3yJZOBqVYZ?=
 =?us-ascii?Q?UfTeIaNNyO/uT0FlDtwvZtADFSAeQc3jUu7Arheb3n2cowUao8ypk425R1hR?=
 =?us-ascii?Q?zAC22+UnIeA4bbNgl6wN9kPyiMgb54PEcW/K3ULe9tjQRLfBjBWLCih2/xUu?=
 =?us-ascii?Q?yHw9rRIJhwbtFPBIWsJq92TIn4fjbeeaZP8wbAqaZ7nKnvVKgVBlBc6Fal/l?=
 =?us-ascii?Q?jopLfPfl0HcMT3/UJ81F2pS2Co79/jfHftBYSSW9iaKY4sVQzaVB4A7bfCe0?=
 =?us-ascii?Q?TFegCNRvypLQttmMw5v1sWpAbCIJKLKitSdPORo3OfEUEJRyk1SetcO1osyF?=
 =?us-ascii?Q?u0xjCYH5xgxnu5yihN4fTF9OWoMdZFsXEejG?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:29:13.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9791b69-f702-453b-cd20-08ddebbf6bf4
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5939

On Thu, Sep 04, 2025 at 03:43:14PM +0200, Krzysztof Kozlowski wrote
> On 01/09/2025 07:19, Ravi Patel wrote:
> > From: SungMin Park <smn1196@coasia.com>
> > 
> > Add initial device tree support for Axis ARTPEC-8 SoC.
> > 
> > This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.
> > 
> > Signed-off-by: SungMin Park <smn1196@coasia.com>
> > Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > ---
> >  MAINTAINERS                                   |  12 +
> >  arch/arm64/Kconfig.platforms                  |   7 +
> >  arch/arm64/boot/dts/exynos/Makefile           |   1 +
> >  .../boot/dts/exynos/axis/artpec-pinctrl.h     |  36 +++
> >  .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi | 120 +++++++++
> >  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  | 244 ++++++++++++++++++
> >  6 files changed, 420 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> >  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> >  create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fe168477caa4..4d0c1f10ffd4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4102,6 +4102,18 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/sound/axentia,*
> >  F:	sound/soc/atmel/tse850-pcm5142.c
> > 
> > +AXIS ARTPEC ARM64 SoC SUPPORT
> > +M:	Jesper Nilsson <jesper.nilsson@axis.com>
> > +M:	Lars Persson <lars.persson@axis.com>
> > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +L:	linux-samsung-soc@vger.kernel.org
> > +L:	linux-arm-kernel@axis.com
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
> > +F:	arch/arm64/boot/dts/exynos/axis/
> > +F:	drivers/clk/samsung/clk-artpec*.c
> > +F:	include/dt-bindings/clock/axis,artpec*-clk.h
> 
> Some official ack would be nice for this, but I also remember we earlier
> emails, so I will take it as is.

Sure, that is a reasonable request,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Best regards,
> Krzysztof

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

