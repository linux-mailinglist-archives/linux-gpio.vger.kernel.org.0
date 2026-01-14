Return-Path: <linux-gpio+bounces-30541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B55D1E2B9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F58F309A5F9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 10:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44368392B95;
	Wed, 14 Jan 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B8xKtRS/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA239340A;
	Wed, 14 Jan 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387164; cv=fail; b=mwmWzvqgFQOkpkcJYL8DQPHoXaM2FjSAmfvryC9p0nGecYffEvJcReHoXvkFduOGhF8zMLtfxmNibLRwT+xa/wnG2LmOhoQdzdmHkshvS7m9WJUI3mMHVJ2f85QiJqgiYeVm6Khl9jfBEA5yaphF6qiQAqnStcYxNmlg6xcNc2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387164; c=relaxed/simple;
	bh=nWtzEsZ3wY1YMMcGSJryr0aDOU3qqv2OSVcPfgWKluk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KlJQNgPUVXZcffpfYi5BaRCbCvd8G04oXSweHN0ZrqR7pyDJfynU9terkkiIlxpPMGQI9FeR3YLDibMX7qHOwd1B2/PJGIse2sGSMjO434XCMyFdzvKJDcWWXle0ChZRNzMvHJvBRHRF/O2SUCUmIeAj8eVioQPEdTqhMRfV3Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B8xKtRS/; arc=fail smtp.client-ip=40.107.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEqShmND8iW/WIKWh9DGG2wZgK2KClYe7JpIV944dvqQptnZiF2GO0mUGviT1QUS3Nrir4/uKiWWPCR1eOvWoJvTsqNxq7zuQNjxJZzITkytNXnG2M6e7FgGd8uxYTzBPywPOVoHx11mdkqKaDahZ0xggoTKOhk6uD0IKbC3TqJl22+4wUjFfvNbinjwWXxoZCPzQ80mJvJoTsBOLxm5COHg3oCmPrW/zn9BTYuFuefoFRVAA98xHZr6XHGp5VdfXWzpcKaFG1C+p7lYI/0x/oVVGmmC1P+KDzNcMsIr4YzZqpYpRN+klBOFZ4d2tV2ke0+lJzXx//jg3IlSYPm2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwSOdxwTyuZxmmnTw+5GKPg6Ks4BJUVwIeY4G3c8xhc=;
 b=plSNlHBa/h2twDZXwOHd3leIiwt1z1csow30R52m18fRjUJyZA5izmiDYkwVpsi9Se54vtzt9kFYFRltwwoLqiyjb4HuSz3mSVWGsOH7a0dZjpqmksVIdLfd9DAL1vfxsspXE6MI+iQOC8DPJbbt2JbYvvqgZagGbfvHthzujAfDxiaK89n8RIBlCy61YE7pACEyYYpYkBQ7piULqcf/O3hFayBZmN1pHddbt3J8s7KDjBUNCfGA/ZsR+E9amHbiOANhvnO1tF2QpnRX3yCaXOT+1POKMlBEi8wMkg4WI/jhpxfcNLGHQ4ujw/g987nxUxjXHmYbvmliGYuzHxhBvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwSOdxwTyuZxmmnTw+5GKPg6Ks4BJUVwIeY4G3c8xhc=;
 b=B8xKtRS/hfA06Udwyj2zfb+Zz1R08UYdGGWOinA0IQPuCRn32Xk/9VBZngJ+q/LPY6DCb+DKMMQEIULe8Ll6m6xehc9ouZquBnzjbcKc+QKMZBINlVHXYz3g0lY7wjUigi7jpNsaObhYIiYYxvZKmEP50JI7NOzisznjoMTMnX3NCIvbch26fuFxmHTit1IkdTW9+YWx583+fKJgSN3c2grlCvDxY4PLvu8kzV3ebti29u5/boz/g0hLJSSIggpeQKEMcP5MSSfvbYTQNUNPgH+Brz3gIoR6SSus9YFY3npWWZWD+ZNsV5s5lrmbqEnUi/BLuYG8u/YWsrYGzhLI1g==
