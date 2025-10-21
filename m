Return-Path: <linux-gpio+bounces-27337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F00BF4CC5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3DFF18C5967
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F49274B23;
	Tue, 21 Oct 2025 07:04:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023079.outbound.protection.outlook.com [52.101.127.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA4427381E;
	Tue, 21 Oct 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030259; cv=fail; b=mB7pYRw3anXohbjvc80cS5rBuPkweYnvlNhQ7cG4fdxYL+VSvagM7xpiS4QKfT+GpJrnyha/PfX1IWp29r5LNvCwtH4PTxERUKMNoWaOtbaD35mFPUWTdPpyita4G2b/q9fdLPI18WePpN32Gtza/wYka0XFAAj+EBUYBgagc7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030259; c=relaxed/simple;
	bh=r3a+njTM/AroUjP/sZs3Q9weIG3//ggMMjt14OwQwYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEz/vFBrrIiKCbPmsN32NaWLsgoD4f4W1nLIy2eOQZF3rRHA/38CitFLYMnJ1CZvXuUj9dR6LjappPpYJTJWVml4rWDbvhUN10/GK3VmgL9mz6y4jx/RDQd7GjRAnsZbEAkDMozY/AkllC0N03Dq7cKIGngzniAjI2H76+IJBBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBvXukHEiZGpIpvXQ59EIj8TowPDO4RcCfPokzr9fS+M4oU03JV1r+sWEeW3bm+agbsAURFB38yQd8M6a9jbudpDSbU2pm6wRjB0JbqgVc5UsT1Ji7FjiTpGomoavSCl40khMVKegv/yXNdw8i2Xs+WIOjcLJj2kCGOnJfm28DNOZ1u+3rDyu6SyaihsYIqmA0Kw5Gop/eG3sKwaEFuJtuLISms7DVH+AMY1pr7FXk5slvyhqkwGqw8QuMrj59dgwkI/OvZsoM4IePa69qqJqO7yGphRpiytjW5KAhy4MmYJ+Qe79ioku+3/059g9z/XYAfDNUWx7oX0u6u+Fi63eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehfiuk//1JrsyruokWTj4WAzfPbmII+v964/at++0u8=;
 b=bW3tUzZ4qH+SEwEHFzFUCOrCfCteNxPKDnU8arN+PDwzhEC31Pd/sYI/4O7g+FP1wMChqRs16I8D7PdKXn6ZkvznRQ2n/h+y7vcOL2HAC1Anjg2wxnio09P+3yiJ0gLYvs7lv8EXshsgl06Gi42DYP03IG2Ft6tz++hJIto9/6YvKLMgQZdcA+cf1GXrQShfjoJ2+ZsZp0oHABGQWIPSMqv+Tm4oqUxDkkE0sl+8RLhjDfKgQK0bXI0nbTlX/qI1KXqXuQEQBYshCpElLLGmsgUCAyNbkuegdvARZUA6J9h9bDmhzD1bTZbvxB3muVGrdtyngleLHjCpF3PKTgNcLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30) by
 PUZPR06MB6128.apcprd06.prod.outlook.com (2603:1096:301:116::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 07:04:13 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:be:cafe::2c) by SG3P274CA0018.outlook.office365.com
 (2603:1096:4:be::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Tue,
 21 Oct 2025 07:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 21 Oct 2025 07:04:11 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 057594143A8D;
	Tue, 21 Oct 2025 15:04:11 +0800 (CST)
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
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Date: Tue, 21 Oct 2025 15:04:08 +0800
Message-ID: <20251021070410.3585997-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021070410.3585997-1-gary.yang@cixtech.com>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|PUZPR06MB6128:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: faec0787-a14c-47bc-d75e-08de10700a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1+mO1y4ZEJ/DL6TgrgfD9xmC6CLgzmspJkzHgmuoy3gQZW9nPwOieEzt6X9d?=
 =?us-ascii?Q?khEPehZ5qXCL1zuniyi6Tt7YIuB9Uhpx1Y3yOfiLOubCcNUSFwN2dLsf9Xvt?=
 =?us-ascii?Q?J307Z/rtp12AzLRsnQL6OhMgQwbv0B46X2t7969/5KFuPG+q4fchFk/pDFYC?=
 =?us-ascii?Q?h2E5tYGsFaBcRJOku3vLcii+N/T3g6OHfmzCoTnCp4z9CWoV7fbZgypqU/p8?=
 =?us-ascii?Q?FFC3ULYYyNi7D1IhYffFh2Da/NQXGWcDLf3/1+MXYKfuF7yAI5Lc5f0uiXYw?=
 =?us-ascii?Q?/7o+V5tzL6/iClCoeghwx5IrgZZDvem+hRNOMmoVzsMqyv/BvibIEfqEZon+?=
 =?us-ascii?Q?sM0IpHQ+xugKnlKGUILsGCkdQ/H+2uv8PKeWCTMK1mBfUNdN3/2Po807EdS5?=
 =?us-ascii?Q?VaKmgVsxXPdGMmnpURs9YYgTUemkHtXvgW/NOw6NhuUSuFsGPId2f+Grj9z0?=
 =?us-ascii?Q?K9937Ola4gdUHyGc10yz2VWSZITKSuc+VJauzhfUVfm3CpBT05M2hcLCC3iD?=
 =?us-ascii?Q?O/KkFQDyvv2DfIO2hxVY9Ma4MBumx42r7A8pw5xvdaWuF0t9Z8PaNVw5AoqP?=
 =?us-ascii?Q?tKeNT6aHFcMXD0AIyIblrYP+3CwkkwoUUrzzCeamsqnqW/J6lfr3EBrDSP5u?=
 =?us-ascii?Q?mvwKC05cEnIT3RKHoeCmkerGPmDzfWRtRvKhVQCSw6oWkMYlnLAm1JpQGRLk?=
 =?us-ascii?Q?Shhs1PP6wNmfVvX9On6YLNXMjkebPGeeRx5rpFU2VuxUb2VbFss/pD1kb8FM?=
 =?us-ascii?Q?4bFb47B1Tta92Gj9nOFrQiK6BwDBbshaRnSNdonUBRTNYHDPNEWzXxPiIWrG?=
 =?us-ascii?Q?Ta6/BEilpHC8AB4uIRO3amZCVAo66o255Magmtd7Eoi3nw9DabsaeRwQYugu?=
 =?us-ascii?Q?u7aHM/z+A7rVyI2OpPh3ghE2xjCFF6hMax8yQET+w8Y4M+4fhTPKnFWLe0M8?=
 =?us-ascii?Q?TIbxtr1SdZ/9AT4/DpD4uUiBgxUZZgiY06Hu/D/wSIkHGbAXR5ez+Ix3VR3U?=
 =?us-ascii?Q?CkjMyiFwGdEoHlspOHl9KUV2IiHsrXwLBCvxrAI3Q0VBMtP4bt0hvX4H99wT?=
 =?us-ascii?Q?6A0rxTfVLOhpC8EyWzgW7sz4TZsQbnsUDC//U7LwDGQclyJ+eg+lFRtzexVQ?=
 =?us-ascii?Q?RJ8pUOPgYZzI6hjkME5K67OIUjUn9HcUyGDhfxtVCSGEs1kTsDXUdp2gjx5N?=
 =?us-ascii?Q?o4MU8/2oCOGJ8+oCiSjGlbdmGqmQo+CW6QX5fFKZp9Xi6H8b9sDFkwWly8H+?=
 =?us-ascii?Q?ozlP8Bc+rif/zdN5iaX/07cKgHih7itZShoM0eJ1ZPwmvRYz6PMh/HymYnFE?=
 =?us-ascii?Q?ZYaMkq9TXkjvn6HDcj8W9JXjB5lUK3RjG15NvZxFlS4lysDK2B1RAPXskbNN?=
 =?us-ascii?Q?rQEhSGD3AbRESbLNag2D9qjzNUQ2Y7v7+OG3kSN/I92BrDGZVVTRKodYxd7Y?=
 =?us-ascii?Q?RWthsEpHIarUklFfrFyo8SxL5772VS2dUsiiZZ4PkhfggNEkkuCeHKVwgFLq?=
 =?us-ascii?Q?P4tNoAdg09ihoI7ZctTPiiUxYHHFrP4Q6tKy?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:04:11.9833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faec0787-a14c-47bc-d75e-08de10700a16
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6128

The pin-controller is used to control the Soc pins.
There are two pin-controllers on Cix Sky1 platform.
One is used under S0 state, the other is used under
S0 and S5 state.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
new file mode 100644
index 000000000000..36977b0d745b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 Soc Pin Controller
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  The pin-controller is used to control Soc pins. There are two pin-controllers
+  on Cix Sky1 platform. one is used under S0 state, the other one is used under
+  S0 and S5 state.
+
+properties:
+  compatible:
+    enum:
+      - cix,sky1-pinctrl
+      - cix,sky1-pinctrl-s5
+
+  reg:
+    items:
+      - description: gpio base
+
+patternProperties:
+  '-cfg$':
+    type: object
+    additionalProperties: false
+
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    patternProperties:
+      'pins$':
+        type: object
+        additionalProperties: false
+
+        description:
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias pull,
+          and drive strength.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description:
+              Values are constructed from pin number and mux setting, pin
+              number is left shifted by 8 bits, then ORed with mux setting
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          drive-strength:
+            description:
+              typical current when output high level.
+            enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
+                    24 ]
+
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
+    pinctrl@4170000 {
+        compatible = "cix,sky1-pinctrl";
+        reg = <0x4170000 0x1000>;
+
+        wifi_vbat_gpio: wifi-vbat-gpio-cfg {
+            pins {
+                pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
+                bias-pull-up;
+                drive-strength = <8>;
+           };
+        };
+    };
-- 
2.49.0


