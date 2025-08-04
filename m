Return-Path: <linux-gpio+bounces-23996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5CB19AAE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 06:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F70B18966B2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 04:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE93C223336;
	Mon,  4 Aug 2025 04:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eZxQ+8Fw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0003A6ADD;
	Mon,  4 Aug 2025 04:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754281039; cv=fail; b=e+Avp4UeQ3bTgdpGSk0uQqAlCvXAoyMKDlXc3GvrlmA2ht0f+0Nd+oXcIvKSDrVtbUK7vwO0MigCQMd5ckqpK+4kxK8HQFlTCtRMuSSzBFBYKhh1amjKHL7Yydhhn/7GF27m4M6mpmAL9cpPBSYTjcqZxITo8GmMGA7xBhtCP9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754281039; c=relaxed/simple;
	bh=64q+CGxPahUgPgZaUe7BBFOd8sKQWsonF8x+qCSP2PM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NXkuMg/m3Bl44jwL+vXyOKuNYyZ6F7yv8rqgRWLKOt9Ms2gm9t5fjOK/t/AKkqBKUzpSHU4nXgKSXRiXsDKO9Juw3n50C9jXZYzpXIDUR3CzVqO5j8ui4T1UWABaFUhDu3ZTbsEQUeKqo9e9cvE5ud7jPa9otjl3a/4NnkbQw3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eZxQ+8Fw; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcHcf3lnVAA1M9TVfXunfB/ALcaOT9FWhrfh//Zs5WNW950O8aF+TuVzSHt8Y5nnA5K+hmlwdGbQUWj2iWzsnEOBdF4tInQfnO0NNl0NGOzbkEskdW0S71evwkp6m0fbg7iwUjQuViLjR3Jbm7b+sODTNGzw7LVJqazvb62t+PQkl0QTB2mfr3OYy5XP09bA849FwFfhuhNZUXGsRunFoooTQYuOTSaAUybrEpAlYC3HOuyvIvN3wSW5PQgrXXJQSXFjnDeExn0gOHWlN1w/gMNWYpvLb9Sshi3TDHW+lQg1c8hFoCMU/80ivzsxMUT9coXCHIpx/I9mYMmV0M8bLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bGAcPRbjB56GwO8xczsv10AKq8zlB7ELuRMhRnlC1A=;
 b=dgg8/CNN6CiFco0w3Sw5lE2pu5jdiYFbXgr/ZSlDaWE0XeEVve4NQoW65h9YWcc282iyQl735IOonYXE7IS/jCWT50oUSmpIb37aMQpbOQbll5Cnd2YVL92/3FVa8E0r1/qVm0GrwOTACHg0f1pQQiC3o+FyWNeOlX+bvbfm9B37oI/4JTPo0u1UtzWDXJdmzBqGeQftj8FNrVLPVjEokfw6Fsav0VzL7DzEQqOzSObsVdiWuvaQp/9+ba3ksfCHgr5G38RD9KUe+7W29oxWs5xmS4pbgY59ET+oyDRXtVNa03u/pqcaEknJDFwoQSpWWO3hnMwxl7FhbRivIVU3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bGAcPRbjB56GwO8xczsv10AKq8zlB7ELuRMhRnlC1A=;
 b=eZxQ+8FwdMg80Oro6WwnRYurF5EkdAKy4or5qvkhSwSkyEIdhKL3qCPRRbRrf7RgppHSEwbTbPhNFWfKR7fWuYjm+3Qgmdvr6e9jkQ4OUewAehTrjt0TTCKjToIuvOqDm9juw35XiIAqbQMgmRJeoRAjWcrHIRIEfRM/KjqFKwODpRlrk/MaX55mHEjpMa9owKSHwzaQFbtbiwOZ/5Nbpy3T5BuXC9vkJX17DbN/dnE1OSpPxJMq+h3vA9q9RTGTMsLhVQ+5TdcwvjcX85SfAt+csB46PmPiZGPIY1F+nClKo93RIox+h1oR29Pjai/vBP+W2cLI68KRllfj5u51aQ==
