Return-Path: <linux-gpio+bounces-26383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D90ABB89A9D
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9333B24CC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D307B30C61B;
	Fri, 19 Sep 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dxUUxwGD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A23126C2;
	Fri, 19 Sep 2025 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288386; cv=fail; b=RewyySrLU0iAvThyKnNAqj7BsktENEcAHAxoruymUeaLyUiBJhXNWG3RJeDN/1nY03ieCKaq/L3j+gfeTnQFA3xG2MT3GnPTUKPUNgiCGzPn2UHrKPJrGPcq18tkklReuR3pY4C9U2csjdoTAw2N8ioXcELqp/GmWo1Zw8BXLUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288386; c=relaxed/simple;
	bh=+NNVdJtyZiMIh6eolDJaX0Te6KXr+d35i8MX8gRfPEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=himAp/gWXmwQS2wJZVPkJYkYKj/BOQ/kbR92uHapCBQEJ7xt0ipdBbqmuobowEwSvEqW+2bGybHUI3NaxRRDBpRN4qWSrjDmQMbD304COTLFxCBK0oW9PLLE7i/xA3Emb15UfAcXKBzj6tHXHXtlPXr9KH4ziT0YA5NJuH8Oes4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dxUUxwGD; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3F3h3lnZSlqKcILlErjJapOLWH/wg6aWiOy4pRN3pymC93riJDKqV2X6FwEf+zARWqQDvgNGYswbP9l/6VP541R2In47IVKp8Re87dNcUdCdhkrByBF1DYRv00uLDADhVNEuRSPx89OR0bAgFpaUGBrngSaGLyCqZdUdyPDAymjKY1J7W/ZqYEPRQjItAqKEnPnmoLa3NrKcMWulW83mMuecok0BLjFzNqEAe5oq5EYOkagZPdESpWrcVhbv5v5D8ckYbY0WlRjM0UbrCsuNo2gqQvDlOIWCKl6NwrA5KBoCl7jLpOiVswtHmx12Dinn/atWoWix8w5/WiouDOzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cH9gUsBLJAIOkObZ+KWLdXbnYFr6CNxnySbEkIyHWs=;
 b=s/hJejwoSQmG4NpP/mWkOj3SvNRfXZTx7dSW0wIiUBC2MJgm9DFo0L5/qV2r9BL/MzKjelRiDnTXf40yN/am/1uLcNqlQj/bLyWRJP6EMw7OljwgFWBHD/SsHEsVktsUfsLYAjFn/M3zM/4h8Eeah2ZRUd+dzx4WMs1c0Bz7CAwE3PSgTKNoLeh9bSAfkSjali2OgnDj9Vg1ChaHvWAmnrn0Fjdt//PLocsDifPu9T2DgkbINa1PaC7+HcnuYLSDEb5yacJW3r7IEQ4s9nQaLXxUwh9BuXbnjNRR/QRxgoHfPmp+bjbZcGGCaoTzmhx7H2dDZPcWkhc/c3k6ZJCdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cH9gUsBLJAIOkObZ+KWLdXbnYFr6CNxnySbEkIyHWs=;
 b=dxUUxwGD9A3B+VE1SfEplKQUQ908SCDQ6aQA/QK/lHZlroddUC7AfsSVcvzrjem9h+wFYle7bSVMc9/yzHEU+uQGDYvdSWeYIDJRQPkGpkdv5A1cQvE/bT/WTOhVcmlZX4AJVD3oySuoj9FkQ3BsXtn6sd4Qv5kZrYMK4UoR6wGxkp5agbX3CdXGKiCkyrnFeOMl/QOlq6HSo+tOxqSUoNvfnlSuotAwQ/9j6E4tjDdyPiE6evoIH2eLgW8j4B5fraXEriNzVbpP5HQdSAD7ln34oo4hJFxTrWEKW741WqNmOwaAon+a2mhVqX47ph4xFA8kjShQe/nyMzwnhqxkxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 13:26:13 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 13:26:13 +0000
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
Subject: [PATCH v4 05/11] mfd: simple-mfd-i2c: add compatible string for LX2160ARDB
Date: Fri, 19 Sep 2025 16:25:09 +0300
Message-Id: <20250919132515.1895640-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
References: <20250919132515.1895640-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: f02bbcd9-f3e2-4731-4983-08ddf7801abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tTvv0qqlp34xVcHCGJ7fur/z12Zh6Rt503/vYSpXcrcIj+5UvfrO4u13Rhq+?=
 =?us-ascii?Q?vY4seiGN6mnLhTiHe0Glwb7rOqxPibxOxUG8fMflahtf7psUa92gVv1s08p7?=
 =?us-ascii?Q?tlK9BWhoEzJotpnkm+VOCNIWMZAJPvpdOd9iMG+who8pTX4qQcBkQMDvtmu0?=
 =?us-ascii?Q?knEsMsyTzT3w5u3IXCWe8dp93V1BEQG/jm5ubBHksUHlQmHGQC6a0rr+m8Vo?=
 =?us-ascii?Q?NKsRNVAbp1R3plG1ZaixxBfDnK51uPx1dbK2v9zdEgKTMOZYGAHoa4bYzaVk?=
 =?us-ascii?Q?2ghhuqdvEKCa3kJ70EJkH6+tU6mUsztuUwjTNqT322y36BpKYTv2S8Gd1n5v?=
 =?us-ascii?Q?OO+vsqezbIb4iW2C7lXlxA7S5xt+/lTXkUEoWbfBfEt9LoIDHGPE/6kXux/u?=
 =?us-ascii?Q?NT9v5aIWb2dIQGVn+KU0uO9mZQPlXT+yQMswdT4lLFkNZp9c3JSpePbwj25h?=
 =?us-ascii?Q?Stbu7xFQlisHPE+yAqenkOjAdbY/q0WFVUjzFvfPG2poqlWAJxAmZLag4oGo?=
 =?us-ascii?Q?sPchFk4vwOpIUilarZmtEqcswvtYs37DvHjWvHWzw6CHfp4YjwpjXFwc1B99?=
 =?us-ascii?Q?7PQBw+NqTGDd3JYZUXdtl3yS1SiVPX1alySfZfAzDREXeXR2knHRwATZbfIg?=
 =?us-ascii?Q?sagtWkaRXYRF5MRP4vkv41gEiNCy9J2xpWGroe7uo/kXWifTSS/jJbjzPBkg?=
 =?us-ascii?Q?KnWFHCZWOeD8Rjo5tUwwz5uSTeJZ2zhDelSJYimcU997MFRWrS28PsZ4eXvt?=
 =?us-ascii?Q?VhyyDUDyvni/Nw5JcpjVVI2hBFjuZX4+pDUpj1PmMze5gAVt2a56zOrt5rSW?=
 =?us-ascii?Q?VX8olMUyOCst8QWq0gz5L6UH00mq2hWV9MYbR8+eikm9WQVXt11KnmnSKh4X?=
 =?us-ascii?Q?+hPeHcyFGmtbggSL6kApHIhzR+QvtmZKiLsn/Wb+A8+3XP+Cn+llNZ9jiGQY?=
 =?us-ascii?Q?mtyZJdSwlFhFJG6iElNAfHRsGFVNLYuJ9KJOAsBuifvAHECEdOhwHHbqKSJO?=
 =?us-ascii?Q?k+R978VAXskLftXs51H85J5utiTnSqtESTaLw+xIaXegObyAjXIutBA/vL9E?=
 =?us-ascii?Q?ijJ3hm9eGqljQ1feA+dTy+I6top1w181t6Ew0qR5swbS70iQtHadlbXBufIo?=
 =?us-ascii?Q?6/AMnDz+yYFXutyhquHjRhDw6BxEpNftXke8eM71Bv1n6Cfy58Gt1Z7r0gDa?=
 =?us-ascii?Q?bTc4+XaF1tT7IwDz0GYWVj2fBorkclf1LdpIHbqHCOKJGUXhKBbSnWd4wbBb?=
 =?us-ascii?Q?T2shTr1AjiqpaB/upJag1LBvWHFeC7Wc6sNNnfj74UNfsxOmBLhoyeHH0yEn?=
 =?us-ascii?Q?lkGlJ+tCHD+ny1m3n0YnvICDB1lTXLEnM942KfVkcquCxtixmA2YNNSAejOp?=
 =?us-ascii?Q?LYHwSvVqIGzhkgf21YkGBqEqVH+rMf4bkB/VYbCuH926cML/5mi1HflsSFbx?=
 =?us-ascii?Q?bpuG/d1yBdmC5Puq7POPp4HSWzdNr4/wUmC+84MAIY6AR+Q6v8txmA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mx6HqiouyjlzSzSlW888jFbkIb9o2xzbkmXOgLo1kvOLPOa5YhcgYZiV9vQR?=
 =?us-ascii?Q?rToVSlVo/v/RX7hXtr4pClr3UmsWKe6igIvV9MvyOeoEY3GpxQxnDdA/WFM8?=
 =?us-ascii?Q?WPcXXYqsSG2MZJd3pOW6WTJAQERx5twN9ayZE0lwuTworjMK5Rd8aL9gvxQI?=
 =?us-ascii?Q?99O58rh9cRoFrcorNlARsnXXYgtSvhE+nHyHkpl3xGGmEK8SlZd3/3S6sidk?=
 =?us-ascii?Q?ZTLvbxFq3Z7g7yZaTVSRE7OSgOs/8fdsjXyBpUxLttx3Pf8hvPEcwURv3RMq?=
 =?us-ascii?Q?PDngSIDQHpkc55Tx+kDO+eclZluD3p7ZxbPS/+ku0k6RVHYiVvm4G/9Yfesm?=
 =?us-ascii?Q?UheDRqGiqSsBjhbdvQN5/JzuBJC8Fc5WfiZFUIzGMbr4IhR4dELtqm10HaFv?=
 =?us-ascii?Q?ZVoZnFVyAoSu2Cc4WELmjSdbgjnF2DYWgqsiEle1uzTiI+kvXW7POe7UREIO?=
 =?us-ascii?Q?LBtQPaqdKpah/Qy/lLpUBBc67fTR0cjRiWmbGE8HP5KgUwZ5M2gr9IUIgWuD?=
 =?us-ascii?Q?dqoThrwYMd/hK1HtPm7oqaWHhfwNCJNNBlty8ujKmHoFuOi1vhQeQBUORML9?=
 =?us-ascii?Q?yuZP62aTpVEzoCpJTNwgyadZYMvJACJTmhXcTjpO3Jbk37Due1FHQQdAGD9H?=
 =?us-ascii?Q?UON4XCqRqRix4LGMkLS4PTZKBCfI0c6BRKqVMSokA07dVLAbZXE4iW3862Wl?=
 =?us-ascii?Q?ZbCC0YpVtPs56FQ9VEIRHL/nLNYOfAqhjiiktdZPaSsOHZlWDuWlDSX7XYAY?=
 =?us-ascii?Q?0s1hesHoypGTt1Uh3/UHTyA1Er7ACVDinrbI5kcWsE71m7weHbTRC7eaZ+sH?=
 =?us-ascii?Q?7LmugfyUcDOb+D6x84JPMJE8C65EaorIECfNQR8/qSU1zvNYlCKN5dmhKxQo?=
 =?us-ascii?Q?yHd8IkskYYGJV3oFtuN+uiCGR+k7CTO376HI1BB0pPcSmV7GS9wew37C9PHl?=
 =?us-ascii?Q?80h6vwouXa1xhwii1k90PvBxFm7H85BsYF3aW/AcHdaBuWJBKYLJbZsvgHEr?=
 =?us-ascii?Q?XPiaQDB8EItBpwCERWJBWBbdEaSvxyd+HPun+M+g/ce8BSQ0dGMLvhSHxpGj?=
 =?us-ascii?Q?XlcgE91hAo3syn3f1BV6tevvLvCqAQ4exhV8vAMyznP2ZhiErgCWOqrjkHnf?=
 =?us-ascii?Q?f9+fHffRcyYEgQFWBHcWzqMEJg93qDRK8oEzBPezlH50M+yrK1u8yKwyCXO7?=
 =?us-ascii?Q?5mdXybEH6Tipbwc9MxZuLa0j/3T5o4wbhXnBMHRMEpLr3VHOfh/Zsh4YRjk+?=
 =?us-ascii?Q?70kBp1NDgzy7SomM6KWklrR/bJgL/Oifzhs8mw/7dYboMwvpc7AC72R6KUhX?=
 =?us-ascii?Q?Ld4y3TK080TmGRngFubH3fk7lBI100SKS8wa09SaQg802LHCSYQhzOHsh8F4?=
 =?us-ascii?Q?DhlR9+xK5r5qFEN8usy6shKmmXJF4JZVqEbaOHZov1vAsS7UrHObNrS7vvVQ?=
 =?us-ascii?Q?5LeShnhncCtn2v4Z28HSe6MG4DDxBZeekfm4wskd/LA1WDWzEZQVkKK2I9+0?=
 =?us-ascii?Q?uKS5S909t6sLR+hTLVAkzDQSPmr8Q2B0xZKA1ofFtxFl0x2o4cPqH8K+FHC7?=
 =?us-ascii?Q?+OI+IkWm0TDT3DEZbIxGYx6m0A7gdAD7HszaF/H7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02bbcd9-f3e2-4731-4983-08ddf7801abe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:26:13.4053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/XphdTbxgxyR/VVU425vh+PYxLhJLV33xVatX77/29y6BBXkELRmG2gsVeVXXso856/MSWyMZYKDWPWC04Kqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

Extend the list of supported devices with the QIXIS FPGA found on the
LX2160ARDB board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- none
Changes in v4:
- Insert the compatible so that the alphabetical order is kept.

 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0cca7a9044cd..0a607a1e3ca1 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -112,6 +112,7 @@ static const struct simple_mfd_data spacemit_p1 = {
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "fsl,ls1028aqds-fpga" },
 	{ .compatible = "fsl,lx2160aqds-fpga" },
+	{ .compatible = "fsl,lx2160ardb-fpga" },
 	{ .compatible = "kontron,sl28cpld" },
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
-- 
2.25.1


