Return-Path: <linux-gpio+bounces-33284-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGMbDvoLs2nURwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33284-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:54:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D445C277641
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E2130E8DF6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52FA3FFAA0;
	Thu, 12 Mar 2026 18:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RB8ZC25y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011036.outbound.protection.outlook.com [52.101.57.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B9E31D381;
	Thu, 12 Mar 2026 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341384; cv=fail; b=FDB3vsMX6VLH5adSnaIpzHbmee7pguBPnI3dnc9CN+AWgx9w2c8rMumZncCNmQxvTQ7jXwWolFRwSE0qyr36Sj2dbLLurUmquP6dWx8DV8cKVC1z2w4ur3Efnt9OAodUOUYLYDtaFAQNPKE7aN6wmFtuERzqRL5GW2JK25PTInU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341384; c=relaxed/simple;
	bh=vQp4HSG2HOUaDxotPKC10eQmTfIa+p1M5DgV1uLg2d0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfzukrgO0vr0xMYMmnsu5UyrLUBA5v4Kkd8bAxQ2GAOQ7t0I7u1ApHij7ozhIDGreclDucLflTh02phCt1zNpXEPyL3ZKLB1crzTyH2C7TAhp3mlk+YQTVgb+HRSf8yiTnI1Ge8NghO+q0PjB6xzuUKE8MRs945ryPAE+9OvYwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RB8ZC25y; arc=fail smtp.client-ip=52.101.57.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRqyPmvZp4NMnvbbwUVX0p1I25qMunceE94fkcaDewITLSVE9Ty0g/VZzGH8WDd+2eJi5qeCQqUl5RP5X1aVAahPPn/9Y3Vk0yIXDyK9HC5zwxArGn3dc7MKptD4tnTo1QOgOFaYSZZ3ZSMfxl3pHKsoAuoHZHD7n1TXz502fUluOXZMLRqVB7g2jpuyN9NiiOGvF76zZQw2G64MfU7ghd/sKLUwBuL31SUQ+IwfmGF6rqg9n8dJSrerxnUDYXJlh9w4fxMEeqwJIoUz4P1mL/5jG+4yIPbG2GfknanXqEH+c9920QF+IoyytOCbS/aj/s1FGRN4J6abd8AaITALuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLfiu6Krl08DiSvqz6RHt2YNj0fp02mekiZHNeX6EXU=;
 b=OLa/l60/BtMea1WMsKwlbs2zadg9kRY2owVGqTZC8ODrdRqzqZEYXFdz3vXrTNZV4AnY0beErx1Cvc9x41s8/fKDJpTCnSmAoVBbB4BYcGxx1O1o2mOLedWV+cSLPuXfgMTgCWVEz+LYtu5survJYoUGz59Cn0a0bdSFSvf460jS1XRzHLEMc9RwlfbtZwOWbQWyYvTSXTqZmQ3x4qNEUxsptvYGWKbDfqlK3NaweUVLUn0OiVN9wWVYz2JjCJySDlzQnEgaoQ8XYjtNuIdfJ/ckLZ7OwEkU8UE3NdLKzrh7i9KkXPgvpeNkBhZWRW0sGQ0Ymu+qD+1L71qEOt6Zqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLfiu6Krl08DiSvqz6RHt2YNj0fp02mekiZHNeX6EXU=;
 b=RB8ZC25y6c3Xs22DEdtqyyRXyFaVUBh/MB8dUZM5ViY1LWSmzJwJDszW3/P0rcatuEJdWUQ0Wf1XxXmgB0vFe8/0agd9u9OHbb2yC7i9ORVHkymS5mJZRXRW/Rrv0l/2TRsZANjKbuPmZwDtSKqUX0nohsiopMRo1NLHvNPmJMQ=
Received: from CH0PR04CA0048.namprd04.prod.outlook.com (2603:10b6:610:77::23)
 by PH7PR10MB6334.namprd10.prod.outlook.com (2603:10b6:510:1b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Thu, 12 Mar
 2026 18:49:32 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::8b) by CH0PR04CA0048.outlook.office365.com
 (2603:10b6:610:77::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 18:49:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:30 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:24 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:23 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54m2829533;
	Thu, 12 Mar 2026 13:49:18 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 2/8] dt-bindings: pinctrl: Add bindings for TI TAC5x1x pinctrl
Date: Fri, 13 Mar 2026 00:18:27 +0530
Message-ID: <20260312184833.263-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260312184833.263-1-niranjan.hy@ti.com>
References: <20260312184833.263-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|PH7PR10MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: e3435f88-c9db-42b0-aea9-08de80681824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hyjFZR31JVt0VaC2o9KHOJWdp9sx9wJcuvslokYZHhF8JcPa+mtffFODCheGzOXEDVXkcZZHleFdxnnc9aoRO6tPMMv3L3dJ6KJByguBvM7Eya+lIMhdyS79jZV8uGnmYxi/SVMs43AGSMUetsN69lGL7el4tuWJE4OO0qW9KFXLorRuQm+qdiaSha+lUh0mUlETmqoqucT+Z2I3rORoy+Wjaz3YlCgpcWnoz4FfCeijZnxXvA8jy+uiJGD4agGIOLHkqK7dMwcvfvV9J3MPdUgDdYsYDs5s6tD2b6C7A2jJom7i0hfMoFCBQilBNSqWI2r8hzcj/tuCZF1H1djrFNXNzgh72YgOG1MM2lvUq38aCPWspRsYn5MqptTtw7wq+sGXB8eekO+aFOi1paYQ7hmzfzbPrj/OiUaZzeGsPYQ1u1AMTKx51xKIl3z0hnQz0OJN6vA1b4r7f7KPWgOBiMVal0Eb4a6LeX6YLm2WI1O75MdInPqW1XyUHPi1n0a9riOhvuxsUb7d14Ldvn3gqrUUMn9ak7IQ6VKJ7vMxoRNYvrCAIpy694tOcdhGk0botxjk5m/3I7J/oc/T0NLevt+PkACwPs+Bij/7mb0accnvoJlMv3d1iNDyNob5Qjh5CeD0gLyWi61fVMRjJRvi4JF2mF87vFZ+jG/ldXKk9kKWLLF06kA6w5YvlpRl693Ou9mrlVzcFfomk3BfDLr+CuWsmvPig3/ttymVNvb/qq4=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hcB6vOe40vELvxNbd43c05NI0qBCKW7BlU6vEwwnlzayRVV2gD8BGBA7NiFCi+SLobbaQ30OhoR0v4f0YUs47xKYqNcSU/ESyPflws9paoMaG4OQxugiOrGMFh12GBqpTrA7r0FVTAKHYtsZ7G6/TxjAJTFJhhP2t1Rnm91rAlpmXFZTqwH6fP7NS364et9y7a1sU4Sdfqg6YRsYgewjeYYByDcNiv9ROVvvwcUsNkaenAOaKd/Xp1T3cCriaSaF8XPRq1PxTVJXrR7bSRLyrcl3IYw1X1Zdv3pd1zM7PHtFYmEnX38KwuG86JAoz38YAoSWNSbUwnE304mrTvLQ2jwxIwbDrLMD9pfOmrwypy53EDMnjp11P5y36VkojZNwXTCeM2usl9iCoykGD09c/qQct/gMF0a4HDNndE39mX/tvfpSAvK93QVGXSRC5VnJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:30.2276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3435f88-c9db-42b0-aea9-08de80681824
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6334
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	TAGGED_FROM(0.00)[bounces-33284-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D445C277641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for the Texas Instruments TAC5x1x family
pin controller. These bindings define the GPIO and pin control
configuration interface for the device.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 .../bindings/pinctrl/ti,tac5x1x-pinctrl.yaml  | 163 ++++++++++++++++++
 include/dt-bindings/pinctrl/tac5x1x.h         |  44 +++++
 2 files changed, 207 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/tac5x1x.h

diff --git a/Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
new file mode 100644
index 000000000000..3ccb262d6247
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ti,tac5x1x-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TAC5x1x Pin Controller
+
+maintainers:
+  - Niranjan H Y <niranjan.hy@ti.com>
+
+description: |
+  The TAC5x1x devices have 5 configurable pins that can be used for GPIO
+  or alternate functions like PDM (Pulse Density Modulation) and interrupt
+  generation. A subset of pins can be present in any variant of the HW.
+
+  This binding is used as a child node of the main TAC5x1x MFD device
+  described in Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
+
+  Pin capabilities:
+  - GPIO1, GPIO2: Bidirectional, configurable as GPIO, PDM clock, or IRQ output
+  - GPO1: Output only, configurable as GPIO, PDM clock, or IRQ output.
+          Some variants use different name GPO1A.
+  - GPI1: Input only, configurable as GPIO or PDM data input
+          Some variants use different name GPI1A.
+  - GPI2A: Input only, configurable as GPIO or PDM data input
+
+properties:
+  compatible:
+    const: ti,tac5x1x-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description: |
+      First cell is the pin number (0-4 corresponding to GPIO1, GPIO2, GPO1, GPI1, GPI2A)
+      Second cell is flags (GPIO_ACTIVE_HIGH or GPIO_ACTIVE_LOW)
+
+  gpio-ranges:
+    maxItems: 1
+    description: GPIO range mapping to pin controller
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 5
+    description: Names for the GPIO lines
+
+patternProperties:
+  '-state$':
+    type: object
+    description: Pin configuration state
+    $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    patternProperties:
+      '^.*$':
+        type: object
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
+        properties:
+          groups:
+            description: Pin groups to configure
+            items:
+              enum:
+                - gpio1
+                - gpio2
+                - gpo1
+                - gpi1
+                - gpi2a
+                - pdm_gpio1_gpio2
+                - pdm_gpio1_gpi1
+                - pdm_gpio1_gpi2a
+                - pdm_gpio2_gpio1
+                - pdm_gpio2_gpi1
+                - pdm_gpio2_gpi2a
+                - pdm_gpo1_gpio1
+                - pdm_gpo1_gpio2
+                - pdm_gpo1_gpi1
+                - pdm_gpo1_gpi2a
+
+          function:
+            description: Function to assign
+            enum:
+              - gpio
+              - pdm
+              - irq
+
+          drive-push-pull:
+            type: boolean
+            description: Enable push-pull drive mode
+
+          drive-open-drain:
+            type: boolean
+            description: Enable open-drain drive mode
+
+          drive-open-source:
+            type: boolean
+            description: Enable open-source drive mode
+
+          bias-pull-up:
+            type: boolean
+            description: Enable pull-up bias
+
+          bias-pull-down:
+            type: boolean
+            description: Enable pull-down bias
+
+          bias-high-impedance:
+            type: boolean
+            description: Set pin to high impedance
+
+          input-enable:
+            type: boolean
+            description: Enable input buffer
+
+          output-enable:
+            type: boolean
+            description: Enable output buffer
+
+        required:
+          - groups
+          - function
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl {
+        compatible = "ti,tac5x1x-pinctrl";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 5>;
+        gpio-line-names = "GPIO1", "GPIO2", "GPO1", "GPI1", "GPI2A";
+
+        default_state: default-state {
+            pdm_config {
+                groups = "pdm_gpo1_gpi1";
+                function = "pdm";
+                drive-push-pull;
+            };
+
+            gpio_config {
+                groups = "gpio1", "gpio2";
+                function = "gpio";
+                bias-pull-up;
+            };
+
+            irq_config {
+                groups = "gpo1";
+                function = "irq";
+                drive-open-drain;
+            };
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/tac5x1x.h b/include/dt-bindings/pinctrl/tac5x1x.h
new file mode 100644
index 000000000000..8cc3fa0b7946
--- /dev/null
+++ b/include/dt-bindings/pinctrl/tac5x1x.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Device Tree binding constants for TAC5x1x pinctrl
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated
+ * Author: Niranjan H Y <niranjan.hy@ti.com>
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_TAC5X1X_H
+#define _DT_BINDINGS_PINCTRL_TAC5X1X_H
+
+/* Pin IDs */
+#define TAC5X1X_PIN_GPIO1 0
+#define TAC5X1X_PIN_GPIO2 1
+#define TAC5X1X_PIN_GPO1 2
+#define TAC5X1X_PIN_GPI1 3
+#define TAC5X1X_PIN_GPI2A 4
+
+/* Pin functions */
+#define TAC5X1X_FUNC_GPIO 0
+#define TAC5X1X_FUNC_PDM 1
+#define TAC5X1X_FUNC_IRQ 2
+
+/* Pin drive modes */
+#define TAC5X1X_DRIVE_HIZ 0
+#define TAC5X1X_DRIVE_PUSH_PULL 1
+#define TAC5X1X_DRIVE_PULL_DOWN 2
+#define TAC5X1X_DRIVE_OPEN_DRAIN 3
+#define TAC5X1X_DRIVE_PULL_UP 4
+#define TAC5X1X_DRIVE_OPEN_SOURCE 5
+
+/* PDM configurations */
+#define TAC5X1X_PDM_GPIO1_GPIO2 0
+#define TAC5X1X_PDM_GPIO1_GPI1 1
+#define TAC5X1X_PDM_GPIO1_GPI2A 2
+#define TAC5X1X_PDM_GPIO2_GPIO1 3
+#define TAC5X1X_PDM_GPIO2_GPI1 4
+#define TAC5X1X_PDM_GPIO2_GPI2A 5
+#define TAC5X1X_PDM_GPO1_GPIO1 6
+#define TAC5X1X_PDM_GPO1_GPIO2 7
+#define TAC5X1X_PDM_GPO1_GPI1 8
+#define TAC5X1X_PDM_GPO1_GPI2A 9
+
+#endif /* _DT_BINDINGS_PINCTRL_TAC5X1X_H */
-- 
2.34.1


