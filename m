Return-Path: <linux-gpio+bounces-33283-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E3tDvoKs2nURwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33283-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:50:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19B277570
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33BCA30805D7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5753FFAC9;
	Thu, 12 Mar 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FIFKzjDU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF53FF8B1;
	Thu, 12 Mar 2026 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341363; cv=fail; b=uxkLMVdWkMmURT1IcmJ40ikjTFkLX3rvaQY+4Rnrjv9r65q0m1JJawHxglnhM58jLwoDRXim9R8CSuLYRp70AGaMjeq60wJnIyegI0lACNZ6BI/phGMrSTDIDVYJ47tDwotGv/DfapTH9TOnrKn01MYeX+ilIho2s7/3MzDRZEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341363; c=relaxed/simple;
	bh=dwMm1Lacwl9gmxIzfW/QOpv+tkLhyPRge8D4xHVxW/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rxZtcpDTHyjOUieJpLaMUEoogK7PH9WDv+u7tUwvdiAdr34hPdB+B7bPzUGQNNVuCXjev4U1bW8RYJvMdx8L/PHmwvB5u/MBhCoMjdypo6iitSTVSEXmHESGJethM9RGGa62YmUSwxpLH2Ao7e+dKzY7qh95Uv0nuYJwxirPwKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FIFKzjDU; arc=fail smtp.client-ip=40.93.198.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWzMNiYrZ8ciaFqqmwAn9kYSsBnSd4D3ka6TE/dmfiGlBOB5fGSK62WQ9C8/TVSv7sUYmVbvEgl+MJx3A0XUxiE5raZmVjQxf/bWat1ZDdOqWNOVj5sWGTL3PoNMwu+OhG7esbjQztGtpMkc6/H5D7gpR7t+xXQUKIk9V2ukeRubTHKFvATfcWqdUFQoGqRUJLFlRkfObO1/a46aHyKhTyWMMhjfSM8OtZKlIMDq58hoYlW+RSB7iZxo6HM+CvPje0/AKPMvyCseuZgJJfMcmaztwZ4YFC0QEB6Lwz+Poz7xPD9zwX/B5n5raNxL5ZdIpc08+RmJwmapb85exy0MSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqU5rMW+F/vZ7Qsmt1aFMR8+KGZORLBCA3uuoWUY3Ig=;
 b=ZcEH69TZZUeK8KGEiC8NMZsXRj7L6wOYspF0pKA70KyIZMumnbK1fkOqXvRFXYBxwXElrNe2PK6RSLjsfEbAXAEAbeAoFUuEKK4ahKVizjDufxMeo6eEjMx3nkM2/2Ykr3J5Ir0tS/WXvg54A+pmw/qKbj0jKDNIV3dDK04lWPztyvMMsBAhogf5Lzfkve/9WU4p1GUZqTbkPvueUGKCNRtF0l4i0b0Htmr4PCd0YT9LkxKqxjTrKQMzSqwN15XhUyFVaOeE7c8LKBTQiZBkpnT+REuejHRSiSeqcaax4A/E4dpReq59+hGz+e35SP/QbrjrUfFfvWT0gyml++k8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqU5rMW+F/vZ7Qsmt1aFMR8+KGZORLBCA3uuoWUY3Ig=;
 b=FIFKzjDUTbUrSko9RE0Z4HhQUfhX0/IZ/1gl8U0cErgccvRma9YZ9ecNvKxNb0/9Om+93j1C7b/7G0VN3unJ2KzJWULKw2ff9Jw81QUnQujjQivAg+9k/zVdcns5171RJt+weFxSmcgpZtxHbzB6GSag1iw5i2UbZLbrclEDCHA=
