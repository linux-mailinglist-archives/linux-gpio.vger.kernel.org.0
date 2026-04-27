Return-Path: <linux-gpio+bounces-35568-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIPhBFxo72lZBAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35568-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:45:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51D473AAF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17DA4301F4AA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D613CC9EA;
	Mon, 27 Apr 2026 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rlz206P6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73C3BFE4F;
	Mon, 27 Apr 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297415; cv=fail; b=HXH33M6AD9aiXJ7MQrRdD+bsBOOx5N7FSgqjIeb32/6W/jzy2M+ARx44gsEGgPGkXE458o9f2Gh4xLKyt+zE6IhXSkH8/nnxS5aWTXySlJM7qg33XuugS71GQuB5CA6mdUvbqO3u1kYvX9KgqjMYab1wRB9Q+hdHLB/+yjktANg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297415; c=relaxed/simple;
	bh=0PZ9gAvIMMmwHnVWPLGCfSLwx5UZyPTZwdEQRXMN8A8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EWuUJM9bGKS6aC2hpgaA8y1sdZoYNN9iHPxwScVg/+KUA6/iJv/SXZIF0cUrhOFKmFY0IMC+Pc3r6n3OzWACaKrtVk2IMnPb7HzrhVPGjNvoEED4fzjXZi4nLeQGiVRmSF4iy4E3EhQmHDvh5j5gB8Qg8mMspipuIuApbLHVUAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rlz206P6; arc=fail smtp.client-ip=52.101.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dy601//AJOJnD7q/vDkKZpiIdq5OtQAuqUfAdXSkQBNucNjT1Tb0+zlF5asuIPWx80p3ZOZw+zDmKRHc8pY+LoP91Ljz9as0xzvn3QZ6t601uYaxrYLg9knXEHrOept8gccZtbng8oDrvUpkQkQWSKOYS/41G+i1fTLidSd+OCxGqYgF6CQ/ye9N/8VXtOateSLxlaQuLQDoJab3MOfb8IHlBIgdBsIPcG4swT5w+5HNJYGuuKrCCTMMCrXVaH5ywKPtawOZk23BAbnitT6i22gaaeJXD3peR2Feeqz+YPrkA7cFaX+u84MLA7hEVEr55+0jXUa1Oz3GQ7nHvWRr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=356uDeBkFGpyL7BfT58TimmJLnSW0AQDgUcDFdbhSFQ=;
 b=EKosH8V2A7Og+eaNLmGv5DZOf6dMzUhayqWb8TZlNqSd3vqLtyxgCK4RWh9yIlUglkdrcGliTE+pRFSisZnSIVmB/axvMpjAueRpfoGwAIT7yH5FYeRc1ERXpagescaKAnSmPG0MM9oIm8q8jeqpA7VjMx95AzuG06U1kNNkqQ2t12/i/W0Rugu0CyMToK1+k/lXojkLZuRf/aldPGXqxeieMprtATxPspokr4IJ56AErRgMypfoYEY8RTPC0d6krLqk77fMEmj90dXWQnEXy0icq/Y6CzRXeKCp5BXCzIhbGAg6XSB46On5F/xoUhk4u/Z8eOS8C0dkdoxVoEmgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=356uDeBkFGpyL7BfT58TimmJLnSW0AQDgUcDFdbhSFQ=;
 b=Rlz206P6H0DFPzJWsdj203Ar72b4U1rpKtM8XcRsj9h5dWh7H+M+oqxuB9g2xe6nnsjIg+Oh3oGMz7LRUGvKA8kt35zB8IhVJ30JuaXKWiW5rw7y9LweatuIe3nHm9zNjFq0r7S5jTbBgmURP9yNLcI087gkrOPuFyShsgl4usa1PR4XMZmqbghfWqcn947cmV9QRAJCOCIIfw+AaeJKnfUKvBFqJ/bQmc2dnake/NXdaCofrw1cJb6ssb0Kamn+5VSATu+fUzdvxroBWhm2psWp+XxxZAB7v6hzcGCUJQL3DfdqCbyY1zZrzSLkwrePPn/ZskFs0Ok25Pz8a/dsbw==
