Return-Path: <linux-gpio+bounces-36844-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCi2E8/EBWrDbAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36844-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:49:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF52541E81
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57E9E3023060
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5B13630A4;
	Thu, 14 May 2026 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ocYxtk8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937B22068D;
	Thu, 14 May 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762955; cv=fail; b=p1qIyJOQjj5+NrHAMcEAvKmIYzCdaVM+9vJIH4ISCHM+ahz9bp0EGffryx5c9yzu+jza0T0FtA2wjg5FkmWSkwvcShfs6WA4f4uMBvd8q8ieQtkCtrABZkDCnHQBjft/J1Jfq5jSfyQ/Uzp++3GTHOmFUrLH21xsCSeUNeYRT5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762955; c=relaxed/simple;
	bh=lWaIiZ16+Irk3FCmiYso28au8ssM+SoZrsopXbsaDBk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tcP+68VUOc/uDVjFQmTkY/ozW6tdrqsiVPa2r/6m97pbD6czg1CvWaY74x2x6r6/7M/cVROaX1WCv7LSHrcy+zO0s/H6Y1xL1SLfoS4KiYTTgC5kxtKmMAj0MpU3mXm7PwjJbE+tTPG8cw8g2/HR93fkyCp7P5R1JjbXtSCaAe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ocYxtk8S; arc=fail smtp.client-ip=52.101.53.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6aeOrAnZMDYAQ3WIMZMXKG0zBVkGQhPfivmIC73bpl+ewno+9mcnj/dLUcIqJAAfyFWF/XAJ0ywlFMi9ZO+La8QeMaLwQ5bOSSVZrZthR6X7Qo9NcBeo3+/hmPK8gDJ7TdVjFYq2bQakun1ah00/NoXjqSIlcMO6hgZFytwKrmMID0/9m50WZcldS+YWWvUJJd3uNkkTARhq3Wpsh3cFynk+x/E080LTualKb0jutKYDKP/dNxxf7vWCIvEcmERMcReUmaTsI/72ZvzqBYDI6OiFPu6iT9ZjoKy8zycOMyAKTLMSyzpEpEaT4+1+ojPnNyXTWtbbsz/3KueIqiakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSTfPlQ9FQwAulzXu3MnTyRMptjJl9qLqldiQfxMbtI=;
 b=QD8HAthueNTHYN8iyUvNfqI+me2MlfySoJdno0Uhngt9K4mSVVRzXobUpLn9piTJaf/OY9XrES6J37V5DS7ZKk8kJoPR9Ymr3p8J6ItI6q9XgdG6osgahXSmjwN0LLO4anfbCa/st1w986GhqnNhdptE3xTL8KbPbCTptyJHCD8MPOAMMHnzXdKq6Uk4Z5V5OS6ybfOPPTvEqRdTgaFgqQ2kmChJJ3ERnuvzWz+TtvMTF+uT3sqAiFG97JKYKUnL9D7jlL2nQDrMif7ptMsJKXPpEDsS4EbDkGA2NCW4G5uUQpS6B3I8cRQk861uSdOUNQeUwNiWRpZM2CgpdTE4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSTfPlQ9FQwAulzXu3MnTyRMptjJl9qLqldiQfxMbtI=;
 b=ocYxtk8SUQuBqEc0YmtaF16OfIm59GcYeHdiLZapkwYfup9GwVgqvBOhACdc5IvGo+1bpXvt4pyjQq76BtYu9LGcisgDjhoZ7DGmTS5pslaVq5wC7Rv8Ikzl7C01Nffy2uaA5RnAD9TZ+6jAKT0TVIr7hgn68MBfHFqD1JC7HTrFcdgYg0JkydoY5gT4BK5qJ00aIsqpaMzvs0plbzJsmhUXLiibjZGuVKtG+JXMWFdr4nTWN0folTrbrEuvwVs9WvlryVZ/ZS5zQIRmOw26eeUfgfYejk7xea/6VyJ9RQCOYsryIl/MajScejvn32wubESK/Qrafc1cBxaP1Bbhzw==
