Return-Path: <linux-gpio+bounces-30543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7AD1E256
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E74DD3057091
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D04F3939DE;
	Wed, 14 Jan 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HqbuIMsP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC138A2BA;
	Wed, 14 Jan 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387179; cv=fail; b=CwcOMD6Ex4zlB6Ofw6qLkxBCLxK8ac1tHnpZHfFwxRPxfTj9rhuDFPeLy0T64ZR2fJ6d3uUoabLFLIgvxlCZXO+Kx0Z5av8NjYbMxZLPu/zssrhUB0UCP7wwC17hNBzDCyDOAO0LkutpXHeWeHTcrb7gb5UmWAsFbZ2xR/kulq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387179; c=relaxed/simple;
	bh=iLV8pDewyVFGA25oXx1bSiPWCeI47CWhi8Dp0mhTYVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a38uuBlnklhQ5wNCBp02AEgWEpb6IzH/8GFGhUCmLgdttDXGlr0GCfQpDnal2LigOouQ1yhQLoTwMyJuyayNgkxfh/g+hIrb1tWcwqAAoEOsdgvHRAbHF3aVpM4Z579Mh3kAJWLuWfwJgdc8lNZ35sfsF/aIWOCBKHmZv4QaI5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HqbuIMsP; arc=fail smtp.client-ip=52.101.61.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AidCjl43jURV0z/7AD7TNcptny97SAzVHKNcJDlef69QZfJ+T4H446Z5IpKGwRvn2WBI4rmV0k/cuxwtAMOPr3oarl4f8dQzZFH9p/vk+rteWIlL7YCH9p/ME5Q+Q8bTg8GU7D4rwdbgVfQ1hyO5RGRyJD9pVVWuyK6JNFGJ17HtTzx2M9pMJ7xllwlamQmcjPJEVF8x4ubto6XE1siyyvOUPsAFZ90sFDhUmpdwXXphAhspGTH43C6ut/0183/43chfE5UAW0vps1hunTXMVgw+yNEo/PwaomZaM1uYQQgA9LqlaL/Z3qF+gEAYUCyqIUduAiBj4iOMoMywW8rNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMwJYmn+goFlPqEzMennHtfd7cIL1l8M/yVZ3xX4Dko=;
 b=itlzMSS9eDxgqT9X5bmeLy8Nd3woWvmapVi+i4C/zF04Uh+WOL8mlSBvtkJEI6jHErJeyw17C1Q5DRvgvVEVL3snKMwRDWhOGe0Q5vgxyLYcnUj0smzGW2GQ/p/I6dOrja6TEj9dQyr/tCIPy53S8VEGp5qWQtMyBXu4nXZLS3rabWDId0w02/Z+yoWhVwCN+TfwRuTBce0kuDY9Oa6gMmv2WkV3mU4osqKNIBqLgqrChm7J/s90j0XqvbzJc30wT+5h17ZxQ0hepWB2KaH+W4WIRTHHZTKQvxcBilWDojqZtWHZyunGyHUWrCAuDSl161LonBlEAwsBIVybmOlLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMwJYmn+goFlPqEzMennHtfd7cIL1l8M/yVZ3xX4Dko=;
 b=HqbuIMsPAJDYBEa+sfzj4mnPbBJ2t6NC0yo+YhlCJQ3se0kIbX9qtXklLbNiurTsDThN6FrN8vaK2knFcL2XA3ZH3/rHZ/DfY/hhOvy+tvy3HC+zz/eh5FqO5Ya3spXJPHRxG4qOUJmF8OkOzXoM3fyFXQOB4V7gsnueQbAZ+UYl0G4VhUMPH65DQEbqyGkZv8hX0aubw77u2RbmpNE7NoE5SBLk5P7Z3AV9JgyGYpInHLUUGqQ4LnYRqYCXy0zD1og5PNMqWQL9BJWqevIE+Z2X8EXvtzCumgl7ux2W8FwDA89ONLyIpJKFl/U0eVtsCbRg0TtuuHi42ppM/LsvzA==
