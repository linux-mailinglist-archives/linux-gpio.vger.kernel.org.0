Return-Path: <linux-gpio+bounces-35253-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDWkLJP75Wm/pwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35253-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:10:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED342939C
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 12:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 933E9303FF96
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 10:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D967A3939CE;
	Mon, 20 Apr 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b9CuFERb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7238F950;
	Mon, 20 Apr 2026 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679635; cv=fail; b=rCSS7ohT2tc0qdARXSjgIVt5QQX4iyjdl5h6tE0X+8uiGzzN/rkQvNeYqZeR05w4lvx1Mvr09uwZ19+5F7jgklvg3MKWCExFtgnq2lcurnXgJewRQ//q0esEyfau0pIJshWDO3+RCxv+V2mFoC5jlFM2zUoptMzTJj4dNOL0dnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679635; c=relaxed/simple;
	bh=ubRrx7jOqwc/UUyt/GOc+5CS22bE97/PTc3Sml8Y6S4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bz1BTL5qV5y/4mkW3Tez2X7DSvrZlcgSHA/rgke5t/FMQbyX8OJum4K2UoUGZVjMMXbavHgQicKNbHJ/q33oBgN7bF6FoG3kNKtWCVq4pPKvradqITgASYgBWuWkuMP86Z8b/eP15av2S5UluyZSEADTQkPZ0Zal85Z4GDkEYp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b9CuFERb; arc=fail smtp.client-ip=40.93.194.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmZBJiKwp93BRAieEY06Nx0zpG93Wr3ZJJ74umZgy9TNndrUQTuJaxLlx9T5MK3Azq1AJUeXxHs3+KRxkY4xxkwvqqd136coGKoRU1eWX+u9qlQp33NdqpPbOKTQ6g2ZzUwa3huWwJnsvQe8bpQ+P6G7nFBixX2pz+aJn3mUwOPj4w2rnz2WyRKPNMeDnRgpTWgeCI55ZJUrWDSOzl5GAPCvclGXrdYJcqgcuF8NiGw+hXsGQIzJ0yeyqS4xJp3y1Bj5dnCj7Q0fDCpJvkbhd/Ez91KmKG+31/yAgSTSM2pcPEXQJYPVZslzWOl1p40M7VycmSR+uRzN3JmTu/GIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZChUkAv1u915SL96VS3ZwhnZYnCK23ofv+A7rYEt+0=;
 b=yTGr86TtfAsqUqxfsFX7Voclk/CCWH1a0FwTf4XhflLpBuXNGn4K5qMOYzjN0yOUQkRTAtMWpafuc0X/6XRXgFdWztZ5DnuQ5UIfspE0sKRARqMzGMAZPTEQV5pbfANGaj1nHjOvCwf388G1EGFAVUIDqg8G4WU5OZthED75pKzEenxncaPu8eFfdYwAcPRDPqzqe1glrScB9YkEG9433x62jYqZ6HO9XaarAaJNokL6C8CVo2Tb2cJs5WgkE04cZSBpRr9HLxXylwnhMC01BJBIxiX2Sa76es0sBKI/ZgNcBTSZvCMMpcqEWV3T2QJWpUY4qQW2HUHVUDA/pES9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZChUkAv1u915SL96VS3ZwhnZYnCK23ofv+A7rYEt+0=;
 b=b9CuFERb+Uqnc6Zku/p6OlD28BdikedXVQYphQY2EK/6Zt76+s093lKZVe+XJHDOLlVUvmRi3JOy+dLkXEDsY0S1AzyVe/9VjR7wJ7kchWd1aPW7EmsREpIpVvLFU8R+QkyxL6fYL4vKBA/Mf1LjURLE6LH15i+wuqe2uwV4hxaCuG3U8FcG1QTVuwcUNHNgRmt6sFekb8ERu4XtaHhI98dBmBmf71B2Eht/873MtJ/e0AdWjYChwIhLM/aPKWujXMOrF7mUftCzawIHw2BuRbeGZLC0o6tDeBCufDpuaATHhi3kiFRN5D9ZwrEqcJaIfoFYRCcW3AZa6DMclpzOdw==
