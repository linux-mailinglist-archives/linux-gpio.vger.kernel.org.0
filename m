Return-Path: <linux-gpio+bounces-34942-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HeSKvqm12noQwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34942-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:17:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 923473CAF38
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A650302865E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876C43D75D6;
	Thu,  9 Apr 2026 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aBfFKjLK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E23B38B4;
	Thu,  9 Apr 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740479; cv=fail; b=akiHiB/AQKSKSWqWi5o5zVslRd85avKAzc+pw1IcaFhMfe1VVNljxTbzV5awk/newztkqTvPR8CXB9MvbwSg7VjYwqYqExwUBz8jFwzXOGLKBarSGU0us8V8IDKG96R8pTaeBGsUH3lBQEZpuVOSAlh3NtF+X4hyvv1XJZHAPqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740479; c=relaxed/simple;
	bh=MNbpWsnPXYfwdjynI/qdsXxIrj5OPSye2LKq/dgnCAs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbCkYEuhBklhGXBrLJ4UclzPfEH+08pLaMYa71G0saeK1kqhrwdV5xTkuv9qFVgxR2a3bgCkMbPDNgM6v+KAOAr4RsZ2abWIUVj1pJox5hUYR+2Uv9/cywTN4pFrhSwW5z9eQ87BciH0KlxhXoTWWzSPWSJexBece0ocq1ZfgcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aBfFKjLK; arc=fail smtp.client-ip=52.101.52.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox7dI54Lzx3n0tgpg+eeErSsxlMUPwARSAg+QM/qk+v9151g8YnNqmx0OoP2MLkSaf6sCUxd65WJ37eXeGIH80YjzGVDDbbZ+18H7N0vNP3PZEEriwbP4veCVoZDxxDtlep7agxuvOoWFLreFCL+F4ZLf4Qebr6DMwkh4Xlxr6wNzF3Uobd3k+ujDAEmbT+YjjNuvQhAdD6dZ0VpMyHClyiVQxRnDCDQLyyrCuupO7e9X9OlM+IxyAA9m3zyRdc1dRPrMjTdyHBXDAcCAnl5vmaOXFIsuSY5Pga7fMvbTSZY0wz7C+FIt/NISLcaq8VtxziBlGgCTcngGX3WSNEq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZkTMuyULiM5ePfbOvLKxrNNqFb2GWBYeWXmaGQh+vY=;
 b=hAOD9V7PsUchvSH3HJ7L9FwDW85evRPpy9rTwEoCHdeiWfqNb/1KdbJIJY1aS9fxnC+EVo8MjeW3FROJ1Tkl16DqWh/8DClvs6j7hg2E9qZkmz72juObP7X2zlVStxilMMmtZ4LtemSXPYtW4xK4uush39dnaC8b7ZsFeAlRO7A13IJN4K8BGDrdKM91DPn8PefocbRj+jQ9QGiLXbbEXO0I+eNjRF0v+4BqvANdH832wALpRpthYZUYZPeoXgL6dSnEVoAl4sch2qoIzDZ6iBfrHkKNQr6Qq6lqIH2t4C1T1E60F/+BVplMx2BtSxuB9JoICcFFksrmW6OdOSvydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZkTMuyULiM5ePfbOvLKxrNNqFb2GWBYeWXmaGQh+vY=;
 b=aBfFKjLKZzs3A73aPW1JDQ8IWgixeuQziRJjA7twczS+2ZXucwgZ4Z4TynhrI/n9IYtIddYn0nYLs5KHM0xoP3r+wPQ4G1M791UnEgHPESspr6m1MlQg90X/XyA2OntcVpQWO/qFIWcg8h1e7Bno34uMAhlLJfSKqQET+GAnOqKaUuqlZ6QoacSF3TuZ904jwTtHdD4MwYGRLOHVIOh+6cFE6mqtnNgmGGIhOEz5MPwTk7UkrWBvyZf4m0Q2bEy991PnZb7CtZcgJk1J33MRV2lYYxdxvMcEQ9eTMay0ahkqdimbWg3axN+yxYqgUHQd4ZFvtm7Nxyl0+xk+0DATIg==
