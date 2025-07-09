Return-Path: <linux-gpio+bounces-22989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B09AFE7B9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D2A41884D6A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFC42D6619;
	Wed,  9 Jul 2025 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R9m77NWe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B42D63F0;
	Wed,  9 Jul 2025 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060462; cv=fail; b=RmtL3b0+67q2niSn+XINsHaCtM0Nh3LyY0yUeWq89rMH6VUVQrAgiJNECZLgK9aZcTnAJyTQuZgIvNOhRnDSR+n9GzE7Oul6lFNOIm8ODizhRmj/KwMXXFTTrPJ1/2ArZEITDMjmnNYiyFQmpSY1r9AZpY383E7DzUiA6jEMvdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060462; c=relaxed/simple;
	bh=a1sVdyISVOFBEoVGW3+XhDXVULG3v3Xatrxcay8AnYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EWqEOuRIr3dsRIFK0BJUFkDLB+CnS0al1tdvuLG/S3Hnlv0yK7vLc8yKO/tY+5wUNHKX9TN9tm/s6x0IDU3GLxagpMBBgntO1LDYCHs+GZrb1SrCsPxf6aQlN0X2xhejwc2kAFSAD50pV+AjGHSmp3e7TtJgN2XgPvsfsfG3Gh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R9m77NWe; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6Ilekt7GFEQ31Em4tcs3ecJPS1jhbvoZJKP++/C/dBtOCoWzR90oL3k03k4oBxFoeiSk0kq3+xEsOq1xxHnjnyg/Wsa8UV8r+NhNoYyybpN8xUxa12gB8NzhWkGI9jMw17yPbyJxsK6XOJ0fZqQxOBDWr1i7gyxmWq8SuBVQEglLnlU2g5TRi3LqPhObOdRi6psR6gQ+qNOtdHMZ4v3g1FDX2WbJlmnrpbcruoIl8WBjkhSQRc4m92lz3blbo7UIOLoruN8Z/h+P9VMiax4SZ63aLI5Gh01wHLEZ0kUTOIYicWgNnZ+FKMEe4/PfmJPlwHXtNG4S0Q0st9R5z35iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=836LFo69puEKiM4jBbfQm9XF1dPwU3t+KIQosa+nqY0=;
 b=mQYl6VmB+EN0I3QIEs23+aKE6+7Dom5OWxYyoiHQm7Ip+xfb9/AFRVfiLdoCJkpPyzCmtxD4xaJq7J+z4jb7wHD/AR3fWOPJq4oYI7tIH9dxNnQGQfE0sG43OTR25itcoRmXb7KJdtpwZ4JKfC4s7cHfp3K+AdnKr4O4M7X1H3Avrqi67Uh0fx/sUfKhnNdJSBHJu0H+h7jDrdNAPh5tnxx15/C6e3bwuE3LXuV9fwJ3eXyTz1t209hswqDmmu1Eixs+VVgzq4aurTkcKKmid4vC6pZbRvxobUBS7D12xtsN8I2dCK71odNSCJ5UK8gUqCLQaDTvwluxGT71xubIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=836LFo69puEKiM4jBbfQm9XF1dPwU3t+KIQosa+nqY0=;
 b=R9m77NWeIgVKDh9980c5sqCpxqU6pOuRY3ydNUX8NOKbuPLzx5p/8Fnkbr9anctj6HI3srOb+eBL5xITdDZaS0fYkD/KYsi9BxAwyMukWl7qh8VbcVU99NuuC9YZqqzBL1Z4vcFbQ1fnqrU+EeBcITnX4pfBEXWF/GJ74Na5HGhfeuJXDj4AHqN1nN49VOJ35OGAT3Dv2NU+2iLo/ptqd8RUkTJyr3R559PXZAaLDDGdIyDhK3daLfakseJpZW8uWCKwOwDL5RBle9TXZr0MED2OOGsWcoBqK72dX/cvUrbAfSJNcir2aYTW5SpRU68601xhn2XJXVvE6yqUvzw1kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:37 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:37 +0000
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
Subject: [PATCH 7/9] arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
Date: Wed,  9 Jul 2025 14:26:56 +0300
Message-Id: <20250709112658.1987608-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::13) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: d956ceaf-55cf-4b70-cdcd-08ddbedb9b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eT3KpU9vWYonkJdP+swnorB7M6DP6tHx9QnqDfe194ydfFQKqlXtUGqafYxI?=
 =?us-ascii?Q?rjNg8MdF7mAX9kBlhX81P0MC8BYQTH0lrgz+9YgBavLt017yDwKIc2CgS1c+?=
 =?us-ascii?Q?9JaCD50fS8nUjh1hntQaEA5exQAgbfagPGLdtmKY0QHoXe445X+8dMZHS4I5?=
 =?us-ascii?Q?rIn85EwzSict8Uxy7DxmzC+X59J59sXVyKGMako7qBw+bbGfnvhXtUxnhWat?=
 =?us-ascii?Q?FvtXL/Nx8L3/57BnUKdQdwuXXPyZn1+5JnZZ7aNmMOWkI/yy+kEj+UgnOoP4?=
 =?us-ascii?Q?aK2iWkwiLg8DuABLzRRI3Ac3o/gVCEMDTroJ0DGQ16rGd3smt9qyDTCU8cGg?=
 =?us-ascii?Q?76KQqG7UPTCkKBSEolQsaiqHxbBIkB9pQtOr/PIqfELfCQHHTV37gAxO3j+N?=
 =?us-ascii?Q?oh1DcOEdGfojEdtkISDmNnEmwmhuChhECufLvZ9IZcQ8Lc3SUz1UjXSY849p?=
 =?us-ascii?Q?bkQI1yeNEJD2ehqmiU0mlT+bqhBZoOAVLM5KKhnK9VXerZEwSyHmwPWrGSl1?=
 =?us-ascii?Q?Y4R86zhtr4ONrXL1EuTf1OXhrlrNKBv0bcRfXTOTmM37/GHl6AkdEHQLFx50?=
 =?us-ascii?Q?8NKF+j3yI3BGVFOSeM1IVXvc8LllrJ3BBghTN35MFi3ldbHEy8wWvQiYU9ix?=
 =?us-ascii?Q?yRRlx5Gf5MpgFBDCyKQHKdjf5lbPqMF/oOvpKvfacLEN7XjWNd/pkYZ/WCOV?=
 =?us-ascii?Q?jo3QA7i2LQMJJPbV1l8799jmIKpLO5WoHghyU2xCD6AMAvmnsraKHj2ku+PE?=
 =?us-ascii?Q?rHvGREoUyhgE7j5DUFAY33Ql3hYdZ7Np7M57p0y+d7Jo6yJJrcpbIsM6Quce?=
 =?us-ascii?Q?H5gvZuoPs/0Hm72Vm+PpNtalVSvXDlGWU0OPaOe9C0hsRX7Q4qDx/r51bU9C?=
 =?us-ascii?Q?hmIgzR/SdoJpaQXzYtEViN+N2C+8Bub6ourKEiaKBuE3H8Yq94aRCsBlezZ3?=
 =?us-ascii?Q?CCyq19BcvYEVuVlReyFfLgiKV+ZgjJm8QaW7er9d2+puUFwMHoj/NN1+fU7G?=
 =?us-ascii?Q?DGWs85ccUEgOZ6g1VK3KJ0B7u6PP6n4SdBVQZ1oeHJT9IktkYSv495MfuHgE?=
 =?us-ascii?Q?sKdTngv3AbuP40os6gtiHzR4nzwMbD3GAZQonqiJm7bH1OVvQrdiRK68RXs8?=
 =?us-ascii?Q?A4o5Zez/eOtNsM+SaaG+JC5t+b7wzJuE50o5e0r9iCFPtrXWEygS9Q/xWLN1?=
 =?us-ascii?Q?zjR5/AguDmVPcYilgUgqklqT79SUpoSVTQqoxexI8WIlMFxEjP4Xvky1wpR9?=
 =?us-ascii?Q?I99o9GCrcDfi7ZCEZeCmOI4bHlReJot3hQKIGHJjKiJSc8QVTj1OpUrrWS64?=
 =?us-ascii?Q?nPosgc1SKwcdNnpi+trppnVDNerXjeVOqG7FiEYPq9z24KGwq/mc7WM99WRz?=
 =?us-ascii?Q?nHekxrJ2jKiNpdpDRkbtVM+Z9FxVM3Kh3fNHgOOABopw4slWhBI+2HxSpD+F?=
 =?us-ascii?Q?32uqwiQTyhA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+YNXJjlbPkXCdLmxdC30rp9n7vxTAvEdOPL7g1gj79bcFkmoUs3dktw9rgx?=
 =?us-ascii?Q?UZ51TsPloIQQ/VBPr4gWsvwduOC+HwyK8d9KGjj3S7Jmmq9pb05GzWF8sPAt?=
 =?us-ascii?Q?aOIvrJhEFV1OzxlVryWo0t/w9umXaUgYiPVQvlJnRwPn+agj4/58op98CcSR?=
 =?us-ascii?Q?cJAEekX8Q+MsxJFgbP1bQJ+AMWuCuUYxs6JWXjAI0ZFw21fHGBR+Gc0feyyU?=
 =?us-ascii?Q?63JE9Jlwg4b82BcLVYyNb+NE0/tPZth1EujcsfLeqVr0OQNeBTwwTNqWeFdj?=
 =?us-ascii?Q?WZ7MfX6HGyCkIWGfsp9kMkUZwFvQn8cW1ukisHusg1fA4pWg47ST1W0piKvV?=
 =?us-ascii?Q?sBZPR9qAePDyqe7apcxbCaGMk81mPFE1RvMRf9ZRJIA2zHvkvoRJQsCHpN2T?=
 =?us-ascii?Q?/5r48SqyByCW6rUb5Zo3dC/QDoDbIgSAPjeS72JhZVUw1s7SuXuZpHCNHWpV?=
 =?us-ascii?Q?0c14OG8EfsWPq3KvulPNdYAKj13tkRi2ks3dqkyG3CPb3XlsJ4la9kiXTLmE?=
 =?us-ascii?Q?5cBmR28ZAlOAzfwfHFQKDI+8fIJwqXbJZQrcoGnF6fNAGyhSdC724Ecvjh3W?=
 =?us-ascii?Q?0Yg6XAkBdr8vLQS+IjX+AX69uenYpELYT9DZfPTq9ttNoKDYe/6alsrEocB3?=
 =?us-ascii?Q?AVDexTRne1cyW4qvO0D18wS6t+eS3gKqYjZp29eTop+TWMKW3s2lJ5zzbgXO?=
 =?us-ascii?Q?j9gdY+IOi9mCmyJqbUSCr7NjyR7JOc7Q87WWB7nrQ0t8iE43KmCVRqix4Av5?=
 =?us-ascii?Q?PGHBIiBoyZYi6kwwmto5YdA2qJYkrdPjlIDni11whIQobhvr8G94w87bEuzm?=
 =?us-ascii?Q?JBCQPu0TZrPOaGd/X5CvYYoqYAtU0FbiHcnyVct0jXBFZuIbhh73fVo8q6WX?=
 =?us-ascii?Q?6mK4V6eOrVqqL/l3a6uQ0Oika3410sseJhNFyELQjBWDHFQ6OBgnAal9Cn4H?=
 =?us-ascii?Q?60HgP3rcOCJQpDrMDMHNwcrfR35JyaaLGvkw0tICyZwifsLwa8rbJcgJh7dP?=
 =?us-ascii?Q?Zr9chphqAuCsaijG+tbE/bYsKfeeTHTixtlQmJVixGChF7l4VWVhEhr8NEqF?=
 =?us-ascii?Q?0OnrjThTeH9IpIbSz5Dx0kW7LHYndtEY+VkimYGN/QPiPOjaB+e+3L+HckXM?=
 =?us-ascii?Q?xGAWg/nE8ZEsMFRI9WGXTNolHtHWwGOUpU8UnCqOH/QW+qrT5VC0pE7hNJxC?=
 =?us-ascii?Q?i8lq6gAiEURHijjQw4rl40Znyt2zCeIq3HhXqNf24oyROTL9R2E3eE3iqnEp?=
 =?us-ascii?Q?5F00OHKZVIEXzUDEDR0ix437WqnueYFTrDndHJSXnA/WD8s8o0V1uBSzYX2q?=
 =?us-ascii?Q?DO51EyKq4Q1Op9v1gVr7EHVlSnrDa4gdvfjc4fNo8koCK9poXr+N934nOXj5?=
 =?us-ascii?Q?qAtfSxtFnEvbcoA3uDdh9p7lavhvPHcaP2Sew4luCh8lfRF+sjY3AcGahIwm?=
 =?us-ascii?Q?wW8daiHqXx4w+GhCaKHfvMUSbGaf1jGNzcebwEjowvyf86R8i0p2TF1iTLcU?=
 =?us-ascii?Q?E99Z852ia+2JHAz2yevv28xKawAYm4z7XMA/veZtSjSq2fjuDxreKzF7qPKT?=
 =?us-ascii?Q?vp5VNNmCdxqpDGEoaUn7AOQT90s1doDgFUln0h6b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d956ceaf-55cf-4b70-cdcd-08ddbedb9b95
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:37.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWyuKb5ZyVhSlupIERvQbtLZeyLGFlzqBxq6yIAmEtNH7nWdgBexXk8TZUhviKbnlEEpXRNonvp7W9IyfEHrbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

The QIXIS FPGA node is extended so that it describes the GPIO controller
responsible for all the status presence lines on both SFP+ cages as well
as the IO SLOTs present on the board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 736722b58e77..64133e63da96 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -166,8 +166,20 @@ nand@1,0 {
 
 	fpga: board-control@2,0 {
 		compatible = "fsl,ls1046aqds-fpga", "fsl,fpga-qixis", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
 		reg = <0x2 0x0 0x0000100>;
 		ranges = <0 2 0 0x100>;
+
+		stat_pres2: gpio-stat-pres2@c {
+			compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2";
+			reg = <0xc 1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SLOT1", "SLOT2", "SLOT3", "SLOT4", "SLOT5", "SLOT6",
+				"SFP1_MOD_DEF", "SFP2_MOD_DEF";
+		};
 	};
 };
 
-- 
2.25.1


