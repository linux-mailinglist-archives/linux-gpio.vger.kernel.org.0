Return-Path: <linux-gpio+bounces-25993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24FCB54275
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78897A065E3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 06:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A928C28466A;
	Fri, 12 Sep 2025 06:06:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022108.outbound.protection.outlook.com [52.101.126.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1914F2773EF;
	Fri, 12 Sep 2025 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657218; cv=fail; b=juEmnwELspVgDZGZWqeWmTBl2AjBaKi/L/5d+It9w9WOEEdlEK+OXm63TRfUjJf7a5SqlTEo98pwIJM1YSuGGHzvmhV+6MNZHY4w/CXozTM/PCESLR3pS9tXSbXoRmy38PoahP7sLy/Ondx8Qa7FXg7it5WoAGaosJ1Ec9d+FHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657218; c=relaxed/simple;
	bh=5fG+Hepf3FhqbdcraPvBAxgi2Ndkzax5gQjzkoHFD3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dkVtLa4NLwk4ICylDz7T0JhT3oGM/6ceIbkOXG8U3sDQ1huotv6i2QZm0z+OlVHqXwX6V03VmO2aUGTxWDgM/W+9EFD5WzhTrC03JZmheLi/+yqeas6hVZxXzl9yNCej8NU3w5e/yq/OY9vbnSEMlCl39dBZfRwr1UInO/86x6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYai6yrM3CBvukHxurx7WJ+Qg77aF2JoPi1sVihqUgANj/BgRI3ZohqhMMw7hpXrAkXf1AJQvXXP3Cm2Meawvru1xXxXADY4MknN4SEF7RPIYP3ccvKflQ49gyhxSy/QRY1KR1yIUJ0liys2bVsWB8zMqC+Ew73Sa8M+rlbh0yx8IX8DDlBfDzEodw0d/HBJT2/gzQUoh+CRC5oP4ccyREWI1E21WXx53dV9Xb/vhDMaBj3dRAPaJuIbQ9CDUebhN0Ia+ItYl4qUGyTF8bPnebe+HhG9WVjn5Ccv659iksSSufyD1VQWwK0csFUMWGTfnmDLQGY5vTsL8Bn1Wvv3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX4pW+g8iv7NZC+AIShr1VAEZNoejnLoMkjWPhesGaM=;
 b=twNRnEB4zt2e5MFgtr1eUuv8zxdmFhjt2AAnp1vEHBrkIWjzsCpl+DfATuHVar34Z9i76S7I37OZwR4SFwLk8JZVA+7DSfLrFcuiRnuGmcqjkpTLnVhXnWqbrnp6gQFL7A0icLJhIG+pxySA/ILwbs+sFKdQSfuycagTKRWJZ3Ylsss3Kt2SsdjLH8anN1FQ9/rz/fhPWeWfhtK5lxReIm/1RPclBl6hipT/7aW6q4siRRKqeMkXE11eO/1fA91uf/PrDeLNC/d08Ttd2JG6DeHogmJHoPZz3mHX+QVFsBarj6a4Vqb2f74SggMXeezN70cu6uRhCEWvaI3l9mvFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTP286CA0027.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:216::15)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 06:06:52 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:604:216:cafe::29) by OSTP286CA0027.outlook.office365.com
 (2603:1096:604:216::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 06:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 06:06:51 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C4D8141C0156;
	Fri, 12 Sep 2025 14:06:50 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Date: Fri, 12 Sep 2025 14:06:49 +0800
Message-ID: <20250912060650.2180691-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912060650.2180691-1-gary.yang@cixtech.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|JH0PR06MB6917:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 94a9ea1f-abad-4935-873b-08ddf1c29132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MCXGbbj8mSnqlyIE8u1yiGy0UEY2AWzhxOxtJvQM5Y8IAmD27Zu/Rtk3AO9T?=
 =?us-ascii?Q?l2f5cmoKgpqQWBdUnDrsK2ZMH46+BjJzrQW2HF1DKw+/JxJmoPGhEhD0UxR/?=
 =?us-ascii?Q?mtDxt/tU9Mcf6wB2EqVxOu9l0wIS2UmP8e59fuzkAJdcG0ER+cYnzSDxChBt?=
 =?us-ascii?Q?uba6s/Azrn5R953MFz5TdT4av6lCP7GWgQKTodhb5f1Irfo7ubSDHDA7hjmf?=
 =?us-ascii?Q?zbj2NKA3IqUen8Ul8SiO+lZy4fiYHe///Y0DcBI7yHDzS+2ktaibHGDwwlVm?=
 =?us-ascii?Q?h9/dAQS3jDBKzT2Td6v8jktEB1jqziPHPIJVkHVAkYzrNnv7w0GSFVdi87Fp?=
 =?us-ascii?Q?8IcZL5HKjjlZTp4D6meIwYV9JQlMGMlhNM6W9zFJpaVL8spKfE9NNPHVZNmy?=
 =?us-ascii?Q?bkPi94K/z3KHeIj14EqizILRGb7Anye6Z9X/qb0Kkk2XWvObNUHhk1iH9KpF?=
 =?us-ascii?Q?oownCP76kCPDB1bYVYQSKZMI/nQfR5xCBsbC30vF8kN0rgDRBLd7tBq7UxQS?=
 =?us-ascii?Q?eXoa1cIE6KE3WwMd0xWl53NNewCkB/R3Mu9OB5sL2W1xEd4C9KfUo3K9ltrk?=
 =?us-ascii?Q?ZTVLTGSweR5aHylmjO/9ke9AQzKzb8+O/jED9NE2UwKnQihc9TMv9HRm49zO?=
 =?us-ascii?Q?M6emNYc/0OEr+18uZl6FcK+BKEsPacipfyX2YtEM/r/R7I+aODUz8ifGrks1?=
 =?us-ascii?Q?CkCEVgFxxWB5Z+izjLZ+/BC8YxFSqkKQ7Uce4GwnydkEpyKWLGfD2ZetIjc2?=
 =?us-ascii?Q?Q36tMPtDqNbDEAe3Wbwql6m0wp9W+7u0ogXqcstATOiFTP6Hv8fdg0CSiDPw?=
 =?us-ascii?Q?Pm+spimAdNWfmPS9tEQkdKc0jbdaNuzLTLSdTxTFByxL1D5nKZi/r8i9oqSp?=
 =?us-ascii?Q?IXKBRuFRtdkrsaXANnpf0RtNxFdhRUCrxFqpeqiGt2hlmHwfuasCuDFprgm3?=
 =?us-ascii?Q?D9FCetPOfslPswVaTF4+5NK9cm0Dj9BDMZPslHAT9BcXCZvrc6/aIhgZxRTH?=
 =?us-ascii?Q?Plnku9rJbz7+aCCJTu/j0yP0IG0+aG+VZApCEfzjaqpVMhKzUiYsY2WVQCh3?=
 =?us-ascii?Q?//HAM0Gi14Xdv9lM8ik+P9WdxfIaqgeBqyujVMNoJXaCvVZS6ij6xAvQHo3+?=
 =?us-ascii?Q?8Ea1btbZcPTeRs7oSiS6772chfLBl2oIuXZrUkxvE2oZGbdjc7gLpbFoyAlb?=
 =?us-ascii?Q?sRUCsPYvyu5oU3xjFbcDur4cHvJ7OP8nup68qt7GcY2dMxOktCPiqFKSgnyY?=
 =?us-ascii?Q?2xEKu/geoViRHTSDO163zAAOz38hDTosVF7uGS14BwKzLwo1mTH06CN+1Ofy?=
 =?us-ascii?Q?TIGU5lRJawa0orUm8EDwGxtH5Zw02Ty2aWa9CrAwI+P6+gtlwjfv7ZeWWNNG?=
 =?us-ascii?Q?nyXzYFi5ztlEm02iLnnCTqj4Y5BcDsWd+Fim4HMwW9rnVms68wVV0r6NVcdr?=
 =?us-ascii?Q?kT8gK0b5qW/SRhKlZwN1WRAOD/ylCesZMbUFsSVU4GU806N/0iDHtw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 06:06:51.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a9ea1f-abad-4935-873b-08ddf1c29132
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917

The pin-controller is used to control the Soc pins.
There are two pin-controllers on Cix Sky1 platform.
One is used under S0 state, the other is used under
S5 state.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
new file mode 100644
index 000000000000..c4a127fd8330
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -0,0 +1,85 @@
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
+  The pin-controller is used to control Soc pins. There are two pin-controllers
+  on Cix Sky1 platform. one is used under S0 state, the other one is used under
+  S5 state.
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
+required:
+  - compatible
+  - reg
+
+# Client device subnode's properties
+patternProperties:
+  'pins$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '(^pins|pins?$)':
+        type: object
+        additionalProperties: false
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, and drive strength.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are
+              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.h directly.
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            description:
+              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
+              See arch/arm64/boot/dts/cix/sky1-pinfunc.h for valid arguments.
+
+        required:
+          - pinmux
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
+    #define DS_LEVEL4 (4)
+    iomuxc: pinctrl@4170000 {
+        compatible = "cix,sky1-iomuxc";
+        reg = <0x4170000 0x1000>;
+
+        wifi_vbat_gpio: wifi-vbat-gpio-pins {
+            pins-wifi-vbat-gpio {
+                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
+                bias-pull-up;
+                drive-strength = <DS_LEVEL4>;
+           };
+        };
+    };
-- 
2.49.0


