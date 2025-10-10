Return-Path: <linux-gpio+bounces-26964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C7BCC587
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 11:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B7A04EB28A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 09:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA65926F2BB;
	Fri, 10 Oct 2025 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m6MhXl15"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2F5137932;
	Fri, 10 Oct 2025 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760088591; cv=fail; b=DPSZJVhFVdqrLPkh/I36hMTXARNyc/DB2Hzs8HSSZ0sIjdMwrs/YIuZzTSCBtTpXJLuhUiLK9cHaB79MnGvDg1p00VSxoFzttCnAN8C/LMTKQf+3Vy7rRhnb1V1SMdrtI2vP94NEu4pKrnqlCiqxGrY2m0gxBqOqFtZaAunC86c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760088591; c=relaxed/simple;
	bh=9xjC0Dg1nopyG11ZOf881MGahNGeH3zeEaRkAfBhNlY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEfqEYoB7I+1g4+gYZWiydr4Lf6fRAZbP59fbW7dTwwhpDRDA/3xW73xKeAxLeFQ12OYcoE4VxlezrsQagmqmKCME+2J2+nIof+1HXY/tV4QUaZVhUgqA7H8St0YVjMlibJ0LZY0QjZiQVKRYJcXYvUqUluphqZ1khl5aQQSWEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m6MhXl15; arc=fail smtp.client-ip=40.93.194.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro0J2Aw2z1E4mGzGIPhhQA6cGHzfZgvtHzbVA9uyB+3sdXMXKEr1TBBqOS5aqwhJBbkraqni4KihhmHtoVo0s0C17+Rz/AVs712Zv4IZ5emUEmsRjPDI4OVvn24qzWE15CDw7EUjR/i6l6ItD7n+WZVHFnD2Lga7djf3vXOL0aTMM4HFlyvTQbVtbOH+yj296Prh0NVgUKtrq7UMK2075KgsqngGADZwt2T+I4k5nt+OZ+8eLDU57R3kG+KJzScqwJaiA2wYK9UkipvaIeHEmlxaMcvdUV9NEloW9FIP4tcDcr48TJQdSYmp+CbfY+ggQBeMhcAzokNf2kwLVbbNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTqmzdvVrAd8b5lArqlt6eEMMe/5Vg7LOZG9u4WQsGM=;
 b=RlS3av+ygEyCPRuEYrubCvQH8WjAdjDcBcxCfjsrXEYzhQGHBifPyipTleysn6Q6j1S5w8Cg1IK42DLS2EamWl6tciVzGOcvwBybEOB4EMVHVrEv+JxUqt5VhKWttL9K4U/rfZbmV4LnklhETY3p2QxPgfAk7Knryqg7eFX+6UO0UKc22de4h0u3z5bJR1FZ7Bil+Ivme5lsZ/yrsQb8eJWYR8bsBhRO0ELiCaddBe/YA64AnXNYsLUsXj3Hdl+CjDpAqMvfppEO6fF9v+Di5fhGyamBEMcff0uPFhmJR1MB7jEG0TBWaORp5bzFYf7OZp3ndGo0JckSnsXxDork0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTqmzdvVrAd8b5lArqlt6eEMMe/5Vg7LOZG9u4WQsGM=;
 b=m6MhXl15krPW6RfnfUEN3XLsbsoBe6gVNCTjoJ2iWyJ1tBkHC8eaSxSMwvqQOB4kAeJ9sxp67UOCn71j8pEzDapYpDmeIdxWg6LP/qL71JRowOIvL2iTY6okP7nwXVEEfMve/Vlz1SCEoGUBNrIxWChDUtQ+VAk/bpwJOxyPxd4QVa4RZvCtZuLjqiWTd7wJ81uUUnLDOjdbMN1WXjoyd08GYgIy3EvZJjRLjaC6O6C2G8fbD92H94N6PbJZmmzQCKHF5yOdJcxCeq81A5lpnbVGyf5wvfzcDl+8KtMsc58c1T6UWKr550jMJnl9JJ2XxhjHoFuscB8fqOraMti+QQ==
