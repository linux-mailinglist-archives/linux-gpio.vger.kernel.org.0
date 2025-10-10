Return-Path: <linux-gpio+bounces-26971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1CBCC7EF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4417D4FC1F8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBCC2ED87F;
	Fri, 10 Oct 2025 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F4qcphds"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E12ED164;
	Fri, 10 Oct 2025 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091271; cv=fail; b=m4EWk00ljvBPCB+/oViYXf8uMpZnqP8cBaT+sSinugfjMfPhUuhvoVqoTrmL4Z2zhkAVTNrKukOR1Dw0GUOcfLAIIVzv5wm7CKnxLYX1TvVGwCtfQPoqvBmw+3SOenq0YQc1nFxkkSzC7whBmxwOHveU3GK4213cmo0Y0VgJ6Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091271; c=relaxed/simple;
	bh=isdWrHQiCL5Oxk78DqbphV7O50PtGMuaLThG6FbcfYM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BD1kvOz1Sj4M0gKIXr4iMREJ+RalIAmGLHzFdNH6ZukGIG4PctkvGaPx3Dle8iQd7SU1b833MDxbThXFz8+a/tJTUk4I1xzEdGrO8VeleZFUyCy8h2HIB+56iK9It37tYF2y2BPbapMxfX3LEvdgFonjgEHGdrGlUBCSJXe6aSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F4qcphds; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDMboBtTHbyY1xF1sBRjtgN0BY6CZyQTgzRMXInEAcUhZ3QA4lns0mAE3CkRFYA0WFd7n4hFGkdVlLTkIzH8GrpwXVJvv6Y4Z2QowzFP3SJGFWZz1sZdOSuqf2HJ+OsyM8O/kY1aOSCTCI9sd8KBMISGxyQsyPrBIPnQQuOIpppQHEHKvMt9xst+yhYIV+/bc3vJOowol0lIcCk84rMw2z1uf5Tm3oG29BWegpj1TCMXYlweg066p/3JMNHVVdMYxgkfjPJHil7Zv+J5MhZIBG/zCimVGM/Zwd0tAFFpLWnfJGV4Uz07Tsbcq6B7sg/+gKL1KuJUv2WSEB9M6eyARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW0wb0CkDY2P9YHHykBrdAHn13EIV3QbJSF6dGQM3jc=;
 b=KLIv5pKGXCSA4IPzOt+5eMStCrz+ewZ7PRnI9o+HrijX8/elLeWkTDKzzmxe73c/ituQqXlpY7Co2PKJ4IlFwRJYamvdDsKUxvRbstbpQRz1+JbiKjVUK41lwUJ7lfhuUJH9+BW/UPgbB2128QbZc8Ugp7pLbca206CKBy1mV74rRBBhvgLggLy5mLIAvRUEgMZBp2ZQhzURN7pzL3n9V10q31RBFnjvkpmQElTJR1bJOuIEmEFoDh3LSk0kJ3qew/AFSdVbI8G2j5PdB58VyvyRVKfanF7xnlPTXbhU3UmSLxwIy8CqwkxYY266wtm53ICawtF7yc2ceG1B6Evs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW0wb0CkDY2P9YHHykBrdAHn13EIV3QbJSF6dGQM3jc=;
 b=F4qcphdsZfRwcBZu0Vm5n4pxGyY+ky4N/A7m7ejcW+lGCDkbOAaRAg5hMRoBUKaac0uwvx2V3J31aCerm8T/YJlWy1fsQRKkLtWbMXMCfirijVZKMp4JT7yZdpR6FRY+80xRubgbWS9PwvmgRUsBz1Nr4+InqBGM/SvCC6UoCMnEi+WoMdaQH2ZksgyR0weMABPz0AN/8XerEb40KkxIWX8ePNHBx/r2IAk8/QFXetqcNgVbFUr6B2oUx3pUuL2zugz44hPNtBFOhPCncwILB8ObwU9ul7HEQ6QQp9DfazuNopQyBqNhWSJh0YZIuGgdC1uwKENXU/RiFjK2dzqjLQ==
Received: from DSZP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::10) by
 DS0PR12MB6414.namprd12.prod.outlook.com (2603:10b6:8:cd::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.10; Fri, 10 Oct 2025 10:14:21 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::7e) by DSZP220CA0012.outlook.office365.com
 (2603:10b6:5:280::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 10:14:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 10:14:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 10 Oct
 2025 03:14:07 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 03:14:07 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 03:14:04 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman
	<nhartman@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4 2/2] gpio: tegra186: Add support for Tegra410