Received: from BY3PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:39a::15)
 by SA5PPF50009C446.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 13:43:22 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::ef) by BY3PR03CA0010.outlook.office365.com
 (2603:10b6:a03:39a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 13:43:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 13:43:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:43:00 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 06:42:59 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 27 Apr 2026 06:42:55 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <pshete@nvidia.com>,
	<jonathanh@nvidia.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <webgeek1234@gmail.com>, <rosenp@gmail.com>,
	<linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: pinctrl: Document Tegra238 pin controllers
Date: Mon, 27 Apr 2026 13:42:27 +0000
Message-ID: <20260427134231.531222-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427134231.531222-1-pshete@nvidia.com>
References: <20260427134231.531222-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SA5PPF50009C446:EE_
X-MS-Office365-Filtering-Correlation-Id: b782b8af-58e2-4b92-8d71-08dea462f223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|56012099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	PPxav0QvOxkCjGZ/s9G5ZnzAqhZR3Gm7/X3lFnNuayYR2U1k9rAKUMfgmorGVuVMGXc6RruBvdcSfDI8tAAJJd6PM/GIPnbblmUe9knJktOAEgCXXJc3VsKfP8Y4QMbhuS6Rr4kBPH1nKXTOrNhA1mq9RbvoDR0QJ+/iAQwGVhjDXGAXMyd/AIm/0si4NWdEEMZ1UiZFqFu9xpiOqzAmvPpyQxuOTa74gsDZwUVA7z3fVjwHECygPkGZyaPKMig6rGErJJn+0T1f8mFoKbKYZRUOMWe8Zf+XpUFJ2LeTDTDiOpR8dPcYRkDdTajO76+3srxT4STqcU44ojeoHnsSTFceRlGokmpTyrrhPEtpnD3a2BnlUdU6StnfIH1jy3Gw+mg4ClaGkxMBjumuc4YYIsOnXG/XX7b2ncTP+D5nKbiU8ZdzSws9n5xepcSQ6Xm4ZuZG+7+3PEmfInSLyNaUuNEAAALINP0uC15LcBlKgETYQBvBhBWWSmo+Ypo1Qywc0mMaC1k4et7WqkUrzTm4eAQBzmtKjhd/f4+UsJatvT97Ueoc4DRxSiiO87/mYfOaL/JgsGApUdyZnOCWWemPlRUmeD1drp7vV1IxTiTUb/mfJeGmmh2YOx0Y98tACSzFrXcL2h2TEfBCkoNforNw/LoDAmLFP9oKWUAUqh8dVX+Yw59F4T4oq4tDYAow+svyPx+PwuU8AwW64TElG0SRxpQK7Vmv8+RrZw779+SDFFwkCwmjsmNTXSPpJFF8iA9qKfkAr+z+PopkEAbZnQi7vQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(56012099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7ltoAnE12Lcfg+8KWkA0gr7Leihz4bI3xQUzV3dNPYZ9NAm1CzyaK7q9VSAIv58RM+SZkiMU9ZLakXxxHuMG9Xfl6HlZej5Wvngn69t2OyQdNg9moAnxHKHA+BUXRI/E/4cJNuiLthUzxS9ItBRn8xrl0+q+r56kOhaM6J4RnbAjWlWLLbvECKNjTQtQRNOw3xfR9QWNyXyxY9vSAWZLNiZKZTRbDdq+AhK1oJfxLV81V0SYM8m6WviEqdEqpqfqJdE2otTWaLH5sRo6BZ+5oMZTUybRIaEuK0lyK1p7UOBzvsKTCc68h7NWJCiVqIBjxN3MCRseqDat0AGyoARFgaX+nqxmZZGHfs28dKuKN6e63sBoBbVcvzRPs13qSdoTDza2EFWlMmYIOK0htPt6D+xNc+VQOFvxJy3Rj/auSS+RGDaSCadbk9abPUz2+HGJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 13:43:20.7910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b782b8af-58e2-4b92-8d71-08dea462f223
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446
X-Rspamd-Queue-Id: 6E51D473AAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35568-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.37.20.48:email,nvidia.com:mid,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,c300000:email,Nvidia.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

From: Prathamesh Shete <pshete@nvidia.com>

Tegra238 contains two pin controllers. Document their compatible strings
and describe the list of pins and functions that they provide.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v3:
  - Wrap commit message to 75 chars per line (v2 was too short).
Changes in v2:
  - Add a 'required:' block listing 'compatible' and 'reg'.
  - Switch top-level 'unevaluatedProperties: false' to
    'additionalProperties: false'.
---
 .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   |  82 +++++++
 .../nvidia,tegra238-pinmux-common.yaml        |  73 ++++++
 .../pinctrl/nvidia,tegra238-pinmux.yaml       | 219 ++++++++++++++++++
 3 files changed, 374 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
new file mode 100644
index 000000000000..ab9264d87c88
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra238-pinmux-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra238 AON Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra238-pinmux-aon
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra238-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ bootv_ctl_n_paa0, soc_gpio00_paa1, vcomp_alert_paa2,
+                    pwm1_paa3, batt_oc_paa4, soc_gpio04_paa5,
+                    soc_gpio25_paa6, soc_gpio26_paa7,
+                    hdmi_cec_pbb0,
+                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
+                    spi2_cs0_pcc3, spi2_cs1_pcc4, uart3_tx_pcc5,
+                    uart3_rx_pcc6, gen2_i2c_scl_pcc7,
+                    gen2_i2c_sda_pdd0, gen8_i2c_scl_pdd1,
+                    gen8_i2c_sda_pdd2, touch_clk_pdd3, dmic1_clk_pdd4,
+                    dmic1_dat_pdd5, soc_gpio19_pdd6, pwm2_pdd7,
+                    pwm3_pee0, pwm7_pee1,
+                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE)
+                    drive_bootv_ctl_n_paa0, drive_soc_gpio00_paa1,
+                    drive_vcomp_alert_paa2, drive_pwm1_paa3,
+                    drive_batt_oc_paa4, drive_soc_gpio04_paa5,
+                    drive_soc_gpio25_paa6, drive_soc_gpio26_paa7,
+                    drive_hdmi_cec_pbb0,
+                    drive_spi2_sck_pcc0, drive_spi2_miso_pcc1,
+                    drive_spi2_mosi_pcc2, drive_spi2_cs0_pcc3,
+                    drive_spi2_cs1_pcc4, drive_uart3_tx_pcc5,
+                    drive_uart3_rx_pcc6, drive_gen2_i2c_scl_pcc7,
+                    drive_gen2_i2c_sda_pdd0, drive_gen8_i2c_scl_pdd1,
+                    drive_gen8_i2c_sda_pdd2, drive_touch_clk_pdd3,
+                    drive_dmic1_clk_pdd4, drive_dmic1_dat_pdd5,
+                    drive_soc_gpio19_pdd6, drive_pwm2_pdd7,
+                    drive_pwm3_pee0, drive_pwm7_pee1 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@c300000 {
+      compatible = "nvidia,tegra238-pinmux-aon";
+      reg = <0x0c300000 0x4000>;
+
+      pinctrl-names = "cec";
+      pinctrl-0 = <&cec_state>;
+
+      cec_state: pinmux-cec {
+        cec {
+          nvidia,pins = "hdmi_cec_pbb0";
+          nvidia,function = "hdmi_cec";
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml
new file mode 100644
index 000000000000..5c7608981f2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra238-pinmux-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra238 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+$ref: nvidia,tegra-pinmux-common.yaml
+
+properties:
+  nvidia,function:
+    enum: [ dca_vsync, dca_hsync, displaya, rsvd0, i2c7_clk, i2c7_dat,
+            i2c4_dat, i2c4_clk, i2c9_dat, i2c9_clk, usb_vbus_en0,
+            usb_vbus_en1, spi3_din, spi1_cs0, spi3_cs0, spi1_din,
+            spi3_cs1, spi1_sck, spi3_sck, spi1_cs1, spi1_dout, spi3_dout,
+            gp_pwm5, gp_pwm6, extperiph2_clk, extperiph1_clk, i2c3_dat,
+            i2c3_clk, extperiph4_clk, extperiph3_clk, dmic2_dat,
+            dmic2_clk, uarta_cts, uarta_rts, uarta_rxd, uarta_txd,
+            i2c5_clk, i2c5_dat, uartd_cts, uartd_rts, uartd_rxd,
+            uartd_txd, i2c1_clk, i2c1_dat, sdmmc1_cd, i2s2_sclk,
+            i2s2_sdata_out, i2s2_sdata_in, i2s2_lrck, i2s4_sclk,
+            i2s4_sdata_out, i2s4_sdata_in, i2s4_lrck, i2s1_sclk,
+            i2s1_sdata_out, i2s1_sdata_in, i2s1_lrck, aud_mclk,
+            i2s3_lrck, i2s3_sclk, i2s3_sdata_in, i2s3_sdata_out,
+            pe2_clkreq_l, pe1_clkreq_l, pe1_rst_l, pe0_clkreq_l,
+            pe0_rst_l, pe2_rst_l, pe3_clkreq_l, pe3_rst_l,
+            dp_aux_ch0_hpd, qspi0_io0, qspi0_io1, qspi0_sck, qspi0_cs_n,
+            uartg_cts, uartg_rts, uartg_txd, uartg_rxd, sdmmc1_clk,
+            sdmmc1_cmd, sdmmc1_comp, sdmmc1_dat3, sdmmc1_dat2,
+            sdmmc1_dat1, sdmmc1_dat0, ufs0, soc_therm_oc1, hdmi_cec,
+            gp_pwm4, uartc_rxd, uartc_txd, i2c8_dat, i2c8_clk,
+            spi2_dout, i2c2_clk, spi2_cs0, i2c2_dat, spi2_sck, spi2_din,
+            ppc_mode_1, ppc_ready, ppc_mode_2, ppc_cc, ppc_mode_0,
+            ppc_int_n, uarte_txd, uarte_rxd, uartb_txd, uartb_rxd,
+            uartb_cts, uartb_rts, uarte_cts, uarte_rts, gp_pwm7,
+            gp_pwm2, gp_pwm3, gp_pwm1, spi2_cs1, dmic1_clk, dmic1_dat,
+            rsvd1, dcb_hsync, dcb_vsync, soc_therm_oc4, gp_pwm8,
+            nv_therm_fan_tach0, wdt_reset_outa, ccla_la_trigger_mux,
+            dspk1_dat, dspk1_clk, nv_therm_fan_tach1, dspk0_dat,
+            dspk0_clk, i2s5_sclk, i2s6_lrck, i2s6_sdata_in, i2s6_sclk,
+            i2s6_sdata_out, i2s5_lrck, i2s5_sdata_out, i2s5_sdata_in,
+            sdmmc1_pe3_rst_l, sdmmc1_pe3_clkreq_l, touch_clk,
+            ppc_i2c_dat, wdt_reset_outb, spi5_cs1, ppc_rst_n,
+            ppc_i2c_clk, spi4_cs1, soc_therm_oc3, spi5_sck, spi5_miso,
+            spi4_sck, spi4_miso, spi4_cs0, spi4_mosi, spi5_cs0,
+            spi5_mosi, led_blink, rsvd2, dmic3_clk, dmic3_dat,
+            dmic4_clk, dmic4_dat, tsc_edge_out0, tsc_edge_out3,
+            tsc_edge_out1, tsc_edge_out2, dmic5_clk, dmic5_dat, rsvd3,
+            sdmmc1_wp, tsc_edge_out0a, tsc_edge_out0d, tsc_edge_out0b,
+            tsc_edge_out0c, soc_therm_oc2 ]
+
+  # out of the common properties, only these are allowed for Tegra238
+  nvidia,pins: true
+  nvidia,pull: true
+  nvidia,tristate: true
+  nvidia,schmitt: true
+  nvidia,enable-input: true
+  nvidia,open-drain: true
+  nvidia,lock: true
+  nvidia,drive-type: true
+  nvidia,io-hv: true
+
+required:
+  - nvidia,pins
+
+additionalProperties: false
+
+...
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml
new file mode 100644
index 000000000000..92d276634d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra238-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra238 Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra238-pinmux
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^pinmux(-[a-z0-9-]+)?$":
+    type: object
+
+    # pin groups
+    additionalProperties:
+      $ref: nvidia,tegra238-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ gpu_pwr_req_pa0, gp_pwm5_pa1, gp_pwm6_pa2, spi3_sck_pa3,
+                    spi3_miso_pa4, spi3_mosi_pa5, spi3_cs0_pa6, spi3_cs1_pa7,
+                    spi1_sck_pb0, spi1_miso_pb1, spi1_mosi_pb2, spi1_cs0_pb3,
+                    spi1_cs1_pb4, pwr_i2c_scl_pc0, pwr_i2c_sda_pc1,
+                    extperiph1_clk_pc2, extperiph2_clk_pc3, cam_i2c_scl_pc4,
+                    cam_i2c_sda_pc5, soc_gpio23_pc6, soc_gpio24_pc7,
+                    soc_gpio27_pd0, soc_gpio55_pd1, soc_gpio29_pd2,
+                    soc_gpio33_pd3, soc_gpio32_pd4, soc_gpio35_pd5,
+                    soc_gpio37_pd6, soc_gpio56_pd7, uart1_tx_pe0,
+                    uart1_rx_pe1, uart1_rts_pe2, uart1_cts_pe3,
+                    soc_gpio13_pf0, soc_gpio14_pf1, soc_gpio15_pf2,
+                    soc_gpio16_pf3, soc_gpio17_pf4, soc_gpio18_pf5,
+                    soc_gpio20_pf6, soc_gpio21_pf7, soc_gpio22_pg0,
+                    soc_gpio06_pg1, uart4_tx_pg2, uart4_rx_pg3,
+                    uart4_rts_pg4, uart4_cts_pg5, soc_gpio41_pg6,
+                    soc_gpio42_pg7, soc_gpio43_ph0, soc_gpio44_ph1,
+                    gen1_i2c_scl_ph2, gen1_i2c_sda_ph3, cpu_pwr_req_ph4,
+                    soc_gpio07_ph5, dap3_clk_pj0, dap3_dout_pj1,
+                    dap3_din_pj2, dap3_fs_pj3, soc_gpio57_pj4,
+                    soc_gpio58_pj5, soc_gpio59_pj6, soc_gpio60_pj7,
+                    soc_gpio45_pk0, soc_gpio46_pk1, soc_gpio47_pk2,
+                    soc_gpio48_pk3, qspi0_sck_pl0, qspi0_io0_pl1,
+                    qspi0_io1_pl2, qspi0_cs_n_pl3, soc_gpio152_pl4,
+                    soc_gpio153_pl5, soc_gpio154_pl6, soc_gpio155_pl7,
+                    soc_gpio156_pm0, soc_gpio157_pm1, soc_gpio158_pm2,
+                    soc_gpio159_pm3, soc_gpio160_pm4, soc_gpio161_pm5,
+                    soc_gpio162_pm6, uart7_tx_pm7, uart7_rx_pn0,
+                    uart7_rts_pn1, uart7_cts_pn2, soc_gpio167_pp0,
+                    soc_gpio168_pp1, soc_gpio169_pp2, soc_gpio170_pp3,
+                    dap4_sclk_pp4, dap4_dout_pp5, dap4_din_pp6, dap4_fs_pp7,
+                    soc_gpio171_pq0, soc_gpio172_pq1, soc_gpio173_pq2,
+                    soc_gpio61_pr0, soc_gpio62_pr1, soc_gpio63_pr2,
+                    soc_gpio64_pr3, soc_gpio65_pr4, soc_gpio66_pr5,
+                    soc_gpio67_pr6, soc_gpio68_pr7, gen4_i2c_scl_ps0,
+                    gen4_i2c_sda_ps1, soc_gpio75_ps2, gen7_i2c_scl_ps3,
+                    gen7_i2c_sda_ps4, soc_gpio78_ps5, gen9_i2c_scl_ps6,
+                    gen9_i2c_sda_ps7, soc_gpio81_pt0, soc_gpio36_pt1,
+                    soc_gpio53_pt2, soc_gpio38_pt3, soc_gpio40_pt4,
+                    soc_gpio34_pt5, usb_vbus_en0_pt6, usb_vbus_en1_pt7,
+                    sdmmc1_clk_pu0, sdmmc1_cmd_pu1, sdmmc1_dat0_pu2,
+                    sdmmc1_dat1_pu3, sdmmc1_dat2_pu4, sdmmc1_dat3_pu5,
+                    ufs0_ref_clk_pv0, ufs0_rst_n_pv1, pex_l0_clkreq_n_pw0,
+                    pex_l0_rst_n_pw1, pex_l1_clkreq_n_pw2,
+                    pex_l1_rst_n_pw3, pex_l2_clkreq_n_pw4,
+                    pex_l2_rst_n_pw5, pex_l3_clkreq_n_pw6,
+                    pex_l3_rst_n_pw7, pex_wake_n_px0, dp_aux_ch0_hpd_px1,
+                    bootv_ctl_n_paa0, soc_gpio00_paa1, vcomp_alert_paa2,
+                    pwm1_paa3, batt_oc_paa4, soc_gpio04_paa5,
+                    soc_gpio25_paa6, soc_gpio26_paa7, hdmi_cec_pbb0,
+                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
+                    spi2_cs0_pcc3, spi2_cs1_pcc4, uart3_tx_pcc5,
+                    uart3_rx_pcc6, gen2_i2c_scl_pcc7, gen2_i2c_sda_pdd0,
+                    gen8_i2c_scl_pdd1, gen8_i2c_sda_pdd2, touch_clk_pdd3,
+                    dmic1_clk_pdd4, dmic1_dat_pdd5, soc_gpio19_pdd6,
+                    pwm2_pdd7, pwm3_pee0, pwm7_pee1, soc_gpio49_pee2,
+                    soc_gpio82_pee3, soc_gpio50_pee4, soc_gpio83_pee5,
+                    soc_gpio69_pff0, soc_gpio70_pff1, soc_gpio71_pff2,
+                    soc_gpio72_pff3, soc_gpio73_pff4, soc_gpio74_pff5,
+                    soc_gpio80_pff6, soc_gpio76_pff7, soc_gpio77_pgg0,
+                    soc_gpio84_pgg1, uart2_tx_pgg2, uart2_rx_pgg3,
+                    uart2_rts_pgg4, uart2_cts_pgg5, soc_gpio85_pgg6,
+                    uart5_tx_pgg7, uart5_rx_phh0, uart5_rts_phh1,
+                    uart5_cts_phh2, soc_gpio86_phh3, sdmmc1_comp,
+                    # drive groups
+                    drive_soc_gpio36_pt1, drive_soc_gpio53_pt2,
+                    drive_soc_gpio38_pt3, drive_soc_gpio40_pt4,
+                    drive_soc_gpio75_ps2, drive_soc_gpio81_pt0,
+                    drive_soc_gpio78_ps5, drive_soc_gpio34_pt5,
+                    drive_gen7_i2c_scl_ps3, drive_gen7_i2c_sda_ps4,
+                    drive_gen4_i2c_sda_ps1, drive_gen4_i2c_scl_ps0,
+                    drive_gen9_i2c_sda_ps7, drive_gen9_i2c_scl_ps6,
+                    drive_usb_vbus_en0_pt6, drive_usb_vbus_en1_pt7,
+                    drive_soc_gpio61_pr0, drive_soc_gpio62_pr1,
+                    drive_soc_gpio63_pr2, drive_soc_gpio64_pr3,
+                    drive_soc_gpio65_pr4, drive_soc_gpio66_pr5,
+                    drive_soc_gpio67_pr6, drive_soc_gpio68_pr7,
+                    drive_spi3_miso_pa4, drive_spi1_cs0_pb3,
+                    drive_spi3_cs0_pa6, drive_spi1_miso_pb1,
+                    drive_spi3_cs1_pa7, drive_spi1_sck_pb0,
+                    drive_spi3_sck_pa3, drive_spi1_cs1_pb4,
+                    drive_spi1_mosi_pb2, drive_spi3_mosi_pa5,
+                    drive_gpu_pwr_req_pa0, drive_gp_pwm5_pa1,
+                    drive_gp_pwm6_pa2, drive_extperiph2_clk_pc3,
+                    drive_extperiph1_clk_pc2, drive_cam_i2c_sda_pc5,
+                    drive_cam_i2c_scl_pc4, drive_soc_gpio23_pc6,
+                    drive_soc_gpio24_pc7, drive_soc_gpio27_pd0,
+                    drive_soc_gpio29_pd2, drive_soc_gpio32_pd4,
+                    drive_soc_gpio33_pd3, drive_soc_gpio35_pd5,
+                    drive_soc_gpio37_pd6, drive_soc_gpio56_pd7,
+                    drive_soc_gpio55_pd1, drive_uart1_cts_pe3,
+                    drive_uart1_rts_pe2, drive_uart1_rx_pe1,
+                    drive_uart1_tx_pe0, drive_pwr_i2c_scl_pc0,
+                    drive_pwr_i2c_sda_pc1, drive_cpu_pwr_req_ph4,
+                    drive_uart4_cts_pg5, drive_uart4_rts_pg4,
+                    drive_uart4_rx_pg3, drive_uart4_tx_pg2,
+                    drive_gen1_i2c_scl_ph2, drive_gen1_i2c_sda_ph3,
+                    drive_soc_gpio20_pf6, drive_soc_gpio21_pf7,
+                    drive_soc_gpio22_pg0, drive_soc_gpio13_pf0,
+                    drive_soc_gpio14_pf1, drive_soc_gpio15_pf2,
+                    drive_soc_gpio16_pf3, drive_soc_gpio17_pf4,
+                    drive_soc_gpio18_pf5, drive_soc_gpio41_pg6,
+                    drive_soc_gpio42_pg7, drive_soc_gpio43_ph0,
+                    drive_soc_gpio44_ph1, drive_soc_gpio06_pg1,
+                    drive_soc_gpio07_ph5, drive_dap4_sclk_pp4,
+                    drive_dap4_dout_pp5, drive_dap4_din_pp6,
+                    drive_dap4_fs_pp7, drive_soc_gpio167_pp0,
+                    drive_soc_gpio168_pp1, drive_soc_gpio169_pp2,
+                    drive_soc_gpio170_pp3, drive_soc_gpio171_pq0,
+                    drive_soc_gpio172_pq1, drive_soc_gpio173_pq2,
+                    drive_soc_gpio45_pk0, drive_soc_gpio46_pk1,
+                    drive_soc_gpio47_pk2, drive_soc_gpio48_pk3,
+                    drive_soc_gpio57_pj4, drive_soc_gpio58_pj5,
+                    drive_soc_gpio59_pj6, drive_soc_gpio60_pj7,
+                    drive_dap3_fs_pj3, drive_dap3_clk_pj0,
+                    drive_dap3_din_pj2, drive_dap3_dout_pj1,
+                    drive_pex_l2_clkreq_n_pw4, drive_pex_wake_n_px0,
+                    drive_pex_l1_clkreq_n_pw2, drive_pex_l1_rst_n_pw3,
+                    drive_pex_l0_clkreq_n_pw0, drive_pex_l0_rst_n_pw1,
+                    drive_pex_l2_rst_n_pw5, drive_pex_l3_clkreq_n_pw6,
+                    drive_pex_l3_rst_n_pw7, drive_dp_aux_ch0_hpd_px1,
+                    drive_qspi0_io0_pl1, drive_qspi0_io1_pl2,
+                    drive_qspi0_sck_pl0, drive_qspi0_cs_n_pl3,
+                    drive_soc_gpio156_pm0, drive_soc_gpio155_pl7,
+                    drive_soc_gpio160_pm4, drive_soc_gpio154_pl6,
+                    drive_soc_gpio152_pl4, drive_soc_gpio153_pl5,
+                    drive_soc_gpio161_pm5, drive_soc_gpio162_pm6,
+                    drive_soc_gpio159_pm3, drive_soc_gpio157_pm1,
+                    drive_soc_gpio158_pm2, drive_uart7_cts_pn2,
+                    drive_uart7_rts_pn1, drive_uart7_tx_pm7,
+                    drive_uart7_rx_pn0, drive_sdmmc1_clk_pu0,
+                    drive_sdmmc1_cmd_pu1, drive_sdmmc1_dat3_pu5,
+                    drive_sdmmc1_dat2_pu4, drive_sdmmc1_dat1_pu3,
+                    drive_sdmmc1_dat0_pu2, drive_ufs0_rst_n_pv1,
+                    drive_ufs0_ref_clk_pv0, drive_batt_oc_paa4,
+                    drive_bootv_ctl_n_paa0, drive_vcomp_alert_paa2,
+                    drive_hdmi_cec_pbb0, drive_touch_clk_pdd3,
+                    drive_uart3_rx_pcc6, drive_uart3_tx_pcc5,
+                    drive_gen8_i2c_sda_pdd2, drive_gen8_i2c_scl_pdd1,
+                    drive_spi2_mosi_pcc2, drive_gen2_i2c_scl_pcc7,
+                    drive_spi2_cs0_pcc3, drive_gen2_i2c_sda_pdd0,
+                    drive_spi2_sck_pcc0, drive_spi2_miso_pcc1,
+                    drive_soc_gpio49_pee2, drive_soc_gpio50_pee4,
+                    drive_soc_gpio82_pee3, drive_soc_gpio71_pff2,
+                    drive_soc_gpio76_pff7, drive_soc_gpio74_pff5,
+                    drive_soc_gpio00_paa1, drive_soc_gpio19_pdd6,
+                    drive_soc_gpio86_phh3, drive_soc_gpio72_pff3,
+                    drive_soc_gpio77_pgg0, drive_soc_gpio80_pff6,
+                    drive_soc_gpio84_pgg1, drive_soc_gpio83_pee5,
+                    drive_soc_gpio73_pff4, drive_soc_gpio70_pff1,
+                    drive_soc_gpio04_paa5, drive_soc_gpio85_pgg6,
+                    drive_soc_gpio69_pff0, drive_soc_gpio25_paa6,
+                    drive_soc_gpio26_paa7, drive_uart5_tx_pgg7,
+                    drive_uart5_rx_phh0, drive_uart2_tx_pgg2,
+                    drive_uart2_rx_pgg3, drive_uart2_cts_pgg5,
+                    drive_uart2_rts_pgg4, drive_uart5_cts_phh2,
+                    drive_uart5_rts_phh1, drive_pwm7_pee1,
+                    drive_pwm2_pdd7, drive_pwm3_pee0, drive_pwm1_paa3,
+                    drive_spi2_cs1_pcc4, drive_dmic1_clk_pdd4,
+                    drive_dmic1_dat_pdd5, drive_sdmmc1_comp ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-tegra.h>
+
+    pinmux@2430000 {
+        compatible = "nvidia,tegra238-pinmux";
+        reg = <0x2430000 0x17000>;
+
+        pinctrl-names = "pex_rst";
+        pinctrl-0 = <&pex_rst_c5_out_state>;
+
+        pex_rst_c5_out_state: pinmux-pex-rst-c5-out {
+            pexrst {
+                nvidia,pins = "pex_l3_rst_n_pw7";
+                nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+                nvidia,io-hv = <TEGRA_PIN_ENABLE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+            };
+        };
+    };
+...
-- 
2.43.0


