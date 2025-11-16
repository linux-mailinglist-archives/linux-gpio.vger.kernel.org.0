Return-Path: <linux-gpio+bounces-28539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C7C614EB
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 13:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56E0B4E4740
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 12:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A242D8776;
	Sun, 16 Nov 2025 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NNW5XvZl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E592D7DD9;
	Sun, 16 Nov 2025 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763297057; cv=fail; b=Xuo+lbx5HQI2qXEGDuiMpL05jm2Hvd+jCKCMW0lxx0hhgNp2sytLwlIl9asyX8VXTCpK3eNT4WOG7+I4Fvi6KQCyBAEDrpQW7naez1OsrMlB3ROs+YBKNLA+BRnla1mIWVH6cYE2St4oUF8Fe+GvF18vOoJY6ap2GA5Az9rmJCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763297057; c=relaxed/simple;
	bh=iVMTYxtGCK/gCxwhaOTsA/UJChxDLIxUUbgr2k4NPoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZoxx7L71A9RaVC7yXTMH1aVlpo12pmGCcHE85nBA3vLdwL8dMe5jdrGDi/7Y0pq2q8J34rxdBczOCvoFslDV892K7x7bSB03XS8n82SgjY2myXEc/uvlhFAmQ2EthaD4ALLvOEr1PhefAQSLEaQ9V+4M3KdgUm4J63X6CyZBbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NNW5XvZl; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnBry2ql+3JGU+QOBjdb9Qyy5Q7HxF3y/N1Y2bQhEKbmyryl4E8xHtPrBzv5z3f7uWpsVVL6uCFRHwN/CgYCeZvBqm5c2J1ZQbxVb+WBjImFiUilh+/2z5KBePj0ax3aodCxwGZxpJhTCDWj9wFepdQCqiFrpknafSC2+N1Kl6oWSHtXeYbDECwT0xWcZ0JmVlYY/WXu34SBAxpivNOoSti7haWoXAokdvsQgvepyMcr+09xpfdYVg1hFPgpa3KvuZoJVcSj3bdWUP5PxknEra37qC8EDB6WrMzBe8nu0qbr7/qsA5KCGOey6REZOwAKUnhZNqGF9Ay0pQ4h6Y7aVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSTBBkmRbitUoHMUNoLSm/PlzeEjPH1EDBiAW/OeAs4=;
 b=jFMl1U8Dz3pepBUsngtRyrHQsLBLVNM6d6xZv8rpb5EQJHUo6yCkHGdgVShhLvh6KC4ux2GbCJoeLIUb006j0um++MH/UYo87WGxmEupmsQm4wMqimpStoG/KoUORCo/JGKmY1R6v0QWodSKuwNNIu2A3fAwWi9J/Hj9mr++VkyYCx91gZBWwBGyz4I514tFAwI/S5gf7I5TFtwWJ7XBJ6P5dSiWxDT/7uUXdfMiHixdoTAPkegVcM4zNVJgs5beP3HbxTGnv+5AtYxqNbkKOhTG9TXFf1CYsFIVZLZYardZPc/FOFPnZEdl7GHmfkYyaGwnDJLl0eQqwv41ROyudw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSTBBkmRbitUoHMUNoLSm/PlzeEjPH1EDBiAW/OeAs4=;
 b=NNW5XvZlIEzzmjHHDrhEHrW+F/lVpIWW4k2StG0A56R3ADbCmFUxRL2RQDV2xLhLMGkCj2cnmucOqvQEG5fJWijcpfyBkjREwUWXyt5Qr0Iwx/HDLJzsFBuLXTeHoTqhezKP8K6LLj4cBNoukpvN2t/k2zKYK+t3jvBCwA8vv3I=
