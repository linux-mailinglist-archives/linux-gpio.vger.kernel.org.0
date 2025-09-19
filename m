Return-Path: <linux-gpio+bounces-26386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2BB89AB5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33A2C1C26914
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC1730DD0D;
	Fri, 19 Sep 2025 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VGsO8aTc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676CE31327C;
	Fri, 19 Sep 2025 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288391; cv=fail; b=Rf5v85lkDx4tCXMJvgKghODIx0Un2R8cZA1iEWbNgNLJc7RPvFXzJtzR4LadbbEINlfzqzT/bumJWKg/iq30iu4mTuTm5unyAXKWihWxnghaCrIxOmr4c0V2cePANQlQpuTetLqtTwfjziYGCK8N4RCzAcgpjlf1FG/BxQM4Qow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288391; c=relaxed/simple;
	bh=eyZuCsq15UTJfInFf80CbZGbVdc5BboZTNnf/aBtBrM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SIqmVReL00M0I6Atw29P4DN6yMUolGtuISJ5jTDD2T/5tMqIYYQe8oQSzPvgGxbMLLvV3rYHn3cScQtbjFpbSIv23T8VVQC0FH5QV6VirqkMSMF6zJXINty7V0ZyjydXl6YJR+n9LtpXPAVk/AhPTPDdl3T89vn7rukWS7nhM2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VGsO8aTc; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJfW7neuzz7aLCmYB8lxjKrqSJqeq/3aiqkvH8ptARHnlow/54h3WE669qbX2Sy4bFFmbjrzDSrknsdmwsRmfjRfvypR1xjbZj/nt1VBnPT8zVdo+2bxV1M7JV2HQI6b2cM+9pw/o9H3ZM48WWgzBvkJyhtqgi3v9UxMj4xz3tv0FWXynM2qeTfVKbRKv6LpYlTTHm3a04cMW5Sjdgcf1O7ULMdENXV8Tx7snnzXuZWxM+rJ8KJzQZxDAKB3oUFfj3L5EeodA0JhFWGMKIa9iWmlinKc83FhpJZs/11jOW6v+isBnhi8FV878/RP1MeXoLwkXO6yP4XAI7H7m/i6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXQmbB1m7HwiFS/BQn4rCz6dIdWGZryqYGTAZNKVsj4=;
 b=i0w6iH2R+tUnBY0S4qrcYbcZpN1AqABzsVeOY8oLGj2Fv7iclZherefUY12ZjvFFd9VGiwVziJleuBJHIICP7K5f91wbwPnG24Wk4/vf6YZekTWmnyxZ0n2DPW7UQ4+1lpni0AP0QDrN2axVFIBdYpd16tnbY+1wTOc5xP3gB8+PSmPv7TJZiauBAgMyuVyYwmDqE07pvBU+P1oEmw8JdaKufAxVb0CYXdrjKGz/rucVwodMin45qIUcUqHqfNqZKfWbFBp/tWGgslKJXH0ZXI52X1MnDdCMl60/VxtJ6Fh33qkJyr9YMJHuj+86uF+L61VaOr5svWr9wEAR9ofF4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXQmbB1m7HwiFS/BQn4rCz6dIdWGZryqYGTAZNKVsj4=;
 b=VGsO8aTc20qlZbnodO/qYqcaGyNZDxt3Z7xO0qu8eKyH0YZ/PxYDC0T6iFxhGgaB7yskTyhznUDzuHqPhi5wc3nMx4j46jUJyrbu1od9mVgvL9XKZOxSCP52v1p+bEHzpt6pr9P/dPujetBXoEY0FUIbQQQkVCU4aW5CvoZoo7N/kV2RCgsqdyCQMzqDtOjUOvoG3oUTrvfZctVGJheo0zWzgUNgD9MEPhW8QoKwH0z/fp7pH1jFhj88vnrAdGjdTeAB+donryRQQS2cMkfcwxWil/X8BHx98ZSHw5eBOBKYuoF7/C3FGN/rmciICoMdQYV2LGEiLcC+j5s8elxERw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PA3PR04MB11227.eurprd04.prod.outlook.com (2603:10a6:102:4ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:26 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:26 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 11/11] arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages
