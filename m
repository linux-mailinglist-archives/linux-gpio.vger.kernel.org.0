Return-Path: <linux-gpio+bounces-20926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D409DACC9FD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jun 2025 17:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1337A163478
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jun 2025 15:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7138923C384;
	Tue,  3 Jun 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UvgB2S7z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012062.outbound.protection.outlook.com [52.101.66.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBDA23099F;
	Tue,  3 Jun 2025 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963863; cv=fail; b=LKAu3AVRD2//MXoAI70zQC/w5chGNlpdQnFrmLmFftJRXsgSihrYxzmGYs8TtKEGH8z4LkShVyKUZwBP5FJvh3lVkxXqv4xu4AvRo5IdD3ICVG/OZZBGkUmWJkjek2DOI2iEk2b4C5hAQOHrL8XqR5knlrMs3LNPKa6w0HgXfzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963863; c=relaxed/simple;
	bh=/DELRBVhXHfW4EVDu+lptufmwgWyXSABWF/6PVSmi6w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hiMvkMWCPJ832UeG0DzpC7rd+hKZb4ssxVwx0Z+n1fA+vK5Y/RvHC9khbF32AI3DeOwGhodh9H5t1b+sFs2YfIpPe1LunXTGCDnn3EgR7OHVeKHmxDriiRlvMv2KnmeOn8V+ywl+pC5CO4F2YlzB3EbCFSvvfVet4FzIsD8feKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UvgB2S7z; arc=fail smtp.client-ip=52.101.66.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRl7FHALr3IOhEXAc7Vknp+EXCiHwU1x8aGkfU/pgqK1l0BlbTxkwVCC80z5GGXJqquupPE2AA5xl122hb3C0nIFlVuctIghkOBuvFgnPbS4WG+LXCdnCfrKRUbK36iwaT9EJOd2F+9NIYhE1f4iGTXkCAv0lknr7/MMsEpMY6wf+fHg/aGDsmnnRE0x8cU4+xJ+YtWv27lkvgsFyhGRnmEpU/0y3MG42pjen0MOMByLMOHGb/6XkzE5A+QeJiATcj5LGoa7JW1ImuhvvSVOr39+Zep2ZAjeB+jDaoSGIwzY4K0OtAeaUZOJTy/lMJskkKjslx2ZF7o9jfLcvwFcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qSWmeDQ0D225h4h8WYB8tge3xYP/P0Ff/5rDo2qPlg=;
 b=sWu55d0FzQhfIJO4G23zLuX/SiLUI49quywG8IazjALKUYxVjS/6ERa7n/z+HrjxB+lUJibM4CwCJq5r1bDSd4SKnue1E/PBj6msdvA229+35h92kf08GzcaQoDWUN+Wq/nZmEsbLgmeH44cd8JQWRJrAx46hMtl45bZ0hIpvuIi4s/TMbnM8W6B1nwER5a/j84AwM/cNprzkzcs+q1hw46DHfCbW00/34dqWSzY34MdqZDCpG2eW3PUZAxlBxxe38zCIwnfWW8wAz8PbAEP1Ns/8Zm1mX8HsD2xaHijnpn76VH63tqn66bbRZqWhstDSgrPGCghDgbVy+jDoT79Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qSWmeDQ0D225h4h8WYB8tge3xYP/P0Ff/5rDo2qPlg=;
 b=UvgB2S7zSjSV5a7s+SymJV+45kStoGu+gPJQCrSy6+Xp9eWdWqvg+4vl/BrkuPWKzyaK/MNyaVfgpBkiUtThbsYzRdmcEsFLoRFY92iVK7vJSxkeL8RhIv7TUPOUArXl/J1vwuUnKC6nIN0QeeIz9hyZMIVo8QAL9bwH3vjONkrVGWqvTtbMKpVKmZxQ6pWdYthRyOiYs4CcuKienEBQdEzaqYjmhIurBh0fD+sRP+rLCnuT+eAyv+gYJf00MaSrAJkxDTrqsQu0hPiod4/sleCEHFwWfOjbvmjddsoa8RZPObKaJb9fnJZCrJejjtSsrttt9iws5sKGMwxbuBD2GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 15:17:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 15:17:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	wahrenst@gmx.net
Subject: [PATCH v2 1/1] dt-bindings: gpio: convert gpio-74xx-mmio.txt to yaml format
Date: Tue,  3 Jun 2025 11:17:24 -0400
Message-Id: <20250603151725.1068064-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b226043-3faa-44d5-6b0b-08dda2b1c62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SJOkM7U1OaKhlaIJ3qQBPMWs8Up6pFQ7eakUBc1xS6bPI2zQyTNGp4bezMgK?=
 =?us-ascii?Q?MXpHuPJbFg8rEwdIbIZ0mxe0iFbU0ypI4dpGXtKGGhPkzhE4mYblsWzAc33o?=
 =?us-ascii?Q?iDfj3QMXjhemfVu6mlxa7kTIuabJHEteykbZ7JAAa20u1CwkhN5ynUrCFInr?=
 =?us-ascii?Q?VB30MTclDjrp7bz3syFIDgbQuds/6SjEMyOG9BHh4MEzfbd9S70ombwLfXMs?=
 =?us-ascii?Q?dt0iE3dbsTKSrH4TBkXjwmsPeknUwy6MPaIUgwAs/Q2+RsU+xccAYo6SyI5G?=
 =?us-ascii?Q?2qFijn50NvH29X+xU0sFl0qDBNN+mdG4p1xSqiFlp+MP3+44wrk3n2UNbTYI?=
 =?us-ascii?Q?0zPR1dIwoSnh5E8H57o9TWyiaOkVn3JTrKuRa7ldYc9V6T/dD2MXuclR2nFr?=
 =?us-ascii?Q?fu6J3m1UUJupFczIgBr8PNX9BRc52rcZyfXypTyxA682cwxC8c9OdYJhoVU8?=
 =?us-ascii?Q?7pY1Xuwa5+kp5kvuTgW0s9co2HKU6DcFfL4hPBPDTgugvBGT/OZQFctV92Bn?=
 =?us-ascii?Q?6To5Abt+CEEcmIUdZIZlUMK4dKgpZi/LGmsCvlgluzLqU4GEAH3ffYTlPzig?=
 =?us-ascii?Q?ElqYsqW4oF3wkazC5o+Fi9KRpI8Am+yFc238adBGK5MRE7TAwTdB1K8d/+6k?=
 =?us-ascii?Q?iKxZEezdtUyVQSdofpmNH44vlAbS5SKUi1KJdyw8KXcXQfxrWp2WpaRcw3KH?=
 =?us-ascii?Q?k9eBPIcGXailkfOHLb8cMGURjaM0134EiAjOXxMlHVgd2vZasr75cN7qbq5x?=
 =?us-ascii?Q?ZSgiU7mbV8zHVhAmgODQLc8iHE5Lh64cq8IYJVjDPeyppngNoMNshKLUKm63?=
 =?us-ascii?Q?R8ZEtUJcAbsS1RbJJv6K4x0EDFQseZ9a+NB2bxIyGOW82QrH2osOIKQlc6fr?=
 =?us-ascii?Q?x4uONflOfobbzHIvBNLs6DqnI/Uf2oQJ2G6QLwkUMyVU25ifiJP8zyI6j+Eq?=
 =?us-ascii?Q?/pNvAOSC/U/FCPDkFxhmmQpCr8PNtoCQ27KuWO2zb4ckh9v4o3jEqOZ3UCuO?=
 =?us-ascii?Q?cgjAmP9u1AqxDbLa75vu6GfAihckdZnF4HcAlc5prqXWYsiY5ZD+48Bxf6B2?=
 =?us-ascii?Q?DhIlrSWRGxn3ziSNJ7LfSxrn95MgEcVa//x5Wwn//OL+NKBB+Qh5QMkfJ4TJ?=
 =?us-ascii?Q?vHaohUmAfQSYZjX0YvSFvbKFRqNUhnHR1O78kqYM//l1jSjASMNrlxrzhnKb?=
 =?us-ascii?Q?qlJE2EfIoeGWZhcyP3NBtQoiqmUYURQrDcI9GvGzUXC6FrBlFPZqXYLro41P?=
 =?us-ascii?Q?/RCK+8E9mHsMwOi4M9yJMyAzzOZ5VARYFOTI0nO6LQQeGmgnn/xVf/KkSSZk?=
 =?us-ascii?Q?SnFi3UcNJvdU1mNdPSk3i+8j/3S63PLqkPKmc8bpxNpPva5dZzxF2g7qhtFM?=
 =?us-ascii?Q?4hwcRTITRM5x65EGHSifi5qvOe+aHKHepclpy0op9A/0swg1/fQyLF69kLRg?=
 =?us-ascii?Q?Iz+5k2P5VIGjA/BljAJvBEHn304quePK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/YObbrhAzVxNrgtVGoBycSNzJOrdyFjBLbuw4erWDb84IDnlHWmWsPCsjloC?=
 =?us-ascii?Q?R235bKfwRd8RRFf7arN7POIUTT6O5Tv0QUb/8lGFCzNF83HNOGczknlAMnrD?=
 =?us-ascii?Q?Qy/DqXJGcfszfx3yMXDpD2M1Rp6aJLlDN9OtkTBEoKxrqnpj5Vwm0nI83VMx?=
 =?us-ascii?Q?zgnhJqlhHCZLJnl0xsGFEBC7W1Jd9vtMtS3WoocCxIVA6rKqDrFSRTJzYJAc?=
 =?us-ascii?Q?ZUaJSH0QxOZEm4sLAUMj1cU47uxOHPd1IYn/JKvdLgGKFY0PWlTJPBWw4Mp0?=
 =?us-ascii?Q?uU3uOq5iXcTNuxF95bw01/nv1blZsVEd1kHt91vkFHsXPYHWAcwkwc9id0Vu?=
 =?us-ascii?Q?aVHcf3AEZR8dVvi/Wj6mwsDwT4/W1KQBD2JZuDUgZUZgVyufkMlkFMVN+Exw?=
 =?us-ascii?Q?GTEHyNTE6ml98MLrcqwRyAP8gSnj49I1lMu65u3OCutA6asba4CFHF18fkJb?=
 =?us-ascii?Q?TxzLcD5WR43cnsuhfBe5fOzFFtUHpHJOsSydwYki+/7x6v/+ojotMfXrkoly?=
 =?us-ascii?Q?e3K2XK2Gd/tty2gt8JgYmOjCmdQwJpKcZly+yMP1PqhKPw8nwW+vuabx8wWh?=
 =?us-ascii?Q?rwiHHkY/mlpnHAUqOK1uQkOV2mzb6LdrTjhnFjxGMuKaIjms5Dk8usIQ/MVj?=
 =?us-ascii?Q?+6Q93+MBgMkHOAYjcI0DIBU7ruvq/uJMEcQ7aZDCFg6wNof4ShX8+EKABxp2?=
 =?us-ascii?Q?5/SREQsfS+3TikymXP1BApkdg+pXlhYaOYW+J9zBmq4UMZrIm4alNkq7wIg4?=
 =?us-ascii?Q?dG5ZpZ4gi6h3YPt5UFsL7Vpp9XA8/s8h8fuOoFnr6WK6GNI9LhMv3P1W8cCK?=
 =?us-ascii?Q?42R47G13xhI6mBh64yeytZkspVLPfPYHyqj2owirlXThl7lKjeQaWd4WNj+0?=
 =?us-ascii?Q?9LkYZXuoLxoKd3dyAFfBE/Sob14DYHxJ73L3fDyxu1bg5XDf4mN9VRfZUBut?=
 =?us-ascii?Q?kzESJ9sLF11xS3kqv388cEUq0XRv+FCoxZQw4cE72t2JvfD5scvvmOIpkdbX?=
 =?us-ascii?Q?kReG5T8v6fL/taJTEk6KFwaoVJhCzWu04mdBM6XOvCe16CU5SRegCC7l75jC?=
 =?us-ascii?Q?EX5hiPq0kzcglVjNhqpw7AlcQbp9DN9U3if9IiqgX02WhLLJZMSE8pYtyRBc?=
 =?us-ascii?Q?xF1hef4+yuMVrP4GUbTViOLqDNq3pXct8Gu3i8H0li9JAPsn/pdtN82NM2T1?=
 =?us-ascii?Q?VMJmqsEd5D5fFeAB2hylR+c3sPStCjsaWJxuQYRshO4fBK/x5tLLRr7x3TRO?=
 =?us-ascii?Q?xf0J1GpVopben6YAxSJB7uQkFzwtfYkhqJzte2TgruybfyUw4pU7nYHWuH9M?=
 =?us-ascii?Q?iMmL0ZlQyRu+wD82c0+dN1lNpRaAUOn+aXeHoGt/FHQoK9CjsdS/GbdyHuVS?=
 =?us-ascii?Q?6cXg9VgxdCcQ/ai6ewyQup2LlUaHevZigMI6OBD7vVBTm23fTSt6kt0qcSL9?=
 =?us-ascii?Q?dc8Jk/Whsd7TQtxrQ1lDZX3s9Z/XdAMzo2Ne7aFtopAEjLG3oMua3qf1CKF5?=
 =?us-ascii?Q?0LBYzA/l1+gGDlymkgujsBgTIBOTYQiWvT3kITr2t/px9S6LyNAXv6bqdDvD?=
 =?us-ascii?Q?IL4g7L5QyaNFFRKsc+EfpMjyEUJ4riQwj1STtbKu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b226043-3faa-44d5-6b0b-08dda2b1c62d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:17:37.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRGJpGqkdKFji5+hjCsR3SiGkWyPqIGS9SH2UBe6Lnjj9Sn10fZ1Iui0OhXR/WrwqTIHe4MhTFlNd9hmaUeT4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571

Convert gpio-74xx-mmio.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove trivial changes in commit message
- add TI in title
- fix additionalProperties
---
 .../bindings/gpio/gpio-74xx-mmio.txt          | 30 ----------
 .../devicetree/bindings/gpio/ti,7416374.yaml  | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,7416374.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
deleted file mode 100644
index 7bb1a9d601331..0000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* 74XX MMIO GPIO driver
-
-Required properties:
-- compatible: Should contain one of the following:
-   "ti,741g125": for 741G125 (1-bit Input),
-   "ti,741g174": for 741G74 (1-bit Output),
-   "ti,742g125": for 742G125 (2-bit Input),
-   "ti,7474"   : for 7474 (2-bit Output),
-   "ti,74125"  : for 74125 (4-bit Input),
-   "ti,74175"  : for 74175 (4-bit Output),
-   "ti,74365"  : for 74365 (6-bit Input),
-   "ti,74174"  : for 74174 (6-bit Output),
-   "ti,74244"  : for 74244 (8-bit Input),
-   "ti,74273"  : for 74273 (8-bit Output),
-   "ti,741624" : for 741624 (16-bit Input),
-   "ti,7416374": for 7416374 (16-bit Output).
-- reg: Physical base address and length where IC resides.
-- gpio-controller: Marks the device node as a gpio controller.
-- #gpio-cells: Should be two. The first cell is the pin number and
-   the second cell is used to specify the GPIO polarity:
-    0 = Active High,
-    1 = Active Low.
-
-Example:
-	ctrl: gpio@30008004 {
-		compatible = "ti,74174";
-		reg = <0x30008004 0x1>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/ti,7416374.yaml b/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
new file mode 100644
index 0000000000000..62bd371616daf
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/ti,7416374.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI 74XX MMIO GPIO driver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,741g125 # for 741G125 (1-bit Input),
+      - ti,741g174 # for 741G74 (1-bit Output),
+      - ti,742g125 # for 742G125 (2-bit Input),
+      - ti,7474    # for 7474 (2-bit Output),
+      - ti,74125   # for 74125 (4-bit Input),
+      - ti,74175   # for 74175 (4-bit Output),
+      - ti,74365   # for 74365 (6-bit Input),
+      - ti,74174   # for 74174 (6-bit Output),
+      - ti,74244   # for 74244 (8-bit Input),
+      - ti,74273   # for 74273 (8-bit Output),
+      - ti,741624  # for 741624 (16-bit Input),
+      - ti,7416374 # for 7416374 (16-bit Output).
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description: |
+      The first cell is the pin number and
+      the second cell is used to specify the GPIO polarity:
+        0 = Active High,
+        1 = Active Low.
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@30008004 {
+        compatible = "ti,74174";
+        reg = <0x30008004 0x1>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.34.1


