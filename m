Return-Path: <linux-gpio+bounces-28484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3609C5CBBF
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 12:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 40E91343CD7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 11:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581523101C5;
	Fri, 14 Nov 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h7uRpDeg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC54A23D288;
	Fri, 14 Nov 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118043; cv=fail; b=Ws3VBo9rqXXiSNf9mH/pw8krLS4gBdW83HypD0qiQvm73nBP1ow1+kyDmRwdEoFuCDUDmEdDHYrXM7Jp5whqXFqTjRIO3oSPG7YexBYLJjlk9EJk9GJPaTtF3yAp8PwdMFigi6L0zGipcMSKxte9sEl2vtZl18KOyJ4h3tTky3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118043; c=relaxed/simple;
	bh=aDW6E+Gx3yXOBhiPrjJWmjQ40gi1gUcXLPV/IZP2toY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rbPhMuKnevVnNRE+B34XXtKlLkulkHU7zJ3K6oe/cJRHxj2EtWMbqboS7KT2rbxeCm+tHZlLWw9ek23sz6HUeJyu8cuZ5d/pXurQn3vSNPMlJhOLcgO5D12dfgjx6HG8PZvbvv0fJQC/BeaOzmESee4jY/P8xm9pblyVOEPkOq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=h7uRpDeg; arc=fail smtp.client-ip=52.101.52.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7Y/HFYyeQZ3P3mOtlC/8I27+NyjRbwL0YyLMW8DmLvLZj/noaTX8ZMdzWfDovrxE9OuMRzXMpC8o+AbjS+KURBQd2/h1lphJhjd8pNCdrfv22FRbUFzkOnomdoy2WRcuSic9BtXQdQJ0p19Rs8zfMExGL7m5YBN7IZ+Ll5uNgj4yDK3Hrp5kzlduyUvW9VaP+c2K5PPyZpt+1DibNG0FTDg7NVsRQdFDC1o4yIbMOzPdxVax7YnSZqVmAwEu9Y/87TTv27oH7p5PcfmYrufd5+CgHb9nOiDxVLyx4wYMwQW5vGHhGJSJMJZ0tFuZKdAqgsKawINbnlvvPJAlE/gAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffzflhNskVB6nqPf2XogFj9cYoO6KwKniBozlJVy7j4=;
 b=EvE5RU7VLGoYpmWX3wP+OPGt9qoy9ukbLa/+1pmdHsSrDiaXwTyDUTr5pnkIDmTibFpr54K9mdwwp5sc4dFxiqmng5N/MVkZnBSyN+f4f9sPMqWDXviCcHCPwr2BvCQK6j3Hf2vwonIvvjIcJq1D/U8hmGtgSwneQKgEaGnYs82t9dw/X0ROnV804RYT99Yzd0AtLglMvjaDJIWzktXkbUp0EFk0gul4Joih+u1ON+VWsI4Gy3rQy5Y6r4hXvYSBavU6/OtDrmUnyEKfGeLiMCPp58/2l8ZhnWHHYtcKY6bz24r4JTRmJMIRAcbViLmfxqfJOrJfdPi7RaJ+Wk8qRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffzflhNskVB6nqPf2XogFj9cYoO6KwKniBozlJVy7j4=;
 b=h7uRpDeg2wV/eFA1NIhyG0cULi148KlGzRUyqybHybdVjAApJgrDrodLtOXVM40so+Y/17wOGsp3aHJllHQ9owmKqCelYBj7rKE+C7+ndw2luu1XQUHhuPxujnIu6jaMzTT4tYTNDjS+sF8Lxa3ShgAijPXzLFCm5H9AXzKPF+0=