Date: Fri, 10 Oct 2025 15:43:31 +0530
Message-ID: <20251010101331.712553-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010101331.712553-1-kkartik@nvidia.com>
References: <20251010101331.712553-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|DS0PR12MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 19083234-3037-4670-2a3b-08de07e5c78e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PTijCWB7KzAitFq5e03KDXq3A/MgxVtE6fPc4rYQkU699cnJSOEr//H+x3rL?=
 =?us-ascii?Q?5em9IsGRFgI/49WGI6U9IUbSMzyAAgVNGqQShjn7BvgyYHdNRxi3rgyu4wyW?=
 =?us-ascii?Q?0wKgBVHXxxb1nl5xzvZJALZ93T/YFh6lEgtTThdQct8aI19CyvAVLLmaP4kC?=
 =?us-ascii?Q?9rSnYbTD68ogYPkbQOiHjDTh5CTx8gF+onOyZRgOnwB1Sshe99TbMEwmEKKt?=
 =?us-ascii?Q?id7lXE170iV7H9cOBBgt7AVSqbsxKj2RoZCvuvxS809ygtswJKUVbZQ6XfWQ?=
 =?us-ascii?Q?U3P29RyxvhOXDXlm6Og8F6gRh6sc+8QPORqnFoJXwhc4wrlFNClEuzRPamKe?=
 =?us-ascii?Q?5G8EYd6Ut+nwmZ1hbDiqEceTBab3NBULfjiNXwz2s+1U5+WURm2SInpe/xae?=
 =?us-ascii?Q?8rzzHCVAJuc7JvoMQt+zUEZ1qxXlPQtUpNqp3NS6BCwNE5ZExp2CSzQ14tnr?=
 =?us-ascii?Q?ypaq82xRjfAyQA3BZNVlCwqFp+oy0f1fBAZqUgwSUTqMGtsgFjXQP++CPNF4?=
 =?us-ascii?Q?JNhN09aXiCmQKefNtqdjPQt+1ymq/KsnxBRaqaFERNnI01QMk9Mbr3USIbli?=
 =?us-ascii?Q?z0w7N9McrUrSWJ82Jhoe5z4YDqn5jjr2S3DC3xlMQ+gazqqk3Z+C5+sTVtnr?=
 =?us-ascii?Q?fWy5KwynW144BUBOnV1CkqqsD9RS9A7svd6tyvPkT8JkElsapSPzGlvQhEew?=
 =?us-ascii?Q?zxJnJy9bl9rorr//RWjZPYdnJJ8/zRpSbbmxKUKYL+61+9kpN6GjOetA9lJi?=
 =?us-ascii?Q?XzGYt4ENnvTodRD9lkq1krkgbjg5T/ZU+vUHpHFeuDV7PFRLs8MUD0hJItUl?=
 =?us-ascii?Q?H0dFWMu8lCif/Rzb7ocTcoZJC+sgMQH9zsWDeMdLRViu6xfe+thW+MvxndbS?=
 =?us-ascii?Q?yZgpQ7HNzPNS98frk6fCHFIH7uC1JrQvQ0gTEP5SmSAC1QXijv7fGazPO3aK?=
 =?us-ascii?Q?Wj6FezxCFSRuQp65pB21Bwt7TfTmIQDwe9DclxXzmn7TEh2B896A1H5ym6Js?=
 =?us-ascii?Q?JQ4HDzWOz9YC4C2i5ZkSP4O083Ju4A24Qd7bymLLVMwN4refY3uFMFck1ehj?=
 =?us-ascii?Q?fgCtiFbg3QLr8BWJqJIb/wHsVDTeGGU7OG7CSNQwKDKJ8vlxmxjsYyO70PGy?=
 =?us-ascii?Q?49dCAeBamHw4ELYW8jBIT8QxCSglRcS2iGgnZ3+7R9STqEUgqyj6xVZVDafR?=
 =?us-ascii?Q?exrRs5qp5tfUzoefMm8Zp3QUHqJcKFTsPtbkkKWgMhglfBzojrN5E0oyHuLW?=
 =?us-ascii?Q?e6kUArRX2bv5m/2HVbS274dTFW3JiRn0aLw5EcV1NJJ6ReuTJ+Mqo8NsLbav?=
 =?us-ascii?Q?XLu5GfCp/R0UWYrW6Zhr9SHqEI3otaWxHeLvLOrgWwzuvj0JJMQ8pR/mTd4b?=
 =?us-ascii?Q?5ZDVUDdU0yijMEkO22NKHGsz6QDwKW8ABEkBMA+X4dQcsbfdMNA443kRxLsi?=
 =?us-ascii?Q?yu9RFiQr20xFh2+PNxEMFP3Jrxdbuoloyh9f9kGy71/H+szS8BEPpEaMF9u+?=
 =?us-ascii?Q?IHA2S+KSwfhzdIk4/hNVoSRZOI3uG0sJP9Sj+uJuF63PnxfLW+itQaznzrKW?=
 =?us-ascii?Q?WXyXVRXYFCR+gJv4+IM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:14:20.8771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19083234-3037-4670-2a3b-08de07e5c78e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6414

From: Prathamesh Shete <pshete@nvidia.com>

Extend the existing Tegra186 GPIO controller driver with support for
the GPIO controller found on Tegra410. Tegra410 supports two GPIO
controllers referred to as 'COMPUTE' and 'SYSTEM'.

Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v3 -> v4:
	* Remove TEGRA410_COMPUTE_GPIO and TEGRA410_SYSTEM_GPIO macros
	  as they are not used.
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
 drivers/gpio/gpio-tegra186.c | 76 +++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 7ea541d6d537..83ecdc876985 100644
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
@@ -69,6 +69,30 @@
 
 #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
 
+/* Tegra410 GPIOs implemented by the COMPUTE GPIO controller */
+#define TEGRA410_COMPUTE_GPIO_PORT_A 0
+#define TEGRA410_COMPUTE_GPIO_PORT_B 1
+#define TEGRA410_COMPUTE_GPIO_PORT_C 2
+#define TEGRA410_COMPUTE_GPIO_PORT_D 3
+#define TEGRA410_COMPUTE_GPIO_PORT_E 4
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
 struct tegra_gpio_port {
 	const char *name;
 	unsigned int bank;
@@ -1267,6 +1291,54 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
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
@@ -1302,6 +1374,8 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
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