Received: from SJ0PR03CA0177.namprd03.prod.outlook.com (2603:10b6:a03:338::32)
 by PH8PR10MB6454.namprd10.prod.outlook.com (2603:10b6:510:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 18:49:19 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::35) by SJ0PR03CA0177.outlook.office365.com
 (2603:10b6:a03:338::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Thu,
 12 Mar 2026 18:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:18 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:17 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:17 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54l2829533;
	Thu, 12 Mar 2026 13:49:12 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 1/8] dt-bindings: mfd: Add bindings for TI TAC5x1x MFD core
Date: Fri, 13 Mar 2026 00:18:26 +0530
Message-ID: <20260312184833.263-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260312184833.263-1-niranjan.hy@ti.com>
References: <20260312184833.263-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|PH8PR10MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f25944b-3283-46b9-05c9-08de8068111e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4GwBBHsoxbwKBeG7pN/rF/xl9e1o8SNHeKpiY3fHRlTQzT7VV9xHwsvcCOrbTbY95OjM7o83pDjpGNRwAWfAyMHsnruSPc3aDyZepDxJaGHbxr4VRD7Gf8v63EsPPwLp6EuoqK/ZkGsp1Zakro3ZCbd1sY/ADK5JZ6Gh29WEyfH206trPfa566KtNHvvsF5cpLSTATYt21l9ir8PuVzaAfG8NOGUsFDnQby43Ba6OlnGXneyMY/u1v2JXk5Bar3gt8Cmk2D+dyi7xDfsflTY/3tTJRO2c+Va6UCI511Fg7McGdKx7CAoHfG28mJgGI/IMAWjutulvVZk9ATF1A+ZBQ88za1+z4r8xlyQ18zwKBtcVx6MW7Oqe4UpZO0yXnFDWf8BRW5F+XbbP40FrufRcYzw/womXhC7C8TxVHWS4c0St2XarrYQ63lkH/54fd/+3hUJdwxJILycroCAhpK3vtVHpWtiZtkw9d0Y3M8rfSua2DKWwRfkrMfUTZIvxVnbOzmFgbpjEcG7kR6wJ6JINoWtZcsUKxWvZmoqbjZ8TWTIH34HxtVOICK4GQ7a1CMO0SlNA6fuYfLa2gd+Angq5o+Uwif/XGGvATPOfdm8jEXU2iFejLnDsuf/89ghgzG4wmrnYCuAsIzptLaZAbXeLsp/Qq7b4BJ0td4VAtgTCWmS1YxWszdh/YrGhvQB0tN6Opao/Oik8om4Iuu3X4nWTKJXEO/ITq1LLMavtZe9n9k=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OztIpSH2GmuJiRJbbmP6gSURCDTPRNX4AczpjJu/q7N4fmMzE9fepjkyygUU9UPVEeF1VYHg7ebe7vW8P5dwfsh2ZhlLRfWh6JGfPRh5m0OMuFBAFPKDfFRCOxSMEAYB/6R22yMhjveegKrbBQbm6YVVUnW7Y4KH+q8ovhHGRIocY39rrl+lxQV/4Vj8y5QgIJAEI6kCwIBMj261Qi2tkJaJjOJj34kw2PXpaDMXKtJJj8NfLnfxC7m+8agyLnJxlnCJ7BF5+kdC677iqkGB5+6af3/jSlc6Y8d2reSJD/Yh7sR3O1ZOjBG+5WPE3qbAsmzzyaMw2EdvAi4p2tyvOMOmoq/0rDdG2k3vmDbeiIglIBfyR3cpw0gejOeu6ccuItaR8SjjAsG5slNqbzQdf6XOn9xpWywLRwGZfvTHD8d9hSA+kYg0SKwqiBpP+xAD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:18.4052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f25944b-3283-46b9-05c9-08de8068111e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6454
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33283-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE19B277570
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for the Texas Instruments TAC5x1x family of
audio codecs with integrated GPIO controller, describing the MFD core
device interface, power supplies, and clock configuration.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 .../devicetree/bindings/mfd/ti,tac5x1x.yaml   | 247 ++++++++++++++++++
 1 file changed, 247 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml b/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