Received: from BL1PR13CA0186.namprd13.prod.outlook.com (2603:10b6:208:2be::11)
 by CH0PR10MB7461.namprd10.prod.outlook.com (2603:10b6:610:18d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 11:00:35 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::92) by BL1PR13CA0186.outlook.office365.com
 (2603:10b6:208:2be::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Fri,
 14 Nov 2025 11:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 11:00:35 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 05:00:30 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 05:00:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 05:00:29 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEB0Pxv1876673;
	Fri, 14 Nov 2025 05:00:26 -0600
Message-ID: <882565f0-a903-4e6a-9bd5-a3839bfe18ec@ti.com>
Date: Fri, 14 Nov 2025 16:28:50 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: ti: k3-am62l: add initial reference
 board file
To: Bryan Brattlof <bb@ti.com>, Nishanth Menon <nm@ti.com>, Andrew Davis
	<afd@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>
References: <20251105-am62lx-v8-0-496f353e8237@ti.com>
 <20251105-am62lx-v8-3-496f353e8237@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251105-am62lx-v8-3-496f353e8237@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CH0PR10MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 158f0da5-d468-47cc-acc1-08de236d09da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V04xNFFLaUswMVE5TGlpQnFXVU96dkk4Rjc2UnpPdk1YaURiQTRHZE54WG5s?=
 =?utf-8?B?N1JLT0pJS01BdUN4UFBRUWlQZTFXNldpdFdhem01enZSeTdWVWFHQ294MDBK?=
 =?utf-8?B?cXhXKzgvTUp0dHFtWlZUbW1pUkYydTBRaW4ydkJIV2EveEh5dEJUNWUwYVV4?=
 =?utf-8?B?MmZGYVFzbUNtSzRVWlFjMEhKOTBqZGlKOUNGVGNiUjFiRE9RVWVhT2k2TW5E?=
 =?utf-8?B?d1pMUDhIWGpXMWwzelFTdWZjVUNNTENZZ0RnWEFQU3lzdCtMcUM3cmxScjJv?=
 =?utf-8?B?NThNRUg4WStpVU8vOC9GUU1kNzB1bXB1WUFTUzNQd0tHWGNqdkl6TXFKMCtH?=
 =?utf-8?B?WFdvbkZKNEgrMWkwNGoxYVY2Rmdtbm8rVXBiUDhSL05RVjFtcHNmQ2xWYXoy?=
 =?utf-8?B?ZEwzQVBIMnc2VXY4S1lsVkg5akRtT3g0VEJuaS8rR1cyTzdQRW9pNmRvQys0?=
 =?utf-8?B?d3pySUo0aDl6Y3ZZZ3gxbEFzSmNlTmNGTEpFcE5jMDJKbWFTaHBlbzBjem91?=
 =?utf-8?B?cWZ0QkRuSHovTnYvK0VIK3FHVEJTUGhwV2lRN2tpdTRGUW5TMGhISTNaWDFw?=
 =?utf-8?B?R3pMUGcvN1pqTnlFSmxWLzljTXNYd3hkOTJGdURCUWFHWlFQdXhHV21weHZo?=
 =?utf-8?B?Z2wxUjNrWElRblZsc0VhOUVJbnd4dWVWcm9yakhUY1JIODFaUVEycTdVdEVB?=
 =?utf-8?B?V0laR3NZSEIyalBVOWlLOUg2blFvTmlTeTBqQUxOaXI3dlVETlZZOHhMclpU?=
 =?utf-8?B?SEo1b1ZwcDJWbXRnK29VUXBtb3haQmZ1SVgybmhhaEtvSklPOEdoM1ozMG81?=
 =?utf-8?B?bEhDQ3U2SVpUMC9VRVlSMEh0MHlNR3JNNUxMSWFZRGhrajNnU2lMZlhBTzgv?=
 =?utf-8?B?cEZNcmdqdUFtZGsyTVg3S01rc0RpSWE0c0JxVGRNZDloOHFnQTFHWm1vN0Fz?=
 =?utf-8?B?K09OaXIvRzRvRmg4M216blVqQjJOM0VYb0RQcEU2SVlvTTduZmk3NmRsY0FH?=
 =?utf-8?B?c3YvWVlZL3lmL2pxeE9nb3dKQUlLWkJYMWthRVE2R0o5NWFHcFFIZUJlZkRo?=
 =?utf-8?B?UVA4dmlyUExCR254NDRZN3JJMUp5SXh6Mm9mTTdMeDFiMSt1WnAyeXZaNCs4?=
 =?utf-8?B?Q0tKSk15VEx3VEhoNytLQldPRzg1RG0yNm1sZXlzQUU2MEI2UDB5YndhTVRv?=
 =?utf-8?B?bkFYN0VvM0lMOVdoMHhOZkkwaUVoVVI3Ty9BY1VZRmtPMGh0dDJzL3FwMnRm?=
 =?utf-8?B?Rlg0b1F0RHVPejdxMFRlVVR2dFZhaGg2ekRqTTh5S0Y2V2tzY2JzS3psTko2?=
 =?utf-8?B?Q0FxWGRnaUJoSGFXWGowa2xWYXJSUldZQklYTlBpcHVSY1RPNktQU3p6ZStp?=
 =?utf-8?B?dEZPWm1RUEZPbktOQldnUCtIUk9hN2R0YnRVS0MzRUlmMVU5VWpaRnJKOGwr?=
 =?utf-8?B?NU1STFpSeHhtU2V1L0xNb2EvRmVMalZYOEVaSStjVVRBdG0wUHJ2QlRwZ09W?=
 =?utf-8?B?UzY3dzVSSGhWWThUZVpKeWFqODBTNDFoUFBoOEIvWGVCaWgxZmU1d1loenZa?=
 =?utf-8?B?OGpTMVhUeW1MVE54RG14S0xCQUpZNUIyODdrNHNDUWFKejYwQmd0RTMvRGpw?=
 =?utf-8?B?OVdmQjBmQW9idmJpS056MmpPV0lESTJvc2cvSnZjYVc1SUNIR3BQNDhPMFM1?=
 =?utf-8?B?SUdVMFIxcU9mbDFRbDJLUHltcDV4U2JxWmdCbjhYSnFZK3JsbUM4bDBDWERp?=
 =?utf-8?B?dVorak1ncG5DRnhEVTg4MHI4MzJ0UW5vNks5bi8vNW9LSy9uUDNqRW9nWWYz?=
 =?utf-8?B?YlZ5elhvM1V4a1FPMG1oVVR4Z2k4dkZ6K0hobjNzNVo4SmN6U0VSQlhybjg0?=
 =?utf-8?B?OEIyR2FCZUdyUXFuam9STWc0NE5LM3IwMkd4aEFQMmVDZDMxVG12SHVtRUFm?=
 =?utf-8?B?NG1tNVBOajRqMUdDVmNqMGRhQnhSYUYwaHZqc3hybGhwWCsyeHdTSFRBaXg2?=
 =?utf-8?B?Y2F2QnMwWXhGeVc2bDEyeUpuTHNSdm10UHA1WktXd1c0cnJjejFtcVJpQWFQ?=
 =?utf-8?Q?iesno/?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:00:35.5859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 158f0da5-d468-47cc-acc1-08de236d09da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7461



On 05/11/25 21:16, Bryan Brattlof wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Add the initial board file for the AM62L3's Evaluation Module.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes from v1:
>  - switched to non-direct links so TRM updates are automatic
>  - removed current-speed property from main_uart0
>  - removed empty reserved-memory{} node
>  - removed serial2 from aliases{} node
>  - corrected main_uart0 pinmux
> 
> Changes from v2:
>  - alphabetized phandles
>  - corrected macros and node names for main_uart0 pinmux node
> 
> Changes from v3:
>  - added and enabled more nodes that have been validated
>  - added link to data sheet which is now public
> 
> Changes from v4:
>  - Corrected Copyright year
> 
> Changes from v6:
>  - moved thermal-zones{} into the k3-am62l3-evm.dts to allow other
>    boards to selec whichever trip points they wish
> 
> Changes from v7:
>  - enabled &i2c0 to access the eeprom on the board
> ---
>  arch/arm64/boot/dts/ti/Makefile          |   3 +
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 362 +++++++++++++++++++++++++++++++
>  2 files changed, 365 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 361248dcfff42a27f07cea6bca31461f8dc25b92..386ab1e91bcc3463e2d0618919da1ec3ce314bf2 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -37,6 +37,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
>  # Boards with AM62Dx SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>  
> +# Boards with AM62Lx SoCs
> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
> +
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..34c24b368d9e88cd94a7426cd1524f096e9c43c9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0-only or MIT
> +/*
> + * Device Tree file for the AM62L3 Evaluation Module
> + * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
> + *
> + * Technical Reference Manual: https://www.ti.com/lit/pdf/sprujb4
> + * Data Sheet: https://www.ti.com/lit/pdf/sprspa1
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/thermal/thermal.h>
> +#include "k3-am62l3.dtsi"
> +#include "k3-pinctrl.h"
> +
> +

Extra blank line.. I can fix this locally before queuing.

[...]

-- 
Regards
Vignesh
https://ti.com/opensource


