Return-Path: <linux-gpio+bounces-26290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 687BDB7E437
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A24A1BC26DA
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB33932E2FC;
	Wed, 17 Sep 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RCzSW129"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1332E2D3;
	Wed, 17 Sep 2025 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099902; cv=fail; b=QSpX6G78PpPJmu9TiL8db9qUqYskoiHMvaocJtiGmPZyt4n/0oQgUMUWD27LW1wcXywvA72FQaHWT2dgkSA76ld1exJ3XCnzBssju/tw9oKRbfdRhrAXQoseVY9L42J7YCFPLwuaLAL36SBQGmcHI1lN3aSm+DbilQFAfK3R0uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099902; c=relaxed/simple;
	bh=Oz52hOtgu9HjBQUKblhcTPVFImpGy+/T/Sc7e0S+1cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UyYqFG9EjijL2L5zW09cJucE8i2dQI+HwZMXAfAbvhgKBFefUOsKzsMNr7wMTvtO7IygZXLWTxWko/U4+qvhlF4vPDI8e237ORN1GI9i8tpygx2mjkHirRxM1kOOYIAH/VMBAiDPPEIZSLcZbnV3BvlI3TwbcIQbjNXwCvvCVow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RCzSW129; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBeDVK4muHOjVUyeqOtUIo9cZdxFY7KVr9csrZCh8IfgbOScQAsqeiYig49Q4rPbv7Rg4jU2QpzJoTYHi25AQek+Z6xD+rAfHmrVMUUAad9QiEnltodjrhRdNMTnZZ246oaovJW4p5aq3INQMp3BBA9RV0ATAMUO4m5iAHLOS7zVafcxTPQiHRNFYoJXV7Oop4yUV//HJAjMkQhyeNbl361F7FDv/uszJtAp9JrhBKPMCBFHGHyGDhBI8fIgVUL/nIgHCPtNTtqMi7FIskbcP+eg+cTFVNV0ukAWFK0p1dgnXbVoHjPf5L6NyOCII4pG4AtIlRSSuXQI3Q5kt7Divg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Svc+Uc14ZYFawtP9ZSndRsxYwkYGSWD0HwEfBKiIFI=;
 b=NaroHk55EMyTeGKZjA0vbMt5pdAF2MftRr2/9z40gNJwUwjHguXqq6sp4a/QBNkxhQnutmjrayzuD0rg0co9SOzGSeybsVOP8Igz6UaVVx04kFKOT16I/WbxUFi9w/+BuxLB46+M10/C7P/if3tsI6mVpuAG86jlN0k2KJHN/3n0MkKwR7I1wg9eCvQslP7bQPSrxzazQg4HqN9wBci5FoU9PL/AC7OvwePiXD9/GUaEd5bebfqgictB+yLfPNVFbze/rN7px/mhjhKaqvc418qQi2Fj5A+ysGgthTueRaNfm42AwO107VQwJ9Ki5/UwYCYqnw5IDO7mxte5YyGy0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Svc+Uc14ZYFawtP9ZSndRsxYwkYGSWD0HwEfBKiIFI=;
 b=RCzSW129DJV/vjldyr4iVpAtO4VhEkfLeOiIqrqCtBe6ri3qrjdAdQa7/AJetgPjCjsNzBJ5vk+ioXD/Bad0qI7hwofjfK/edP+7VF8v0+MfvQRSeSW5+TlsU0GD2NjME3OzOiKpT9cwGaPJSUkf8UUsSjTOCmjpxuacQWv1KHXOptiveWosHhfwvKqxm0gI8FzIPJWAf7aNKA4YQFMlmT+d2lh8qgTtTc2Ko19f67pPZHjIa6hHm8rWEi77kin5z0rTfHwKusoMvWIggf8xHFo33yEuGSdm9x7JHSssx6MB28N6/DaNOcQ4f1KK3nYltOQrDcBcO8pJEMh0f40LyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:04:56 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:04:56 +0000
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
Subject: [PATCH v3 03/10] dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS
Date: Wed, 17 Sep 2025 12:04:15 +0300
Message-Id: <20250917090422.870033-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0092.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::33) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 1178ab18-d0eb-4d1b-6615-08ddf5c94561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BCCE8UIQkkVPfU9wOu7XeSJHSwi/HE318/qSnldWrxry37fx+8+LoF5XxJHH?=
 =?us-ascii?Q?MsJIU+caMydyvbMfJGRfjDsrEFoSxlX6ZbZ3oIWTf+g1+HNCPkYLcJfEcnYi?=
 =?us-ascii?Q?2lJj4/b0vgNDPI+3AoZNWgGeDH6TVB83exJWfl4b2cIO+UPxe5Z/VjQKPq/S?=
 =?us-ascii?Q?ji6Ql3M5Nr61NA6VCZ5YydrDmMZv8aQ5i4dx4KjbZ/Tm5WGhcDPeOUrydKGs?=
 =?us-ascii?Q?o0lrlb1knmS1Ebkn2erl+bmLp8LbELryB1vE0GCkb9s3TaMEyKSJd4IbFAK7?=
 =?us-ascii?Q?VpRt3FMNsS/wJhMC6ujnZtU3yD2N1kary+utDGPRJsXN8m1JRjyNMLDmnY8r?=
 =?us-ascii?Q?Ls7KjIlwN9B2sPdpR+52NRiv4MCflEcgiQxINBSvslLC5pXeVRBYA736fyAA?=
 =?us-ascii?Q?g8ZV7ORC+K4dpcjvhRx/VrMODV8CRSeOFJk2d3P4mR28u+/zUfuuJQpddhN6?=
 =?us-ascii?Q?1bXdIwjEuvl/ZecdvqFtjS+3EOBE44yzUqN6CT/mTC8ziGQZU+7GQzDdIJ1R?=
 =?us-ascii?Q?YRWU2JjYIG3SZ4SjgHhB/JMuKjuX2+6toMZRPYmE9rqwuD6Mj8zmI1ndK15g?=
 =?us-ascii?Q?x0RMty8MfPu4GKiHI+n1yBnS5bfuXi1jQv6N4eKkT4oqAj1LJCVTgyITMVWV?=
 =?us-ascii?Q?wXe8EckLHc/QKZh1RygZmkm4itivt0BeCbUOweFeFFn3vkhDS9OX60t7X8qf?=
 =?us-ascii?Q?B1uC7EEqSftaV6DhlsWKqTbqqPB3sDCsAdNt9zRtDceQQDS7sD6eBCbZCgFn?=
 =?us-ascii?Q?yp3yNEFimzB6u+rWyaRZeYnrMg4M0Wayx2Upn9Ez43c870QaY7MJb2bKEALA?=
 =?us-ascii?Q?8KoX2vXn+XgwFVZsUMUZa8SCdtgBFkbc/PEM98AumjS09TjqrH8TgHba/Z2E?=
 =?us-ascii?Q?VlZxJHQd4HMce+2lLyTrJepRlkGFHN+6w/9UI0p/oI/0zkY2q1ZkpD1jXncT?=
 =?us-ascii?Q?Y1YKI6TNgR1pp1hPQfhrnkPQobOmUaRqeNjK4F2Su2rGBeAHMaJJv7Max5nK?=
 =?us-ascii?Q?6m9b/VeUGbUFzGrypiQd+nnXQqKnlq4G88Sn7p0D4K2caM4oehbVXHBBIEjM?=
 =?us-ascii?Q?aMrOLp2RNMZEhU+ffOj/oMiS44A/HouAXKsWW9G/BBZBJsLa1u1n2r77lOw/?=
 =?us-ascii?Q?HA0f0vIrE+7EjKfurrApbVb5k9zWTPfvVChPyzCka9Bky2WdkQ7BOuWEdMgH?=
 =?us-ascii?Q?YiZUMHGUj9P6WyMlES46P+mad9Ie0j0UDjQHsPqUSIA1QpzDOeT0CQkmFpoG?=
 =?us-ascii?Q?y2Kc9kUJVsAR1GRBdVlLnarQ/vJxMgX8Q7wQzmsBHv8rJUpEEpdHOZJgPtUL?=
 =?us-ascii?Q?Vg4uIxJPW9eek8f3BMbONUS8HGH5w+ybqd6VTVNz4rW05iD0yDFG6qk3+DYG?=
 =?us-ascii?Q?dSbC4MB45OvK2JkEuou2fXMBPPrMM5g7Sxc9JTtfGCWff28pxO0QVbd/9J7K?=
 =?us-ascii?Q?zuD5OFv5cV8x1GGrN2uMkk+P68FgZM1ArEVFh3Iv3i+N1sBoDAEo1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qtSIVc3aqI8RluQBivylClu126DiVNroCvEW3iuOapCOdrfgFm9IbES5FVNb?=
 =?us-ascii?Q?l4YJ55xjB6/7ZuPJjKK1opWlIbQAVWJfBR1wyx6wfCpZSfK2a879Ojg44X6J?=
 =?us-ascii?Q?v5ZEwQX8N5IaOhP4f+HuKJNy3Mgs9Fh4due+Ju2Ah7GbyFGY4FWexMtSwY+Q?=
 =?us-ascii?Q?u34omcdGn346eKA7P+io4q41tNzRu5pOW/fT5+KgXqwJPD+Ctva3MQ2vAGxp?=
 =?us-ascii?Q?tgeW4U/rqp4Jq59c1RGwnz1UTnzBJoRJoY1MNux6wzJKCvmLyq65UlvzZ6Ti?=
 =?us-ascii?Q?CTQrfnTqGhjUS3TpTZcTJOhNLvDmU4C6QZA4dLe+1aopAEMWYEn6wHIYddpj?=
 =?us-ascii?Q?5WWWaLTDqoPsP/wb4/7qJjh+EscFJPYC2+ytXHAAoZl0N3Y9DlDa5Bbl8jO8?=
 =?us-ascii?Q?dGfuc0TKxwJMiyJBzZ8o4ucrxgrFiy4s+vVUs0RzCX/iXl/ODjBkbPawjhhh?=
 =?us-ascii?Q?phNCH5WFMfFkhFj7OgDgR3NuccC3aPbdh/AiHQcGv0sWaCRQOQOMDKlESVEl?=
 =?us-ascii?Q?pMDCBYDZGBz1NSZoabwAhFJ0dgIiNPpFUa6NRtNc29g+QZcsXlTMninR2e2G?=
 =?us-ascii?Q?NNbEiaZ60ogsEMp0GVOZdWbdN9bx8pJD6Pt15nkjFfMYewPZ956w/yXEs0TF?=
 =?us-ascii?Q?Xb3x/65HsdPl8kIjSWMmCD3fBSnVcLl5RQ3GYElPYGRYXtoxCCInxl1z+I3Z?=
 =?us-ascii?Q?TuqdFhvq5lhPeYFVRTXfwTffMa5XuL8baxixDtuRKaRZPIStIVR8krkx6FLy?=
 =?us-ascii?Q?URXbCms1z8GtGqMWSQOPyXQ992HtcuXTomHlqHBsrZkpAn4/pBP4SQKgdu5o?=
 =?us-ascii?Q?AW6EBYZiWTULk9rDz5ThRKr7qemAeWlzwW4gsrkd5OmVKjiqP/6gy6xFbD9W?=
 =?us-ascii?Q?LGa3Ttmy8ZOzxousA2PdehdDZ7bv+oBPH9ilERc5VqxNCpNTp0MFwVoCwES1?=
 =?us-ascii?Q?vJodeqsfaSNpbJMKGraKaKmMYWiHTDCku7rveVExTCi/PTQ4oijl8wHeLoPA?=
 =?us-ascii?Q?uM1xBIiLoNetCLpTTWfJsQ7qhL9ovbCX/eh2xJCEi1tp80hmJD0foOmCd7wG?=
 =?us-ascii?Q?ydN0DdBpyD9Y198zSE+mxoQ/PzLkwWnKdW2Qr5mbsW+k3fyMSj8jQdnmLmhW?=
 =?us-ascii?Q?9VHIngJ04OJtpYmISKcHv0D35QTWL4gOZfSji6hAh0E5d+y+docNjbU7RgmK?=
 =?us-ascii?Q?SIdm2PlhUiHGCKPN6EuoBZ1rx4Ha57Sv99vf9aGJaDeZybynjqRGNHQ3n8+J?=
 =?us-ascii?Q?a6DJux3PP7ToHIM34duXpvhCkpds2rNzFcJiXqWWzM5AFWFKJ4kt4lryrDcD?=
 =?us-ascii?Q?+dL9iFOlcf0/UYAHvuD5aSIA2dc/40j3kW/cuigkwnX7oyFSl36hqjrQ7m0s?=
 =?us-ascii?Q?3iz9N7O2KNh9Dne3LKvQTLWltogrtxqiXnlMNAqt69XtwXsloOuPTmO0gOt6?=
 =?us-ascii?Q?amz3Hocq2MagnFwLP25MfVve5dYpPQ5pwczuW0akBaxCJYPWtLCAzlTfKUv4?=
 =?us-ascii?Q?u0pdRjNfgavv+HqBoR4AZSIf9/BRuLJ1raxYRC8WwjM3UWDR7PftMCPqPcEn?=
 =?us-ascii?Q?fHZ8OTYFsMam7KREVr1ZGWBbi0nvNBGNhqm5jjQP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1178ab18-d0eb-4d1b-6615-08ddf5c94561
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:04:56.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75mUU60xDpv8dsXpANlAvJNKR5jfYEKG2d253QrhIJN0Qr1/rNA67uJJGUKuGHu29K8sEhaLmwGc8xDj+bgBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Extend the list of accepted child nodes with the QIXIS FPGA based GPIO
controller and explicitly list its compatible string
fsl,ls1046aqds-fpga-gpio-stat-pres2 as the only one accepted.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- new patch

 .../devicetree/bindings/board/fsl,fpga-qixis.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
index 5a3cd431ef6e..2eacb581b9fd 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
@@ -57,6 +57,16 @@ patternProperties:
   '^mdio-mux@[a-f0-9,]+$':
     $ref: /schemas/net/mdio-mux-mmioreg.yaml
 
+  '^gpio@[0-9a-f]+$':
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          enum:
+            - fsl,ls1046aqds-fpga-gpio-stat-pres2
+
 required:
   - compatible
   - reg
-- 
2.25.1


