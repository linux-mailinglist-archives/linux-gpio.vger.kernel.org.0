Return-Path: <linux-gpio+bounces-27121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E893BDA81E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2AF5440B2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C662C302151;
	Tue, 14 Oct 2025 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GNqV7bbD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F413301709;
	Tue, 14 Oct 2025 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457266; cv=fail; b=oTG9Gj2Y4hutxQiQYDKT0AUH7yie+baP8iR8cTstJSJB8ck8ivm+e9nIBOxI32CiYAGdjukKG2v7CvTHjaJuzVtRkuRpwDPdn1hDWACj7Ph2yUJBsCGRvslKgsEyXcEHAWGOePB1qVzWRLYsIVJfSfK9t8Kml4SIkTZm4RNO2Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457266; c=relaxed/simple;
	bh=OdgeYFp1IfOtI2ksIWmHBn2A2sBTYAseaBT3KUtyfkE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ICxx41xmF7raYqIm0CBgTxgYdjYPIPYcX03F6muhMZ7vI7lNPZvDmAMel8uF84qOw1QAfrqLx4v5Fy6KjgDRg6unXw51vsYd2h+PPunG+NmDNa+tCoklSNy53wO4vVohbEygvTj0gwlyGgm/NNxTQW0Rr0FtREbAUJ/0RSiQ2K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GNqV7bbD; arc=fail smtp.client-ip=52.101.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLYzND3/dYjZeB3u7SwWD9y1XxwdF9ZlnP+UTxYSu34Xh9jGyLL/53MndpxcRGjK38SXPJPwti7/cgCjgMAyb3YOLfgk/8RtRT/DO/ZD3HRT45DYRUDvbwrGVvgxZlJbFEC3rNoFhydbJ3NSojmoSS81liy9uSeLwidMrjCgXjt4HzFSGkdEgLjZo+XZxyKJWd35Wr/mKfNrRqM/prt+j7wORT1VddunF5h0w9X2iXiGjIgV+jR41aytNpqPhxiA/DfTvtw2J2FQhgELTTityn9c5hY06F0YeBW+ncntorXgSJjopwQe1V0CHLxkTri0U59EYtdwZlj+tAqRG4YTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2r0miwB/jrq5tTPd8YZHzlI1YQ8qUrLL6XvfKVavJ2o=;
 b=J0d848YteKrnpyNd1NiVBHxnOZaHX6kuKOWOMI9Y50FAigfkljYMriuuq1hUQUlZuGH3bNaZTCFDEQf8AgO0814xKOTFZ+ILgMov9qlKmAslayTIAkztfY1vr2Ksot93ExYsBhXL+4vU+GlMOqL7rt9ZwlfrTagW40Ghioilwu+IJYO1upAgaVyRRqIi7ciHYkjEXkkFzQf7MZaW5WWOf1LWk3W1OhggIZuHEeVafk4lTiihqu8VVtUKCJ1Jp2VVPtK5SonaB0ub6ugKXMC8COaZ8PvfIQ15GyB0HwbEPRviFfgncGpKtga2o6CniwRz8M6d3eb3xu2Rjinz7kcIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r0miwB/jrq5tTPd8YZHzlI1YQ8qUrLL6XvfKVavJ2o=;
 b=GNqV7bbDbHfO651LmNCsw5xrXemUjoIm/IRrHtH26xdSYpQeGE50FbNsKJYyjsW/xwcaBIE3E13VcvQfnClPw/PiOZoE3RDJjSbUYZcIGdP/AuCkMzQgkinnvqs3zCXeYX6S/nc6XNY7IZdz0EH9ZscxIgUkWtvwzLL3Z0fPTjKRix5w/ss59uFDpVtsafygWUh4IWQ99td4sJV/lphhPcNO8z8Ih/OpKONlUKq7VoiW5Ug/nta0N6+q7eDuflsemJaWtTJDED5OvgLRFFrMb+EtqBlauBjK0wLali5SdgK0Ohbs5WnXePloLfB4m0J2hHqPudC71CyACT/RczRhBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:19 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:19 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 7/9] arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
