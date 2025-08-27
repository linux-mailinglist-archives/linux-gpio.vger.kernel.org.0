Return-Path: <linux-gpio+bounces-25012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E2B37843
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5701B23A3C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094092F0671;
	Wed, 27 Aug 2025 02:42:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022113.outbound.protection.outlook.com [52.101.126.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055E29ACD1;
	Wed, 27 Aug 2025 02:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756262554; cv=fail; b=JDTjhJ5RG0akGM/4Qhadgz26WhUc64oVM6X3eZGBblEsUBFiqa1K5ADNWe7jqstXCNdCgrUU1f6lT7CvD7Yz4bliTCsP6nmnrnNMgj9oINpRj+6WtJxsdXPRaHLXK74raXjMmopd1E1Vgl7fYfU6GueQqijLyhW8JyLMwNYaSv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756262554; c=relaxed/simple;
	bh=oi20nMqyZNsO1bLNlF4jYBZffCSVLHT1eE85MVken1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjlCTYSrJ/3Rix6Td0P1gqd3JMTM/QCbzzNDecocIYkhj7pM108eD7uA1VWnXLiNs6prvrbO7hVyH8/baTQEKewf9z/h022buSuYhpPjvwCo8gQA4ZS/t9vF5au1B54bQMA4xdLm3tlR24WzLdulcXgkkRkmGRFDxb0dk0ZSWSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBv88v+6P1tBenmfJ1HJKkmVhA+UmRhe1x9dkcMJx9zRfaGZl5BA6Xt4DDYg/AWClxsrckCi843/cRy2LmJEqGSOXz7Uv/Vv4yaeSdTEDNn+SjvQPP1YbjlQ5LkzVAARNtAXzZEbq6s3LCD6D8XR5TIT3JZBN2QlWD7hMQYTYXH8yW1WnBuYKr9Nfp7my9FrFO2bfnFqlSFE4wTvkYEXEE4uqgvgE7Ho5cKpfUqEKfJVO0xJFect5aGnxZBAb0x0VDL9gtkKpCW2tDH4HUmI2K02nelsWuNuC8lY1wXFkVJCPGLITEeMCRrxZp6lb9MbEkDD7fHsqsdJUvKz707qQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf3KUvOSFlPbGdChNbA1Y2Aooi5xt2KK2qlKIMlcfi4=;
 b=uk3fANOgL0ieenUTjFg3mrQ+TDZbVJLU+i0Cr/PaPID3us90mjuQPVULB9E3rW1EECsKI2kD9uGP9KJh8b1pr9HWwGSo6HPPgbTK9x5pWowWHZf5Z8g1qr826yCOclMsIzYofKuX8pCe2Ddj/L5KV5Ir9qrJ8JigrW66v2SUsWzaXpVvp2+HTlqwNDV/PxBX2eMyipiE9fCHZ3cHZY6/uyz/CBPr6c3YFqn5gICV27ry0hB/OGXJpeqXQPpt3NIuHbEzcuUm2xqkcI2QYvIETD57aTlZ7QqEknMRm9cxPeauoF4WrXwhByevCEDWpDctGU99uPncItJoGUBwgf7Kkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096::14) by
 KL1PR06MB6109.apcprd06.prod.outlook.com (2603:1096:820:d1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.15; Wed, 27 Aug 2025 02:42:25 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096::cafe:0:0:32) by SG2P153CA0004.outlook.office365.com
 (2603:1096::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.6 via Frontend Transport; Wed,
 27 Aug 2025 02:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 02:42:24 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0ED2E41C014A;
	Wed, 27 Aug 2025 10:42:23 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Date: Wed, 27 Aug 2025 10:42:21 +0800
Message-ID: <20250827024222.588082-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250827024222.588082-1-gary.yang@cixtech.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|KL1PR06MB6109:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a5b9731-7337-462a-a7ac-08dde5135aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d1l9j+1mlETY8/pO8Dl9cIsp1O7jco0Y64OOiRVe22XUnj4fn+VsdMljEZnG?=
 =?us-ascii?Q?VupsjlArYsKaGLeh4UYh7z/7fokUVK8bSYdV96a00wLPT1k5NritfAXuNCuc?=
 =?us-ascii?Q?vUv87R7lAVXVnxwPAYqluPyFbEQeyc7RCK+LIUKIqu11T7C9Wk+ifIWmS3iR?=
 =?us-ascii?Q?Ewe26cXHzbZ7HDmnurUnOBrrocOb0r5DaRrdXNUlmuZH2QuUiM8gb9VAUPbB?=
 =?us-ascii?Q?lvhzvv2LtudEhf7gOwM2sW5iyMJIJ/sVQ0q5ItVIjN9TRC8m1DYjbNZejoUz?=
 =?us-ascii?Q?tr68xUheVwt3aU694hDaBDGx2VKsKhEwD53z09qm1AtFpTA/hZHC/L4oZEH8?=
 =?us-ascii?Q?86WQHPzDbo61iLZmDbwEarh1ooWue4XLAOXp05REs39k6RdfLoLPwInF/l0w?=
 =?us-ascii?Q?at6WR82OLR7DYqNGyxmFN0hh7X9v+P0VdDZQSbkC9/gk1JBYUodhHHAwbxUe?=
 =?us-ascii?Q?0aNa1+DiGD3hVJ9er+qCMbeSqQX9VYAI6tghl1jhzc7uV/uEo7b9Ipdi5/WE?=
 =?us-ascii?Q?CEQaoE5EaMFRC9WDccxEQwiWTcCZBpbpfL1ognfUaVSFFZyUP6HwgGlo57Rq?=
 =?us-ascii?Q?BVlWkTUPmZx6uuPwfeqYtWsfE8kpb3cqEJ2CyUCpufnEKGyc8k2DMwsOisHM?=
 =?us-ascii?Q?NNMblg3ctocTbp+fyyxzNdvUlOcL2oaAlh4OMI/mHzs9ye3dAQ98Cs/kE3re?=
 =?us-ascii?Q?H5pmVsPq6STtVKErJDPK93k9nKuwev5hq5dvxhFkBGPBhTUroZB9ZvK7//z9?=
 =?us-ascii?Q?oBOfFcqgRrHRKeZVqCWkeJHsvcJxdvK+xidlbQK6PVtB4Lkv5qj6X7iOHvkr?=
 =?us-ascii?Q?QV3isyhAC9FClagCN7y7zjRiYdvC95CFFBjYtYy2U5SSRarNBLj9hMtZQ87P?=
 =?us-ascii?Q?tgsCb01R5qBM0ae2d5qGC/5+JXuprjhLiPA9mSLrq98sYzqMQgQKoLS3xyD5?=
 =?us-ascii?Q?uQiXc0273ipilNnyatIkVAKbdEKzAORvGkBSfEPLoYhGka5X9MgRVnkMp/7B?=
 =?us-ascii?Q?afolb3gxMdzqL45AWOtRo2YFrRb8TSE1xveHzMao055HbtARXUTj47OqqlxO?=
 =?us-ascii?Q?m8VNgzRNy6X/vZuWkI7S9yVOVaWJpbKPbtbP5UkTyBSZgrQVjQAuBzjEhvjD?=
 =?us-ascii?Q?YC/08/N3j0AWajdsqW3VrB6deyI9sVwAlArsZ2QUDR49wyhLrMvMunPBCbSW?=
 =?us-ascii?Q?e1yQFDldeQI50h7yDS/7L0SaAwAVnDQbOyZat7dajsoGrr4vaou/yWk86mVV?=
 =?us-ascii?Q?QJx1YremhNaZO9UlMP5dBjAzAIzSYSa/9m4Q1N+i1KoaZ3o0jsTtBicXDl6F?=
 =?us-ascii?Q?IkT3ghGwxT86BdHRCKU8rHLkT9YqQaSoozH1M/dRqe/72c3oEPMT9TPaVDzo?=
 =?us-ascii?Q?ghy+YXb2ZkZ2+3OJ38MnGHVZ5Ap6xGOD/lAnsfyVUeyeAwe6ZivnvhKA1FBN?=
 =?us-ascii?Q?9r0bCrge/4M5O1yYAJVIxWf/Bwzf1xq0Fx5uq9mbG+ymKBn1TcrWEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:42:24.7337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5b9731-7337-462a-a7ac-08dde5135aee
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6109

Add dt-bindings docs

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  77 +++
 include/dt-bindings/pinctrl/pads-sky1.h       | 592 ++++++++++++++++++
 2 files changed, 669 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pads-sky1.h

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
new file mode 100644
index 000000000000..10a4a292188e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 Pin Controller
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  Please refer to pinctrl-bindings.txt in this directory for common
+  binding part and usage.
+
+properties:
+  compatible:
+    enum:
+      - cix,sky1-iomuxc
+      - cix,sky1-iomuxc-s5
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  '-pins$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      cix,pins:
+        description:
+          each entry consists of 3 integers and represents the mux and config
+          setting for one pin. The first 2 integers <mux_reg func_num> are
+          specified using a CIX_PAD_* macro.The last integer CONFIG is the pad
+          setting value like pull-up on this pin.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_reg" indicates the offset of register.
+            - description: |
+                "func_num" indicates the mux value to be applied.
+            - description: |
+                "pad_setting" indicates the pad configuration value to be
+                applied.
+
+    required:
+      - cix,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    #include <dt-bindings/pinctrl/pads-sky1.h>
+    iomuxc: pinctrl@4170000 {
+        compatible = "cix,sky1-iomuxc";
+        reg = <0x4170000 0x1000>;
+
+        pinctrl_hog: hog-pins {
+            cix,pins =
+                <CIX_PAD_GPIO144_FUNC_GPIO144 (PULL_DOWN|DS_LEVEL4)>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/pads-sky1.h b/include/dt-bindings/pinctrl/pads-sky1.h
new file mode 100644
index 000000000000..44550e4105b3
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pads-sky1.h
@@ -0,0 +1,592 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2024-2025 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef __SKY1_PADS_H
+#define __SKY1_PADS_H
+
+#define CIX_PAD_GPIO001_OFFSET			0x0
+#define CIX_PAD_GPIO002_OFFSET			0x4
+#define CIX_PAD_GPIO003_OFFSET			0x8
+#define CIX_PAD_GPIO004_OFFSET			0xc
+#define CIX_PAD_GPIO005_OFFSET			0x10
+#define CIX_PAD_GPIO006_OFFSET			0x14
+#define CIX_PAD_GPIO007_OFFSET			0x18
+#define CIX_PAD_GPIO008_OFFSET			0x1c
+#define CIX_PAD_GPIO009_OFFSET			0x20
+#define CIX_PAD_GPIO010_OFFSET			0x24
+#define CIX_PAD_GPIO011_OFFSET			0x28
+#define CIX_PAD_GPIO012_OFFSET			0x2c
+#define CIX_PAD_GPIO013_OFFSET			0x30
+#define CIX_PAD_GPIO014_OFFSET			0x34
+#define CIX_PAD_SFI_I2C0_SCL_OFFSET		0x70
+#define CIX_PAD_SFI_I2C0_SDA_OFFSET		0x74
+#define CIX_PAD_SFI_I2C1_SCL_OFFSET		0x78
+#define CIX_PAD_SFI_I2C1_SDA_OFFSET		0x7c
+#define CIX_PAD_SFI_GPIO0_OFFSET		0x80
+#define CIX_PAD_SFI_GPIO1_OFFSET		0x84
+#define CIX_PAD_SFI_GPIO2_OFFSET		0x88
+#define CIX_PAD_GPIO018_OFFSET			0x8c
+#define CIX_PAD_GPIO019_OFFSET			0x90
+#define CIX_PAD_GPIO020_OFFSET			0x94
+#define CIX_PAD_GPIO021_OFFSET			0x98
+#define CIX_PAD_GPIO022_OFFSET			0x9c
+#define CIX_PAD_GPIO023_OFFSET			0xa0
+#define CIX_PAD_GPIO024_OFFSET			0xa4
+#define CIX_PAD_SPI1_MISO_OFFSET		0xa8
+#define CIX_PAD_SPI1_CS0_OFFSET			0xac
+#define CIX_PAD_SPI1_CS1_OFFSET			0xb0
+#define CIX_PAD_SPI1_MOSI_OFFSET		0xb4
+#define CIX_PAD_SPI1_CLK_OFFSET			0xb8
+#define CIX_PAD_GPIO030_OFFSET			0xbc
+#define CIX_PAD_GPIO031_OFFSET			0xc0
+#define CIX_PAD_GPIO032_OFFSET			0xc4
+#define CIX_PAD_GPIO033_OFFSET			0xc8
+#define CIX_PAD_GPIO034_OFFSET			0xcc
+#define CIX_PAD_GPIO035_OFFSET			0xd0
+#define CIX_PAD_GPIO036_OFFSET			0xd4
+#define CIX_PAD_GPIO037_OFFSET			0xd8
+#define CIX_PAD_GPIO038_OFFSET			0xdc
+#define CIX_PAD_GPIO039_OFFSET			0xe0
+#define CIX_PAD_GPIO040_OFFSET			0xe4
+#define CIX_PAD_GPIO041_OFFSET			0xe8
+#define CIX_PAD_GPIO042_OFFSET			0xec
+#define CIX_PAD_SE_QSPI_CLK_OFFSET		0xf0
+#define CIX_PAD_SE_QSPI_CS_L_OFFSET		0xf4
+#define CIX_PAD_SE_QSPI_DATA0_OFFSET		0xf8
+#define CIX_PAD_SE_QSPI_DATA1_OFFSET		0xfc
+#define CIX_PAD_SE_QSPI_DATA2_OFFSET		0x100
+#define CIX_PAD_SE_QSPI_DATA3_OFFSET		0x104
+#define CIX_PAD_GPIO043_OFFSET			0x0
+#define CIX_PAD_GPIO044_OFFSET			0x4
+#define CIX_PAD_GPIO045_OFFSET			0x8
+#define CIX_PAD_GPIO046_OFFSET			0xc
+#define CIX_PAD_DP2_DIGON_OFFSET		0x48
+#define CIX_PAD_DP2_BLON_OFFSET			0x4c
+#define CIX_PAD_DP2_VARY_BL_OFFSET		0x50
+#define CIX_PAD_I2C7_SCL_OFFSET			0x54
+#define CIX_PAD_I2C7_SDA_OFFSET			0x58
+#define CIX_PAD_I2C5_SCL_OFFSET			0x68
+#define CIX_PAD_I2C5_SDA_OFFSET			0x6c
+#define CIX_PAD_I2C6_SCL_OFFSET			0x70
+#define CIX_PAD_I2C6_SDA_OFFSET			0x74
+#define CIX_PAD_I2C0_CLK_OFFSET			0x78
+#define CIX_PAD_I2C0_SDA_OFFSET			0x7c
+#define CIX_PAD_I2C1_CLK_OFFSET			0x80
+#define CIX_PAD_I2C1_SDA_OFFSET			0x84
+#define CIX_PAD_I2C2_SCL_OFFSET			0x88
+#define CIX_PAD_I2C2_SDA_OFFSET			0x8c
+#define CIX_PAD_GPIO057_OFFSET			0x90
+#define CIX_PAD_I2C3_CLK_OFFSET			0x94
+#define CIX_PAD_I2C3_SDA_OFFSET			0x98
+#define CIX_PAD_GPIO060_OFFSET			0x9c
+#define CIX_PAD_I2C4_CLK_OFFSET			0xa0
+#define CIX_PAD_I2C4_SDA_OFFSET			0xa4
+#define CIX_PAD_HDA_BITCLK_OFFSET		0xa8
+#define CIX_PAD_HDA_RST_L_OFFSET		0xac
+#define CIX_PAD_HDA_SDIN0_OFFSET		0xb0
+#define CIX_PAD_HDA_SDOUT0_OFFSET		0xb4
+#define CIX_PAD_HDA_SYNC_OFFSET			0xb8
+#define CIX_PAD_HDA_SDIN1_OFFSET		0xbc
+#define CIX_PAD_HDA_SDOUT1_OFFSET		0xc0
+#define CIX_PAD_I2S1_MCLK_OFFSET		0xc4
+#define CIX_PAD_I2S1_SCK_OFFSET			0xc8
+#define CIX_PAD_I2S1_WS_OFFSET			0xcc
+#define CIX_PAD_I2S1_DATA_IN_OFFSET		0xd0
+#define CIX_PAD_I2S1_DATA_OUT_OFFSET		0xd4
+#define CIX_PAD_I2S2_MCLK_OFFSET		0xd8
+#define CIX_PAD_I2S2_RSCK_OFFSET		0xdc
+#define CIX_PAD_I2S2_RWS_OFFSET			0xe0
+#define CIX_PAD_I2S2_TSCK_OFFSET		0xe4
+#define CIX_PAD_I2S2_TWS_OFFSET			0xe8
+#define CIX_PAD_I2S2_DATA_IN0_OFFSET		0xec
+#define CIX_PAD_I2S2_DATA_IN1_OFFSET		0xf0
+#define CIX_PAD_I2S2_DATA_OUT0_OFFSET		0xf4
+#define CIX_PAD_I2S2_DATA_OUT1_OFFSET		0xf8
+#define CIX_PAD_I2S2_DATA_OUT2_OFFSET		0xfc
+#define CIX_PAD_I2S2_DATA_OUT3_OFFSET		0x100
+#define CIX_PAD_I2S3_MCLK_OFFSET		0x104
+#define CIX_PAD_I2S3_RSCK_OFFSET		0x108
+#define CIX_PAD_I2S3_RWS_OFFSET			0x10c
+#define CIX_PAD_I2S3_TSCK_OFFSET		0x110
+#define CIX_PAD_I2S3_TWS_OFFSET			0x114
+#define CIX_PAD_I2S3_DATA_IN0_OFFSET		0x118
+#define CIX_PAD_I2S3_DATA_IN1_OFFSET		0x11c
+#define CIX_PAD_I2S3_DATA_OUT0_OFFSET		0x120
+#define CIX_PAD_I2S3_DATA_OUT1_OFFSET		0x124
+#define CIX_PAD_GPIO090_OFFSET			0x128
+#define CIX_PAD_GPIO091_OFFSET			0x12c
+#define CIX_PAD_GPIO092_OFFSET			0x130
+#define CIX_PAD_GPIO093_OFFSET			0x134
+#define CIX_PAD_GPIO094_OFFSET			0x138
+#define CIX_PAD_UART0_TXD_OFFSET		0x13c
+#define CIX_PAD_UART0_RXD_OFFSET		0x140
+#define CIX_PAD_UART0_CTS_OFFSET		0x144
+#define CIX_PAD_UART0_RTS_OFFSET		0x148
+#define CIX_PAD_UART1_TXD_OFFSET		0x14c
+#define CIX_PAD_UART1_RXD_OFFSET		0x150
+#define CIX_PAD_UART1_CTS_OFFSET		0x154
+#define CIX_PAD_UART1_RTS_OFFSET		0x158
+#define CIX_PAD_UART2_TXD_OFFSET		0x15c
+#define CIX_PAD_UART2_RXD_OFFSET		0x160
+#define CIX_PAD_UART3_TXD_OFFSET		0x164
+#define CIX_PAD_UART3_RXD_OFFSET		0x168
+#define CIX_PAD_UART3_CTS_OFFSET		0x16c
+#define CIX_PAD_UART3_RTS_OFFSET		0x170
+#define CIX_PAD_UART4_CSU_PM_TXD_OFFSET		0x174
+#define CIX_PAD_UART4_CSU_PM_RXD_OFFSET		0x178
+#define CIX_PAD_UART5_CSU_SE_TXD_OFFSET		0x17c
+#define CIX_PAD_UART5_CSU_SE_RXD_OFFSET		0x180
+#define CIX_PAD_UART6_CSU_SE_RXD_OFFSET		0x184
+#define CIX_PAD_CLK_REQ0_L_OFFSET		0x188
+#define CIX_PAD_CLK_REQ2_L_OFFSET		0x18c
+#define CIX_PAD_CLK_REQ4_L_OFFSET		0x190
+#define CIX_PAD_CSI0_MCLK0_OFFSET		0x194
+#define CIX_PAD_CSI0_MCLK1_OFFSET		0x198
+#define CIX_PAD_CSI1_MCLK0_OFFSET		0x19c
+#define CIX_PAD_CSI1_MCLK1_OFFSET		0x1a0
+#define CIX_PAD_GPIO121_OFFSET			0x1a4
+#define CIX_PAD_GPIO122_OFFSET			0x1a8
+#define CIX_PAD_GPIO123_OFFSET			0x1ac
+#define CIX_PAD_GPIO124_OFFSET			0x1b0
+#define CIX_PAD_GPIO125_OFFSET			0x1b4
+#define CIX_PAD_GPIO126_OFFSET			0x1b8
+#define CIX_PAD_GPIO127_OFFSET			0x1bc
+#define CIX_PAD_GPIO128_OFFSET			0x1c0
+#define CIX_PAD_GPIO129_OFFSET			0x1c4
+#define CIX_PAD_GPIO130_OFFSET			0x1c8
+#define CIX_PAD_GPIO131_OFFSET			0x1cc
+#define CIX_PAD_GPIO132_OFFSET			0x1d0
+#define CIX_PAD_GPIO133_OFFSET			0x1d4
+#define CIX_PAD_GPIO134_OFFSET			0x1d8
+#define CIX_PAD_GPIO135_OFFSET			0x1dc
+#define CIX_PAD_GPIO136_OFFSET			0x1e0
+#define CIX_PAD_GPIO137_OFFSET			0x1e4
+#define CIX_PAD_GPIO138_OFFSET			0x1e8
+#define CIX_PAD_GPIO139_OFFSET			0x1ec
+#define CIX_PAD_GPIO140_OFFSET			0x1f0
+#define CIX_PAD_GPIO141_OFFSET			0x1f4
+#define CIX_PAD_GPIO142_OFFSET			0x1f8
+#define CIX_PAD_GPIO143_OFFSET			0x1fc
+#define CIX_PAD_GPIO144_OFFSET			0x200
+#define CIX_PAD_GPIO145_OFFSET			0x204
+#define CIX_PAD_GPIO146_OFFSET			0x208
+#define CIX_PAD_GPIO147_OFFSET			0x20c
+#define CIX_PAD_GPIO148_OFFSET			0x210
+#define CIX_PAD_GPIO149_OFFSET			0x214
+#define CIX_PAD_GPIO150_OFFSET			0x218
+#define CIX_PAD_GPIO151_OFFSET			0x21c
+#define CIX_PAD_GPIO152_OFFSET			0x220
+#define CIX_PAD_GPIO153_OFFSET			0x224
+
+#define CIX_PAD_GPIO001_FUNC_GPIO001				   0x0
+#define CIX_PAD_GPIO002_FUNC_GPIO002				   0x0
+#define CIX_PAD_GPIO003_FUNC_GPIO003				   0x0
+#define CIX_PAD_GPIO004_FUNC_GPIO004				   0x0
+#define CIX_PAD_GPIO005_FUNC_GPIO005				   0x0
+#define CIX_PAD_GPIO006_FUNC_GPIO006				   0x0
+#define CIX_PAD_GPIO007_FUNC_GPIO007				   0x0
+#define CIX_PAD_GPIO008_FUNC_GPIO008				   0x0
+#define CIX_PAD_GPIO009_FUNC_GPIO009				   0x0
+#define CIX_PAD_GPIO010_FUNC_GPIO010				   0x0
+#define CIX_PAD_GPIO011_FUNC_GPIO011				   0x0
+#define CIX_PAD_GPIO012_FUNC_GPIO012				   0x0
+#define CIX_PAD_GPIO013_FUNC_GPIO013				   0x0
+#define CIX_PAD_GPIO014_FUNC_GPIO014				   0x0
+#define CIX_PAD_SFI_I2C0_SCL_FUNC_SFI_I2C0_SCL			   0x0
+#define CIX_PAD_SFI_I2C0_SCL_FUNC_SFI_I3C0_SCL			   0x1
+#define CIX_PAD_SFI_I2C0_SDA_FUNC_SFI_I2C0_SDA			   0x0
+#define CIX_PAD_SFI_I2C0_SDA_FUNC_SFI_I3C0_SDA			   0x1
+#define CIX_PAD_SFI_I2C1_SCL_FUNC_SFI_I2C1_SCL			   0x0
+#define CIX_PAD_SFI_I2C1_SCL_FUNC_SFI_I3C1_SCL			   0x1
+#define CIX_PAD_SFI_I2C1_SCL_FUNC_SFI_SPI_CS0			   0x2
+#define CIX_PAD_SFI_I2C1_SDA_FUNC_SFI_I2C1_SDA			   0x0
+#define CIX_PAD_SFI_I2C1_SDA_FUNC_SFI_I3C1_SDA			   0x1
+#define CIX_PAD_SFI_I2C1_SDA_FUNC_SFI_SPI_CS1			   0x2
+#define CIX_PAD_SFI_GPIO0_FUNC_GPIO015				   0x0
+#define CIX_PAD_SFI_GPIO0_FUNC_SFI_SPI_SCK			   0x1
+#define CIX_PAD_SFI_GPIO0_FUNC_SFI_GPIO0			   0x2
+#define CIX_PAD_SFI_GPIO1_FUNC_GPIO016				   0x0
+#define CIX_PAD_SFI_GPIO1_FUNC_SFI_SPI_MOSI			   0x1
+#define CIX_PAD_SFI_GPIO1_FUNC_SFI_GPIO1			   0x2
+#define CIX_PAD_SFI_GPIO2_FUNC_GPIO017				   0x0
+#define CIX_PAD_SFI_GPIO2_FUNC_SFI_SPI_MISO			   0x1
+#define CIX_PAD_SFI_GPIO2_FUNC_SFI_GPIO2			   0x2
+#define CIX_PAD_GPIO018_FUNC_SFI_GPIO3				   0x0
+#define CIX_PAD_GPIO018_FUNC_GPIO018				   0x1
+#define CIX_PAD_GPIO019_FUNC_SFI_GPIO4				   0x0
+#define CIX_PAD_GPIO019_FUNC_GPIO019				   0x1
+#define CIX_PAD_GPIO020_FUNC_SFI_GPIO5				   0x0
+#define CIX_PAD_GPIO020_FUNC_GPIO020				   0x1
+#define CIX_PAD_GPIO021_FUNC_SFI_GPIO6				   0x0
+#define CIX_PAD_GPIO021_FUNC_GPIO021				   0x1
+#define CIX_PAD_GPIO022_FUNC_SFI_GPIO7				   0x0
+#define CIX_PAD_GPIO022_FUNC_GPIO022				   0x1
+#define CIX_PAD_GPIO023_FUNC_SFI_GPIO8				   0x0
+#define CIX_PAD_GPIO023_FUNC_GPIO023				   0x1
+#define CIX_PAD_GPIO023_FUNC_SFI_I3C0_PUR_EN_L			   0x2
+#define CIX_PAD_GPIO024_FUNC_SFI_GPIO9				   0x0
+#define CIX_PAD_GPIO024_FUNC_GPIO024				   0x1
+#define CIX_PAD_GPIO024_FUNC_SFI_I3C1_PUR_EN_L			   0x2
+#define CIX_PAD_SPI1_MISO_FUNC_SPI1_MISO			   0x0
+#define CIX_PAD_SPI1_MISO_FUNC_GPIO025				   0x1
+#define CIX_PAD_SPI1_CS0_FUNC_SPI1_CS0				   0x0
+#define CIX_PAD_SPI1_CS0_FUNC_GPIO026				   0x1
+#define CIX_PAD_SPI1_CS1_FUNC_SPI1_CS1				   0x0
+#define CIX_PAD_SPI1_CS1_FUNC_GPIO027				   0x1
+#define CIX_PAD_SPI1_MOSI_FUNC_SPI1_MOSI			   0x0
+#define CIX_PAD_SPI1_MOSI_FUNC_GPIO028				   0x1
+#define CIX_PAD_SPI1_CLK_FUNC_SPI1_CLK				   0x0
+#define CIX_PAD_SPI1_CLK_FUNC_GPIO029				   0x1
+#define CIX_PAD_GPIO030_FUNC_GPIO030				   0x0
+#define CIX_PAD_GPIO030_FUNC_USB_OC0_L				   0x1
+#define CIX_PAD_GPIO031_FUNC_GPIO031				   0x0
+#define CIX_PAD_GPIO031_FUNC_USB_OC1_L				   0x1
+#define CIX_PAD_GPIO032_FUNC_GPIO032				   0x0
+#define CIX_PAD_GPIO032_FUNC_USB_OC2_L				   0x1
+#define CIX_PAD_GPIO033_FUNC_GPIO033				   0x0
+#define CIX_PAD_GPIO033_FUNC_USB_OC3_L				   0x1
+#define CIX_PAD_GPIO034_FUNC_GPIO034				   0x0
+#define CIX_PAD_GPIO034_FUNC_USB_OC4_L				   0x1
+#define CIX_PAD_GPIO035_FUNC_GPIO035				   0x0
+#define CIX_PAD_GPIO035_FUNC_USB_OC5_L				   0x1
+#define CIX_PAD_GPIO036_FUNC_GPIO036				   0x0
+#define CIX_PAD_GPIO036_FUNC_USB_OC6_L				   0x1
+#define CIX_PAD_GPIO037_FUNC_GPIO037				   0x0
+#define CIX_PAD_GPIO037_FUNC_USB_OC7_L				   0x1
+#define CIX_PAD_GPIO038_FUNC_GPIO038				   0x0
+#define CIX_PAD_GPIO038_FUNC_USB_OC8_L				   0x1
+#define CIX_PAD_GPIO039_FUNC_GPIO039				   0x0
+#define CIX_PAD_GPIO039_FUNC_USB_OC9_L				   0x1
+#define CIX_PAD_GPIO040_FUNC_GPIO040				   0x0
+#define CIX_PAD_GPIO040_FUNC_USB_DRIVE_VBUS0			   0x1
+#define CIX_PAD_GPIO041_FUNC_GPIO041				   0x0
+#define CIX_PAD_GPIO041_FUNC_USB_DRIVE_VBUS4			   0x1
+#define CIX_PAD_GPIO042_FUNC_GPIO042				   0x0
+#define CIX_PAD_GPIO042_FUNC_USB_DRIVE_VBUS5			   0x1
+#define CIX_PAD_SE_QSPI_CLK_FUNC_SE_QSPI_CLK			   0x0
+#define CIX_PAD_SE_QSPI_CLK_FUNC_QSPI_CLK			   0x1
+#define CIX_PAD_SE_QSPI_CS_L_FUNC_SE_QSPI_CS_L			   0x0
+#define CIX_PAD_SE_QSPI_CS_L_FUNC_QSPI_CS_L			   0x1
+#define CIX_PAD_SE_QSPI_DATA0_FUNC_SE_QSPI_DATA0		   0x0
+#define CIX_PAD_SE_QSPI_DATA0_FUNC_QSPI_DATA0			   0x1
+#define CIX_PAD_SE_QSPI_DATA1_FUNC_SE_QSPI_DATA1		   0x0
+#define CIX_PAD_SE_QSPI_DATA1_FUNC_QSPI_DATA1			   0x1
+#define CIX_PAD_SE_QSPI_DATA2_FUNC_SE_QSPI_DATA2		   0x0
+#define CIX_PAD_SE_QSPI_DATA2_FUNC_QSPI_DATA2			   0x1
+#define CIX_PAD_SE_QSPI_DATA3_FUNC_SE_QSPI_DATA3		   0x0
+#define CIX_PAD_SE_QSPI_DATA3_FUNC_QSPI_DATA3			   0x1
+#define CIX_PAD_GPIO043_FUNC_GPIO043				   0x0
+#define CIX_PAD_GPIO044_FUNC_GPIO044				   0x0
+#define CIX_PAD_GPIO045_FUNC_GPIO045				   0x0
+#define CIX_PAD_GPIO046_FUNC_GPIO046				   0x0
+#define CIX_PAD_DP2_DIGON_FUNC_DP2_DIGON			   0x0
+#define CIX_PAD_DP2_BLON_FUNC_DP2_BLON				   0x0
+#define CIX_PAD_DP2_VARY_BL_FUNC_DP2_VARY_BL			   0x0
+#define CIX_PAD_I2C7_SCL_FUNC_I2C7_SCL				   0x0
+#define CIX_PAD_I2C7_SDA_FUNC_I2C7_SDA				   0x0
+#define CIX_PAD_I2C5_SCL_FUNC_I2C5_SCL				   0x0
+#define CIX_PAD_I2C5_SCL_FUNC_GPIO047				   0x1
+#define CIX_PAD_I2C5_SDA_FUNC_I2C5_SDA				   0x0
+#define CIX_PAD_I2C5_SDA_FUNC_GPIO048				   0x1
+#define CIX_PAD_I2C6_SCL_FUNC_I2C6_SCL				   0x0
+#define CIX_PAD_I2C6_SCL_FUNC_GPIO049				   0x1
+#define CIX_PAD_I2C6_SDA_FUNC_I2C6_SDA				   0x0
+#define CIX_PAD_I2C6_SDA_FUNC_GPIO050				   0x1
+#define CIX_PAD_I2C0_CLK_FUNC_I2C0_CLK				   0x0
+#define CIX_PAD_I2C0_CLK_FUNC_GPIO051				   0x1
+#define CIX_PAD_I2C0_SDA_FUNC_I2C0_SDA				   0x0
+#define CIX_PAD_I2C0_SDA_FUNC_GPIO052				   0x1
+#define CIX_PAD_I2C1_CLK_FUNC_I2C1_CLK				   0x0
+#define CIX_PAD_I2C1_CLK_FUNC_GPIO053				   0x1
+#define CIX_PAD_I2C1_SDA_FUNC_I2C1_SDA				   0x0
+#define CIX_PAD_I2C1_SDA_FUNC_GPIO054				   0x1
+#define CIX_PAD_I2C2_SCL_FUNC_I2C2_SCL				   0x0
+#define CIX_PAD_I2C2_SCL_FUNC_I3C0_SCL				   0x1
+#define CIX_PAD_I2C2_SCL_FUNC_GPIO055				   0x2
+#define CIX_PAD_I2C2_SDA_FUNC_I2C2_SDA				   0x0
+#define CIX_PAD_I2C2_SDA_FUNC_I3C0_SDA				   0x1
+#define CIX_PAD_I2C2_SDA_FUNC_GPIO056				   0x2
+#define CIX_PAD_GPIO057_FUNC_GPIO057				   0x0
+#define CIX_PAD_GPIO057_FUNC_I3C0_PUR_EN_L			   0x1
+#define CIX_PAD_I2C3_CLK_FUNC_I2C3_CLK				   0x0
+#define CIX_PAD_I2C3_CLK_FUNC_I3C1_CLK				   0x1
+#define CIX_PAD_I2C3_CLK_FUNC_GPIO058				   0x2
+#define CIX_PAD_I2C3_SDA_FUNC_I2C3_SDA				   0x0
+#define CIX_PAD_I2C3_SDA_FUNC_I3C1_SDA				   0x1
+#define CIX_PAD_I2C3_SDA_FUNC_GPIO059				   0x2
+#define CIX_PAD_GPIO060_FUNC_GPIO060				   0x0
+#define CIX_PAD_GPIO060_FUNC_I3C1_PUR_EN_L			   0x1
+#define CIX_PAD_I2C4_CLK_FUNC_I2C4_CLK				   0x0
+#define CIX_PAD_I2C4_CLK_FUNC_GPIO061				   0x1
+#define CIX_PAD_I2C4_SDA_FUNC_I2C4_SDA				   0x0
+#define CIX_PAD_I2C4_SDA_FUNC_GPIO062				   0x1
+#define CIX_PAD_HDA_BITCLK_FUNC_HDA_BITCLK			   0x0
+#define CIX_PAD_HDA_BITCLK_FUNC_I2S0_SCK			   0x1
+#define CIX_PAD_HDA_BITCLK_FUNC_I2S9_RSCK_DBG			   0x2
+#define CIX_PAD_HDA_RST_L_FUNC_HDA_RST_L			   0x0
+#define CIX_PAD_HDA_RST_L_FUNC_I2S0_DATA_IN			   0x1
+#define CIX_PAD_HDA_RST_L_FUNC_I2S9_DATA_IN0_DBG		   0x2
+#define CIX_PAD_HDA_SDIN0_FUNC_HDA_SDIN0			   0x0
+#define CIX_PAD_HDA_SDIN0_FUNC_I2S0_MCLK			   0x1
+#define CIX_PAD_HDA_SDIN0_FUNC_I2S9_TSCK_DBG			   0x2
+#define CIX_PAD_HDA_SDOUT0_FUNC_HDA_SDOUT0			   0x0
+#define CIX_PAD_HDA_SDOUT0_FUNC_I2S0_DATA_OUT			   0x1
+#define CIX_PAD_HDA_SDOUT0_FUNC_I2S9_TWS_DBG		           0x2
+#define CIX_PAD_HDA_SYNC_FUNC_HDA_SYNC				   0x0
+#define CIX_PAD_HDA_SYNC_FUNC_I2S0_WS				   0x1
+#define CIX_PAD_HDA_SYNC_FUNC_I2S9_RWS_DBG			   0x2
+#define CIX_PAD_HDA_SDIN1_FUNC_HDA_SDIN1			   0x0
+#define CIX_PAD_HDA_SDIN1_FUNC_GPIO063				   0x1
+#define CIX_PAD_HDA_SDIN1_FUNC_I2S9_DATA_IN1_DBG		   0x2
+#define CIX_PAD_HDA_SDOUT1_FUNC_HDA_SDOUT1			   0x0
+#define CIX_PAD_HDA_SDOUT1_FUNC_GPIO064				   0x1
+#define CIX_PAD_HDA_SDOUT1_FUNC_I2S9_DATA_OUT0_DBG		   0x2
+#define CIX_PAD_I2S1_MCLK_FUNC_I2S1_MCLK			   0x0
+#define CIX_PAD_I2S1_MCLK_FUNC_GPIO065				   0x1
+#define CIX_PAD_I2S1_SCK_FUNC_I2S1_SCK				   0x0
+#define CIX_PAD_I2S1_SCK_FUNC_GPIO066				   0x1
+#define CIX_PAD_I2S1_WS_FUNC_I2S1_WS				   0x0
+#define CIX_PAD_I2S1_WS_FUNC_GPIO067				   0x1
+#define CIX_PAD_I2S1_DATA_IN_FUNC_I2S1_DATA_IN			   0x0
+#define CIX_PAD_I2S1_DATA_IN_FUNC_GPIO068			   0x1
+#define CIX_PAD_I2S1_DATA_OUT_FUNC_I2S1_DATA_OUT		   0x0
+#define CIX_PAD_I2S1_DATA_OUT_FUNC_GPIO069			   0x1
+#define CIX_PAD_I2S2_MCLK_FUNC_I2S2_MCLK			   0x0
+#define CIX_PAD_I2S2_MCLK_FUNC_GPIO070				   0x1
+#define CIX_PAD_I2S2_RSCK_FUNC_I2S2_RSCK			   0x0
+#define CIX_PAD_I2S2_RSCK_FUNC_GPIO071				   0x1
+#define CIX_PAD_I2S2_RSCK_FUNC_I2S5_RSCK_DBG			   0x2
+#define CIX_PAD_I2S2_RSCK_FUNC_I2S6_RSCK_DBG			   0x3
+#define CIX_PAD_I2S2_RWS_FUNC_I2S2_RWS				   0x0
+#define CIX_PAD_I2S2_RWS_FUNC_GPIO072				   0x1
+#define CIX_PAD_I2S2_RWS_FUNC_I2S5_RWS_DBG			   0x2
+#define CIX_PAD_I2S2_RWS_FUNC_I2S6_RWS_DBG			   0x3
+#define CIX_PAD_I2S2_TSCK_FUNC_I2S2_TSCK			   0x0
+#define CIX_PAD_I2S2_TSCK_FUNC_GPIO073				   0x1
+#define CIX_PAD_I2S2_TSCK_FUNC_I2S5_TSCK_DBG			   0x2
+#define CIX_PAD_I2S2_TSCK_FUNC_I2S6_TSCK_DBG			   0x3
+#define CIX_PAD_I2S2_TWS_FUNC_I2S2_TWS				   0x0
+#define CIX_PAD_I2S2_TWS_FUNC_GPIO074				   0x1
+#define CIX_PAD_I2S2_TWS_FUNC_I2S5_TWS_DBG			   0x2
+#define CIX_PAD_I2S2_TWS_FUNC_I2S6_TWS_DBG			   0x3
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_I2S2_DATA_IN0		   0x0
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_GPIO075			   0x1
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_I2S5_DATA_IN0_DBG		   0x2
+#define CIX_PAD_I2S2_DATA_IN0_FUNC_I2S6_DATA_IN0_DBG		   0x3
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_I2S2_DATA_IN1		   0x0
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_GPIO076			   0x1
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_I2S5_DATA_IN1_DBG		   0x2
+#define CIX_PAD_I2S2_DATA_IN1_FUNC_I2S6_DATA_IN1_DBG		   0x3
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_I2S2_DATA_OUT0		   0x0
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_GPIO077			   0x1
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_I2S5_DATA_OUT0_DBG		   0x2
+#define CIX_PAD_I2S2_DATA_OUT0_FUNC_I2S6_DATA_OUT0_DBG		   0x3
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_I2S2_DATA_OUT1		   0x0
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_GPIO078			   0x1
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_I2S5_DATA_OUT1_DBG		   0x2
+#define CIX_PAD_I2S2_DATA_OUT1_FUNC_I2S6_DATA_OUT1_DBG		   0x3
+#define CIX_PAD_I2S2_DATA_OUT2_FUNC_I2S2_DATA_OUT2		   0x0
+#define CIX_PAD_I2S2_DATA_OUT2_FUNC_GPIO079			   0x1
+#define CIX_PAD_I2S2_DATA_OUT3_FUNC_I2S2_DATA_OUT3		   0x0
+#define CIX_PAD_I2S2_DATA_OUT3_FUNC_GPIO080			   0x1
+#define CIX_PAD_I2S2_DATA_OUT3_FUNC_I2S9_DATA_OUT1_DBG		   0x2
+#define CIX_PAD_I2S3_MCLK_FUNC_I2S3_MCLK			   0x0
+#define CIX_PAD_I2S3_MCLK_FUNC_GPIO081				   0x1
+#define CIX_PAD_I2S3_RSCK_FUNC_I2S3_RSCK			   0x0
+#define CIX_PAD_I2S3_RSCK_FUNC_GPIO082				   0x1
+#define CIX_PAD_I2S3_RSCK_FUNC_I2S7_RSCK_DBG			   0x2
+#define CIX_PAD_I2S3_RSCK_FUNC_I2S8_RSCK_DBG			   0x3
+#define CIX_PAD_I2S3_RWS_FUNC_I2S3_RWS				   0x0
+#define CIX_PAD_I2S3_RWS_FUNC_GPIO083				   0x1
+#define CIX_PAD_I2S3_RWS_FUNC_I2S7_RWS_DBG			   0x2
+#define CIX_PAD_I2S3_RWS_FUNC_I2S8_RWS_DBG			   0x3
+#define CIX_PAD_I2S3_TSCK_FUNC_I2S3_TSCK			   0x0
+#define CIX_PAD_I2S3_TSCK_FUNC_GPIO084				   0x1
+#define CIX_PAD_I2S3_TSCK_FUNC_I2S7_TSCK_DBG			   0x2
+#define CIX_PAD_I2S3_TSCK_FUNC_I2S8_TSCK_DBG			   0x3
+#define CIX_PAD_I2S3_TWS_FUNC_I2S3_TWS				   0x0
+#define CIX_PAD_I2S3_TWS_FUNC_GPIO085				   0x1
+#define CIX_PAD_I2S3_TWS_FUNC_I2S7_TWS_DBG			   0x2
+#define CIX_PAD_I2S3_TWS_FUNC_I2S8_TWS_DBG			   0x3
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_I2S3_DATA_IN0		   0x0
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_GPIO086			   0x1
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_I2S7_DATA_IN0_DBG		   0x2
+#define CIX_PAD_I2S3_DATA_IN0_FUNC_I2S8_DATA_IN0_DBG		   0x3
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_I2S3_DATA_IN1		   0x0
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_GPIO087			   0x1
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_I2S7_DATA_IN1_DBG		   0x2
+#define CIX_PAD_I2S3_DATA_IN1_FUNC_I2S8_DATA_IN1_DBG		   0x3
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_I2S3_DATA_OUT0		   0x0
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_GPIO088			   0x1
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_I2S7_DATA_OUT0_DBG		   0x2
+#define CIX_PAD_I2S3_DATA_OUT0_FUNC_I2S8_DATA_OUT0_DBG		   0x3
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_I2S3_DATA_OUT1		   0x0
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_GPIO089			   0x1
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_I2S7_DATA_OUT1_DBG		   0x2
+#define CIX_PAD_I2S3_DATA_OUT1_FUNC_I2S8_DATA_OUT1_DBG		   0x3
+#define CIX_PAD_GPIO090_FUNC_GPIO090				   0x0
+#define CIX_PAD_GPIO090_FUNC_I2S4_MCLK_LB			   0x1
+#define CIX_PAD_GPIO091_FUNC_GPIO091				   0x0
+#define CIX_PAD_GPIO091_FUNC_I2S4_SCK_LB			   0x1
+#define CIX_PAD_GPIO092_FUNC_GPIO092				   0x0
+#define CIX_PAD_GPIO092_FUNC_I2S4_WS_LB				   0x1
+#define CIX_PAD_GPIO093_FUNC_GPIO093				   0x0
+#define CIX_PAD_GPIO093_FUNC_I2S4_DATA_IN_LB			   0x1
+#define CIX_PAD_GPIO094_FUNC_GPIO094				   0x0
+#define CIX_PAD_GPIO094_FUNC_I2S4_DATA_OUT_LB			   0x1
+#define CIX_PAD_UART0_TXD_FUNC_UART0_TXD			   0x0
+#define CIX_PAD_UART0_TXD_FUNC_PWM0				   0x1
+#define CIX_PAD_UART0_TXD_FUNC_GPIO095				   0x2
+#define CIX_PAD_UART0_RXD_FUNC_UART0_RXD			   0x0
+#define CIX_PAD_UART0_RXD_FUNC_PWM1				   0x1
+#define CIX_PAD_UART0_RXD_FUNC_GPIO096				   0x2
+#define CIX_PAD_UART0_CTS_FUNC_UART0_CTS			   0x0
+#define CIX_PAD_UART0_CTS_FUNC_FAN_OUT2				   0x1
+#define CIX_PAD_UART0_CTS_FUNC_GPIO097				   0x2
+#define CIX_PAD_UART0_RTS_FUNC_UART0_RTS			   0x0
+#define CIX_PAD_UART0_RTS_FUNC_FAN_TACH2			   0x1
+#define CIX_PAD_UART0_RTS_FUNC_GPIO098				   0x2
+#define CIX_PAD_UART1_TXD_FUNC_UART1_TXD			   0x0
+#define CIX_PAD_UART1_TXD_FUNC_FAN_OUT0				   0x1
+#define CIX_PAD_UART1_TXD_FUNC_GPIO099				   0x2
+#define CIX_PAD_UART1_RXD_FUNC_UART1_RXD			   0x0
+#define CIX_PAD_UART1_RXD_FUNC_FAN_TACH0			   0x1
+#define CIX_PAD_UART1_RXD_FUNC_GPIO100				   0x2
+#define CIX_PAD_UART1_CTS_FUNC_UART1_CTS			   0x0
+#define CIX_PAD_UART1_CTS_FUNC_FAN_OUT1				   0x1
+#define CIX_PAD_UART1_CTS_FUNC_GPIO101				   0x2
+#define CIX_PAD_UART1_RTS_FUNC_UART1_RTS			   0x0
+#define CIX_PAD_UART1_RTS_FUNC_FAN_TACH1			   0x1
+#define CIX_PAD_UART1_RTS_FUNC_GPIO102				   0x2
+#define CIX_PAD_UART2_TXD_FUNC_UART2_TXD			   0x0
+#define CIX_PAD_UART2_TXD_FUNC_GPIO103				   0x1
+#define CIX_PAD_UART2_RXD_FUNC_UART2_RXD			   0x0
+#define CIX_PAD_UART2_RXD_FUNC_GPIO104				   0x1
+#define CIX_PAD_UART3_TXD_FUNC_UART3_TXD			   0x0
+#define CIX_PAD_UART3_TXD_FUNC_GPIO105				   0x1
+#define CIX_PAD_UART3_RXD_FUNC_UART3_RXD			   0x0
+#define CIX_PAD_UART3_RXD_FUNC_GPIO106				   0x1
+#define CIX_PAD_UART3_CTS_FUNC_UART3_CTS			   0x0
+#define CIX_PAD_UART3_CTS_FUNC_GPIO107				   0x1
+#define CIX_PAD_UART3_CTS_FUNC_TRIGIN0				   0x2
+#define CIX_PAD_UART3_RTS_FUNC_UART3_RTS			   0x0
+#define CIX_PAD_UART3_RTS_FUNC_GPIO108				   0x1
+#define CIX_PAD_UART3_RTS_FUNC_TRIGIN1				   0x2
+#define CIX_PAD_UART4_CSU_PM_TXD_FUNC_UART4_CSU_PM_TXD		   0x0
+#define CIX_PAD_UART4_CSU_PM_TXD_FUNC_GPIO109			   0x1
+#define CIX_PAD_UART4_CSU_PM_RXD_FUNC_UART4_CSU_PM_RXD		   0x0
+#define CIX_PAD_UART4_CSU_PM_RXD_FUNC_GPIO110			   0x1
+#define CIX_PAD_UART5_CSU_SE_TXD_FUNC_UART5_CSU_SE_TXD		   0x0
+#define CIX_PAD_UART5_CSU_SE_TXD_FUNC_GPIO111			   0x1
+#define CIX_PAD_UART5_CSU_SE_RXD_FUNC_UART5_CSU_SE_RXD		   0x0
+#define CIX_PAD_UART5_CSU_SE_RXD_FUNC_GPIO112			   0x1
+#define CIX_PAD_UART6_CSU_SE_RXD_FUNC_UART6_CSU_SE_RXD		   0x0
+#define CIX_PAD_UART6_CSU_SE_RXD_FUNC_GPIO113			   0x1
+#define CIX_PAD_CLK_REQ0_L_FUNC_CLK_REQ0_L			   0x0
+#define CIX_PAD_CLK_REQ0_L_FUNC_GPIO114				   0x1
+#define CIX_PAD_CLK_REQ2_L_FUNC_CLK_REQ2_L			   0x0
+#define CIX_PAD_CLK_REQ2_L_FUNC_GPIO115				   0x1
+#define CIX_PAD_CLK_REQ4_L_FUNC_CLK_REQ4_L			   0x0
+#define CIX_PAD_CLK_REQ4_L_FUNC_GPIO116				   0x1
+#define CIX_PAD_CSI0_MCLK0_FUNC_CSI0_MCLK0			   0x0
+#define CIX_PAD_CSI0_MCLK0_FUNC_GPIO117				   0x1
+#define CIX_PAD_CSI0_MCLK1_FUNC_CSI0_MCLK1			   0x0
+#define CIX_PAD_CSI0_MCLK1_FUNC_GPIO118				   0x1
+#define CIX_PAD_CSI1_MCLK0_FUNC_CSI1_MCLK0			   0x0
+#define CIX_PAD_CSI1_MCLK0_FUNC_GPIO119				   0x1
+#define CIX_PAD_CSI1_MCLK1_FUNC_CSI1_MCLK1			   0x0
+#define CIX_PAD_CSI1_MCLK1_FUNC_GPIO120				   0x1
+#define CIX_PAD_GPIO121_FUNC_GPIO121				   0x0
+#define CIX_PAD_GPIO121_FUNC_GMAC0_REFCLK_25M			   0x1
+#define CIX_PAD_GPIO122_FUNC_GPIO122				   0x0
+#define CIX_PAD_GPIO122_FUNC_GMAC0_TX_CTL			   0x1
+#define CIX_PAD_GPIO123_FUNC_GPIO123				   0x0
+#define CIX_PAD_GPIO123_FUNC_GMAC0_TXD0				   0x1
+#define CIX_PAD_GPIO124_FUNC_GPIO124				   0x0
+#define CIX_PAD_GPIO124_FUNC_GMAC0_TXD1				   0x1
+#define CIX_PAD_GPIO125_FUNC_GPIO125				   0x0
+#define CIX_PAD_GPIO125_FUNC_GMAC0_TXD2				   0x1
+#define CIX_PAD_GPIO126_FUNC_GPIO126				   0x0
+#define CIX_PAD_GPIO126_FUNC_GMAC0_TXD3				   0x1
+#define CIX_PAD_GPIO127_FUNC_GPIO127				   0x0
+#define CIX_PAD_GPIO127_FUNC_GMAC0_TX_CLK			   0x1
+#define CIX_PAD_GPIO128_FUNC_GPIO128				   0x0
+#define CIX_PAD_GPIO128_FUNC_GMAC0_RX_CTL			   0x1
+#define CIX_PAD_GPIO129_FUNC_GPIO129				   0x0
+#define CIX_PAD_GPIO129_FUNC_GMAC0_RXD0				   0x1
+#define CIX_PAD_GPIO130_FUNC_GPIO130				   0x0
+#define CIX_PAD_GPIO130_FUNC_GMAC0_RXD1				   0x1
+#define CIX_PAD_GPIO131_FUNC_GPIO131				   0x0
+#define CIX_PAD_GPIO131_FUNC_GMAC0_RXD2				   0x1
+#define CIX_PAD_GPIO132_FUNC_GPIO132				   0x0
+#define CIX_PAD_GPIO132_FUNC_GMAC0_RXD3				   0x1
+#define CIX_PAD_GPIO133_FUNC_GPIO133				   0x0
+#define CIX_PAD_GPIO133_FUNC_GMAC0_RX_CLK			   0x1
+#define CIX_PAD_GPIO134_FUNC_GPIO134				   0x0
+#define CIX_PAD_GPIO134_FUNC_GMAC0_MDC				   0x1
+#define CIX_PAD_GPIO135_FUNC_GPIO135				   0x0
+#define CIX_PAD_GPIO135_FUNC_GMAC0_MDIO				   0x1
+#define CIX_PAD_GPIO136_FUNC_GPIO136				   0x0
+#define CIX_PAD_GPIO136_FUNC_GMAC1_REFCLK_25M			   0x1
+#define CIX_PAD_GPIO137_FUNC_GPIO137				   0x0
+#define CIX_PAD_GPIO137_FUNC_GMAC1_TX_CTL			   0x1
+#define CIX_PAD_GPIO138_FUNC_GPIO138				   0x0
+#define CIX_PAD_GPIO138_FUNC_GMAC1_TXD0				   0x1
+#define CIX_PAD_GPIO138_FUNC_SPI2_MISO				   0x2
+#define CIX_PAD_GPIO139_FUNC_GPIO139				   0x0
+#define CIX_PAD_GPIO139_FUNC_GMAC1_TXD1				   0x1
+#define CIX_PAD_GPIO139_FUNC_SPI2_CS0				   0x2
+#define CIX_PAD_GPIO140_FUNC_GPIO140				   0x0
+#define CIX_PAD_GPIO140_FUNC_GMAC1_TXD2				   0x1
+#define CIX_PAD_GPIO140_FUNC_SPI2_CS1				   0x2
+#define CIX_PAD_GPIO141_FUNC_GPIO141				   0x0
+#define CIX_PAD_GPIO141_FUNC_GMAC1_TXD3				   0x1
+#define CIX_PAD_GPIO141_FUNC_SPI2_MOSI				   0x2
+#define CIX_PAD_GPIO142_FUNC_GPIO142				   0x0
+#define CIX_PAD_GPIO142_FUNC_GMAC1_TX_CLK			   0x1
+#define CIX_PAD_GPIO142_FUNC_SPI2_CLK				   0x2
+#define CIX_PAD_GPIO143_FUNC_GPIO143				   0x0
+#define CIX_PAD_GPIO143_FUNC_GMAC1_RX_CTL			   0x1
+#define CIX_PAD_GPIO144_FUNC_GPIO144				   0x0
+#define CIX_PAD_GPIO144_FUNC_GMAC1_RXD0				   0x1
+#define CIX_PAD_GPIO145_FUNC_GPIO145				   0x0
+#define CIX_PAD_GPIO145_FUNC_GMAC1_RXD1				   0x1
+#define CIX_PAD_GPIO146_FUNC_GPIO146				   0x0
+#define CIX_PAD_GPIO146_FUNC_GMAC1_RXD2				   0x1
+#define CIX_PAD_GPIO147_FUNC_GPIO147				   0x0
+#define CIX_PAD_GPIO147_FUNC_GMAC1_RXD3				   0x1
+#define CIX_PAD_GPIO148_FUNC_GPIO148				   0x0
+#define CIX_PAD_GPIO148_FUNC_GMAC1_RX_CLK			   0x1
+#define CIX_PAD_GPIO149_FUNC_GPIO149				   0x0
+#define CIX_PAD_GPIO149_FUNC_GMAC1_MDC				   0x1
+#define CIX_PAD_GPIO150_FUNC_GPIO150				   0x0
+#define CIX_PAD_GPIO150_FUNC_GMAC1_MDIO				   0x1
+#define CIX_PAD_GPIO151_FUNC_GPIO151				   0x0
+#define CIX_PAD_GPIO151_FUNC_PM_GPIO0				   0x1
+#define CIX_PAD_GPIO152_FUNC_GPIO152				   0x0
+#define CIX_PAD_GPIO152_FUNC_PM_GPIO1				   0x1
+#define CIX_PAD_GPIO153_FUNC_GPIO153				   0x0
+#define CIX_PAD_GPIO153_FUNC_PM_GPIO2				   0x1
+
+#define PULL_UP		(1 << 6)
+#define PULL_DOWN	(1 << 5)
+#define ST		(1 << 4)
+#define DS_LEVEL1	0x1
+#define DS_LEVEL2	0x2
+#define DS_LEVEL3	0x3
+#define DS_LEVEL4	0x4
+#define DS_LEVEL5	0x5
+#define DS_LEVEL6	0x6
+#define DS_LEVEL7	0x7
+#define DS_LEVEL8	0x8
+#define DS_LEVEL9	0x9
+#define DS_LEVEL10	0xa
+#define DS_LEVEL11	0xb
+#define DS_LEVEL12	0xc
+#define DS_LEVEL13	0xd
+#define DS_LEVEL14	0xe
+#define DS_LEVEL15	0xf
+
+#endif
-- 
2.49.0


