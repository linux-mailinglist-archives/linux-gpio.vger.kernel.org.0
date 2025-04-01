Return-Path: <linux-gpio+bounces-18140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D767FA7752B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 09:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17EA13A568F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 07:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BBB1E5B6F;
	Tue,  1 Apr 2025 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R6ySs/FV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DA1E2606;
	Tue,  1 Apr 2025 07:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492360; cv=fail; b=Tjkq/9LqHhmxZDcO3u+67JG4hpa29Jb89dDVhlC8dhU4IyFfMDWkPMUSLMGTpem8WaOy/6Wd1ekZDeEyj4Kr07pWkBRmUN99UkpASn57PRcCuM0GUXUDTx7vl6tm/jqHjmA9s0asr6ltRSqer9TaFYJ1g21m8XGugxfmlMQEj7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492360; c=relaxed/simple;
	bh=OMHTISnLT5fkqT+c4fLHkpfjAad2bZsI87R5cbtW1FM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GKG8qGcSfFpOah5Z4F+u+Xtqr9SmylmMt7qSLVYj9XQh0ttSQWJkCBjTyiDKJRbGInBA4jnzkz0EObfH2OfmLE2M6O3TshrrFhlQ/eOcXRusmIZLrpVwfuMdbW6DqSfMIf38bj3CjWfEIiUQxRS2cye5WAwPagu/jeZcHhqhhNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R6ySs/FV; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju8CCZPlILWf1dCQjMroNGtMvoab++MfM0tMRTJM5U0Ab8RzTN2vFpdPrPE4HdgKkkDNmCm7LdaH23pqyfogt52QYEFkJPZad1Qb+qz72FW50g+2v8ER3nYzRR+0SVLn6Ng/aa6v9UIwMlEE5JP3oXeKe15LAFgepzUo7rCT/+VhdsMlQNYCdRTLIchBNM4u3lGH19KP3i2TD2N09eGxIiacqYjiNiyXiL4cQx8X7BDtakAzEtkAf2Nw5B+w5IZ7xVXr6iJiSKd/6hj4HWcUfwc09Rx8xkW+iwzcBcdwIRuURJsuZYCqNDRBeD5ZbwDFzpq3aC+St9ZUaeOjZSkZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/RWBxXdJN1vknmo3Kkyl/3QyB/UHIAIM1uC6oUszog=;
 b=TDh6oLc45lhykQeGSPCIKu01L1nkCC8cQOI06+ZxHCTux5YRK2xN7pbvCfYKUgP7E5KdM9GtOKz+hP0kqohy+E9mIzea197izxk751cBUO6FkDD0bamd6Hk6Rfq1K/Nm+0l8qHwH5gTVU1salYe3kqUImE4KFdCLbLkjkN2N9ktxjCob4lXaUEOEwknvvXUn5tpgonYChOku81GYW2ex9z/nYeIWCePC5/PtxjbaF8clH+PJcWo6FfmYeNAv+qdiB02yrTxnDSH2LVwvXaPp/K+61lipqT3AoN6wGUHB9pkX7XmrP5/Kwt71jLEXh90YXy/m/yVEF1rbpHg2ReoS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/RWBxXdJN1vknmo3Kkyl/3QyB/UHIAIM1uC6oUszog=;
 b=R6ySs/FVSwYnXzaMUQIVow3bByNxSMTIiFtq5bc8prVMTP3e9Xd0Zqe7snJGygWkYtrOqqoRI8VkshllI8ymvkFvFHIrnjHZUcci+8FWny708Pq2bCl9OS58KQvTXV4u/0ZQyLtWrN+qxmaYbymRPnhCehOUXUNc0LekZsI71X03F3etpE6jIIcvNCHTbpemOFsJEGTmyx/cVQC20wjAGjheN4KYkG4NPAKlE93YpiOs2HOvKCBl6syHw+z8G/g9DjiYFZKWnXspHLztvhoVtkjSxJdFyA3X61j+PMnjoLVHCDFM30TzO4yfw5MTL29gC7xWcumx9hUxjNoJZi8q+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB9735.eurprd04.prod.outlook.com (2603:10a6:150:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 07:25:55 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 07:25:55 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: sudeep.holla@arm.com,
	linus.walleij@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	cristian.marussi@arm.com
Cc: aisheng.dong@nxp.com,
	festevam@gmail.com,
	kernel@pengutronix.de,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Subject: [PATCH RFC] pinctrl: freescale: Add support for imx943 pinctrl
Date: Tue,  1 Apr 2025 15:27:25 +0800
Message-Id: <20250401072725.1141083-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: e1792f10-d1f6-42a6-a7e0-08dd70ee70f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tOMC6fmSZ9w4p5DpjF3RtEqk6As01JUxcB6m+l/Y4O0Dr8o9maR+2FQW0kuZ?=
 =?us-ascii?Q?dkaZu2+yGxVLNRR6SqVH2iz9csc8hPiynGaTRmnCQogWDhqQRlgZddrnhmoA?=
 =?us-ascii?Q?W6bgd9S+7V9wQCCpH9IhWCwnDxRM+JOfKW9euYWpmW2yF8PX2tT0mgjKuz6O?=
 =?us-ascii?Q?eXXC9iV56ErdtI49nsdpXKx+9mv7zDOaXCZTeAzG+N1cKZHM/ipYC8/YsRq+?=
 =?us-ascii?Q?S0yIZbQc2rBrjQgunzwIft7n8Wn9BPaR2UZ28pz3TFs8Ru8zBtEa9HgQ4Zi3?=
 =?us-ascii?Q?YasrzHrSmUOET522OvlG+JM+25OTv9F2dEr/VOyBv5a/y2T7SRQAlE84u8yV?=
 =?us-ascii?Q?3OZm2N/dO+WJniP9weN+doeW5Ks7MDK3tos4D4Po+xdcS+4m/5m3WS2HfLvn?=
 =?us-ascii?Q?XVIA3AT9ymSSxOKMau770yLOmd9EfCKMNF1LxzI6dmE0NZ39F0oBiyVbSZdQ?=
 =?us-ascii?Q?h2tx3Cv9xMJwm1b556LtW3XiY+uBhNVzhiYhXlbQApvUK7EaeYM6mejWAjcV?=
 =?us-ascii?Q?RKqxPTJWt+G4lAJmCZMvxVBzXuXkQDZbSR5jqPaxqN9f2fzHTdevvc2qgl40?=
 =?us-ascii?Q?sQTIdjRSMKkk0cFAhELWDjCl/fHbPGos8h3+2QTpsWnqJxGmjDR5lUl4pXea?=
 =?us-ascii?Q?HLhLJi9j88JdcjxmylP/ZPAfDfxCayNGupZgtX2LVU3lpKZ2gIpuCBUMM0F+?=
 =?us-ascii?Q?HSRPilB6OI/En6b26vbTCgH2JlK/fWOakclsEXYXwCtyqq4/sZjCBHZ+R6bS?=
 =?us-ascii?Q?i+X1yprjZPeX1pkuFD75YSh5MsDGHItCsDmfSoyGQqnPZSlY6LJpqn4XLnha?=
 =?us-ascii?Q?gmAys6wC1XcKHslSaG3kunzRr9vlSwS0Y19uuUGJSY5bqsohwmHwefG4BhVW?=
 =?us-ascii?Q?JLxm2FhQRgB1uOp2g9taH2vWWBBY1w2NG8t8pfgKpfDHcZeY4PiWywFeX2Md?=
 =?us-ascii?Q?WCLbTIy58Yn7IWVyyev5kfsJI2CLwNN/kQ747oCqiNFMCxvrekQL/9b47H6S?=
 =?us-ascii?Q?YBHE5AlBmOlEbMO+DRoYTbpOVr3kjX6iPtey8a2QZutIS+u6FnbwZVYlhIqk?=
 =?us-ascii?Q?5qhgA7Z3grOA4/Fyr0GZ7x7rL8zAYAI0MzPGNtLELo+npcgSMgl8IkcgqA83?=
 =?us-ascii?Q?6wvdu14FdWuWOByDB83PVBdKR5MfPjZxS7liiilttlKYyRFAuoPW7jVe5sSw?=
 =?us-ascii?Q?oXu+X02/mkN4F6m1deTJOc5nJp6J1+6x6Urm8E53HFGxYaTsEuBPD4AkWFIU?=
 =?us-ascii?Q?6/XJFLuIAbhNNdaV6jJGeDwb0fzbNa2rzUldI8RSblHopzNnKi+P4kuSlY27?=
 =?us-ascii?Q?QmT4a1Yp2FpKGmIu/D2tGwsMGTtAXfyArNcW3FR5mvEDekKfqsJ4QAL9dbhc?=
 =?us-ascii?Q?YLGFF40+p2V3/WKhzFfUpiC7dSJyan5dE7X6fF4SHz1mX+q9pgjTq0/qs6Vb?=
 =?us-ascii?Q?s2vytiVgrkNyQkHcdJLwxwzq6VZQIMYg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8bR8kZi4es6ipySaaVQoub8lGCbXhqQuq+z9AigqLk54Gzm1or1D5lNJ6nCk?=
 =?us-ascii?Q?NSr5svvVcDvdOyan3kR684V8OUqwzqiVkb3ZNFfzNhtaaAJTnu8gyrlotwm6?=
 =?us-ascii?Q?9vYeUAH4pBOagd/DgyMGO4lsyCrGzPb1oaVxYnq/6zgkLjdA6fK5gQOvoF5r?=
 =?us-ascii?Q?q3azADSC860gy+tXHGZ9wQREYtgERvyDEaQeXs4W6XxJVQh5a16oytXd0nlr?=
 =?us-ascii?Q?40Ccl518Qlwi77lndRPMRwg0xlGgxZfcxd/VD+aykl5ieLO3OTMLECGYPoxv?=
 =?us-ascii?Q?TDUCHsvr4+ExUOCa5uBh0RX3n66PlkFbW4OFflRWVmCysGWL8EPRWVSDXoMI?=
 =?us-ascii?Q?bMGRUGDUMnLowRmOO7Wv3EUeVh+a9vgV2TYW5mW/awT9SSLW4FgAG6yIxSCg?=
 =?us-ascii?Q?39tGeeB1q27ofmu3CwlOOaoRZfbS01u0UyC/0idi3MhD652nMJ5DTxniMDTo?=
 =?us-ascii?Q?YpLxgHOtd1ALxRUmoCgFm5LX+qZjAqUumSU7+FVPQJXigDoCTHcmNmFKWVGW?=
 =?us-ascii?Q?Js3N3OyXawlsA4mCO31ax9pTDy9t0W4RH9HOm97bl9nRZDASWIxgdz18VbmD?=
 =?us-ascii?Q?x1+9hP7VaABxGENHbsxLOcpOKo5x5s0saHPaquYV34mdv4IfFNfy+vRG9LEV?=
 =?us-ascii?Q?Pqm3foiq+smoQz80/JNJdS9so4166anHz7arbARPTWcPPVN3e1Pkve2d6aOH?=
 =?us-ascii?Q?c461ahEPiVl+gt9SuggAlCP6v8+DG5SgU/7nCslVUAK91FbpU6KPBLIKaFt/?=
 =?us-ascii?Q?KIOhQzWUu/eez1wEs7CGi7Mr2bVBacgEY10zM+a/FPkAUvlpFHv6MywU8Llk?=
 =?us-ascii?Q?p7D7r/t9eiGlmJg2uTE3EkeezGxhYDF6hwoOo305uw/xx6R72nIWeVXEZdtM?=
 =?us-ascii?Q?9XwWAMvecI250A4TY8cAfCjnjfTHCu6ayN24nbtOmxTHg7/1UWzBo7tYo6h/?=
 =?us-ascii?Q?Af0OFXrDniLW476dhT2MLYZiS4cVQRVNFii6bY8O7g10yU1lIa3Utx6CYCWu?=
 =?us-ascii?Q?V5qUY8h/l//K6SraNyaG1P7m0B8f2VHwxZtdgevXt0CBHS098irC+62WoM2k?=
 =?us-ascii?Q?dNxf9QO8Tot0YqjRnWS8mjfqQ8Q/alfE8cTd1mIIjZ6J+79P+uVciHDbtZiF?=
 =?us-ascii?Q?cu223U6vyBSh55QnFJwfsznaw6ksdsF3BG/bW3JD5u4tWFHLbYY48Y1Ui891?=
 =?us-ascii?Q?yNGfe3c9pxSXO3oo1+m0N2GKnq/D6f3OSga2mnW+AvA2FUhknM3q1PSEQODh?=
 =?us-ascii?Q?Dfl+VrJZpwjDPoqQoybe32ozXD/AJz+BOBWvz33AP+Sav2arnV2L7E8YL2xc?=
 =?us-ascii?Q?efHT4EC6lWwEW5Jyh/E68XDVjGw/VPNuJDt8TcK9IhBKYjP/Ctigd+cVaVyC?=
 =?us-ascii?Q?sT4lY/FCVhpcl5Rn9e2XDhm2sf9X8B1Gxlkm0CtpUuL2F1Al0qbwz0P6igOV?=
 =?us-ascii?Q?7xaWqbnQz3RyWR43z4Be8kPwCCgdyE1mwGkPVTvP5L1dH9r/cMWVbIS/Nkyx?=
 =?us-ascii?Q?UPX4btx1dmkf4nidsYZ/zMUeAMIuh8PEyhrmDiQa8rXTttBXDR5QlYW0sKSY?=
 =?us-ascii?Q?G+CbVRnsepGfrZuF/PjMJ57VMRGyFh0TvsjQ+7sV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1792f10-d1f6-42a6-a7e0-08dd70ee70f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:25:55.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feHp+n76KglqEaPbjGp4xLu6qI1rcxWqi5004Sq7olMPsJV7/bG1ihD+qr001GngK/5RaJF69ZzV6FK6KHGIbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9735

Add support for i.MX943 pinctrl.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 4 ++++
 drivers/pinctrl/pinctrl-scmi.c               | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 8f15c4c4dc44..4e8ab919b334 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -51,6 +51,7 @@ struct scmi_pinctrl_imx {
 #define IMX_SCMI_PIN_SIZE	24
 
 #define IMX95_DAISY_OFF		0x408
+#define IMX94_DAISY_OFF		0x608
 
 static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 					   struct device_node *np,
@@ -70,6 +71,8 @@ static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!daisy_off) {
 		if (of_machine_is_compatible("fsl,imx95")) {
 			daisy_off = IMX95_DAISY_OFF;
+		} else if (of_machine_is_compatible("fsl,imx94")) {
+			daisy_off = IMX94_DAISY_OFF;
 		} else {
 			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
 			return -EINVAL;
@@ -289,6 +292,7 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 
 static const char * const scmi_pinctrl_imx_allowlist[] = {
 	"fsl,imx95",
+	"fsl,imx94",
 	NULL
 };
 
diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d5..383681041e4c 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -507,6 +507,7 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 
 static const char * const scmi_pinctrl_blocklist[] = {
 	"fsl,imx95",
+	"fsl,imx94",
 	NULL
 };
 
-- 
2.34.1