Received: from BN1PR10CA0011.namprd10.prod.outlook.com (2603:10b6:408:e0::16)
 by CH8PR12MB9791.namprd12.prod.outlook.com (2603:10b6:610:254::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 10:39:31 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e0:cafe::e3) by BN1PR10CA0011.outlook.office365.com
 (2603:10b6:408:e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 10:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:39:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 02:39:14 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 02:39:14 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Add Tegra264 GPIO controllers
Date: Wed, 14 Jan 2026 10:38:46 +0000
Message-ID: <20260114103846.687338-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260114103846.687338-1-pshete@nvidia.com>
References: <20260114103846.687338-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|CH8PR12MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: c850d27e-343b-4f6a-c652-08de53593344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZFZzhaaz5oglZzE6IVXI8KlbYzsrJxdJ6q+zQsHkWJ17nkCVFQPSAP79b/oC?=
 =?us-ascii?Q?ulA47kElwko1LDA0jxZCP0qONqEDXuJWaefmPg1lV9UUT1PqOj6Hiv8ZyOfl?=
 =?us-ascii?Q?6uur4IrK0NHSjaVwZb1AU1+kweXMWyBe+19vrFD1roR/MXduN3KxTTmPrWUF?=
 =?us-ascii?Q?fkroHwqOhBx4ZPqK97At60so7EsUAwIrChU2oE+pIEz5AFFQ3RLGjTTLPaIj?=
 =?us-ascii?Q?+8b6mrHUA4WRpOi02GB0i/Ixb4jWIH+8Xwx+zAqFLiJ5UWj+l/cnf6aum04t?=
 =?us-ascii?Q?QeeNdxgpjSrDHBCPYpu82jM5lPH7OmMpZS3DqMusUaDuGe2zWfOLoTLJ6Dqz?=
 =?us-ascii?Q?6JBsadMpcEaM4EIYuMnzArXTHKhLEzD7vk6MCDyU8hWBi8IRiFnA17j6Mzg5?=
 =?us-ascii?Q?KOM17PnjPptEuf8JNb+JWmX63RRuTEW0D701o68GWf2Zu+Pxx3QE5o72KInn?=
 =?us-ascii?Q?H6HDoOKmxpg2sBomnjLe1n+HUZ58Jshdopr/vFqMvyxJ48ufiwlBWy1sleGb?=
 =?us-ascii?Q?/qo2/CGyQ/4Uy+uOqhBgAfWdgknEPAywAW6OG/jh/TefM9uNUJnslXxZdyh+?=
 =?us-ascii?Q?fBPwOx25WYnaRC/KOAwCHBF4e1mvT+LFyzvtS8/5+3khO/hyvpyoN7mLrTQV?=
 =?us-ascii?Q?ujvScRgBNazbr8+hZOgZArihC32fk+h/NnJCoBsP3STDVqaVNtZm1Ghpf0YW?=
 =?us-ascii?Q?MNWoHeNcb/t3ZzqYGU11R9d48ttQT2+2KOv6Ty8LlXVzr8TdqvDwYQJ37NFi?=
 =?us-ascii?Q?SpC3pWGhu1r3w5Jvl7Yn45xtTZEE2lHaHqEqxFspIrjDSFWcdaXb0ojvU3mQ?=
 =?us-ascii?Q?Pqa3LKX2iPJUNy1p51ujyyB1a7IdemGNNvvEdoYStbLye182LV72SRYSNu6p?=
 =?us-ascii?Q?6y483FpqOgguQxna1flDmDjSo1/ufnJaHK7ol71L0hDnoRup3DjYY9Q0PJzd?=
 =?us-ascii?Q?t8yoTxe4MTBDcM+etUUMhu/6SNAYIkkJez2pTrPv6HfP9U3o/p5PaZlliqAE?=
 =?us-ascii?Q?b4MKXMQkaOohrzburXGxlrYCVkVqinVcK0T0yJoftHvSCM3XRCfkOxA+9Ic8?=
 =?us-ascii?Q?O685ygCcB9DZUEdrLC8fDyQif/hMPxJy0cobs8W2ngSM/5barSlE3EJ7Picg?=
 =?us-ascii?Q?zuea97/ntts2mzMPl3kc34/F3NWSpTGtttl70igiVu+11ZmTTX63j327jb2s?=
 =?us-ascii?Q?GegHZ5bwfoqpBo68Qux/Oq3Sse04HkvNeUzolP40HZKKnIlj6p80gKI9NcpG?=
 =?us-ascii?Q?0UDubNZHwALgzL60ZLtE2nrokA45IRmnzpZvNVuw7yXEkSUwDxBGOlacjL7r?=
 =?us-ascii?Q?oXksN7z/PUs7rM9HylcBcHt7WPDUYbtbqnN9fGZwTOLYIZXE0PNrZy8oCdZm?=
 =?us-ascii?Q?+CsgPLB94i99rBeMdpq+w2YiTdY0kFuP4wy0D1qvbFkGExzgKkqm37u6IHi2?=
 =?us-ascii?Q?8fsQep33dpkhI1uIqoKMUiHQ4eijv1yRWwIOnUA5HALiAKkMh5swQn0X5+dV?=
 =?us-ascii?Q?qbCs49MppR1ah9Ylwl/SutuifNZoY2XVEbf3B5Glu58+iLl/w3JxJI+iOZmg?=
 =?us-ascii?Q?dZ8gVJEHo7U6oXFX9mvu7uhs3MrNiwmGYFb0yOzw6mDcwPyAOAEjWPcJJ5Dr?=
 =?us-ascii?Q?xVnS31fiCWc9+ahc/GOdyoNv0gsY2jqATzdKXjP1U2wIgxryweBZiaVbJcNR?=
 =?us-ascii?Q?3YAAf+/Hh/khFSr3j09deq3lNT8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:39:30.8582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c850d27e-343b-4f6a-c652-08de53593344
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9791

Add device tree nodes for MAIN, AON and UPHY GPIO controller instances.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index f137565da804..8cdf1c61458a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3277,6 +3277,50 @@ rtc: rtc@c2c0000 {
 			status = "disabled";
 		};
 
+		gpio_main: gpio@c300000 {
+			compatible = "nvidia,tegra264-gpio";
+			reg = <0x00 0x0c300000 0x0 0x4000>,
+			      <0x00 0x0c310000 0x0 0x4000>;
+			reg-names = "security", "gpio";
+			nvidia,pmc = <&pmc>;
+			interrupts =  <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		serial@c4e0000 {
 			compatible = "nvidia,tegra264-utc";
 			reg = <0x0 0x0c4e0000 0x0 0x8000>,
@@ -3347,6 +3391,22 @@ pmc: pmc@c800000 {
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
+
+		gpio_aon: gpio@cf00000 {
+			compatible = "nvidia,tegra264-gpio-aon";
+			reg = <0x0 0x0cf00000 0x0 0x10000>,
+			      <0x0 0x0cf10000 0x0 0x1000>;
+			reg-names = "security", "gpio";
+			nvidia,pmc = <&pmc>;
+			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	/* TOP_MMIO */
@@ -3726,6 +3786,34 @@ bus@a800000000 {
 
 		ranges = <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, ECAM, prefetchable memory, I/O */
 			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchable memory (32-bit) */
+
+		gpio_uphy: gpio@8300000 {
+			compatible = "nvidia,tegra264-gpio-uphy";
+			reg = <0x00 0x08300000 0x0 0x2000>,
+			      <0x00 0x08310000 0x0 0x2000>;
+			reg-names = "security", "gpio";
+			nvidia,pmc = <&pmc>;
+			interrupts = <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	cpus {
-- 
2.25.1