Received: from MN2PR16CA0055.namprd16.prod.outlook.com (2603:10b6:208:234::24)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Thu, 9 Apr
 2026 13:14:25 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::2c) by MN2PR16CA0055.outlook.office365.com
 (2603:10b6:208:234::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 13:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 13:14:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:14:04 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 06:14:03 -0700
Received: from build-pshete-noble-20260401.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 9 Apr 2026 06:13:57 -0700
From: <pshete@nvidia.com>
To: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<arnd@arndb.de>, <bjorn.andersson@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<dmitry.baryshkov@oss.qualcomm.com>, <ebiggers@kernel.org>,
	<geert@linux-m68k.org>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <linusw@kernel.org>,
	<luca.weiss@fairphone.com>, <michal.simek@amd.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <robh@kernel.org>,
	<rosenp@gmail.com>, <sven@kernel.org>, <thierry.reding@kernel.org>,
	<webgeek1234@gmail.com>
CC: <pshete@nvidia.com>
Subject: [PATCH 2/6] dt-bindings: pinctrl: Document Tegra238 pin controllers
Date: Thu, 9 Apr 2026 13:13:36 +0000
Message-ID: <20260409131340.168556-3-pshete@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409131340.168556-1-pshete@nvidia.com>
References: <20260409131340.168556-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: f220f378-5965-44da-4475-08de9639ec12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|22082099003|921020|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	arH996hsDhIbO12reQ7aen6XX/1hcNF7jy73LteYHWqcr5BbJxUkA3rG4n9IOAzMARNGHsTOSi2OuuL1NgbPiSmfRXJy/ILA8eHr5dqZ6ovEmvLiInCEN8gH8yD3EgXpZ+eKb2OYu7gcNKLCb0g30hrqRPfJnreJPI4R2a6ZYKYcXkw2oGJoVB+hJVz+EOTtUe3L/7ENO2LDFptXkrtF49zvmVcV7avgHevK7QHaTPTm+f1FE8ZBo9FtLC7d2CyZyOB3BOKALVIRSbYnMIZr2GyCwkhTL7RNcFQABtYP9y6wvekccwoEKv3KCvRFYJlgNo389y5auGlf3MdsCDuHmNJXhuOMXrqKeHMwRUCyY0GiEBr+G3HW3buWYJLhTgvmBTjgjcVIeQrMD0jFry/fJpiZeLlm2lEIwFjvpSz3asktT5E4nIcUrHq92h6NoEfoFS3MuiJqBuoXMDYdw4zzRcpHSLTH+LYKxhNdt53mYCX8WzOy51Pp3eL7Uu4NPOfWBuViTu8XSaLNYlsYQkt8ym5zF4Vpizv0A7cNYQ9Si2Rz3GB2beuPURGoG24O826wixR4FkfsYPs3uLEIUM4K0CXELa5hjXmOC2kvi9DsVdd9T+KuPiohaD4EbHgSTkNQkSXpmrjdQ13nPWWgQ4lAu+bHf4D6T2NPndlPlBQdDaTqDaGPdSSdV07ym7NiybzBP8C2l/X0WHi+EcgM6ioQE8+ZwfuG2aMwR2v6Q0AboP21ZXFdGVnGn5IkepXnNgLsT+Ve53gh63+zjuF6l4g+vvyHTadiZmj84laqLOTKYsfckSA2/B9B6GO2wd/T3N8y
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(22082099003)(921020)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dBZH7dtCnDTA9Bzhg+APRTdu6nMpJ4dsO25oZA71WEuKlCZRBQf1b56FXojWzsbg09NpPYx4uYak0um6tFCkf0CK/FgP3d4ExlpcPfAM/F/eZ2NyrQCrcXV5l7xXOq7ISqkvH7VMGGFTsQvY8hJLruPIt6NWD40yHhKZjKzy15c9JUZn6SeZIbU/cNrOpf/f9GgxQM7P4e1gtsIOPM3TJcFpcxCVBDKmpan2RTbrT50gsY0I6xRpfdYCDh8yhzqgpK6WliqNcow6iXcvAatNQs2x1U7PTFmmcGvZ4Z0D4Wag6EdO3uoVcbqlgBET9euD9gFdVoPXO6PRSI8wF7adNp4mYEBYVv0awIRjobab54pSj6LkrtCVebssenM3v2NfCyI4HhVtsgHEXG4aWTlX6zkRSR4BE0SyMkFX9qZUuNK3A5NbJwkQYo2Cc9Zh50pC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:14:24.9213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f220f378-5965-44da-4475-08de9639ec12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34942-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,arndb.de,oss.qualcomm.com,kernel.org,linux-m68k.org,nvidia.com,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pshete@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 923473CAF38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prathamesh Shete <pshete@nvidia.com>

Tegra238 contains two pin controllers. Document their
compatible strings and describe the list of pins and
functions that they provide.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 .../pinctrl/nvidia,tegra238-pinmux-aon.yaml   |  78 +++++++
 .../nvidia,tegra238-pinmux-common.yaml        |  73 ++++++
 .../pinctrl/nvidia,tegra238-pinmux.yaml       | 215 ++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-common.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
new file mode 100644
index 000000000000..0521ba4d55f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux-aon.yaml
@@ -0,0 +1,78 @@
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
+unevaluatedProperties: false
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
index 000000000000..4513f0d9c2fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra238-pinmux.yaml
@@ -0,0 +1,215 @@
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
+unevaluatedProperties: false
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