Received: from PH7P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::27)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 09:29:39 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::cd) by PH7P223CA0006.outlook.office365.com
 (2603:10b6:510:338::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 09:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 09:29:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Fri, 10 Oct
 2025 02:29:23 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 02:29:22 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 02:29:19 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman
	<nhartman@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 2/2] gpio: tegra186: Add support for Tegra410
Date: Fri, 10 Oct 2025 14:59:13 +0530
Message-ID: <20251010092913.711906-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010092913.711906-1-kkartik@nvidia.com>
References: <20251010092913.711906-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f22b76a-fe48-49e4-d363-08de07df890e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n4eT7J1ySMoRZaa/9WLyhZ/WX9n4MynYSEwjh3VTdgtmytffcVj5KhfvwjXb?=
 =?us-ascii?Q?J+//ml5rmwTsL18a73/x6oQzlRIs0rc94Nxd/n1O2i01GumOUSkmp3dANhZg?=
 =?us-ascii?Q?h7JdqEw19WZ8wIfZlmTmRmylxhsUg1MYQtI6fhvM9iRJxMVfzGmfFRYZ0vFS?=
 =?us-ascii?Q?5q9nqAyszSj5ZL9oQr4If+KncvfpogrmIMv/e8+wa7g9JCHwslZJRnpSJtSf?=
 =?us-ascii?Q?KT3d+0jL/O96Q3dp29Ls7LRHfq8l/1eha37WPwWb+gn7NXNA567ESSy60giE?=
 =?us-ascii?Q?P7H8fJF2FsDBIBAPaQINcDM419y+zLmMg9BkOFNu+z6K3u/mxnGXZqkLQMgi?=
 =?us-ascii?Q?hZ+G8wsxvdX/gw1qC+qFm1bSHrWV9Gc89wao2n9zpEmpGUvd0V9LPs836O9l?=
 =?us-ascii?Q?TX8N25ziaMcuqgN7KQhGjPz7BVLILbXlQRwsErJsrddW1ggAIsSQeP8NXtwH?=
 =?us-ascii?Q?Z1AH2+As4fS8uZned8eaYczPvRmZoCIoqASBTNBYbQVCZKNtPMHMxPoN9fNx?=
 =?us-ascii?Q?cpTq/qIigzEfYxoLIHrBG4Y7wHcG+TKWnb/hmVwheuuVsZhMws0PuGF9tdf1?=
 =?us-ascii?Q?GulijFBeAcPRo/jeUI0KtJ0EO96/N20KAQMZX9ZmilDfGPPTEpDk4Lcokfjp?=
 =?us-ascii?Q?6zgw2ZBH2WEdvhtiN1N2M7ZF74URBGd5dcOGFmKDaHsKui0TkhlATK2+/M8h?=
 =?us-ascii?Q?ELznLjW4yluKunlfYLFbpDKokMNYFPRMbDvgWxCyCzAqT+unq+98lp+JetJf?=
 =?us-ascii?Q?B7cy6KOE14d3aPYUIIjZdLz/YIqhIFFKdFcs+HtfUUzJ3hCxX+coDeWvix3M?=
 =?us-ascii?Q?ml2kE7jAyD/EIcQ0ydfdK6zFzMsZJfQ6GA0y9lp/4n1vFQCvwS1dkUqXNpya?=
 =?us-ascii?Q?O4mA1gyx/gfIFgvyQ15G6o4S26UpvsVUv18unItpp9s7yVdz0D+biWr7feNs?=
 =?us-ascii?Q?8RXMOM1mhPN1GYJcbkV3yS7h6ofq37p4a0dgjaICtxmb2bribaHTM5u0fF5Z?=
 =?us-ascii?Q?ZrhVjng4gTGto5kwf/xlSY49VSrYbGr3E5YTNGgoX865oCXxl/of8QqpGlJP?=
 =?us-ascii?Q?/241JhfjzEaCKrz6VfEmUM1TIw+/Ukl4SkRcJPm9ygxCgsyZmH51+UuSmuVY?=
 =?us-ascii?Q?USwjtmsYNZBP7WwhTih1J1qBezGZ57a7n1incUe/QzcWwGu9Q561qo/fjdxa?=
 =?us-ascii?Q?ILQxFxkyKLx+DkZoA2izAMDZQ/s4wrhn8wLnhexj1pLWAhrEgWyrRd753AHg?=
 =?us-ascii?Q?wfj8OqRXRjgXQBUc2hJvn/bvfPwOKernss+c3OWY2fMnDcJtxVUsN2AIvYfx?=
 =?us-ascii?Q?Oh5Ou2XSdvapnhuDq5OpewL0OZeVadP84XD9xZXoliNam2ThW5SViFs5XfrG?=
 =?us-ascii?Q?3yO4SBOvGo90PJpUEmV/WmtQFbf/2wj+BRfAFCG3wTVSEuWbzJTD8vbH0Ia4?=
 =?us-ascii?Q?sPiyoiE9pzeOVBS/aTW6lMNR78QOLLn0A1H3vKzXfdCSZuGHVagemszvNA59?=
 =?us-ascii?Q?8qeLWpB/SSNQ/8a/obcvdk9l7gLDqt8A1agV/cU3Wx70H5Tvr2T57fOxPGmD?=
 =?us-ascii?Q?Turrm9yEqmUiU++0a08=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 09:29:39.0246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f22b76a-fe48-49e4-d363-08de07df890e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572

