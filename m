Return-Path: <linux-gpio+bounces-22983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA7AFE7A6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22B91166C2D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51B5293B7D;
	Wed,  9 Jul 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AoWcOxC6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23B28F93F;
	Wed,  9 Jul 2025 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060449; cv=fail; b=qf6MENxrUn01omKv40HpzK2nQBkDCWAguaa+9+sMdXMut1sFuZ6w19CnMlDTpCG6dRoxR77JN+B4noaODS021Y02bpuJEY48AKpAfc88Gpj2Wqsfznc6xYzMXJZknTDeqZQq0J3qh1o3EXvqeFoHC6PIbLeT8rWMvcgyPOLF9dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060449; c=relaxed/simple;
	bh=CeMfwiSX4KYpeTXlYJUqcCNeoWO4PWI6eW3vQzO+EKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Usx0LXUUbO3IsxVJy3pBozSujKNW/zQjUmioZ3LqlPM5Bz8zny9D1CUGAHS7i9ht9XnlBp4ZFFxjMHEDqLqa4+ICPtgi2f4ykx3e3UOVVQy7swpgV20yhZeQzpG0U2hneXXnUZBrAR+SeMynoGrjL0ILXXl1vpGYgqcf1HAvWl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AoWcOxC6; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVf9XZfRq67mQniqIOp4FJwQBaYJNIUAHj/324QyqMWLlhUnUFWs1lrxkk9Vjx92eTKP56NjaK9JEYBeC1zxzg9Ps5YGjvhm/ND4DmPnYkt30SiZTc/CJMh92ixlljkv8pXgdOmuH5WRkT5kcsDInNVyXwiERKDCFP71XYOUOktBVRrfOjKhUXjwPwDLzgNdZE8upAioqgs/M9TzWevqIkbVqc4U2/+cvfkIch1+BVR85Q3TRpkI4sxyJGyEf6WoNz8lhOLSxcgc+YPj/gmzPfTSDew7M/YqiGBnrZRJ3b+/UorSH68hs05xh9iueaktD2jH5BdrKxRBTBpqSAPHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sheUkDL9QfZPWPGhSHUvcIi95ZzPE5dLgV1NBC3MqQ=;
 b=SPsQBeDQ8zm6DY6zytzcJNanCjs6ccFMrpq/YpALuqbU5mrXNokv+45WJECwQBPogEaF7NCPp1BWQu3KOnGHdg7TiICn69WLjPECueECLo00KkYEsWMszlUIL5IYCd2x7gemUKyCjJFmjIqB1Q6tMgNeOBDBZ/chkZtq/dojGGL05SDfhmqcG/1Wk1Hmkx+pP4+gubL33xDTj9ZyRkuLiu6QQkW9HwrhelWqRjm6t2dCIbf+PVUUfWYXquM5P/CtlnvRnQ7ayWVHmx92qUh0ygf2H0A3gUP3uDdwTBFl+E63PVEUobQeFvQ+f5HFLakT3wi4mio8qN9S6gh8dijSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sheUkDL9QfZPWPGhSHUvcIi95ZzPE5dLgV1NBC3MqQ=;
 b=AoWcOxC6o05tpyWzYGrUa5OYsEEdRZVZJe/ejTS2L6B5I0wD7EUgfHCCVcJij8fOmPywP1aQplE725RVYv+799A9XCD51lWBhoALBjwg35RdHpKJ8E5ZgxjsXG51FlEbKvWuAfF/uNfCttsVPP94X8R7dvWYg8NaE3m/DYi2Y8TlLefTFE7EOuuBglu1xS22jsr7PsgCYCL5oXUag5KV6qHllezQFsoPVbmZgLqyY8sysHbRYqsd6qU4pkkn7zlcyzW2JA5Z1Qxp7lBbOPKqJaP/U9TPbqqzJ4oEWj6E1bT04cxnr88IbO2c6ltOH/Y0z3avGDl6AGesiMp84H03Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:24 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:24 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/9] dt-bindings: gpio: add bindings for the QIXIS FPGA based GPIO controller