new file mode 100644
index 000000000000..3d7943c0411f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
@@ -0,0 +1,247 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tac5x1x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TAC5x1x Multi-Function Audio Device
+
+maintainers:
+  - Niranjan H Y <niranjan.hy@ti.com>
+
+description: |
+  TAC5x1x family of low-power, high-performance audio codecs with integrated
+  GPIO controller and diagnostic capabilities.
+
+  This is the parent binding. Child nodes are bound by these bindings:
+  - Pin controller: Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
+  - Audio codec: Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
+
+  Hardware features:
+  - Audio ADC/DAC with configurable impedance and voltage references
+  - 4-pin GPIO controller with alternate functions (PDM, IRQ)
+  - Analog voltage and current monitoring circuits
+  - Diagnostic fault detection with interrupt generation
+
+  Device datasheets can be found at:
+    TAA5212:    https://www.ti.com/lit/ds/symlink/taa5212.pdf
+    TAA5412-Q1: https://www.ti.com/lit/ds/symlink/taa5412-q1.pdf
+    TAC5111:    https://www.ti.com/lit/ds/symlink/tac5111.pdf
+    TAC5112:    https://www.ti.com/lit/ds/symlink/tac5112.pdf
+    TAC5211:    https://www.ti.com/lit/ds/symlink/tac5211.pdf
+    TAC5212:    https://www.ti.com/lit/ds/symlink/tac5212.pdf
+    TAC5301:    https://www.ti.com/lit/ds/symlink/tac5301-q1.pdf
+    TAC5311-Q1: https://www.ti.com/lit/ds/symlink/tac5311-q1.pdf
+    TAC5312-Q1: https://www.ti.com/lit/ds/symlink/tac5312-q1.pdf
+    TAC5411-Q1: https://www.ti.com/lit/ds/symlink/tac5411-q1.pdf
+    TAC5412-Q1: https://www.ti.com/lit/ds/symlink/tac5412-q1.pdf
+    TAD5112:    https://www.ti.com/lit/ds/symlink/tad5112.pdf
+    TAD5212:    https://www.ti.com/lit/ds/symlink/tad5212.pdf
+
+properties:
+  compatible:
+    enum:
+      - ti,taa5212
+      - ti,taa5412
+      - ti,tac5111
+      - ti,tac5112
+      - ti,tac5211
+      - ti,tac5212
+      - ti,tac5301
+      - ti,tac5311
+      - ti,tac5312
+      - ti,tac5411
+      - ti,tac5412
+      - ti,tad5112
+      - ti,tad5212
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  reset-gpios:
+    maxItems: 1
+    description: Hardware reset control pin (active low)
+
+  interrupts:
+    maxItems: 1
+    description: |
+      Interrupt from device diagnostic circuits to host processor.
+      Generated on voltage/current fault conditions and other diagnostic events.
+
+  clocks:
+    maxItems: 1
+    description: Master clock input (MCLK)
+
+  clock-names:
+    items:
+      - const: mclk
+
+  avdd-supply:
+    description: |
+      Analog supply voltage input (AVDD pin).
+      Typical voltages: 1.8V, 3.0V, 3.3V, 5.0V
+
+  iovdd-supply:
+    description: |
+      Digital I/O supply voltage input (IOVDD pin).
+      Typical voltages: 1.8V, 3.3V
+
+  ti,vref-voltage:
+    description: |
+      Internal voltage reference setting in microvolts.
+
+      Supported values:
+      - 1375000: VREF = 1.375V
+      - 2500000: VREF = 2.5V
+      - 2750000: VREF = 2.75V
+
+      Constraint: Selected VREF must be lower than AVDD supply voltage.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1375000, 2500000, 2750000]
+    default: 2500000
+
+  ti,micbias-voltage:
+    description: |
+      Microphone bias output voltage in microvolts.
+
+      Configuration options:
+      - VREF voltage: Set to same value as ti,vref-voltage
+      - 0.5 × VREF: Set to half of ti,vref-voltage value
+      - AVDD voltage: Set to AVDD supply voltage value
+
+      Note: When set to AVDD voltage, hardware automatically overrides
+      VREF setting to 2.75V regardless of ti,vref-voltage property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 687500
+    maximum: 3300000
+
+  ti,adc1-impedance:
+    description: |
+      ADC Channel 1 input impedance in Ohms.
+      Supported impedance values:
+      - 5000: 5k input impedance
+      - 10000: 10k input impedance
+      - 40000: 40k input impedance
+      Available only for TAC5111, TAC5211, TAC5212, and TAA5212 variants.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [5000, 10000, 40000]
+    default: 10000
+
+  ti,adc2-impedance:
+    description: |
+      ADC Channel 2 input impedance in Ohms.
+      Supported impedance values:
+      - 5000: 5k input impedance
+      - 10000: 10k input impedance
+      - 40000: 40k input impedance
+      Available on stereo variants only (TAA5212, TAC5212).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [5000, 10000, 40000]
+    default: 10000
+
+  ti,out2x-vcom-cfg:
+    description: |
+      Channel OUT2x VCOM reference voltage selection.
+
+      Configuration options:
+      - 0: VCOM = 0.6 × VREF
+      - 1: VCOM = AVDD / 2
+
+      Available on devices with stereo DAC output.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  ti,gpa-threshold:
+    description: |
+      General Purpose Analog voltage monitoring thresholds in millivolts.
+      Format: [low_threshold_mv, high_threshold_mv]
+
+      Monitoring range: 0mV to 6000mV, Resolution: ~24mV per step
+      Default thresholds: 200mV (low), 2600mV (high)
+
+      Generates interrupt on voltage fault conditions.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 200
+      maximum: 6000
+    default: [200, 2600]
+
+  ti,in-ch-en:
+    description: |
+      Enable input channel diagnostic monitoring circuits.
+
+      When enabled (1), activates hardware monitoring for:
+      - Input channel fault detection
+      - Micbias current monitoring (if ti,micbias-threshold configured)
+      - Input overvoltage detection
+
+      Available on: TAC5301, TAC5311, TAC5312, TAC5411, TAC5412, TAA5412
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  ti,out-ch-en:
+    description: |
+      Enable output channel diagnostic monitoring circuits.
+
+      When enabled (1), activates hardware monitoring for:
+      - Output channel fault detection
+      - Driver fault monitoring
+      - Short circuit detection
+
+      Available on: TAC5301, TAC5311, TAC5312, TAC5411, TAC5412, TAA5412
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  ti,incl-se-inm:
+    description: |
+      Include INxM pins in single-ended input diagnostic scan.
+
+      When enabled (1), includes negative input pins (INxM) in diagnostic
+      monitoring for single-ended input configurations.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  ti,incl-ac-coup:
+    description: |
+      Include AC-coupled input channels in diagnostic scan.
+
+      When enabled (1), includes AC-coupled input channels in the
+      diagnostic monitoring system.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  ti,micbias-threshold:
+    description: |
+      Microphone bias current monitoring thresholds in microamps.
+      Format: [low_threshold_ua, high_threshold_ua]
+
+      Current monitoring range: 100uA to 33000uA, Resolution: ~132uA per step
+      Default thresholds: 2600uA (low), 18000uA (high)
+
+      Hardware monitors actual current flow through MICBIAS pin.
+      Generates interrupts on fault conditions when ti,in-ch-en = <1>.
+
+      Available on: TAC5301, TAC5311, TAC5312, TAC5411, TAC5412, TAA5412
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 100
+      maximum: 33000
+    default: [2600, 18000]
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - iovdd-supply
+
+unevaluatedProperties: false
-- 
2.34.1