Date: Fri, 19 Sep 2025 16:25:15 +0300
Message-Id: <20250919132515.1895640-12-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV0P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PA3PR04MB11227:EE_
X-MS-Office365-Filtering-Correlation-Id: f9880d76-2494-4847-0698-08ddf780227a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I0Mn3aEL8U0DGXiqnY+qW/pFrMcSRrfYzI/9E3z/t5xlQU3Hqh0sfDFl6LIE?=
 =?us-ascii?Q?SI/S6dd+SS28dlZlkHz/WfhM9R4lvLUbgIPl5D+F+pIezwqg2GMVlcASZVpa?=
 =?us-ascii?Q?qF5UiekYTQSTFJgBs59NcgNlkYjGqKLhTx1NM7l1Xzc9J6MR883SUCIBgWQ8?=
 =?us-ascii?Q?YetUAvELWsNGiuqSb5m9be6I6fEwbe+6qtIRuBq57yf86tKyf4CdExgxhjlS?=
 =?us-ascii?Q?6QPY+9P+QwlwVl7qM6PmobI/ogdohkOZC1kip0GEyqxC5xkTRvgZz3SGS0PN?=
 =?us-ascii?Q?sagaXG3V/MxnBCxlKDProyOcOaT+Gx+N7AdwBgJQzZt6gvOixTWLx21+E9Kv?=
 =?us-ascii?Q?v/IPirCIV4XIr4iMojMbDcHzEU6lTLt8UyvU13qbQOWS7jvbxZ43/dDqbauM?=
 =?us-ascii?Q?U/dq92ripj44IDRSvjzwvs6CgnmFmfc//9WnFjswiaiI1TQ4HsodGP9YUxxx?=
 =?us-ascii?Q?X3Ni2w+mAooO/SPZGRCEKSzo5DJYJcpLq6RkL4rs4Jb2fgTA/v1oUlsWS6qM?=
 =?us-ascii?Q?f7kg60M/psKckNPPBj8Rz4tEXACyxGu8A2YBMF27kFp4V9PBFXjtc6Qyy2mo?=
 =?us-ascii?Q?4O7GqMlLFl0JFpNeF83S7/h9wwFUgUcIxh2PNlqbsjxIh1k3Lu4xZi5hff6S?=
 =?us-ascii?Q?+vUqk3+iMxtXOwyqDpLJTqES3CFiqQwx3EYXLyhd6S+pagtnNfu8IBlZTSkb?=
 =?us-ascii?Q?QI+Pcy3lpJlVKt1kJZuQ2/IuUKURy80xMJab81bbQD4ua8vhC/MM04epSska?=
 =?us-ascii?Q?24DP4Yp8aqWulmxAwS5xd1Wl36XD3+bG3K2RBp3qMZrhgEWb68MU+KIRY0X6?=
 =?us-ascii?Q?LI3Dr/pu5ghpQrZonSqMCjddELJiZmwEcUwHG0ZtDZoaja+TJnmDHOq47sn2?=
 =?us-ascii?Q?bhoyBP0B1MWA1e008LPX6vTcmc1FOYpi7K+RQKVWsvKlZdJnMZoRN+OpqH7q?=
 =?us-ascii?Q?psOdDNwnQYX+ichiUzFFThVxfj+e016RqZ7mH6rRFWw/VPg+LeNuyIuZ0+UL?=
 =?us-ascii?Q?dVOTBaSCf92va31mbP++QeXiG4IvXZhjfDOCNq0+bPFDNd8tnpUkRW13SmEo?=
 =?us-ascii?Q?T1gq2HQ4Zp7E+QH4peU14icca+q+Vqe7435AnlTAnCRWc+ibab2ZNFMvrPC+?=
 =?us-ascii?Q?AJ9hTiDcqDiVBVjQMAxgLEAl9AxhXwCWCNhCX1t8Cvz/kD6/SwznpMwYd7Da?=
 =?us-ascii?Q?grcWiCxeQBLiup706B6vudJFzqvM9VNCzTH3PX9+cTHLjCf/5DBKzH4w9IRg?=
 =?us-ascii?Q?gfFTFsBbzQza2l4RRUZhOCptcIC25Xl+MDkKSpuap6CPu9TCAQfkgF1cYv5y?=
 =?us-ascii?Q?sRNCmiZoA3B7v9TFTtes0NYDxDCr7GClzt/98WSqn5prvL4JlTnRxXlvAWIL?=
 =?us-ascii?Q?n0gJBSaQOHNd9J+pJsC9sqabaP1xK3p6BzXbqznSYk2lQDAbAMfgzD8BcrhE?=
 =?us-ascii?Q?M1LEnFqoUEgmTWgBWZOz9xpKXzz70Hf6M6wOojbIy9tq5cGnakqwVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f2GyiH36/qEadoHLGZBYvEbqZaP7847+belmoeKB0fbBhuhGJc0ovYm57mhj?=
 =?us-ascii?Q?SSb1ybUZiF8ohj75LJpKfeksS4ILMu2Ab4QwmGnyQPtl2y+SGeSrjQf1PgU5?=
 =?us-ascii?Q?qw7o5Tr1cEN5AWPh+kwmVQ+r6kMehyRV67ArweUqoCOYiSSg/jjZXgzU9GNw?=
 =?us-ascii?Q?awWQ8xLFb7Nz6lQ8uSv0TC4G8wY0HNzQq+EQF9iNlFFgRv22ugoyeDVrRpaf?=
 =?us-ascii?Q?BdapcYwIX9VfDYVuxcqhv05MImrEwp8lIBexHlXvVZ5nqJkDfWfZTOAkLMuc?=
 =?us-ascii?Q?1t1l+eXFEyCocFi2sJ0RTvCSHvPXX1bMLwYpKKp8T+o1DlCnmjCR/6Arrzem?=
 =?us-ascii?Q?ch50CpuVyasttJLXgm2Fc1h2X1H5dpehJYbYDcYlROmGecd3FwhrEHvvQzUm?=
 =?us-ascii?Q?I4+asf9aGfqFR/RFsdVP4N7fX6nOVtf+gecTHJX1ejovNxjvuNBIAgGHu8qR?=
 =?us-ascii?Q?8z9QxcNJQrtH2BiTUrjQm38VgVike+zfy5OqWW2BZhH8vMGgomQTRIO4s2Bp?=
 =?us-ascii?Q?+Ummm1vQ+0IgPZxwzKxNNABgCJkKQIsNsbbJ6u140weXdYVn7gUPBk96cP7H?=
 =?us-ascii?Q?pS2ETegUynTjAs11/25vMtsNqTCPVjcL9MRZypHcJj+1en5yevMUoeTQTvIw?=
 =?us-ascii?Q?n/WXBksPS78Kw1DfE/2hoHL3wYLu/i0eBa8aOUkWRyNN0nz4FkAwJ9XADhoS?=
 =?us-ascii?Q?r/obssL8bphceTeWWqxdnz2578vpvDvLkEt4rv6L50fFCzHNg1tti2CAA3hH?=
 =?us-ascii?Q?zggvH46ELBZF7Mne6hI4JZCCMcWNWnbVJqCR2McWwKSe4hOB4x1RK7zpyKLS?=
 =?us-ascii?Q?E3zeG5f30pQFke8daXbdp8zYw7BmZPaQxOAxO0JX7fTFn3YdUI0qpcDIlRb7?=
 =?us-ascii?Q?2QRfydgfPAkfooh9oJFkLAYmpLWnWrfZxCxWL2X61pFus4gxZEPvRLFoX/TY?=
 =?us-ascii?Q?M0xcCiEOxPPB4H7k3FhWulHg39msShwvd1HJef4xoDelcyOU+UO+W66L4nia?=
 =?us-ascii?Q?0OCAqH8Pw02zzXzxbq/jcTfiC/yaxjRsA0Zs5LtXwimvneiN25DSrXhmTKhG?=
 =?us-ascii?Q?9H6CWQPz0qNPWbwM+siHaS3kbcf0+RFr4WKjc2EQSwwuhfdjRH1S/uV745WG?=
 =?us-ascii?Q?xyAbkgFNZe2xfXMn7ReEHa8wiXAPqG9nQr7N5ZtiHAlvwVKoCRayzt6w2pYV?=
 =?us-ascii?Q?BlHNPdw2HqknkBhftHxD9qIHg4DwHgQ+sf7qxOKTBcSSX1u8eabnMjbsHWJw?=
 =?us-ascii?Q?L3frfNsNck3ohMghRE4BTHPcVFEuP5sxm5y+KtreDebPjTwd9if9vTaV9LB0?=
 =?us-ascii?Q?X5yoQ+MLbFrSnw2fA6PndHIfZeKt0aCwn3CDI8Wxcvm1wHdpxaCh5dAt1vzy?=
 =?us-ascii?Q?9p09LKimgd4bY2M9nEpMBmhqnb/khxVWSu6hV7M4T9zGTc5P8t6qsqgc7oKB?=
 =?us-ascii?Q?HBjTZNJTD7QrErVPdyq0kXKzqO9TbmBfX2jxT/0yyBBCzXAahNVwdoqzKkGI?=
 =?us-ascii?Q?HBE5PoGoBn4Zrq7a+q19ebXmHYFCleuUU7aEUGh6t63hK26fBSlGXg2tBK6U?=
 =?us-ascii?Q?p0Em5UL8sarzXHSb37QgEP5hmOpS3YIw2525QGOk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9880d76-2494-4847-0698-08ddf780227a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:26.5991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WpvMKY1DnICtZRDYL93GouM/aHVCNznawWAvHGzWzOYTCRQzHYAkdOdqjN6c7UOZ3tKOJioPxiCrszv9myUhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11227

Describe the two SFP+ cages present on the LS1046AQDS board and their
associated I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.
Changes in v4:
- none

 .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 812cf1c5d7f4..48a6c08fcea8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -42,6 +42,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sfp1: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 6 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 7 GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &dspi {
@@ -139,6 +154,31 @@ temp-sensor@4c {
 				reg = <0x4c>;
 			};
 		};
+
+		i2c@7 {
+			reg = <0x7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9547";
+				reg = <0x76>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp1_i2c: i2c@6 {
+					reg = <0x6>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp2_i2c: i2c@7 {
+					reg = <0x7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1