Received: from BY5PR17CA0040.namprd17.prod.outlook.com (2603:10b6:a03:167::17)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 12:49:07 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::f5) by BY5PR17CA0040.outlook.office365.com
 (2603:10b6:a03:167::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 12:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 12:49:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 14 May
 2026 05:48:50 -0700
Received: from build-pshete-focal-20260330.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 14 May 2026 05:48:49 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: gpio: Add Tegra238 support
Date: Thu, 14 May 2026 12:48:34 +0000
Message-ID: <20260514124835.108532-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f148728-f18a-4171-9e45-08deb1b72fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lruy8PG7GyKDKiuLnxrZdpPC/kyHQuk8x9Fzl2i2MwJiXQydeD0Dg9IzHMmu/zOp5kSdU6xrI7HPfH5KipBe/2ROBJC9dz3ZiOnBrYbk9Rl9/HhsavJHs6FW/Ryh3AQEO5bV/y7sZVH2Ba9eP9qNaylUTL9enNylGC0SOYvJ0xiVx358MpjB3Jcd2CUFM1cPCj1Iu2WjUpoLgOXa7XKK4vtdjJAE5qZFF5QDKsh84awuEzpVWXmswUEk14XvQGZ8ogHD1yBQVciLJ62lm95jhAIS3IgUUM+z9/IeMNZ8Vu0MUy8XQjBSc5YlNZ7a2C3B4WMGsS9JmWeGp/D27eDvJFgLOFA9zeNiRGOXZ+uIwbRl0a01zHEfxU2Lmzq8dF7L7FsapQ9m5WUxqkhOl2ObUt0387u7/ifXd18778B9vWRA7AF81zz56TVlqqiqi4TyC1RwTAptQsUqt5aTxCac1b5uVZtcwiNxCTYYuSuWjFTjG0klMTBitT8VRN/O+DrIO7fyMf4lbbpJ+2zARuV9c1dB52xQ2j6yqv104jfv986GPCv634HtEe8B+Pt3KZMD8uIPY0fHOhQdoWoKJm68bgTPs3r/2gUzkdLMnjdcvjkPxxqZOlMdS3lmQvdQmlavh2OVPBBbM6q20x4twIxX8PWXgxpVSZuYiW5FnsavIdVKOib0ibUrGXo0oy7V8rOH1FGIPp5qm0cesnRemaLtn5tUW5cpVedBHdnOQqTdIVk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Rw212EpI/8jjVTlLeMbKrmuA4ZOETv3jzGQdOmqCCxoSmnx+rUfBeHvtWmFnXo+kydtwFIuF09gQlbwXKEvZbVD7bqqZWjCZMu8J5uzha+aV8QNyoaMmuM02/HL1rHHzO4ft0ETH7WiQYZOi3er2OgtfWkBuGEWDQQ3pbHMW9IusMh/57z/f5gA963BwuWIq7Ce5Dg/ho18fbHb4bVKkXE1Ow9HLwQWoZ8LlmwDNxqd8tgFJkOi0N8oIb9+7h243tusWJ2SIWZ/7bWdQ6HeJswX7CMQ2yTKyBKHU1DoAcmWVAtifJw24WVQJA6isDHI265W/A89MGuxXKj//tL0rWUGEWXshZtSxaILHVNuvpzHzE0Da7pZxfv3rHMNRctH37btfc04miKTMizhIGP/bziOxF91/vOeN4DgsR4qtLPKu83VO5JG+G2tiyyp7HSw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 12:49:07.1887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f148728-f18a-4171-9e45-08deb1b72fcd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133
X-Rspamd-Queue-Id: CCF52541E81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36844-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controllers found on Tegra238. Tegra238 has two
GPIO controllers: the main controller and always-on (AON) controller.
The number of pins is slightly different, but the programming model
remains the same.

Add a new header, include/dt-bindings/gpio/nvidia,tegra238-gpio.h,
that defines port IDs as well as the TEGRA238_MAIN_GPIO() helper,
both of which are used in conjunction to create a unique specifier
for each pin.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  6 ++
 .../dt-bindings/gpio/nvidia,tegra238-gpio.h   | 58 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra238-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 17748dd1015d..adeb3b3a2902 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -85,6 +85,8 @@ properties:
       - nvidia,tegra194-gpio-aon
       - nvidia,tegra234-gpio
       - nvidia,tegra234-gpio-aon
+      - nvidia,tegra238-gpio
+      - nvidia,tegra238-gpio-aon
       - nvidia,tegra256-gpio
       - nvidia,tegra264-gpio
       - nvidia,tegra264-gpio-uphy
@@ -163,6 +165,7 @@ allOf:
               - nvidia,tegra186-gpio
               - nvidia,tegra194-gpio
               - nvidia,tegra234-gpio
+              - nvidia,tegra238-gpio
               - nvidia,tegra256-gpio
               - nvidia,tegra264-gpio
               - nvidia,tegra264-gpio-uphy
@@ -180,6 +183,7 @@ allOf:
               - nvidia,tegra186-gpio-aon
               - nvidia,tegra194-gpio-aon
               - nvidia,tegra234-gpio-aon
+              - nvidia,tegra238-gpio-aon
               - nvidia,tegra264-gpio-aon
     then:
       properties:
@@ -192,6 +196,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - nvidia,tegra238-gpio
+              - nvidia,tegra238-gpio-aon
               - nvidia,tegra264-gpio
               - nvidia,tegra264-gpio-uphy
               - nvidia,tegra264-gpio-aon
diff --git a/include/dt-bindings/gpio/nvidia,tegra238-gpio.h b/include/dt-bindings/gpio/nvidia,tegra238-gpio.h
new file mode 100644
index 000000000000..8a616a1df54c
--- /dev/null
+++ b/include/dt-bindings/gpio/nvidia,tegra238-gpio.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for binding nvidia,tegra238-gpio*.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA238_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA238_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA238_MAIN_GPIO_PORT_A   0
+#define TEGRA238_MAIN_GPIO_PORT_B   1
+#define TEGRA238_MAIN_GPIO_PORT_C   2
+#define TEGRA238_MAIN_GPIO_PORT_D   3
+#define TEGRA238_MAIN_GPIO_PORT_E   4
+#define TEGRA238_MAIN_GPIO_PORT_F   5
+#define TEGRA238_MAIN_GPIO_PORT_G   6
+#define TEGRA238_MAIN_GPIO_PORT_H   7
+#define TEGRA238_MAIN_GPIO_PORT_J   8
+#define TEGRA238_MAIN_GPIO_PORT_K   9
+#define TEGRA238_MAIN_GPIO_PORT_L  10
+#define TEGRA238_MAIN_GPIO_PORT_M  11
+#define TEGRA238_MAIN_GPIO_PORT_N  12
+#define TEGRA238_MAIN_GPIO_PORT_P  13
+#define TEGRA238_MAIN_GPIO_PORT_Q  14
+#define TEGRA238_MAIN_GPIO_PORT_R  15
+#define TEGRA238_MAIN_GPIO_PORT_S  16
+#define TEGRA238_MAIN_GPIO_PORT_T  17
+#define TEGRA238_MAIN_GPIO_PORT_U  18
+#define TEGRA238_MAIN_GPIO_PORT_V  19
+#define TEGRA238_MAIN_GPIO_PORT_W  20
+#define TEGRA238_MAIN_GPIO_PORT_X  21
+
+#define TEGRA238_MAIN_GPIO(port, offset) \
+	((TEGRA238_MAIN_GPIO_PORT_##port * 8) + (offset))
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA238_AON_GPIO_PORT_AA 0
+#define TEGRA238_AON_GPIO_PORT_BB 1
+#define TEGRA238_AON_GPIO_PORT_CC 2
+#define TEGRA238_AON_GPIO_PORT_DD 3
+#define TEGRA238_AON_GPIO_PORT_EE 4
+#define TEGRA238_AON_GPIO_PORT_FF 5
+#define TEGRA238_AON_GPIO_PORT_GG 6
+#define TEGRA238_AON_GPIO_PORT_HH 7
+
+#define TEGRA238_AON_GPIO(port, offset) \
+	((TEGRA238_AON_GPIO_PORT_##port * 8) + (offset))
+
+#endif
-- 
2.25.1