Date: Wed,  9 Jul 2025 14:26:50 +0300
Message-Id: <20250709112658.1987608-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::17) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 6066a2f6-f628-43d6-6f21-08ddbedb93db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tH7uwanqTcu32fgf0oazgikUKE0GCoc/c0ipH4If0mzwC7i8lp1WXEDTfu67?=
 =?us-ascii?Q?3sGo4MeZNd4TapeeGaFU0nwuFW10jPQLs5dZS4nMbcUw/JLJs6K7tUEYvwnw?=
 =?us-ascii?Q?Vb8dzmgRow9mJOOqSXKqZRnghZOyttXmislugg98aXUcbhBx+syTQQ5lL2A6?=
 =?us-ascii?Q?5bRLtEwFAa1MzFlOYJFTJ7qQJRLa9f6qIYHrPeSHoZ4OJL7SJuWTz59+wHh0?=
 =?us-ascii?Q?SkTx6UwJ+d1+8lIbB6I0sl2yn2PXstMifVppIVunDAzcBBrf3umpw+B387nl?=
 =?us-ascii?Q?eiOxDeYO1GKCSVGAWZP/yhss49ZDswqZ0jWaR+z1RW12rkjJ3qmLuqzKxLK/?=
 =?us-ascii?Q?b40MFieqb6XdZut4n2hIU4PxMIjCzKf8R1YP4+HkQpRTAX6OQSJMkH+eY8uG?=
 =?us-ascii?Q?1NINdb8+7kjSUO8AXSCu20+CWJQuB0JkV+hOigghDNeykkrCD68LtG/HTfu5?=
 =?us-ascii?Q?VGyeFm5CSFpiAFnpnq+U0b0ZcJF97mh7LlIpM7+BFrTYEglSV4/ISYdGL6Nb?=
 =?us-ascii?Q?x/8jAQrXWRSiCpIlBuPIaDFC2Luo/9Bkx/UmJUdMp6BeJ/QepHsjp8IWfTAC?=
 =?us-ascii?Q?aKqln2msabWxAzoecDH0Bz/kMxg7FHeAG+M3LE0SAtxJ/AKxVku+KvJaHZHz?=
 =?us-ascii?Q?tKsNownFBey5/2pnwNF0ZOFDfOn++4WVlmm056FIi1FKYuHWHTUiW2Mpe29j?=
 =?us-ascii?Q?BLbNdIP+sP/pPso4ARdjYQ1pYla2QxxfDohsotcFcVtNHiZbORizI7xZIYMn?=
 =?us-ascii?Q?EIfnDA8hMZxbK6P1O60F+PZstyueThVhRnwmw5/BKIyIFBwRMaVJrdDd/Epe?=
 =?us-ascii?Q?62CuLnQFWICAaqc+FqdEqFNh5bbUpOHQqR0PlTdAyg0Ad3LygB7z2tqdo1u8?=
 =?us-ascii?Q?OdKhKckkM5vlqCoG8f8aI/Js4YyEVvYqtJ6gUtjJM+z6XdtmwyzIZ78Cc/SH?=
 =?us-ascii?Q?cKjW2Kwy34aJV2dHsHMnT+WJinGAbiIQ3uqUZe2YS4/uqfO09PjLWd5ZAFhB?=
 =?us-ascii?Q?P+sTFdQbQnJ/ueEBZdphwVuDU4uXiwcm73B8Lne0Vhrds3HAfP26fnpu8n7G?=
 =?us-ascii?Q?DlYFtMp8jyxJWceu5DRjjk2JBoHPidSFlmRjp0Z9kbtqa1M1yvslUxl1UKc5?=
 =?us-ascii?Q?q1d4z4KNKcoRJn0YLJpYWcf41jnhcO3N7BEzS2tbjblT7d93leYrlCWubWYw?=
 =?us-ascii?Q?ap1gH97pyfv1DeqkY0y8GjdUyKxjU9ge2wqoBfQWRTOZoKo7tG2GiuW9qvNg?=
 =?us-ascii?Q?pEqO9UDTPtYGvqQP6v7PPxEHRrxhUQPuJr0F+8/WQ/JVS6RPgF7GYELZ3Qyt?=
 =?us-ascii?Q?Bw/QJE+y5hCpUq4vC35SCdyiIzd3+Q5f+TcuS8cg5mZR+XWmct/L1qkDgU7D?=
 =?us-ascii?Q?mBo9hBbU7xR1h8F2GIT7AvFPwqQ6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VVZcBnxr2aw+hM0E1asn7HezSO07ianvoH4KVXCn1yMBGjWoKYL9MOm9pDlr?=
 =?us-ascii?Q?h4po5wKvIOW5teyUrpHbQoh1iy5NrV80ch/BXudEhmsvsm/R3CI+1foogYUY?=
 =?us-ascii?Q?pPg9fFIbk7nMuQbsFXsVdksjFKADGz3jTQ3vI+6gZOkRNQvMxqjamTtjd/Bb?=
 =?us-ascii?Q?0+8HIVTFooIYXBPv6fp2soFUYviF+VDgOq6dO+Bw9qxGnT3DfwxOP34uhTzJ?=
 =?us-ascii?Q?n8SZ54F2G8IoeMftuNd1VyUAR/n6JUn7RgCJSE0UfhCqVTK2GWxgIauQ+zje?=
 =?us-ascii?Q?+8xCzB23rOmfS4gbY7ar8twATt0/SDkSrJOkuf9m/O1z8elzEj7B8hHSvS6t?=
 =?us-ascii?Q?GaQMpPOeEznLe2a9zpZIIFK9Iz12UkUOcCm3EF2egllBr4YyA2pyNeyDywP0?=
 =?us-ascii?Q?UXz5crZs3/ozEoXizGj2CKjJd/QSgSYsxMWNEdHgD6EWbGlnroxO69tqTzvv?=
 =?us-ascii?Q?4wimqhyTTqxdNubUuk+D+Q/PcHyhk8HDhYAmRJx6A3QbV9LXVTU6VFtCZtZQ?=
 =?us-ascii?Q?Xx+6DZVv3TtL4Bss2L2mxt8TqhIjV/2tLenZ2Rd4vyvJg0yhZV7vaoJCATMg?=
 =?us-ascii?Q?MiA74iVNJujCjWl5o3lkJfwUQSiq8Ln5T3UN727Wt7MBQersEKkOD4ds5cuG?=
 =?us-ascii?Q?GCiKfzZ4amhUgbfBfSxqhkW3TlFShk4hO/AyxSWrrtx2uspXL/PBG4nQCDEf?=
 =?us-ascii?Q?IaL/+KM754ST73aeNoDzeRCFJq67vlLblzEP7Kudx+papvVINZwX3vAHY9Et?=
 =?us-ascii?Q?eDcXVQWVUPf9gTJydurvCz5J6OxWg2fipUXg1VmU01ZnXsLh7Eo9mhg6R3aO?=
 =?us-ascii?Q?cgfi0sIT0FC3X0zbLv/eP1LOm5g/pQrLzUn7xvQFE+kjTwjS8x2V0ZXt4brD?=
 =?us-ascii?Q?OOyBIpu3Puxr+wR3GiQPLf3T7i01IGa7eA8P5X0AxEX8EflE/u73nS5fJIDM?=
 =?us-ascii?Q?ifnvb87+aSB7kesfc8Ds9eCfKm9cQnR3no4LlgUdIgZzYT9GkBgkzFtDJFPw?=
 =?us-ascii?Q?qKXqBDOFwvl13DfDP8dTdMy7H9Y2P84Kb9j+h3KaeUgpcsBhMs7poOCoK2u9?=
 =?us-ascii?Q?GUtfZ567Fdi7slVQCplWulksVsfe44GbD9fVk7RtODu6IzhdXDyS0nfKVQj1?=
 =?us-ascii?Q?8Ihs0qACLCf0jmyEbydRv0UnY4OGfrm/DfqPT0CFCQ+UWY2xRnhDP2LhJZiU?=
 =?us-ascii?Q?nrqUIcbGeCYfpIfv8PK6aCr24ANuX1JrSEe0sqgIJSPdX8p+XbY/VIIhuBN7?=
 =?us-ascii?Q?TDAZsFXcfndXdDcJORHEsuKo3AhjRpAHjEhI0ZyHo/8wDV5RoC8ZvXj/8Gug?=
 =?us-ascii?Q?tYKlYstMGyX5zl+6qJagud9iAfKEXeARZga7I810HW3V2XajpbxjmhbQRcjR?=
 =?us-ascii?Q?n+nDCjdcJTocvrbGRs5rvo8D9JIYKirVKyL4J70/cigvuBPSY9LAUaTMBycb?=
 =?us-ascii?Q?cN6w6efwfGrjBcWBdB0++eT/bWmXqyqNu95EGHUUUy/6Nol1U+RgRA/b6SRU?=
 =?us-ascii?Q?LJrpamXp4RdON2ojpcRhVMgysUpVNG4MEglOrDsGgcnLqrJirUKmjQDX1wR7?=
 =?us-ascii?Q?877cjA9fl80fmxUP9SM4dZ0ba/p7WWlV6Rf6bFX7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6066a2f6-f628-43d6-6f21-08ddbedb93db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:24.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPc3YvlwpBzM77042jQlVWPU/OE9q2CiMDfnr7nOTeXLk3i4e/RNZLY40WjCGme1fgwebhT++Kse6iSQmyUbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