Received: from BL1PR13CA0192.namprd13.prod.outlook.com (2603:10b6:208:2be::17)
 by DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Sun, 16 Nov
 2025 12:44:10 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::b8) by BL1PR13CA0192.outlook.office365.com
 (2603:10b6:208:2be::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Sun,
 16 Nov 2025 12:44:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Sun, 16 Nov 2025 12:44:09 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 06:44:09 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 06:44:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 16 Nov 2025 06:44:08 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AGCi43M841562;
	Sun, 16 Nov 2025 06:44:04 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Andrew Davis <afd@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>, Bryan Brattlof
	<bb@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	<linux-gpio@vger.kernel.org>, Dhruva Gole <d-gole@ti.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/3] arm64: dts: ti: introduce basic support for the AM62L
Date: Sun, 16 Nov 2025 18:13:58 +0530
Message-ID: <176311776043.1390105.5828756948304828517.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105-am62lx-v8-0-496f353e8237@ti.com>
References: <20251105-am62lx-v8-0-496f353e8237@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|DS0PR10MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf3a457-ca79-40fc-263b-08de250dd697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djJ5OEZncnpYdlBHanhMQWFWRkI3UUM1b1pOa3piSUl6LzcrTG1ZL0MydUhB?=
 =?utf-8?B?aHdLa1c3c3ZsY1ZJS1kzMzBUS3BDSHViV0xsWXFCelFMa2M0S3hoRkt0dU9N?=
 =?utf-8?B?UU9uTlcvbXpwTkluWnY3VmNvemdRWSswTkYyemdiWlZrVnRFQmNOWFhBQWlv?=
 =?utf-8?B?My9rYWxIaHFPY3pqR0gwT3d6cVowOGN6bjJZbWN3T08wNmVJM2R5bkJXaVh4?=
 =?utf-8?B?a1dLelIzZTg1cE9aZlhEcGs4WEcxaEdNWjE1MEkwdC93ZTZLZDZEZWVLTGFZ?=
 =?utf-8?B?dkVNOTVjOVpyWjlBQVV3aGlETGM4OGNidEt3alIrRDhyNGRpNU5lQUw4dXY3?=
 =?utf-8?B?aGw0RzlkTmFaVGV0QnZlaUVsSWRDc3VqQ3FCMHVuM2wyTUVodEN3Qm4zT21a?=
 =?utf-8?B?VkRUdkdGb3h6OFZtT1p1aE5ybXFER2VUajAydDNSQ0poakNiMzJzVk1YNUFI?=
 =?utf-8?B?TUlhelF0TCtSdUNjNmdKLzByUElwWFFqUG9hNEVjSmN0TlNrWTRqb3hsS2Ir?=
 =?utf-8?B?N1ltWk53dUg3R3N6MFNrckMwTE5xZ21reDRkbEVLeDIzb2N1S2ZOTmRkR2Jn?=
 =?utf-8?B?MC9zVlNwZ0FuTDAyd1dwQUpzenR1OGxwNUxjUXVUWW43di8zNnQ5U2V5L28r?=
 =?utf-8?B?Wk9lSkxwdm1mR2RjcWxDVW1tTzJ5Y2ZlLzhTTVBJcm9Cbm45MnZ1MWp5a2l6?=
 =?utf-8?B?R0xiZUFwRzhkbUMxZnNFd1ZmL2NGKzBZT3ZSQWdYQk1qbjRKbjNjNnZuTlRY?=
 =?utf-8?B?OHdwZDBsTXAvQVhpTXh6eVR5SU5RVWlmVDQ1TnNoK0hKZlJSMzU0eDhGamJB?=
 =?utf-8?B?MWRjUGU1eWxCSzBpNFFlV0NsMWpNTmxlZjJkRWhpZTgvS04yNDE1bGFObkpO?=
 =?utf-8?B?anVmUUR3eDI1YnhvTnhaY3dBTW0vVlFuazU0NVNOSFk2d2lQeWdQdDBHQXNY?=
 =?utf-8?B?cSthYmNRRVdmWGlsdkRhOXJvZ2ZsUlF6MlpZSUZ6cG10MzdhM0RjUUVmVDZo?=
 =?utf-8?B?WGZMUHdzbmlEd3BWbTNLVkJPNExGWmNVcEpvbndCUW5hK044VFNhYnFuWGxF?=
 =?utf-8?B?SVI1bEVjVWFURWVuS1NQUXdLTC9rZXNWeEl6VnltWDZZZDB2VE1jMnppQ09T?=
 =?utf-8?B?aVVJWHMwbXB4Vlo5QkZIa0NxeXpXTzgyZE01eEhNQVlVdUZKeklQVDd3UVZH?=
 =?utf-8?B?Z0lzaTVPMkROV25LaFR4bzNrei8vd2lWN01QekpVZHhDclp1Y2FXQ1VNVTlY?=
 =?utf-8?B?akJvcnM5S3hqeTFCTnY2dmZZVzlIekxtSk0wbDlIUitaWkdBMGlCQTB5RlhO?=
 =?utf-8?B?ZTV0cEtIcTY2RE16UjNJazUvT0pIOWN2WnF3YXJzWUpxWmROVEY5eVZuV1hS?=
 =?utf-8?B?SUgzRDhjeWZCT1JrbTA0ZUdCVFVVMWFWY1hUM0JxKzNxNGlBbE1oSmIzbEZE?=
 =?utf-8?B?VGtoRlU2RzJvZ2RBNzhuUC9kck11WExPTjBxcm1CWHlQY2V4RXNWdDh1NHlR?=
 =?utf-8?B?YTMvYS84N0E5WlF2Z1BJOG8rY1d3OW9ZM1QrN0ZPZ3pnbFdPc3JVQy8xclJw?=
 =?utf-8?B?Rm0zN2RHS1NwbWdvZGhKSWU3V1Fmbk44azJpeFNXZTNpcHdpU3RHMFBMR1k0?=
 =?utf-8?B?ZXRNU29aeXI1LzJneDJYS1hSSkRqeW5Ob2pGZk9kRzJzeW81STNhVzY3VVVO?=
 =?utf-8?B?SmpHc2pvSkw5Wm94SWlIOGhEUmM1SXIyYnoxdkczRWtvU1l0bytCWEdUbzhI?=
 =?utf-8?B?WWRZR2VhLzh5aWw3SC82WUxUbHEvSXZtTlJmaGNtL05COUYrcFRYRDg2bHBB?=
 =?utf-8?B?Z0oza0tGTjBTbzF1VmN4aUxHUHlNS2RoWHNPQ0I1QzcrS3pvZ0tqdDhyWmhh?=
 =?utf-8?B?SjNrZTVXdWtGTjdhWDhrcW1weEZFdUtjT0d1a1JlNkFFNTc3Z2hVSkZpRHJN?=
 =?utf-8?B?QlpNdHZIRGV2OHNqL1J3Uzh6bS9CN2dFZFNzbUJiS1BsY1JHbkRXNVd0OVF4?=
 =?utf-8?B?bTRuQXVMNWdLYkF0VUZJb2V0YkFBZzlINWRha2p5LyswSGtiVWVzMUNZUlR2?=
 =?utf-8?B?d0pLN2lBbm1xRStwejIzZVlDQWFwUm1PL1RvKytuclNWWFBaOGFqeG1zYTBn?=
 =?utf-8?Q?LHos=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2025 12:44:09.6961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf3a457-ca79-40fc-263b-08de250dd697
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6798

Hi Bryan Brattlof,

On Wed, 05 Nov 2025 09:46:41 -0600, Bryan Brattlof wrote:
> This small series adds the initial support (currently just a UART) for
> TI's AM62L SoC family.
> 
> The AM62L is a lite, low power and performance optimized family of
> application processors that are built for Linux application development.
> AM62L is well suited for a wide range of general-purpose applications
> with scalable ARM Cortex-A53 core performance and embedded features such
> as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower
> power management modes, and extensive security options for IP protection
> with the built-in security features.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
      commit: b70d9d7dac873a3a101a1063db2bc97fa2dc29fa
[2/3] arm64: dts: ti: k3-am62l: add initial infrastructure
      commit: 5f016758b0ab5ff8cd5952fc7a25d409d7cb73a3
[3/3] arm64: dts: ti: k3-am62l: add initial reference board file
      commit: 00fb4c73b67d36783c5ab95a830f0cf0142b9fc3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


