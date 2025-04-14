Return-Path: <linux-gpio+bounces-18794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C253FA88C44
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 21:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F0C83B3550
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Apr 2025 19:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3414128DEE6;
	Mon, 14 Apr 2025 19:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DUDA4S2z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B501A2820D3;
	Mon, 14 Apr 2025 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658788; cv=fail; b=kahjE/W2IQrkuyExoOOSpyUXWySqZAJaYp7+sdaXs/w0vguxf8odJDaUT1qQV1QJCHksEZHISMFjr0TfTWqetvYwb1PUA7Qku1K73mRg+dujySDOWkyVn/rR2ssQ4CajLx2SZ972n2haGAaThTSUZcep2XGdzgOy7RhkvIY8wAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658788; c=relaxed/simple;
	bh=mrPzcnUhxRtPy4MBGfeYYUSz/5wuTCj5/6bj8wsyKyY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PLVGdkE/SSDW70GF3dDw77SWMBFznA5myQLeI4A7+AnSOKLdM5vxto6wFEI+5G4PiUcNB3KXxGg1IfqiNWy9rjdbUbfPujzQOJ+1dYgXeR+9UGPnMxuX8gElD9fTwdrr3nwDEins7pNENZEc0GbiCAI4z6kjp7w8Jq4Wi76thAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DUDA4S2z; arc=fail smtp.client-ip=40.107.105.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANQTRm6fzjhNncbXNGUQIiC3pg/SDWA3qwfaRtUXlIoSDGNmNW78o5MtYYyOA0DuWcwreP1U3ACifcLgSEKUXmgojDqwz7RQ4uBln/3+JUMfcH4OnUkCb6w5nGCOxiEkhwPHrmWnvv+mL+yU/CqNa0AVkvc0q41czqNc2gIOT5DXN2P9zSEHp9eTplYWMVehmaEFY6o0wMvmJvIVbb948LsTiQFPuS5ZH4STt5OUNYauH8Kxs9QSOyZ4TcqvnI4mZy6fGYoHX6UvS18dzdFKnKDYdKY5BgIu8Pm1M3L67RAoU2uaR7vyUck/FZWHWzvcw4Lifw8omJRHUIbvz9Tc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OznunGUUwJGVbwQgetkgN2JLkvJGpbUz+L64NuHAzA=;
 b=Scf6YmwjBv3EcY+owQkjwjzMx0gqEfO9QvuvEKhwIzjmXTwDwIg3eznDcdH8NLLro0DBZJz0r9fU2C6AZ6evmgPmtWWQ4bOih+qGHOxz00qnUwxeKFGXmn3TVGYKJpUT9xnaZJKphIr5fEHwMtH/2TIzhCuRQ6ryAXYU31h/RuTyk5KgtTOXn/wV6WEvVQVtU9WfQ/hqw7dGGvvg8wVzkEOejnDtlgzuaCp7pxyZtDCXlK04ZypXhN6tXlBfSWp4SEZ+WILJIP/1mBbjWNVWhKHs860b/wESVV/el70vaDdXK1iLB+wn61llaCQYuToFUAog1hU+nCNGrzIwjocO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OznunGUUwJGVbwQgetkgN2JLkvJGpbUz+L64NuHAzA=;
 b=DUDA4S2zsuDxcWQya8L6hKUErDkXZcwjtiElOUxciuORyKt4nqBbzgwPGCLeQ2i20vY6N9c8Yn4twPIuhge4f9qtNO73YrnixvRqhBldqiok9nW8J/TZhq4q9e61ZkVOWXmYppSxdoYrr3DhVxLcBe96qzYeQRpJsHyV8zap6M5M+PbxHyq3Y2oo6t3QHv4iZb7DOPnlobIFpEpEQHVvxExGI/qJUaQavKbOfU6d5RE/YZuaNx9gUb5PBnmwWImXolVBx4o3UZTxYutFpzX/bHCEPx03HCSnb8mh2J5uPJS01YLaGAXGRb1R7o3/qfLFX6CzoXjeJZWdJihRz/aI2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10985.eurprd04.prod.outlook.com (2603:10a6:102:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 19:26:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 19:26:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROLLER - FREESCALE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt to yaml format
Date: Mon, 14 Apr 2025 15:26:05 -0400
Message-Id: <20250414192606.3349661-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d0e0df-a7d0-41d1-6dc3-08dd7b8a3def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LIDMTvmVqf4pgzleKhq5/E42jds/KV5xHwjIpsMKey2lSOTEYdYwGCEvn//o?=
 =?us-ascii?Q?W5KJxTJGAnqT+2HgWn/yqBLf/JEX/uRjnd8bBVvCcsKZWeQJhybF3tpwHa7I?=
 =?us-ascii?Q?ekyHjCqMI8Wg7Dt0Zq7ptpjSkS8r6zI6rzTcEbR1saKt8MV2pk9MkRri9hRR?=
 =?us-ascii?Q?dpwjwbmlXuyr08/KLBE3s3DJvC4az+V+kU+tprmfsvYOFFQZmP9kqE0lvR1y?=
 =?us-ascii?Q?qdkeyeKhxqPx0AG6MS8Ut7YMP8Vnqto1JPflAwDwNEU+mQSlRUBHDMdh+gsv?=
 =?us-ascii?Q?gBivYp7NKj7FVU3YJLmoYtlNrJqg1NIRood1GSKb5RUsaOz/JJc0GCDg6CCZ?=
 =?us-ascii?Q?WDGsIkYYEgFdrTrSLzABHW/CgLZo1KaJkH33exdr6G3FTy4Bl8EwYxo+xMiX?=
 =?us-ascii?Q?Ozj1wTN/RTnyx33jXq9sDVusjDCBG6Hvnf7+zcVrVi/uWRDMpzollQ+aK31G?=
 =?us-ascii?Q?aI1P+Fm7PEmpxfG6VsSNWkbFgGEOsxm42ua9NmYjuAAAro6lsDKcSaWms1Cf?=
 =?us-ascii?Q?4yDx7NCIUFYqAkZtP0OTIENz6mJsAR/GwMtJZQ/d6JUA5qd+BRY02BVDIp3Z?=
 =?us-ascii?Q?cN9VMehobVCY+GnfvXsktTgZwHcGUOmyjBY16ApGLwj1q39kidmvot93oy8h?=
 =?us-ascii?Q?Cy7B4Qb+UHRxFESg9yyV1jzjARWqgM6P1PE/rlmiiglnEhhTa/PJ7lqSRyA8?=
 =?us-ascii?Q?aHyiCHxNZ7Y9lGBXe5G3GAuW50pX7zIfHIBolcygXaUjOMyKT5CyhjucFSnD?=
 =?us-ascii?Q?1+LRlcE211RhA7I3bgAUnF1xskOTJUToSkc+kQp5w23ZycHgAHTAbA14zIxL?=
 =?us-ascii?Q?Uh98u3RSAk5O4rPhui6fZwX5hjMucJdY3FsBC3UoMDeRGzLv0/MvkdLwNJBX?=
 =?us-ascii?Q?GoDz7t3KK/oEBew4LKpQclg8lJ2vKO7XXpL1oPC/tyZy8rhVbBZN/PJ9SFR/?=
 =?us-ascii?Q?3KvvDUN7GZX6puEvlOuqDfvJd+CF5gaRvpAaYiOutbbLB86/pa864p46ZeIF?=
 =?us-ascii?Q?8UaFS+exFna301l8XfPHFYLlKs1372agORXhwLeLbIdD4ldgFTANxGFp3b9+?=
 =?us-ascii?Q?FuNRpy64fhC99+VNKfyJUqN5zfj5dpt9K15ZHexTrtwpZnsxGS+BJAIC3SkS?=
 =?us-ascii?Q?mAlkoYLgtvMrz3Mkpt802cRQbncGY0rWHjs8L/dbJauoGbquv2ByqQGrJA/Q?=
 =?us-ascii?Q?3Y/hkOBCSUPk+WzXxXjDdb2LqnrTYdG5J3Wc9YFtGifu0MBc9BsdWtDfsxQB?=
 =?us-ascii?Q?x9L/IDyQPk+yKEgWZOIEeVdYR0zi6vd27JFamGWCVBKcJQGwWrSwniARjb9F?=
 =?us-ascii?Q?CfQiWsVdkylVYchNmsBSJdF7h/8yOH3PrG5jUhC7HAmlLlKNvOrlG5+Z0SDI?=
 =?us-ascii?Q?XVaEyK7S6KV6GuHwUQHjZTDRq5CQLPVy0kYo9fPMI68Kt78icZmW7sCvEMbd?=
 =?us-ascii?Q?JUzEM86s3r2pj4FVJF0jQKAfpuOFXzjn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AqWjFxXxfinrx+i45SZE/E53VBq/DMFAuI5AWnLenAMOM9JGO4y9nOwITDmg?=
 =?us-ascii?Q?8G/mBLQ3Ch2mAMSlhZSGZW4zwIbGR1Z7A0HG3De6eNAndjWED4HUpjquJw4z?=
 =?us-ascii?Q?s2K7rxqR4oADdphCO7QYr2JuaY8I6kbpEwNxquf/Pg09nupVJICyZfmjtZLA?=
 =?us-ascii?Q?i9ja5zkNTDhIz6F7Pex0UEBJYiF1wAlCEkx4b7fGdUQLKOt3XFHqUQBFrjoi?=
 =?us-ascii?Q?Y3iREsghQYhQgqfXDTNB/TghFUBwOR9KYQyNMLcuNtiX8twNfxU8ly426RxZ?=
 =?us-ascii?Q?ukBD61La/7CjRz+pa4joitQX/9pDu7a9LRUky9BMnVDrAlni9dcbAtCcYtye?=
 =?us-ascii?Q?ZnjDAp6XoyYj1gmC52Tc6pBTwDtszk48NZSPRlXoZlqqxGlk+GL2dDceaZFs?=
 =?us-ascii?Q?RQ04EXae+VSSBvOfpEDrlSYMctcQ2gAdDycx64uZFujYZ+5fixdHKV3JQCUK?=
 =?us-ascii?Q?/DP5RJBh3Qn12mzXKts1hiMhoeCKobKdpka77ounfiFbTZDvqUJ90NpC/N5h?=
 =?us-ascii?Q?8iIP5//raOyddOInbUIqVQsaitXZEc6rwsNkUvbTFlWOYJXSN3Vux66aGpfm?=
 =?us-ascii?Q?w2isjLxlshx/MViGnlOaGmFVTwLUM+s8EPgI+KfO1X8tF/2Fxa3QLTfnj80n?=
 =?us-ascii?Q?oqpVXqJivm4mIIwoAfBhifrRr4JthnG8Isy4O4X2Z7JvVMUvWhMYJCikhAde?=
 =?us-ascii?Q?5RfnLpSFCl9xS7uNBN/J49w5rPP33V+oZhFjxT3+tpZQDGnkmlmpngpdYyXP?=
 =?us-ascii?Q?02R5IQzRWpMM++psByvw7M11L4LWtceyrMx/S9pkg+1xRsQOkbD/tzswxzB0?=
 =?us-ascii?Q?776rK2e3rn1QLcFgnbE85xDDgFn6JS/fwXRPcSy5AO9QxmLjXE4p5A/MvPQR?=
 =?us-ascii?Q?HTziN+1xJfAkm48p3Ne/LhgRm/niTj+zyzvMDfk/qWMX3j7Q01PiCqGijSQA?=
 =?us-ascii?Q?Ddo99MwzY6DBvWCX84ltUL4SkzZ99BSUL9Fj5mdb8S+DMz/9ei0y5ZVj8qJD?=
 =?us-ascii?Q?v8wuzR9aG4vLdKBleGmidL2PmhbD61zQ6svCqT/XZjD8mYYypfupoe4utv/o?=
 =?us-ascii?Q?2SXWJE9R6SxLi5UJblu+JK6KaDldKfiV78NVwIiwoAUcd5SpaX1qniQ00uux?=
 =?us-ascii?Q?xK/GrHlXKG+nwVLRLT6Q8qOw8yo1I0TBC+zsieJCOiYRMaMzviymNbLQ4S4e?=
 =?us-ascii?Q?6CrErYyFCJJeXBky+DRCZxEMvWFxehvwc43O0fHZA/g182NzX1sLyR1UPgps?=
 =?us-ascii?Q?8nGiiOKFVo0l4Qfn9Ork8Ls/pmlbkyiF3ALMiM7BUEGNlogAQD+z8AtkJpcP?=
 =?us-ascii?Q?Fmu9BgBie91iIGBCUnAfNz7pPb+0q8hSNe2RokvcBHzKp62of+DYOIZ7WBnO?=
 =?us-ascii?Q?zQGcjuZSC4FNpagC/xVDQPyMcVr46qXrsfkqDWzJMyBQ4+x/wOpgRC3QZMHt?=
 =?us-ascii?Q?na7JTDt+YJnAgzkxCDhnc4N34fGxag+gORYbe7lWI3O/JNV8X6ZgYhIP5pwZ?=
 =?us-ascii?Q?JiUmgt21vlqMlFeSkSZKcVKP6xzoZlkn1xxQsUrxW4hJOBmAThetqPdwIcwf?=
 =?us-ascii?Q?O8actxHn6EfN5HpTPuVxkEMRHdvjsizvBcvgtCtr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d0e0df-a7d0-41d1-6dc3-08dd7b8a3def
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 19:26:23.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhRFAOzl8GEQSpMtYr0NmDIY8qfrwrrmhNkw+yNpfOHFUX4KGca/HP2rQPWMXfj0XcDHWcP6zDmorrLmPfPWaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10985

Convert fsl,vf610-pinctrl.txt to yaml format.

Additional changes:
- subnode name force pattern to 'grp$' to align other imx chips.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/pinctrl/fsl,vf610-iomuxc.yaml    | 83 +++++++++++++++++++
 .../bindings/pinctrl/fsl,vf610-pinctrl.txt    | 41 ---------
 2 files changed, 83 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
new file mode 100644
index 0000000000000..c201a3daf2a30
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,vf610-iomuxc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Vybrid VF610 IOMUX Controller
+
+description:
+  Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
+  and usage.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,vf610-iomuxc
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          two integers array, represents a group of pins mux and config setting.
+          The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is a pin
+          working on a specific function, CONFIG is the pad setting value such
+          as pull-up, speed, ode for this pin. Please refer to Vybrid VF610
+          datasheet for the valid pad config settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description:
+                PIN_FUN_ID refer to vf610-pinfunc.h in device tree source folder
+                for all available PIN_FUNC_ID for Vybrid VF610.
+            - description: |
+                CONFIG bits definition is
+                PAD_CTL_SPEED_LOW               (1 << 12)
+                PAD_CTL_SPEED_MED               (2 << 12)
+                PAD_CTL_SPEED_HIGH              (3 << 12)
+                PAD_CTL_SRE_FAST                (1 << 11)
+                PAD_CTL_SRE_SLOW                (0 << 11)
+                PAD_CTL_ODE                     (1 << 10)
+                PAD_CTL_HYS                     (1 << 9)
+                PAD_CTL_DSE_DISABLE             (0 << 6)
+                PAD_CTL_DSE_150ohm              (1 << 6)
+                PAD_CTL_DSE_75ohm               (2 << 6)
+                PAD_CTL_DSE_50ohm               (3 << 6)
+                PAD_CTL_DSE_37ohm               (4 << 6)
+                PAD_CTL_DSE_30ohm               (5 << 6)
+                PAD_CTL_DSE_25ohm               (6 << 6)
+                PAD_CTL_DSE_20ohm               (7 << 6)
+                PAD_CTL_PUS_100K_DOWN           (0 << 4)
+                PAD_CTL_PUS_47K_UP              (1 << 4)
+                PAD_CTL_PUS_100K_UP             (2 << 4)
+                PAD_CTL_PUS_22K_UP              (3 << 4)
+                PAD_CTL_PKE                     (1 << 3)
+                PAD_CTL_PUE                     (1 << 2)
+                PAD_CTL_OBE_ENABLE              (1 << 1)
+                PAD_CTL_IBE_ENABLE              (1 << 0)
+                PAD_CTL_OBE_IBE_ENABLE          (3 << 0)
+
+    required:
+      - fsl,pins
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
+unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
deleted file mode 100644
index ddcdeb697c292..0000000000000
--- a/Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Freescale Vybrid VF610 IOMUX Controller
-
-Please refer to fsl,imx-pinctrl.txt in this directory for common binding part
-and usage.
-
-Required properties:
-- compatible: "fsl,vf610-iomuxc"
-- fsl,pins: two integers array, represents a group of pins mux and config
-  setting. The format is fsl,pins = <PIN_FUNC_ID CONFIG>, PIN_FUNC_ID is
-  a pin working on a specific function, CONFIG is the pad setting value
-  such as pull-up, speed, ode for this pin. Please refer to Vybrid VF610
-  datasheet for the valid pad config settings.
-
-CONFIG bits definition:
-PAD_CTL_SPEED_LOW		(1 << 12)
-PAD_CTL_SPEED_MED		(2 << 12)
-PAD_CTL_SPEED_HIGH		(3 << 12)
-PAD_CTL_SRE_FAST		(1 << 11)
-PAD_CTL_SRE_SLOW		(0 << 11)
-PAD_CTL_ODE			(1 << 10)
-PAD_CTL_HYS			(1 << 9)
-PAD_CTL_DSE_DISABLE		(0 << 6)
-PAD_CTL_DSE_150ohm		(1 << 6)
-PAD_CTL_DSE_75ohm		(2 << 6)
-PAD_CTL_DSE_50ohm		(3 << 6)
-PAD_CTL_DSE_37ohm		(4 << 6)
-PAD_CTL_DSE_30ohm		(5 << 6)
-PAD_CTL_DSE_25ohm		(6 << 6)
-PAD_CTL_DSE_20ohm		(7 << 6)
-PAD_CTL_PUS_100K_DOWN		(0 << 4)
-PAD_CTL_PUS_47K_UP		(1 << 4)
-PAD_CTL_PUS_100K_UP		(2 << 4)
-PAD_CTL_PUS_22K_UP		(3 << 4)
-PAD_CTL_PKE			(1 << 3)
-PAD_CTL_PUE			(1 << 2)
-PAD_CTL_OBE_ENABLE		(1 << 1)
-PAD_CTL_IBE_ENABLE		(1 << 0)
-PAD_CTL_OBE_IBE_ENABLE		(3 << 0)
-
-Please refer to vf610-pinfunc.h in device tree source folder
-for all available PIN_FUNC_ID for Vybrid VF610.
-- 
2.34.1