Received: from BL0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:91::18)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 10:07:04 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::c2) by BL0PR05CA0008.outlook.office365.com
 (2603:10b6:208:91::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 10:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 10:07:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:06:52 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 03:06:51 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Apr 2026 03:06:47 -0700
From: <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>
CC: <pshete@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <webgeek1234@gmail.com>,
	<rosenp@gmail.com>, <linux-tegra@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/6] dt-bindings: pinctrl: Document Tegra264 pin controllers
Date: Mon, 20 Apr 2026 10:05:59 +0000
Message-ID: <20260420100601.343707-5-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420100601.343707-1-pshete@nvidia.com>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cce397-9fd2-4138-1e32-08de9ec49269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|13003099007|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yS7hqdnaHfqLrlsEv1GwHSNIIfF8sYjzzdG0QJelQWjog9mcHjBE0Msd3xPXwWZ92ihggRjP7xhCJLd8W5Tc8tcTlXVr/xZAa9Ms5c6ko6ccHYngieeDhybj0mbBGCW2x6lpJ4RM9MrT/Woo3rvw4b7knTA2aztn8xlAZRmBLh+vgKePaETBSD2DkyhpEbeDEEXWqFMLfEeQvfSfaQvJJKDRrH6nI2i1pHeqNstCD4SUpYaCh6g0l2nXVG0ukFeuaSGE537Bww3znvuyu2N4eDSI38sqP50p0i7YC3XXv1AYoJIg2LqxCYsM/AY1tZFsxkEqp02rDd/xvOmj6VlpYwGNMl4mvY7GdjedRCeR0CpWDS8FpYl7wBrYg73qzu7/4wzhRy1fJPRwDGFCBMQE9tANqjxuzb9V+8uEXeeA4Ie72edV3z7JJHxDV5NLkEsRMQacU3jWujmh4anD0QUSOvh4fWEwz/t+UAPFrsNRo+6A4hc36AIEykrZO/AyLTSYGjjlijk8Th9beDs9A3zBvqR5KsMDBplYitZs37i1+vpWZRWkcyWVCfPuh1RtPNVrjF+f7mMUqIncPacvuwxS5j0+gvsMj//2LIiuv7sLIkuaTY9IM2ezI9Y3MhXu/rK9cys/V1S+GpfFYSdvneBSOkBIvRbqbsP8cq5NxR12gG4CknAhM6GpV5saQCg3kvugiaMEk65U4buw7Em6LnDi0LqdYeqvZuHv2y+nOvWG8NkmQZD+uO7ri5n8UsUKlQ8mz0Baw24dSvxlafr7SSrk7Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(13003099007)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rHnBauC3i4l3lOk3WFEpVs4jVYF0zJv6GO4AK6RcBZPWD4WYyeRZ828HRIMX1cGYVpQqwo2a6X+C76Jqi+fTbUN44Z01N0NyhJkI0BOf3D8p3Z/OUlNl5BNQwnGwulW/4nAtaoDiniDy0vsfRnPswf+YcVAkDPEpCKLbtE1D/CPnfy+EhAnVT8cgqF/n7q89iqJmUaXUMV9PJrxvs6IW8lzUIxe8wjF8PP85vmRFt8V8w/gv5p+YKj6J/he8MRyy8cOSWLc/uE/zusehNU5ClysXLm1pTjfqkgB8K+o8pcXOUCS9tWgpNAbo27emRlZJ4D1kgCLc6jkK5kr1x4sGuWi6d4LVCNpw51VO+NylW+mV4OWL1vdSzaGXsuSzccgovPJlxvnvr123knQYPgnRaETyucrSp7PJhLUnsQTxe5iCHLT7ZFoQ4vAIPjKhRPmD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:07:03.8525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cce397-9fd2-4138-1e32-08de9ec49269
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35253-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email,c7a2000:email,devicetree.org:url,c281000:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 36ED342939C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Tegra264 contains three pin controllers. Document their
compatible strings and describe the list of pins and
functions that they provide.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
  - Add a 'required:' block listing 'compatible' and 'reg'.
  - Switch top-level 'unevaluatedProperties: false' to
    'additionalProperties: false'.
