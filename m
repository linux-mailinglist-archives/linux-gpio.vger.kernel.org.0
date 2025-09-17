Return-Path: <linux-gpio+bounces-26294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3DB7E682
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3BA7326EB0
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC81D330886;
	Wed, 17 Sep 2025 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QVxa+qEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81833086D;
	Wed, 17 Sep 2025 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099911; cv=fail; b=s8OWtde0isf/PsuPbriz6OlDgNGwYc4Dc5/6ub8DlhLlW1M5rZCaxGe1luVVVYyGQ6bV9S2qN5pRjTaJvrltRSqS5XJX9iFmDv8gT6AsySeKw9YFq8WjcT5QvMY+XKeis0ctD+djoWM9pi5N/3O2oXSRhXrQqF0TUeB+2TKsZtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099911; c=relaxed/simple;
	bh=IJ/2Y3EBdajufCmiJgnIKgw1VO8hyjfc2tNi2bY0mhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lkBbjIrcEUfiLgn5og5aSf6hQjqFw9QiJTUP0ShsOSxT7d2QVGsnOxh67Js6HEzIqAVQT3IiJelk9HyTomzRzjCFrz8I4R26JduvFBPpKErpaHb8EDI5FTm1ax6g6283vd1e9tBy/i0C7d5H9+HUmHlc5kcxtb06GHqEda0csh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QVxa+qEl; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEOBTdrXfRgYq6ynwHTaJ8ptQ1Ldl5RcCcVZhO4DreKzn1I67oOH17ilRtoYP/n0/WL69ygh5FwlMMdRjqTjg2L11m9HviA9WKk6raYLuCSk+wV3bWgBBwkSAWoyjNmx8/39GxJldQ8xdJyQBNwgfZgNwfKApyOK9bffiYKI+MhN+vvlIMEhWqtlrerokFgIFjmc866ePlinMdyHszh1IYIeXTOdUg1ZVPTWWNAT5t6s9PrZtdXe5hkBiQGQFLsiwz9WVdiRi5o0IErMFYim5qOnHVtUNQS0w3aUaHBh8g16S9wcXxnsnDz6MVAsz76SWf/xQ0GHzFyr5px6MKiz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZZ7uHOtfHPSL4lQo57UHdhROzMn5R084RLDbe6PWMI=;
 b=Ac0DGnQTfMt9Fvd5XmN2Rd1c6G5Vwhfq6QF/F6aj5gvyQfaLt0/UoQ5Vu/hlwm0quO3SWmv5WE2GXLkPM59gZFEIn0h7s3AziTWp4TPop+GhbDryVsnmzr69Y3QhBGZMU2C1AM+l0FfOMaGkQHYd9E2D/0hs0hYbFvJ27Y+R8h/kqUJ0sxVl1YQnFjMWqgSGYoFCnvjWhtMFZXisEHfPIDSdZflxuqgr5UDIuGO4VUd3WDF2mGgf/RmN7ET5bIgHPOUiI9e0LXbk0F4ULBCot/rMJizYcGp4lBN9k+yaisYzdrMLPPfXzoOLCn2iOzpqNH3lQQ+p6pAKkB3qDlmtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZZ7uHOtfHPSL4lQo57UHdhROzMn5R084RLDbe6PWMI=;
 b=QVxa+qElr/YBMHxeCt/3VP5cRTBiVem7LNA2x8ONz3/YuiUNML/bxU2wSXKrcICrH/nz55Ny4lES2LNiLsFrapLBeWwMyB5l+OWm0VXROkFx4/m5lQlcOjmy0Y7KV3cV9Eimjr0WGwrXTxJfMMOkXQxT6LM8LurbfCKY/1SoqGlNtrY/6q9zXIW9LNUCjPAC6Hwp9v7NTOJLKq7nqNgpWQQPlaICYuUx1JRT27ag7/4useHVUxNnlqCa55UUoWKqx+jf9JejgaDPhpKCajIroQBNcGglFw6u+Cfmbmgaw4AbhOfD6wo8XrbnFbzjv1gWaEBtFaBGYz3eN0CEPdj7jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:05:04 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:05:04 +0000
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
Subject: [PATCH v3 07/10] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
Date: Wed, 17 Sep 2025 12:04:19 +0300
Message-Id: <20250917090422.870033-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0081.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::22) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 2318701a-5f10-46b4-726b-08ddf5c94a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lG49dOt9ug0esa1oouFIcKTAK9ayrG3lTvuNnjIbeBG7drKbWkl0xZoevMXH?=
 =?us-ascii?Q?0OaJkQ3JJvi/wC5s7DAmvosEZkjryZzz37FQKtjCT/yKoRjhzFJyjHYBuH8n?=
 =?us-ascii?Q?BTdqKigmapOJcYE2ZigCt5qmnoqEdttrFCtRUnmTtVDBZTiouSJANHP0tLtW?=
 =?us-ascii?Q?CvpTNXh8j/xqQsy+UgeP8aVjoL1zR0msiDsUBp+qu4mxpqDQKz+TTT+rudXl?=
 =?us-ascii?Q?8BWmBimOOFKevUumLvJUm+bhg1olCRAuLvLWTRt0SMlSEiSrkuRnNM3/fNF4?=
 =?us-ascii?Q?EAOquTOAp5KxXKWXz68XmIgF+/IcliThWIAKPt0QmhIb7OhmnJL1BVCnsNYo?=
 =?us-ascii?Q?s7M4aFLix2USIbVH3lQgIS32yHFvimC9u5Lsz390uXgUcTWqlbxuxh2O96cR?=
 =?us-ascii?Q?7IjIzBBKjh7jByFVXZISztgJiOM3oJTqiobtijNPuZ+TB3dLaw0Q8HtX9H1p?=
 =?us-ascii?Q?BmZGYFjAmAC4XFr5p0LK4NbVshPPZz/SKW6vNYqBf3xwDljoQvKC88VItIGj?=
 =?us-ascii?Q?ZYqNcVXQZp4+rzc675jebFdTKIjlwiCrFd2QAIRQx4xuD9untfN63xvz+5Z7?=
 =?us-ascii?Q?7PJqHMSyx2erkFDD5/QhXBBMrcKik9NJJOqX12YbFytHtPZ1yxABLimtoBJW?=
 =?us-ascii?Q?rEUeFf1olFjXrxAAkiLfDMpOc7vL815oQUuXIDzloTtAKRSAWyjRh/kTGxln?=
 =?us-ascii?Q?IpKsSbc8KSa7ZZSoC0MZitlxVVwLQqUdjv0kcTzYywXsqPrqXyFWDocunuHS?=
 =?us-ascii?Q?BBd88ivpFbKHzcdfNuSJ0MQRmLeTeukWhgqDfm032oTSX6R3xGroyxaIvz/c?=
 =?us-ascii?Q?Wk0vG0pceQytNMHZehdFk8t/iuCDRet6nKZMCQVtp9H4GdxyF6cOyi66EyYr?=
 =?us-ascii?Q?BfURVvKDE4mfiMkaAOG3+gQ4f5kOrQgwYbUCoQqKzOnlhhZv2KWF3KMSLlep?=
 =?us-ascii?Q?DsYdftjqX35q+oGXtBH25qmRx92VbsGVHkhwm4SmqjxwREO4SN2675bLr5Cu?=
 =?us-ascii?Q?tQJPAlPeBLSadDFbzYUPnGwSwaJ9CxxIe68jlXyUW+20dZGEu0TKleSMh89U?=
 =?us-ascii?Q?xwGdrheuwIA90vyC9sxHZv26q7YrECvu3UvJpuV4lZsfulKqk/OwpBtMLM3O?=
 =?us-ascii?Q?8kKpc4cjsGfbHnDf1zmUJANaKH4NBs/P8C6NRdyAzmWf0ZY0UHaqEAAod2BK?=
 =?us-ascii?Q?os8uAKp/7slyyrDb8+Jh2goW5QKpsiVIqNS3Ak55LLDuaGrrGVecukowCRCe?=
 =?us-ascii?Q?uzPXyDhWKA+yeBgTd9olvRQBgL5/YjxdGzAGGGJxx5nJZDz0Cbf27IDrR+aO?=
 =?us-ascii?Q?GC45jOzrQ1CqKrJaTDBjk9zmYMiyXktwu34QKxqMbi1CxjKUd7Uqw7VByvyE?=
 =?us-ascii?Q?E/pefdVLXdT7ayLV37N/sED1tnl0cejg9wY1BcPNnppIFxBd6Ba5JD/LVb9F?=
 =?us-ascii?Q?1ZP3ZksVLk9U2WFLsZbZDoXiNAybCaEy8ZvlpWI9dSswazNqZDwj+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5cupBvgJGY694oWBE8Rqaz+cRIuoVN0n7JUagwD8k8UY+JAw9K0GpE+XT9kc?=
 =?us-ascii?Q?FyEr0qCkdATrpYLltTGFOj9nSFaW+rl8Q5TIYCI3aE1MDJN9iOXZIuxi/Oyu?=
 =?us-ascii?Q?iCyOR06t5Es4158T6Rmzo2EwBnNXGxVmHFuCxin1vuNg+84qdqrF9YI9w3ou?=
 =?us-ascii?Q?dDofEC+X27Gf+E/TP1GyaPCGyLN7YkLogtJO6jb6tinXk0DHJdscQaX0DPZT?=
 =?us-ascii?Q?hF+E/3L0vkd4n/75aagzGSZXuh/1s11FdHc0vCnrKN71OQZ/ixq6p1EXmNeb?=
 =?us-ascii?Q?mZf+Kw5ATrBh/LvrRZk0wlvuCD5etgGtU0/+Tskaye8skSqg6r65WjRWxzU+?=
 =?us-ascii?Q?IVOpj1Qw/8alWwowPx84jqwlxfEZdJYcRZMqjqgYebQJkw+PPAtCT0dAqlFY?=
 =?us-ascii?Q?eDZeADKoi7kLIAk0xqaS5SL2njufL9UCqcvRXqUc0lKYXLtwwx3cnrZWXIsa?=
 =?us-ascii?Q?IciAUbcbZyf6uD0a+kM0TWdTtdn1FFBFLJiLl3qx8vSJbLcS0wC97ZxJYMRe?=
 =?us-ascii?Q?VfrTdkphmg+d9Bz0+IUCTZd+05dkQIiYp3IDRWEocBEe9FbOTnuCi+1MPMvn?=
 =?us-ascii?Q?aInnAfU8LmrO/acuPEkXCeDXqQcquVjkFwpHY5FnM/kvL1YhluDfRMCRfWK3?=
 =?us-ascii?Q?XL5pZvJ7yJAjMgNalWon11umKoySZMZxuniHO+R0UISDc3Y6jDc7nPQRlW5t?=
 =?us-ascii?Q?FQ1sbnepMxA1tg8SQhRvppqCf8MKnBtFXvx3WvhdgHO0ltGbjcZooDD8Bgbn?=
 =?us-ascii?Q?gJzBo/UQzd0rgDKaDPf4BRwG1weMfyTMOHVTGlQrwl0wYrQEOdi06V5mAauU?=
 =?us-ascii?Q?ijeVEdkbmsFAkK52V3iiWQqI5YacOAo4XllYd1XxGxkpzE0WdsQH9yT7JOBf?=
 =?us-ascii?Q?xo8a+hdx1v6UDbwnD1djpF1qt4ZkIuRxTM4PsupOHJDCnmk5FgpELQWgKuoe?=
 =?us-ascii?Q?vqtrKQ2QROBkM6O+Qoo5SvEK5QLiv1VWFhwFGRPL8ViGtE0J4uzvsaPGjnKO?=
 =?us-ascii?Q?ele3d+pNtePJSViX6iCPdauSSz0eun251b9A8W5gF+1ECnNGyvK2NZ0pYNBs?=
 =?us-ascii?Q?cE7kPp8cjsSW4PXhhKi5VjGIT/lIjQeNyIdJbOlOH0xUSpT/tI68hjyi1g91?=
 =?us-ascii?Q?B/8mr+2h1zDH+1cDaeNeL90IFQPH0J91OFKSXBpYH/By+QG3URs6HVLvjNU3?=
 =?us-ascii?Q?IGPflX+EPReYSQai/QYb6I0Bflt7cMxqhTxssqcXJmK7SjTo0+aJj4VJMncb?=
 =?us-ascii?Q?YheV3k2Rwmn7uFo5vNzj9D9AoIn8vpXRjhoVAL7qNCfR/+rd00QPnUgktOT+?=
 =?us-ascii?Q?dQHNKVVabBYhncWhmJR3N9Wo/kv5eLQ1QqBicNqHRWEcTLJ+gayaaizHZSqS?=
 =?us-ascii?Q?FMeNdj8CELi7GU5GGhQh7zUgPQnaHres2YduBWaSJ6+h25XyzzQlenVjcl+e?=
 =?us-ascii?Q?bEYXrRP87+N57Y2ogGQcG/ULy2FbQs4qiznPDXCY4ErB4XYv3GcgBHgIzNKI?=
 =?us-ascii?Q?rec/jrA6yShpLhuyomCc7qRIXnBkK4nqOSryCJIPXbcCeXVRUT4i2F0Cx5Zh?=
 =?us-ascii?Q?eXHdFiffLYcNIyRj/Kt1fZHgO3hi2HU/puM3V3Ku?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2318701a-5f10-46b4-726b-08ddf5c94a5a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:05:04.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAL4zpk2PK6UkJkp5GaYobWzsZaZ1nFOCq3agiEwtVztJXJXY0DieJ/vNDXSCf+mLCLFJdh6qD7Y/ynpRbra5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
device. The FPGA presents registers that deal with power-on-reset
timing, muxing, SFP cage monitoring and control etc.

Also add the two GPIO controllers responsible for monitoring and
controlling the SFP+ cages used for MAC5 and MAC6.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Use the same compatible string for both GPIO controller nodes.
Changes in v3:
- none

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 0c44b3cbef77..4ede1295f29d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -170,6 +170,37 @@ mt35xu512aba1: flash@1 {
 &i2c0 {
 	status = "okay";
 
+	cpld@66 {
+		compatible = "fsl,lx2160ardb-fpga";
+		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sfp2_csr: gpio@19 {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x19>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP2_TX_EN", "",
+				"", "",
+				"SFP2_RX_LOS", "SFP2_TX_FAULT",
+				"", "SFP2_MOD_ABS";
+		};
+
+		sfp3_csr: gpio@1a {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x1a>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP3_TX_EN", "",
+				"", "",
+				"SFP3_RX_LOS", "SFP3_TX_FAULT",
+				"", "SFP3_MOD_ABS";
+		};
+	};
+
 	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
-- 
2.25.1