From: Prathamesh Shete <pshete@nvidia.com>

Extend the existing Tegra186 GPIO controller driver with support for
the GPIO controller found on Tegra410. Tegra410 supports two GPIO
controllers referred to as 'COMPUTE' and 'SYSTEM'.

Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v2 -> v3:
        * Add a generic TEGRA_GPIO_PORT macro and use it to define
          TEGRA410_COMPUTE_GPIO_PORT and TEGRA410_SYSTEM_GPIO_PORT.
v1 -> v2:
        * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
        * Rename Tegra410 Main GPIO as System GPIO.
        * Add Compute GPIOs.
        * Update ACPI IDs.
        * Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
        * Added Nathan as co-author for adding compute GPIO support
          and renaming MAIN GPIOs as SYSTEM GPIOs.
---
 drivers/gpio/gpio-tegra186.c | 82 +++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 7ea541d6d537..c6ebe29f9cf1 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2022 NVIDIA Corporation
+ * Copyright (c) 2016-2025 NVIDIA Corporation
  *
  * Author: Thierry Reding <treding@nvidia.com>
  *	   Dipen Patel <dpatel@nvidia.com>
@@ -69,6 +69,36 @@
 
 #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
 
+/* Tegra410 GPIOs implemented by the COMPUTE GPIO controller */
+#define TEGRA410_COMPUTE_GPIO_PORT_A 0
+#define TEGRA410_COMPUTE_GPIO_PORT_B 1
+#define TEGRA410_COMPUTE_GPIO_PORT_C 2
+#define TEGRA410_COMPUTE_GPIO_PORT_D 3
+#define TEGRA410_COMPUTE_GPIO_PORT_E 4
+
+#define TEGRA410_COMPUTE_GPIO(port, offset) \
+	((TEGRA410_COMPUTE_GPIO_PORT_##port * 8) + (offset))
+
+/* Tegra410 GPIOs implemented by the SYSTEM GPIO controller */
+#define TEGRA410_SYSTEM_GPIO_PORT_A 0
+#define TEGRA410_SYSTEM_GPIO_PORT_B 1
+#define TEGRA410_SYSTEM_GPIO_PORT_C 2
+#define TEGRA410_SYSTEM_GPIO_PORT_D 3
+#define TEGRA410_SYSTEM_GPIO_PORT_E 4
+#define TEGRA410_SYSTEM_GPIO_PORT_I 5
+#define TEGRA410_SYSTEM_GPIO_PORT_J 6
+#define TEGRA410_SYSTEM_GPIO_PORT_K 7
+#define TEGRA410_SYSTEM_GPIO_PORT_L 8
+#define TEGRA410_SYSTEM_GPIO_PORT_M 9
+#define TEGRA410_SYSTEM_GPIO_PORT_N 10
+#define TEGRA410_SYSTEM_GPIO_PORT_P 11
+#define TEGRA410_SYSTEM_GPIO_PORT_Q 12
+#define TEGRA410_SYSTEM_GPIO_PORT_R 13
+#define TEGRA410_SYSTEM_GPIO_PORT_V 14
+
+#define TEGRA410_SYSTEM_GPIO(port, offset) \
+	((TEGRA410_SYSTEM_GPIO_PORT_##port * 8) + (offset))
+
 struct tegra_gpio_port {
 	const char *name;
 	unsigned int bank;
@@ -1267,6 +1297,54 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
 	.has_vm_support = true,
 };
 
+#define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
+	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra410_compute_ports[] = {
+	TEGRA410_COMPUTE_GPIO_PORT(A, 0, 0, 3),
+	TEGRA410_COMPUTE_GPIO_PORT(B, 1, 0, 8),
+	TEGRA410_COMPUTE_GPIO_PORT(C, 1, 1, 3),
+	TEGRA410_COMPUTE_GPIO_PORT(D, 2, 0, 8),
+	TEGRA410_COMPUTE_GPIO_PORT(E, 2, 1, 8),
+};
+
+static const struct tegra_gpio_soc tegra410_compute_soc = {
+	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
+	.ports = tegra410_compute_ports,
+	.name = "tegra410-gpio-compute",
+	.num_irqs_per_bank = 8,
+	.instance = 0,
+};
+
+#define TEGRA410_SYSTEM_GPIO_PORT(_name, _bank, _port, _pins)	\
+	TEGRA_GPIO_PORT(TEGRA410_SYSTEM, _name, _bank, _port, _pins)
+
+static const struct tegra_gpio_port tegra410_system_ports[] = {
+	TEGRA410_SYSTEM_GPIO_PORT(A, 0, 0, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(B, 0, 1, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(C, 0, 2, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(D, 0, 3, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(E, 0, 4, 6),
+	TEGRA410_SYSTEM_GPIO_PORT(I, 1, 0, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(J, 1, 1, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(K, 1, 2, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(L, 1, 3, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(M, 2, 0, 7),
+	TEGRA410_SYSTEM_GPIO_PORT(N, 2, 1, 6),
+	TEGRA410_SYSTEM_GPIO_PORT(P, 2, 2, 8),
+	TEGRA410_SYSTEM_GPIO_PORT(Q, 2, 3, 3),
+	TEGRA410_SYSTEM_GPIO_PORT(R, 2, 4, 2),
+	TEGRA410_SYSTEM_GPIO_PORT(V, 1, 4, 2),
+};
+
+static const struct tegra_gpio_soc tegra410_system_soc = {
+	.num_ports = ARRAY_SIZE(tegra410_system_ports),
+	.ports = tegra410_system_ports,
+	.name = "tegra410-gpio-system",
+	.num_irqs_per_bank = 8,
+	.instance = 0,
+};
+
 static const struct of_device_id tegra186_gpio_of_match[] = {
 	{
 		.compatible = "nvidia,tegra186-gpio",
@@ -1302,6 +1380,8 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
 	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
 	{ .id = "NVDA0508", .driver_data = (kernel_ulong_t)&tegra241_main_soc },
 	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
+	{ .id = "NVDA0708", .driver_data = (kernel_ulong_t)&tegra410_compute_soc },
+	{ .id = "NVDA0808", .driver_data = (kernel_ulong_t)&tegra410_system_soc },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);
-- 
2.43.0