Received: from BN0PR04CA0128.namprd04.prod.outlook.com (2603:10b6:408:ed::13)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:39:13 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::24) by BN0PR04CA0128.outlook.office365.com
 (2603:10b6:408:ed::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 10:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 10:39:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 02:38:56 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 02:38:56 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>
Subject: [PATCH 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Wed, 14 Jan 2026 10:38:44 +0000
Message-ID: <20260114103846.687338-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 6094c355-b0af-48e8-23c6-08de53592879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cv5pA6rbHX+u6jk5BQ0d0GW9TxfFYKqtUsvosomRAoYO6+D9LMWch06i1J8u?=
 =?us-ascii?Q?JI/W0tERimEDrNh48bgYOLp+8Y1JFAp033/xmk3syL0fTdgTtyxfQjVMxzmt?=
 =?us-ascii?Q?GpkUjdD6Tydcm5ZDW5s8L+L6H1n+R72jnxHasRYcd8Jk9aoB2DTXvYAj8Kny?=
 =?us-ascii?Q?K8iKLUtp2xnF/GJLll1EnT2Bm85e3aflh1R0lWGSYUkrBvQ9uO+++d9HaZhR?=
 =?us-ascii?Q?q2i0MnoyL3A5aXAj9gWgCNxCd68Goh5BGVPjpVvNAgD/OUY2HylLPiMsa8RZ?=
 =?us-ascii?Q?JkMaIHo6nSTZPknKaeF4SekGNhQuxaGKmxznYi9T2geQw3co06fMIuUN89PJ?=
 =?us-ascii?Q?gIgkMeXmeqUkxq5i0s8bKJzC7wUJzW3N4PrDTwlaMiidA+e3TkhAouY8HwzY?=
 =?us-ascii?Q?2QGcs0wNKPOv7E4ZxPt8OEyffDdjxOkJ2mLaQhtYxhFxWlEQsVRlz3upr8RI?=
 =?us-ascii?Q?b2f1DbOT8KR6zkWDo6UUtlsFrnwNTApYzzBKy4ZkzPLDOGL6OTBe+fVukW7l?=
 =?us-ascii?Q?hpjZvAZ2bWyFeOpIqGnvPaiu+MPkDCflSavOkgUg8IsKkPosHMsCXUa19QOW?=
 =?us-ascii?Q?bTcqu2EwyfGoVseYY1lRqijg0IVEjK+qlbcnPPnRZcFVmz2HMyvg6vEgpnHY?=
 =?us-ascii?Q?7NgEpdIiTnaMTi7NFhUZ3YitFxZFdCbUGXM150rvAcVXGPss12/Yo+PunlZO?=
 =?us-ascii?Q?mhk8fkHpoI8iK093F+GMEbaloCw5VRIoaZ/TBuSsyiXTEpRSxbsj32MgJtBq?=
 =?us-ascii?Q?fYQakRlBROosuLt8EeMU+uuevnU7w4WZcnmjI+LJ+owQ10l8/BiyUWcrVsL4?=
 =?us-ascii?Q?mbpSRzFHozy/9vP4f2LuOVJkkGykLDZMl4t4I0+OvtCfRmiTSNaSYJF0NE2c?=
 =?us-ascii?Q?jd+KZMvZaPNXMg21F3Mo+ojIjY3DqLNqYUnVI+K90AomQZ5Cg8UZKEuAVpjj?=
 =?us-ascii?Q?5p3MqAaHtNhwSzT0qI9U66e/1wxYIrTR9VzIm6GKCIqRB83eterL3L4FOmwI?=
 =?us-ascii?Q?7bnoTXB2NvDVr2CVz5yBoQ2RxJ+nWifls1OGKGG7pFSVJKQka1cnmTHC7jEj?=
 =?us-ascii?Q?YUscKQCNrRO7ThMVNysw7AtzkL5NsM7298zIdDfRqQwXmb5lcgKTaaq9NWCN?=
 =?us-ascii?Q?zR+Ma7K9ElBQSyo54ldeSqUODwVPHZ8Fj7AAa1lND5w7K4G/dYwpx0q0Tdgj?=
 =?us-ascii?Q?+TDMUqVCb4vFBCIrIv2Kw9HzIKAKCyf9L2IUN8BvMP3uQUvKuCpxX1i9j/bM?=
 =?us-ascii?Q?4+VZMZvp849+IjgF/C3tdwXrdFcmB8ABbE/0imwKWeWJnRkUYFY0s48KCCTc?=
 =?us-ascii?Q?i/bxZ7XOeZS3nGuMoEb27LmWOqpxxgZsidUPMl7TWbm+hWxzGJrlS09lxB5S?=
 =?us-ascii?Q?4P5WMMtdaciw5Ba+PvrnZTODzqTaAx0D7NjK0Y2W5pam+VZWqvytERjHcZBU?=
 =?us-ascii?Q?2qmtgMKQy2Uh8e7+2mZQXMOjS/nrKl5eRy1ADzYgfuJpCi+s7Gz21R33eACS?=
 =?us-ascii?Q?kAU4P7Z/VfTAQj+GhiK2Pkj5mlxtUnJ+udTG701UE3U7dYoGMVKCYA2uG07v?=
 =?us-ascii?Q?7aBHJSiAtYPQuaPvZZ8++Pa5z2I26N6+g0Kv0KN37QNmGdfXV5bVHItXC83z?=
 =?us-ascii?Q?dXM135F0hDoOXpA96Yi2nB9HXKpXWye5MPR25Xo9QRwASVPa9UkEnwK0jY/4?=
 =?us-ascii?Q?D3SqArAW4XXMRhgOB5IKCWOIQZM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:39:12.7597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6094c355-b0af-48e8-23c6-08de53592879
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra264. The number of pins
is slightly different, but the programming model remains the same.

Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
both of which are used in conjunction to create a unique specifier
for each pin.

Document nvidia,pmc property referencing the PMC node providing the
parent interrupt domain. GPIO driver uses this to select the correct
PMC,falling back to compatible-based lookup only if the phandle is
absent.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 10 +++
 include/dt-bindings/gpio/tegra264-gpio.h      | 61 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra264-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 2bd620a1099b..93150504c03c 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -86,6 +86,9 @@ properties:
       - nvidia,tegra234-gpio
       - nvidia,tegra234-gpio-aon
       - nvidia,tegra256-gpio
+      - nvidia,tegra264-gpio
+      - nvidia,tegra264-gpio-uphy
+      - nvidia,tegra264-gpio-aon
 
   reg-names:
     items:
@@ -110,6 +113,10 @@ properties:
       ports, in the order the HW manual describes them. The number of entries
       required varies depending on compatible value.
 
+  nvidia,pmc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the PMC node providing the parent interrupt domain.
+
   gpio-controller: true
 
   gpio-ranges:
@@ -157,6 +164,8 @@ allOf:
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
               - nvidia,tegra256-gpio
+              - nvidia,tegra264-gpio
+              - nvidia,tegra264-gpio-uphy
     then:
       properties:
         interrupts:
@@ -171,6 +180,7 @@ allOf:
               - nvidia,tegra186-gpio-aon
               - nvidia,tegra194-gpio-aon
               - nvidia,tegra234-gpio-aon
+              - nvidia,tegra264-gpio-aon
     then:
       properties:
         interrupts:
diff --git a/include/dt-bindings/gpio/tegra264-gpio.h b/include/dt-bindings/gpio/tegra264-gpio.h
new file mode 100644
index 000000000000..d7baceace474
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra264-gpio.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for binding nvidia,tegra264-gpio*.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA264_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA264_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA264_MAIN_GPIO_PORT_T  0
+#define TEGRA264_MAIN_GPIO_PORT_U  1
+#define TEGRA264_MAIN_GPIO_PORT_V  2
+#define TEGRA264_MAIN_GPIO_PORT_W  3
+#define TEGRA264_MAIN_GPIO_PORT_AL 4
+#define TEGRA264_MAIN_GPIO_PORT_Y  5
+#define TEGRA264_MAIN_GPIO_PORT_Z  6
+#define TEGRA264_MAIN_GPIO_PORT_X  7
+#define TEGRA264_MAIN_GPIO_PORT_H  8
+#define TEGRA264_MAIN_GPIO_PORT_J  9
+#define TEGRA264_MAIN_GPIO_PORT_K  10
+#define TEGRA264_MAIN_GPIO_PORT_L  11
+#define TEGRA264_MAIN_GPIO_PORT_M  12
+#define TEGRA264_MAIN_GPIO_PORT_P  13
+#define TEGRA264_MAIN_GPIO_PORT_Q  14
+#define TEGRA264_MAIN_GPIO_PORT_R  15
+#define TEGRA264_MAIN_GPIO_PORT_S  16
+#define TEGRA264_MAIN_GPIO_PORT_F  17
+#define TEGRA264_MAIN_GPIO_PORT_G  18
+
+#define TEGRA264_MAIN_GPIO(port, offset) \
+	((TEGRA264_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA264_AON_GPIO_PORT_AA  0
+#define TEGRA264_AON_GPIO_PORT_BB  1
+#define TEGRA264_AON_GPIO_PORT_CC  2
+#define TEGRA264_AON_GPIO_PORT_DD  3
+#define TEGRA264_AON_GPIO_PORT_EE  4
+
+#define TEGRA264_AON_GPIO(port, offset) \
+	((TEGRA264_AON_GPIO_PORT_##port * 8) + (offset))
+
+#define TEGRA264_UPHY_GPIO_PORT_A  0
+#define TEGRA264_UPHY_GPIO_PORT_B  1
+#define TEGRA264_UPHY_GPIO_PORT_C  2
+#define TEGRA264_UPHY_GPIO_PORT_D  3
+#define TEGRA264_UPHY_GPIO_PORT_E  4
+
+#define TEGRA264_UPHY_GPIO(port, offset) \
+	((TEGRA264_UPHY_GPIO_PORT_##port * 8) + (offset))
+
+#endif
-- 
2.25.1