---
 .../pinctrl/nvidia,tegra264-pinmux-aon.yaml   |  80 +++++++++
 .../nvidia,tegra264-pinmux-common.yaml        |  84 +++++++++
 .../pinctrl/nvidia,tegra264-pinmux-main.yaml  | 167 ++++++++++++++++++
 .../pinctrl/nvidia,tegra264-pinmux-uphy.yaml  |  78 ++++++++
 4 files changed, 409 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml
new file mode 100644
index 000000000000..682e6510ed45
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-aon.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra264-pinmux-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra264 AON Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra264-pinmux-aon
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
+      $ref: nvidia,tegra264-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ soc_gpio00_paa0, vcomp_alert_paa1, ao_retention_n_paa2,
+                    batt_oc_paa3, bootv_ctl_n_paa4, power_on_paa5,
+                    hdmi_cec_paa6, soc_gpio07_paa7, soc_gpio08_pbb0,
+                    soc_gpio09_pbb1, gen2_i2c_scl_pcc0, gen2_i2c_sda_pcc1,
+                    gen3_i2c_scl_pcc2, gen3_i2c_sda_pcc3, gp_pwm4_pcc4,
+                    uart0_tx_pcc5, uart0_rx_pcc6, spi2_sck_pcc7,
+                    spi2_miso_pdd0, spi2_mosi_pdd1, spi2_cs0_n_pdd2,
+                    soc_gpio21_pdd3, soc_gpio22_pdd4, soc_gpio23_pdd5,
+                    soc_gpio24_pdd6, soc_gpio25_pdd7, soc_gpio26_pee0,
+                    soc_gpio27_pee1, soc_gpio28_pee2, soc_gpio29_pee3,
+                    drive_ao_retention_n_paa2, drive_batt_oc_paa3,
+                    drive_power_on_paa5, drive_vcomp_alert_paa1,
+                    drive_bootv_ctl_n_paa4, drive_soc_gpio00_paa0,
+                    drive_soc_gpio07_paa7, drive_soc_gpio08_pbb0,
+                    drive_soc_gpio09_pbb1, drive_hdmi_cec_paa6,
+                    drive_gen2_i2c_scl_pcc0, drive_gen2_i2c_sda_pcc1,
+                    drive_gen3_i2c_scl_pcc2, drive_gen3_i2c_sda_pcc3,
+                    drive_gp_pwm4_pcc4, drive_uart0_tx_pcc5,
+                    drive_uart0_rx_pcc6, drive_spi2_sck_pcc7,
+                    drive_spi2_miso_pdd0, drive_spi2_mosi_pdd1,
+                    drive_spi2_cs0_n_pdd2, drive_soc_gpio21_pdd3,
+                    drive_soc_gpio22_pdd4, drive_soc_gpio23_pdd5,
+                    drive_soc_gpio24_pdd6, drive_soc_gpio25_pdd7,
+                    drive_soc_gpio26_pee0, drive_soc_gpio27_pee1,
+                    drive_soc_gpio28_pee2, drive_soc_gpio29_pee3 ]
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
+    pinmux@c7a2000 {
+        compatible = "nvidia,tegra264-pinmux-aon";
+        reg = <0xc7a2000 0x2000>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&state_default>;
+
+        state_default: pinmux-default {
+            uart0 {
+                nvidia,pins = "uart0_tx_pcc5";
+                nvidia,function = "uarta_txd";
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yaml
new file mode 100644
index 000000000000..d644c496d8a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-common.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra264-pinmux-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra264 Pinmux Common Properties
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+$ref: nvidia,tegra-pinmux-common.yaml
+
+properties:
+  nvidia,function:
+    enum: [ dca_vsync, dca_hsync, rsvd0, dp_aux_ch0_hpd, dp_aux_ch1_hpd,
+            dp_aux_ch2_hpd, dp_aux_ch3_hpd, gp_pwm2, gp_pwm3, i2c7_clk,
+            i2c7_dat, i2c9_clk, i2c9_dat, uartk_cts, uartk_rts, uartk_rxd,
+            uartk_txd, spi3_cs0, spi3_cs3, spi3_din, spi3_dout, spi3_sck,
+            uartf_cts, uartf_rts, uartf_rxd, uartf_txd, spi1_cs0, spi1_cs1,
+            spi1_din, spi1_dout, spi1_sck, extperiph2_clk, extperiph1_clk,
+            i2c12_clk, i2c12_dat, nv_therm_fan_tach0, gp_pwm9, uartj_cts,
+            uartj_rts, uartj_rxd, uartj_txd, i2c0_clk, i2c0_dat, i2c1_clk,
+            i2c1_dat, i2s2_lrck, i2s2_sclk, i2s2_sdata_out, i2s2_sdata_in,
+            gp_pwm10, uarte_cts, uarte_rts, uarte_rxd, uarte_txd, i2c5_dat,
+            i2c5_clk, i2s6_sdata_in, i2s6_sdata_out, i2s6_lrck, i2s6_sclk,
+            i2s4_sdata_out, i2s4_sclk, i2s4_sdata_in, i2s4_lrck, spi5_cs0,
+            spi5_din, spi5_dout, spi5_sck, aud_mclk, i2s1_sclk, i2s1_sdata_in,
+            i2s1_sdata_out, i2s1_lrck, i2c11_clk, i2c11_dat, xhalt_trig,
+            gp_pwm1, gp_pwm6, gp_pwm7, gp_pwm8, ufs0, pe1_clkreq_l, pe1_rst_l,
+            pe2_rst_l, pe2_clkreq_l, pe3_clkreq_l, pe3_rst_l, sgmii0_sma_mdio,
+            sgmii0_sma_mdc, usb_vbus_en0, usb_vbus_en1, eth1_mdio, pe4_clkreq_l,
+            pe4_rst_l, pe5_clkreq_l, pe5_rst_l, eth0_mdio, eth0_mdc, eth1_mdc,
+            eth2_mdio, eth2_mdc, eth3_mdio, eth3_mdc, qspi0_cs_n, qspi0_io0,
+            qspi0_io1, qspi0_io2, qspi0_io3, qspi0_sck, sdmmc1_clk, sdmmc1_cmd,
+            sdmmc1_comp, sdmmc1_dat3, sdmmc1_dat2, sdmmc1_dat1, sdmmc1_dat0,
+            qspi3_sck, qspi3_cs0, qspi3_io0, qspi3_io1, dcb_vsync, dcb_hsync,
+            dsa_lspii, dce_vsync, dce_hsync, dch_vsync, dch_hsync, bl_en,
+            bl_pwm_dim0, rsvd1, soc_therm_oc3, i2s5_sclk, i2s5_sdata_in,
+            extperiph3_clk, extperiph4_clk, i2s5_sdata_out, i2s5_lrck,
+            sdmmc1_cd, i2s7_sdata_in, spi4_sck, spi4_din, spi4_dout, spi4_cs0,
+            spi4_cs1, gp_pwm5, i2c14_clk, i2c14_dat, i2s8_sclk, i2s8_sdata_out,
+            i2s8_lrck, i2s8_sdata_in, i2c16_clk, i2c16_dat, i2s3_sclk,
+            i2s3_sdata_out, i2s3_sdata_in, i2s3_lrck, pm_trig1, pm_trig0,
+            qspi2_sck, qspi2_cs0, qspi2_io0, qspi2_io1, dcc_vsync, dcc_hsync,
+            rsvd2, dcf_vsync, dcf_hsync, soundwire1_clk, soundwire1_dat0,
+            soundwire1_dat1, soundwire1_dat2, dmic2_clk, dmic2_dat,
+            nv_therm_fan_tach1, i2c15_clk, i2c15_dat, i2s7_lrck,
+            ccla_la_trigger_mux, i2s7_sclk, i2s7_sdata_out, dmic1_dat,
+            dmic1_clk, dcd_vsync, dcd_hsync, rsvd3, dcg_vsync, dcg_hsync,
+            dspk1_clk, dspk1_dat, soc_therm_oc2, istctrl_ist_done_n,
+            soc_therm_oc1, tsc_edge_out0c, tsc_edge_out0d, tsc_edge_out0a,
+            tsc_edge_out0b, touch_clk, hdmi_cec, i2c2_clk, i2c2_dat, i2c3_clk,
+            i2c3_dat, gp_pwm4, uarta_txd, uarta_rxd, spi2_sck, spi2_din,
+            spi2_dout, spi2_cs0, tsc_sync1, tsc_edge_out3, tsc_edge_out0,
+            tsc_edge_out1, tsc_sync0, soundwire0_clk, soundwire0_dat0,
+            l0l1_rst_out_n, l2_rst_out_n, uartl_txd, uartl_rxd, i2s9_sclk,
+            i2s9_sdata_out, i2s9_sdata_in, i2s9_lrck, dmic5_dat, dmic5_clk,
+            tsc_edge_out2 ]
+
+  # out of the common properties, only these are allowed for Tegra264
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
+# We would typically use unevaluatedProperties here but that has the
+# downside that all the properties in the common bindings become valid
+# for all chip generations. In this case, however, we want the per-SoC
+# bindings to be able to override which of the common properties are
+# allowed, since not all pinmux generations support the same sets of
+# properties. This way, the common bindings define the format of the
+# properties but the per-SoC bindings define which of them apply to a
+# given chip.
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
new file mode 100644
index 000000000000..c40409d3263c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-main.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra264-pinmux-main.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra264 Main Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra264-pinmux-main
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
+      $ref: nvidia,tegra264-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ pwm1_pa0, pwm6_pa1, pwm7_pa2, pwm8_pa3, ufs0_ref_clk_pa4,
+                    ufs0_rst_n_pa5, soc_gpio250_pf0, soc_gpio251_pf1,
+                    soc_gpio252_pf2, dp_aux_ch0_hpd_pf3, dp_aux_ch1_hpd_pf4,
+                    dp_aux_ch2_hpd_pf5, dp_aux_ch3_hpd_pf6, pwm2_pf7, pwm3_pg0,
+                    gen7_i2c_scl_pg1, gen7_i2c_sda_pg2, gen9_i2c_scl_pg3,
+                    gen9_i2c_sda_pg4, sdmmc1_clk_px0, sdmmc1_cmd_px1,
+                    sdmmc1_dat0_px2, sdmmc1_dat1_px3, sdmmc1_dat2_px4,
+                    sdmmc1_dat3_px5, sdmmc1_comp, soc_gpio124_pl0,
+                    soc_gpio125_pl1, fan_tach0_pl2, soc_gpio127_pl3,
+                    soc_gpio128_pl4, soc_gpio129_pl5, soc_gpio130_pl6,
+                    soc_gpio131_pl7, gp_pwm9_pm0, soc_gpio133_pm1, uart9_tx_pm2,
+                    uart9_rx_pm3, uart9_rts_n_pm4, uart9_cts_n_pm5,
+                    soc_gpio170_pu0, soc_gpio171_pu1, soc_gpio172_pu2,
+                    soc_gpio173_pu3, soc_gpio174_pu4, soc_gpio175_pu5,
+                    soc_gpio176_pu6, soc_gpio177_pu7, soc_gpio178_pv0,
+                    pwm10_pv1, uart4_tx_pv2, uart4_rx_pv3, uart4_rts_n_pv4,
+                    uart4_cts_n_pv5, dap2_clk_pv6, dap2_din_pv7, dap2_dout_pw0,
+                    dap2_fs_pw1, gen1_i2c_scl_pw2, gen1_i2c_sda_pw3,
+                    gen0_i2c_scl_pw4, gen0_i2c_sda_pw5, pwr_i2c_scl_pw6,
+                    pwr_i2c_sda_pw7, soc_gpio138_pp0, soc_gpio139_pp1,
+                    dap6_sclk_pp2, dap6_dout_pp3, dap6_din_pp4, dap6_fs_pp5,
+                    dap4_sclk_pp6, dap4_dout_pp7, dap4_din_pq0, dap4_fs_pq1,
+                    spi5_sck_pq2, spi5_miso_pq3, spi5_mosi_pq4, spi5_cs0_pq5,
+                    soc_gpio152_pq6, soc_gpio153_pq7, aud_mclk_pr0,
+                    soc_gpio155_pr1, dap1_sclk_pr2, dap1_out_pr3, dap1_in_pr4,
+                    dap1_fs_pr5, gen11_i2c_scl_pr6, gen11_i2c_sda_pr7,
+                    soc_gpio350_ps0, soc_gpio351_ps1, qspi0_sck_pt0,
+                    qspi0_cs_n_pt1, qspi0_io0_pt2, qspi0_io1_pt3, qspi0_io2_pt4,
+                    qspi0_io3_pt5, soc_gpio192_pt6, soc_gpio270_py0,
+                    soc_gpio271_py1, soc_gpio272_py2, soc_gpio273_py3,
+                    soc_gpio274_py4, soc_gpio275_py5, soc_gpio276_py6,
+                    soc_gpio277_py7, soc_gpio278_pz0, soc_gpio279_pz1,
+                    xhalt_trig_pz2, soc_gpio281_pz3, soc_gpio282_pz4,
+                    soc_gpio283_pz5, soc_gpio284_pz6, soc_gpio285_pz7,
+                    soc_gpio286_pal0, soc_gpio287_pal1, soc_gpio288_pal2,
+                    cpu_pwr_req_ph0, gpu_pwr_req_ph1, uart10_tx_ph2,
+                    uart10_rx_ph3, uart10_rts_n_ph4, uart10_cts_n_ph5,
+                    spi3_sck_ph6, spi3_miso_ph7, spi3_mosi_pj0, spi3_cs0_pj1,
+                    spi3_cs3_pj2, uart5_tx_pj3, uart5_rx_pj4, uart5_rts_n_pj5,
+                    uart5_cts_n_pj6, spi1_sck_pj7, spi1_miso_pk0, spi1_mosi_pk1,
+                    spi1_cs0_pk2, spi1_cs1_pk3, extperiph1_clk_pk4,
+                    extperiph2_clk_pk5, gen12_i2c_scl_pk6, gen12_i2c_sda_pk7,
+                    drive_cpu_pwr_req_ph0, drive_gpu_pwr_req_ph1,
+                    drive_uart10_cts_n_ph5, drive_uart10_rts_n_ph4,
+                    drive_uart10_rx_ph3, drive_uart10_tx_ph2,
+                    drive_spi3_cs0_pj1, drive_spi3_cs3_pj2,
+                    drive_spi3_miso_ph7, drive_spi3_mosi_pj0,
+                    drive_spi3_sck_ph6, drive_uart5_cts_n_pj6,
+                    drive_uart5_rts_n_pj5, drive_uart5_rx_pj4,
+                    drive_uart5_tx_pj3, drive_spi1_cs0_pk2,
+                    drive_spi1_cs1_pk3, drive_spi1_miso_pk0,
+                    drive_spi1_mosi_pk1, drive_spi1_sck_pj7,
+                    drive_extperiph2_clk_pk5, drive_extperiph1_clk_pk4,
+                    drive_gen12_i2c_scl_pk6, drive_gen12_i2c_sda_pk7,
+                    drive_soc_gpio124_pl0, drive_soc_gpio125_pl1,
+                    drive_fan_tach0_pl2, drive_soc_gpio127_pl3,
+                    drive_soc_gpio128_pl4, drive_soc_gpio129_pl5,
+                    drive_soc_gpio130_pl6, drive_soc_gpio131_pl7,
+                    drive_gp_pwm9_pm0, drive_soc_gpio133_pm1,
+                    drive_uart9_cts_n_pm5, drive_uart9_rts_n_pm4,
+                    drive_uart9_rx_pm3, drive_uart9_tx_pm2,
+                    drive_sdmmc1_clk_px0, drive_sdmmc1_cmd_px1,
+                    drive_sdmmc1_dat3_px5, drive_sdmmc1_dat2_px4,
+                    drive_sdmmc1_dat1_px3, drive_sdmmc1_dat0_px2,
+                    drive_qspi0_cs_n_pt1, drive_qspi0_io0_pt2,
+                    drive_qspi0_io1_pt3, drive_qspi0_io2_pt4,
+                    drive_qspi0_io3_pt5, drive_qspi0_sck_pt0,
+                    drive_soc_gpio192_pt6, drive_soc_gpio138_pp0,
+                    drive_soc_gpio139_pp1, drive_dap6_din_pp4,
+                    drive_dap6_dout_pp3, drive_dap6_fs_pp5,
+                    drive_dap6_sclk_pp2, drive_dap4_dout_pp7,
+                    drive_dap4_sclk_pp6, drive_dap4_din_pq0,
+                    drive_dap4_fs_pq1, drive_spi5_cs0_pq5,
+                    drive_spi5_miso_pq3, drive_spi5_mosi_pq4,
+                    drive_spi5_sck_pq2, drive_soc_gpio152_pq6,
+                    drive_soc_gpio153_pq7, drive_soc_gpio155_pr1,
+                    drive_aud_mclk_pr0, drive_dap1_sclk_pr2,
+                    drive_dap1_in_pr4, drive_dap1_out_pr3,
+                    drive_dap1_fs_pr5, drive_gen11_i2c_scl_pr6,
+                    drive_gen11_i2c_sda_pr7, drive_soc_gpio350_ps0,
+                    drive_soc_gpio351_ps1, drive_gen0_i2c_scl_pw4,
+                    drive_gen0_i2c_sda_pw5, drive_gen1_i2c_scl_pw2,
+                    drive_gen1_i2c_sda_pw3, drive_dap2_fs_pw1,
+                    drive_dap2_clk_pv6, drive_dap2_din_pv7,
+                    drive_dap2_dout_pw0, drive_pwm10_pv1,
+                    drive_soc_gpio170_pu0, drive_soc_gpio171_pu1,
+                    drive_soc_gpio172_pu2, drive_soc_gpio173_pu3,
+                    drive_soc_gpio174_pu4, drive_soc_gpio175_pu5,
+                    drive_soc_gpio176_pu6, drive_soc_gpio177_pu7,
+                    drive_soc_gpio178_pv0, drive_uart4_cts_n_pv5,
+                    drive_uart4_rts_n_pv4, drive_uart4_rx_pv3,
+                    drive_uart4_tx_pv2, drive_pwr_i2c_sda_pw7,
+                    drive_pwr_i2c_scl_pw6, drive_soc_gpio250_pf0,
+                    drive_soc_gpio251_pf1, drive_soc_gpio252_pf2,
+                    drive_dp_aux_ch0_hpd_pf3, drive_dp_aux_ch1_hpd_pf4,
+                    drive_dp_aux_ch2_hpd_pf5, drive_dp_aux_ch3_hpd_pf6,
+                    drive_pwm2_pf7, drive_pwm3_pg0,
+                    drive_gen7_i2c_scl_pg1, drive_gen7_i2c_sda_pg2,
+                    drive_gen9_i2c_scl_pg3, drive_gen9_i2c_sda_pg4,
+                    drive_soc_gpio270_py0, drive_soc_gpio271_py1,
+                    drive_soc_gpio272_py2, drive_soc_gpio273_py3,
+                    drive_soc_gpio274_py4, drive_soc_gpio275_py5,
+                    drive_soc_gpio276_py6, drive_soc_gpio277_py7,
+                    drive_soc_gpio278_pz0, drive_soc_gpio279_pz1,
+                    drive_soc_gpio282_pz4, drive_soc_gpio283_pz5,
+                    drive_soc_gpio284_pz6, drive_soc_gpio285_pz7,
+                    drive_soc_gpio286_pal0, drive_soc_gpio287_pal1,
+                    drive_soc_gpio288_pal2, drive_xhalt_trig_pz2,
+                    drive_soc_gpio281_pz3 ]
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
+    pinmux@c281000 {
+        compatible = "nvidia,tegra264-pinmux-main";
+        reg = <0xc281000 0xc000>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&state_default>;
+
+        state_default: pinmux-default {
+            sdmmc1 {
+                nvidia,pins = "sdmmc1_clk_px0";
+                nvidia,function = "sdmmc1_cd";
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml
new file mode 100644
index 000000000000..9a54795d9cc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra264-pinmux-uphy.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra264-pinmux-uphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra264 UPHY Pinmux Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra264-pinmux-uphy
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
+      $ref: nvidia,tegra264-pinmux-common.yaml
+
+      properties:
+        nvidia,pins:
+          items:
+            enum: [ eth1_mdio_pe0, pex_l4_clkreq_n_pd0, pex_l4_rst_n_pd1,
+                    pex_l5_clkreq_n_pd2, pex_l5_rst_n_pd3, eth0_mdio_pd4,
+                    eth0_mdc_pd5, eth1_mdc_pe1, eth2_mdio_pe2, eth2_mdc_pe3,
+                    eth3_mdio_pd6, eth3_mdc_pd7, pex_l1_clkreq_n_pb0,
+                    pex_l1_rst_n_pb1, pex_wake_n_pc2, pex_l2_rst_n_pb3,
+                    pex_l2_clkreq_n_pb2, pex_l3_clkreq_n_pb4, pex_l3_rst_n_pb5,
+                    sgmii0_sma_mdio_pc0, sgmii0_sma_mdc_pc1, soc_gpio113_pb6,
+                    soc_gpio114_pb7, pwm1_pa0, pwm6_pa1, pwm7_pa2, pwm8_pa3,
+                    ufs0_ref_clk_pa4, ufs0_rst_n_pa5, drive_eth1_mdio_pe0,
+                    drive_pex_l4_clkreq_n_pd0, drive_pex_l4_rst_n_pd1,
+                    drive_pex_l5_clkreq_n_pd2, drive_pex_l5_rst_n_pd3,
+                    drive_eth0_mdio_pd4, drive_eth0_mdc_pd5, drive_eth1_mdc_pe1,
+                    drive_eth2_mdio_pe2, drive_eth2_mdc_pe3, drive_eth3_mdio_pd6,
+                    drive_eth3_mdc_pd7, drive_pex_l1_clkreq_n_pb0,
+                    drive_pex_l1_rst_n_pb1, drive_pex_wake_n_pc2,
+                    drive_pex_l2_rst_n_pb3, drive_pex_l2_clkreq_n_pb2,
+                    drive_pex_l3_clkreq_n_pb4, drive_pex_l3_rst_n_pb5,
+                    drive_sgmii0_sma_mdio_pc0, drive_sgmii0_sma_mdc_pc1,
+                    drive_soc_gpio113_pb6, drive_soc_gpio114_pb7,
+                    drive_pwm1_pa0, drive_pwm6_pa1, drive_pwm7_pa2,
+                    drive_pwm8_pa3, drive_ufs0_ref_clk_pa4, drive_ufs0_rst_n_pa5 ]
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
+    pinmux@82e0000 {
+        compatible = "nvidia,tegra264-pinmux-uphy";
+        reg = <0x82e0000 0x4000>;
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinmux_default>;
+
+        pinmux_default: pinmux-default {
+            pex {
+                nvidia,pins = "pex_l1_rst_n_pb1";
+                nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+                nvidia,tristate = <TEGRA_PIN_DISABLE>;
+                nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+            };
+        };
+    };
-- 
2.43.0