Received: from SA0PR11CA0177.namprd11.prod.outlook.com (2603:10b6:806:1bb::32)
 by LV5PR12MB9777.namprd12.prod.outlook.com (2603:10b6:408:2b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 04:17:14 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:1bb:cafe::2d) by SA0PR11CA0177.outlook.office365.com
 (2603:10b6:806:1bb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Mon,
 4 Aug 2025 04:17:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 04:17:14 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 3 Aug
 2025 21:17:03 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 3 Aug 2025 21:17:02 -0700
Received: from pshete-ubuntu.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 3 Aug 2025 21:16:59 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: gpio: Add Tegra256 support
Date: Mon, 4 Aug 2025 09:46:56 +0530
Message-ID: <20250804041657.27688-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|LV5PR12MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: c8816e4c-2cdc-4342-f37c-08ddd30dca80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w+PMBYAUE6v2oSr58v7n+HXYb05jiRzic1sY+M14Dd+tAWjep/Ih2mQmVKDT?=
 =?us-ascii?Q?0eX51iFWUkB3CH0ptnDq76BE+zykQhcCFpC5Ww5KzQaBGabev8Mt3HPtxx90?=
 =?us-ascii?Q?YMblJ7dtyH7ZgVvmK95F1HeSKyPxNa27inm+nXNxvZis1hkvfMnz8aTgn/pv?=
 =?us-ascii?Q?mYqJpOW6NL3L36dWnFjaGQBGcvGprlIE5hrlphahogDy06NH73nd6pAaCZti?=
 =?us-ascii?Q?O/7nQDQkPZ/4oQjx0q4TnAl7X63L7gkQBVYWXPiswd+qIzerDpA2U3LueSvO?=
 =?us-ascii?Q?0yLxk3sd2+ZB8MQjxGhpHKr/kDNQHMaXFCx2UTEbqJAMPXI+vWvswfFoaqe4?=
 =?us-ascii?Q?szQttkqE9DY30yuOmzS6BTWq/cvuUuKoB58SohBb9+pXbCUVN47QiiBOOGlj?=
 =?us-ascii?Q?iYqgYw3k1L9rb4A+z0vIQjH0P+abDvYQUZ6+ER9lqgJypLpcfSANIs1PLQGf?=
 =?us-ascii?Q?z+4pFVu3P7ReEMbZXYvcsYRkYj1SBdrPuJoTvuVGXeLdCuMVw3u6VQZVAFVi?=
 =?us-ascii?Q?LElS/Flyd74rUIoRemiTAmtc6dn05OoEGpddCP1uJ9dnbf1T608gXioHiRkq?=
 =?us-ascii?Q?MxdDcnUAtAWh+lbmy5uczRc4RRUYs7riuSfMItbIVYyEucVCEfXSOtkg9wO4?=
 =?us-ascii?Q?Eu6+nq2JTKrsdq00JTtCRl5pBORQNKUDHZs/KPvMNpL++tiGZJWYH4GoXq5o?=
 =?us-ascii?Q?KIhgxF3RVZEk4OeIl1r0bRR9Q4k+yedcpxz3D1JDmsvhBX0wiPWp27q6iUPK?=
 =?us-ascii?Q?c8mP8KUBc9fCYFHGh2aJqPZZU3WG5SpkyBeXeEbSBHDh96WvDuzVfKAtE4Z+?=
 =?us-ascii?Q?ZMK7qELrop7w9bw+LbupZe/F0hJ/jSOgEBceQ68EvUSQbIEsrNgINAJ52kRv?=
 =?us-ascii?Q?aNOnohhuC/2lN8iUMiTLPmQ2fqnk4rMuHEMykMjvFe37TQRiNw6oX+tEZOfP?=
 =?us-ascii?Q?2sK9kQwliy2dBxDynB+8ueifhQrbPUT4N7zo4aQrfI/QJhDBqYKUmzMpJwQy?=
 =?us-ascii?Q?HiFEpe108lQVNbH+0BoXRa21zp462GNtLxA4P3GVMRQ6X4c87iqcPWHx1Vb3?=
 =?us-ascii?Q?jdupVKW6NcKY2Jfoja7a4SQA4NP25mMVBaNhtoHiQOas1AKQ17mafQRET8y6?=
 =?us-ascii?Q?oo7UKZjpn45/eh02v6r5pTHdGUyQx98m15VH+TBUqeSgNoh1yYojlhCbx/sf?=
 =?us-ascii?Q?ltFeteUFpfrLEPpNl1oERevsQz60WoEOjFCYRLwGhscxCFU0+kBrLtmPPPpx?=
 =?us-ascii?Q?o9GzQdub7pGbpYXm38dgZA1n3cK5AtlDPnz5yEiaywSM0/KZUMyRxuhdvaPg?=
 =?us-ascii?Q?g9kICeMG4H31enPTptc3QDzttVcH7uousbaXYmQmYg+33I8AUH5xUGWrWYi1?=
 =?us-ascii?Q?oXiuMU2NMt+ginndMgaO2p3iHTPW6Wms9nBKZBTsLy5ELWJ2RMEy+IfNVZIY?=
 =?us-ascii?Q?l7MV+daBdpCCF7kKZSsHEIaqUE/2thFhQOATFCIzrZcMx2QTJKAMbXTgJtyu?=
 =?us-ascii?Q?0FwfSv76F2oYP4khP6sLDMbnd+j1A6Ts+CeCThaPPGJMMo6Fuqmfjb7mkA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 04:17:14.0956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8816e4c-2cdc-4342-f37c-08ddd30dca80
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9777

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra256. The number of pins is
slightly different, but the programming model remains the same

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  2 ++
 include/dt-bindings/gpio/tegra256-gpio.h      | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra256-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 065f5761a93f..2bd620a1099b 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -85,6 +85,7 @@ properties:
       - nvidia,tegra194-gpio-aon
       - nvidia,tegra234-gpio
       - nvidia,tegra234-gpio-aon
+      - nvidia,tegra256-gpio
 
   reg-names:
     items:
@@ -155,6 +156,7 @@ allOf:
               - nvidia,tegra186-gpio
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
+              - nvidia,tegra256-gpio
     then:
       properties:
         interrupts:
diff --git a/include/dt-bindings/gpio/tegra256-gpio.h b/include/dt-bindings/gpio/tegra256-gpio.h
new file mode 100644
index 000000000000..36485b4bf47d
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra256-gpio.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ ** This header provides constants for binding nvidia,tegra256-gpio*.
+ **
+ ** The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ ** provide names for this.
+ **
+ ** The second cell contains standard flag values specified in gpio.h.
+ **/
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA256_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA256_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA256_MAIN_GPIO_PORT_A 0
+#define TEGRA256_MAIN_GPIO_PORT_B 1
+#define TEGRA256_MAIN_GPIO_PORT_C 2
+#define TEGRA256_MAIN_GPIO_PORT_D 3
+
+#define TEGRA256_MAIN_GPIO(port, offset) \
+		((TEGRA256_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+#endif
+
-- 
2.17.1