Date: Tue, 14 Oct 2025 18:53:56 +0300
Message-Id: <20251014155358.3885805-8-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0118.eurprd04.prod.outlook.com
 (2603:10a6:208:55::23) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 8942dc13-c693-4c05-03ef-08de0b39efa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X74ZkUqEdMsEfTZcPbfcEkI6XT8kSMFUxqsAbJl74rcdWfTWM7FN18cc3phZ?=
 =?us-ascii?Q?VvY10JF7nq9KKrhGztIQSVfsTF3U21QYJgtKTb9alp0Q7+zuxPMmk5Mzx9Oj?=
 =?us-ascii?Q?mSP3VlzuNVItKgWoOLHK/r54ntvITrmY+gyEN6vAmI3d1e1OdH6q4m29c/5U?=
 =?us-ascii?Q?fn3agGqO6321KJjumiNp/op2881NG5rynfSrKXoKZtXwrrbjHlSnEvKPR/V+?=
 =?us-ascii?Q?Fe37JXzaV8ih7GyP2NnHrsKjhemA88686uyFJ8tipXgFxtz0EKJGvSWzUzbH?=
 =?us-ascii?Q?GGdlLZdPMVweTHVzGOkIhwI0T+dKozbAHQp7+KQYYREkcr/GwU4/68if9nOj?=
 =?us-ascii?Q?qKMRwNEbI3rL5UpcTg3VzPMlfTPzWPo6Dv3mr0YGwJh/H6hkD5XXJUbmiU3K?=
 =?us-ascii?Q?/xRlKR8VplQzgbZHlLNtlX0aGMaC8jMa9M8aAJKNoDlg0GkXLvfMhrMD8UTt?=
 =?us-ascii?Q?8DPE5O78Kk00Jmq1zYE7r2/xl8DhLbV6bWteMO1I1Byv461yFotqOwvEc5pw?=
 =?us-ascii?Q?4vFkuPHPid7mOtGR8Qpeh+dX5XUz+ro7/SB0DQiXSF9C/20p0fQdKi8yt8/K?=
 =?us-ascii?Q?Cxy9ewAUmpY3Sw0oNIxulIweFtkkonzjozSjlGOJ3SeoYhnLF9WAVhAKhDyQ?=
 =?us-ascii?Q?6/YmdjK6kQBJGtCTz/zJMnnt5DNv7iM+5na38t08mYOEN2NmZjBzjLbdHM37?=
 =?us-ascii?Q?Krjexf4MwRY9vaZMJqm94UIKEgC592S5QxEuh+C/yvurdJqw+AaYSBZc45yd?=
 =?us-ascii?Q?O+9I92L1RFlTley9edFRPAHV1m8KWZZQSk6hotYZD3GIHBru1Cdv6b015u12?=
 =?us-ascii?Q?yjRVYORc0dTGUkKijKU9X2nvYgQZsFo+SJ1xiaiRgler/BI1TnX02r0XBQGJ?=
 =?us-ascii?Q?+NhXemj6NXmjBozYOn/8l7QoHQcbNs8lqVt4VazU776HI5HNCbcpMwusrkoo?=
 =?us-ascii?Q?2TUsD3xsMpblg0U1P2h6sqjPcbCYadIVp8OauhPMhqYPkBtSRiSf6gnOiYGh?=
 =?us-ascii?Q?NRVqG+eOM7ZThjfJoD+ZBb8NlRpnx2TgU/XzPqrekoJKkRVhV31Sdq6o4LHd?=
 =?us-ascii?Q?6+dQvQ/Jz5hBWxS4VE3n8iAxu1vm0GmV2FRPjXj+MuQ6SDN2yobRzYVy+0U4?=
 =?us-ascii?Q?f/srGRUTIZt3dm+e4UyHSBrrFY/kECRZeMFy1z4s4IhOhX+5qskP550VQ2U1?=
 =?us-ascii?Q?lJAYeG1jI81xSHSZyLItYFeMNc7ZMy7zifi8FIJPVNvf8Nc/EgAhjc9rCsUF?=
 =?us-ascii?Q?cOgOn2POzNleeBp0HtP9v5OYqBIpr2onexF+nS7At309BvQ4q5ykoKJ2SUnu?=
 =?us-ascii?Q?l4/nLP3a41bR8LWTLO0bz3TAwit9AdZxABT3h7IsQiTIcLPFJstsN4XDg92p?=
 =?us-ascii?Q?0XRwzKlmGeaeEjPcImCyYbQ4qTCpWSLortQIh4MH5aid5erLsi+V1WHodEUk?=
 =?us-ascii?Q?2M1w6TqlRCaipK/JFeMabNxwWmPutztZvx6rzGHvh6R3h4XJ2uLM+jKynfV/?=
 =?us-ascii?Q?/bwcSdodftyFOpc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LruVcqbe3th+LhIlIgd7CsqUrV/NTE51pAjiuYIj3UDVCzXM1+86u2WQdQub?=
 =?us-ascii?Q?jI5lPLeqvFmtixPxgTMVhemFsxQ2cfM41JWd+UWpRRu3zQtnRCHi2dUVXJLn?=
 =?us-ascii?Q?Cd99RfFo/Zdr0cAdCCswjwY3IJUNv8MqQr9DFnvhROPCr/dbSPQnMw7ckL1v?=
 =?us-ascii?Q?flq0oszEx/PYFd/YUPV7aYOaFzjQhchqIY/0mUS4wYZtt7mpYLTOJJVycKEr?=
 =?us-ascii?Q?4kssLO9bGgCBLzEcK2o5gGfa2bxCl4EbrLPCSFj7qkN9sxTZOTJe85QVzvnv?=
 =?us-ascii?Q?t4ysaoWysB6GTpGKFakMUL8Epl2rPZeRBX88AfzcBjJ6GZciqZTGMpzumRKW?=
 =?us-ascii?Q?mb4HG5htihkgbb4UlDDO1FbOSi9dX1KrxjdSuYe+yH+FWtCQnV30sjsuGIOG?=
 =?us-ascii?Q?RfM2r0DgLhKQdh9eoyHnyaKgldEHz/9V7R8h3gzf5ao2qaYhcxXpIYEFJOio?=
 =?us-ascii?Q?I9ic2Yv16zwfriibmA6LVmHhB8Ifg7VUn4a0h96wa6w7a9TfXSoT8kef4aZB?=
 =?us-ascii?Q?wN0CdXN1oy+BITt0AxAFSbrHcHr2UzdrRt9T2PVNqcUhNNNWdlbuuEI8w2cG?=
 =?us-ascii?Q?ODn1dikq0QYBggIBe97b62clBBBmpKuyTUEj3yaAdygxImSSXfz+wBchPvQV?=
 =?us-ascii?Q?HCOiC9w6gfsz63wPm4E/Jy2CFF266hhD3ZNZ99UROQhOc44bAKY5oocu5N+N?=
 =?us-ascii?Q?R2+okMYJ3Oi/0ZIINoo0XzzciZ+5tdYTjeAZK7uONtZG8GX3w8NbbAPXGiAc?=
 =?us-ascii?Q?wC3r+AYdsmDAe9p3hB1za78G7ZvuKwqCF2faaHyJ8/QP6MZHFek8BfjvJG9N?=
 =?us-ascii?Q?murL7sQp/KfHnNxzmYkXjjWRp0lpObhGx2soOWETTUteygBI5l5wX2tn8ZQY?=
 =?us-ascii?Q?9hSSLG/eAiZozZ6f0xQiTtfuHLNfLRg9o2liAoyp4WZATDvD6zBa4Cs03jZY?=
 =?us-ascii?Q?27HMWbQawZxr1qpPeen0v+HeQEVZXeZO29rlZPsoXA6yKyl+aFvJZqphZ7tA?=
 =?us-ascii?Q?65FLIDUeQHa8rbz0n9H9PQ4QnQmmIgxMYtkHZaXt7SeRbjmrht1NqYU/WEW2?=
 =?us-ascii?Q?Mry7lmKH0kewpa0F2YqD4qZpB3Hq6RACf0gqEHv9NgR9uiobFeckn6RmMyqF?=
 =?us-ascii?Q?jhTLF1sgzrD9xeGbtOsMdWnqd0Sq19AXIB42M0sdIVs0oH4J59zbqdqttahE?=
 =?us-ascii?Q?qQNLTkxGpw32h6LcQm/fsL8EMy6RDXuRkDiB1QimHNDtT2TD+dnaSgFqo8Cr?=
 =?us-ascii?Q?+oI4ghfbg3vMCIzsVCAJTedNSOlOVLWjFHHb4UdDHTZPvGNdylnRc8X2HqLZ?=
 =?us-ascii?Q?Y2n/5bbgzO+H05u+VF3zfp7mwP2xa2yKXLcLUmzIzuGkIx8aQgNrIPoMaiqF?=
 =?us-ascii?Q?ciOBBWCJgK6sV7wp/pg8OW39fxO1VGvG9jQ8PeQHNa+3HYngCKrgypiy8tx6?=
 =?us-ascii?Q?Qnk4XEk3CKMlD1xJmp5R7KOr1t5tYGpFT4iMAq3LsI0Za92OIQqamEOH2pkV?=
 =?us-ascii?Q?QWeudjTU4YsJte1upmoquPjw9gwEOFLJBBX+RjLChvjcXol8Pkf/vnIMGRL3?=
 =?us-ascii?Q?f37zynkDa7uUWaIhgGO74XHvweVMJEq9GE1kYkuK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8942dc13-c693-4c05-03ef-08de0b39efa3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:19.5910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/lo7T02ZMp6WKX/K/L9dynCYAiBipAk5FhtiQaqcMh3YcJvMZHMQoRgrRp88e/UpQ7fMbgFQVTivli7DF1a4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185

The QIXIS FPGA node is extended so that it describes the GPIO controller
responsible for all the status presence lines on both SFP+ cages as well
as the IO SLOTs present on the board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- none
Changes in v4:
- none
Changes in v5:
- none
Changes in v6:
- none

 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 736722b58e77..812cf1c5d7f4 100644
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
+		stat_pres2: gpio@c {
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