Add a device tree binding for the QIXIS FPGA based GPIO controller.
Depending on the board, the QIXIS FPGA exposes registers which act as a
GPIO controller, each with 8 GPIO lines of fixed direction.

Since each QIXIS FPGA layout has its particularities, add a separate
compatible string for each board/GPIO register combination supported.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../bindings/gpio/fsl,fpga-gpio.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
new file mode 100644
index 000000000000..dc7b6c0d9b40
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/fsl,fpga-gpio.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/fsl,fpga-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO controller embedded in the NXP QIXIS FPGA
+
+maintainers:
+  - Ioana Ciornei <ioana.ciornei@nxp.com>
+
+description: |
+  This module is part of the QIXIS FPGA found on some Layerscape boards such as
+  LX2160ARDB and LS1046AQDS. For more details see
+  ../board/fsl,fpga-qixis-i2c.yaml.
+
+  Each controller supports a maximum of 8 GPIO lines and each line has a fixed
+  direction which cannot be changed using a direction register.
+
+properties:
+  compatible:
+    enum:
+      - fsl,lx2160ardb-fpga-gpio-sfp2
+      - fsl,lx2160ardb-fpga-gpio-sfp3
+      - fsl,ls1046aqds-fpga-gpio-stat-pres2
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 8
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
-- 
2.25.1


