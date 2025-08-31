Return-Path: <linux-gpio+bounces-25239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290BB3D177
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 10:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 433411897EBD
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Aug 2025 08:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43EC2512EE;
	Sun, 31 Aug 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="coxDeCF0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012003.outbound.protection.outlook.com [40.107.75.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0AC24BD03;
	Sun, 31 Aug 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756630219; cv=fail; b=WbPpVNECqU7XceHehYn8ODIUn8xKVsdxOpXIdyTv8MJ0aYvRaHtfPfxekjEBce+k6D8jwrcA2qWem0G2zAEaHfyhka34qEeTSYpRrwIEjrc2ebZcOtHZNnk83r9hE3Grwffr/4q9DFcMCxT/d9bS1hfg8ilpydfEYJMssW+qrJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756630219; c=relaxed/simple;
	bh=QopPmhbFmQu1A+guVHg38dw5bJ8jwSaryLhT8pDLhWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D+Nia9g4RtDyehlvzQJ1ETAj2/jS+h6CTunjJqnaWyS+3VKfHJDfHCnNgZKLO0MjUcYDbnj8gqmyXx/fIwBCdGiqiti3MQ5hawCrDZanlbuHdYPCnwCfUYaCLPd2GXxrvhYGgVfq0kgjrgsfJCVIhvniayH9vN91quTv8EZ6u4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=coxDeCF0; arc=fail smtp.client-ip=40.107.75.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edQUWBPle5Sf7+WiwgBwdaADA1FRsz0RLSm5pk8g7/CV+yuqY1p1+JDNruqEaUVN9ttHvPLma6NUkqn0eKhIliFzUb/4F6lIabhOhjnqvL3AjrpoURiPQw/BChL9f+6rEuGAQtKEjXBI5nSYeZ5BRtGy4CnB5nScFEfDcmc3+JnGajxC5CmdokQjKbde3piaHS/H910KiMEn3EQS95UqWSugX7lNq28KMKfrIrHqiZ4sdti0V77I0jMcgZcfhKuNzaMEiKCByDL0zW2VCZtqxxxcLgh6TUm5pZy56vhelvnCTsBgK98cxKAQ8uv9PVqEi6wAmh9Sjrev9qQHGWGLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wVkXdNV3eazZynFvQPAHe5tWTB1iwRd4yDeYxGMyUw=;
 b=gSSqszzWYcTAtiV5UvPeaVeqSHh1DAv56QOcuK7vc4V0MvpH/ZUcPtyjngrpcrjf2VS8w4IvLogEscm9o19do2hfbtDMGStpSJeC9Bwoz8Q0TlEjRi5YsDdMVPgGVE1/En9GEShaTWr1lE7WvjrOcv3u3mNOEUw44RK6pBrX4q5FTJH2AdQz+p5SzrdQ4XMLSRIBBEAcle3Bfhb7UeTfi62BopigTxo7jYFYAlLp569HrEMXlkgK1CsbXY9dYWGnHelYIOkK+EyKuLQdsVNDjoSCJTFDbsv4XWq1C0b3drdmKTt+JDklqvCsAzNcthQbG6cmZ5p/qP3MwnDE6Xczjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wVkXdNV3eazZynFvQPAHe5tWTB1iwRd4yDeYxGMyUw=;
 b=coxDeCF0ZejHg6f6z/oJwXZpizAzmJjyLXm97nJfAYGZYhz7IyAm3Nx9NxE9aCzN/ak9VSidYpRm9P1VcLPfmqDCDRirn0nSx3rICUUeTe6+qywEpHi7KcHwZtKFIhikFM8HDE67QnPDRnuGY7EqGxLeUUldbuaJYARgao1XIL4Or8t4V7AeCy8u+2v0xjI8ObtfidmNaDOFzY6YcRAt+TEh9j6AcG5if1ooHoJ9kJOHT6HjuFe3wO2Y65zW4bLCAtoe79v54n/DkBuHRKsh2nsxoAC+UApn6y+P5oviGCybJoP2UpAxFFj62AA5j736W+fwMUJ5Pj1JZYPeEu0dvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6372.apcprd06.prod.outlook.com (2603:1096:820:99::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.26; Sun, 31 Aug 2025 08:50:13 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.021; Sun, 31 Aug 2025
 08:50:13 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON MA35 ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 2/3] pinctrl: ma35: Use int type to store negative error codes
Date: Sun, 31 Aug 2025 16:49:57 +0800
Message-Id: <20250831084958.431913-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250831084958.431913-1-rongqianfeng@vivo.com>
References: <20250831084958.431913-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: cef5e127-ba3d-4b27-eb4b-08dde86b663f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5VfIzhhQe1gtZYbVyOG9R7suiXjOLhx56Rc6eACUPKa2FfWzLuBvHGwugY1y?=
 =?us-ascii?Q?nd3dw4+zEbL/tSiIrgA1KyzeBaMW8LTpXvw50Lgyq1SR+3jHRmaDJW1aqUWi?=
 =?us-ascii?Q?qvxbEFfRMkHx8R1W2jgYgWLnC1Hu81xv5v/a+H+eXOYGGRFUWIIvEENtvDMw?=
 =?us-ascii?Q?pHdDL3F2kNgowEDR7VjL3+B986LxAo/1z7kn+56SCEZWkNP7/1aPs+zRZap9?=
 =?us-ascii?Q?XyafAdCeMDRJZuogV7DlG5nteaRd/Yn1IYgEGXrJ57/xhMX2LsP2OaT7icrP?=
 =?us-ascii?Q?y1nDnv7+J+gMu8jc3Qa2KhxpyLw31i8OPjWkm/Jhsnw6ULzulSdY4SR8h2FE?=
 =?us-ascii?Q?f7gwqLbU0X9jZ5Ze1C2TcM/yTZdP6i+qJZXyKIkeB71NxFAn5qdiTY8u/XEn?=
 =?us-ascii?Q?M27GznjwMjw3+Pq6E8z5YPcmJH4grCFtEsgcIUNV++/VxKnNbZF/Dhnndvg5?=
 =?us-ascii?Q?NQVSxBQF9qoNPUugEXV7LZZabSALcGp3QWdrqQGGGK+7fWysrOngFtf1Jda0?=
 =?us-ascii?Q?+XDxv+eueKp+D2oo6utC6OnyXBlC56GLXJy6I/OPKcdUsF/Ii9e5eK0x2BiX?=
 =?us-ascii?Q?VAnqbEthsrqoXwC+lHLcvo0weAc07tuN8PZ4meQ7+UHqbr96A+EtOreCxHJi?=
 =?us-ascii?Q?bn0CEqI4vJvpCOIHSMTSgKQH2IJDJCz6mBgzQ+8q34q5uYmB8HkajhkqSupq?=
 =?us-ascii?Q?LCgNLOthzOD7O9rHm/3zYW0AgjSVcTeepX3hT9Cgg167E1IDnGzD/fvewYPB?=
 =?us-ascii?Q?zY6giUqXnd2zPdzmiBJjd4FVzF0FLmKT76VLQHYzgUxNheNF3J7fyxT4BJDe?=
 =?us-ascii?Q?IZ9GGf7fiSSJgogkM8N/Wt/z7ZoK+gDI0S6bcavi7n9xDtM0nf0KDPhdsJcW?=
 =?us-ascii?Q?UlrKNj/gRDbPm2Ij68Ipjz3vSyCdCjGlfu0DgjIyUaSjuss0A1aYG76Aj4X6?=
 =?us-ascii?Q?60vUDyNEiBq7Ur/4k8tlIkSLQd/9gHmf5SBXiiFJ+WaEThWIRWzBKl9ZYdcq?=
 =?us-ascii?Q?YiR3SJyZmpf0L+nI5Cqe7ujxqVUjTeFQdOJp2WthEYEpyVVkPVeHWTSe5KV3?=
 =?us-ascii?Q?bgSIh9jbCMLgLAaSRD1NfiNzhcT7YbL5wc8lO6swk2N1+o2q/+zjkMdlImYF?=
 =?us-ascii?Q?hGiGowLKxYGbDhzmbIGxiQcErC8DhtNXbkj5/4WAawHKXhjZfPn/bkMSchlp?=
 =?us-ascii?Q?ke6GgyTFq3GRubeTW3PSnJUqiaNQxVteKFODsiylu4T0UsuoS83DfLAkjKd8?=
 =?us-ascii?Q?jnrDb658XfzxpVHiSGNsKZ7YK7wdbnvhBCsCTcwNXpR5faLjSrPeBt3RyWRl?=
 =?us-ascii?Q?rfQuckY5fwSedqYsSZY/Lpp9M2X6daImID0REtK14KjNaQfinAVVKIAqTXtQ?=
 =?us-ascii?Q?xxpzUTGoJcgvChu523xjoBeopBLpoKS9eS0sLmr1Z5uTKyjwEkFKPrNgTea3?=
 =?us-ascii?Q?VN4Sfkx7/w+cPhBfrmyVRbpJvheW0PQ+vQSPmq0Xxf8JlsCCA1FtZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J5rtA/vYiiMbGS31cgL1LmEcGZo2Fbz5TT6rXJVmotTzwFYG/RgSAJn5jedL?=
 =?us-ascii?Q?Vz8AE0QRM/oAyAULdcqQgPHrRcJ1ronFI3NUj7Cs8oxGecv0580I55ykbkM3?=
 =?us-ascii?Q?6t8ZOkzG9qlcmAGGQ6UqAwpRcPGu+BqE0UJUFNcwm+94E3KeLGNXUddJgtVS?=
 =?us-ascii?Q?io1Ro+xt0uiH14vJd76Kx3Gd2IqAcjFUhYKLbHPPiZCMBgsmHE7MFfWAL6y/?=
 =?us-ascii?Q?3Gs9bLc1t+AT0NQF/SQAmXY0nvAdaZ4+DFLx9SILPb+P1ClqoEx7K/Yz/qUy?=
 =?us-ascii?Q?YqRWmJsHBdpfmZ9P5a3OVlp+CfEOfe5U5oSEsL3HDxcd2tPWkEUWRZ7hvO0y?=
 =?us-ascii?Q?djLz3RHeYWBFn5H89Nh4hLEXLpOlSUV5ahnlEH4aZzQm8+uHmCIfA6p9RiKr?=
 =?us-ascii?Q?DcdzH7DZ1HapC8MCLQVEdOPbhrpMbjlSeyzIJtXiMiaPiKxCI6D8Jxi9oIDS?=
 =?us-ascii?Q?+WQgWlmWZLqMysg6kZWmfl267N0fUfUmX2qumX7NzPF0FreFntDjcHJrcQvS?=
 =?us-ascii?Q?rj60NyP83TEsX96GA5+AXzYwXckPuxMNNlDBEMnnMgoDcV6YYNIcYPXZI+GX?=
 =?us-ascii?Q?p+snjHKcl0JkOibhunKwKHPhD75XsfmyUdTT9pFTLfwkOjMYm2hezZMzhNvr?=
 =?us-ascii?Q?qiawlGh6CWpz/XQs7QkpSoCdk2lX55Nx5h5yjGD+rGp4zBW8islQA8gWA7N6?=
 =?us-ascii?Q?0Dk4fmRkMM+trluqDxXtlah53jgkhx+Ftt0Zrq4dcqnCQ1cCtyQZbsyVmg2V?=
 =?us-ascii?Q?1f0gVhg104KaWP45UeFVn4XIxyg72mdMKFVHNg0oUIaSVxXJE8/NOskpLR6R?=
 =?us-ascii?Q?UTfdBW1TyyE+bsewOz1g+C7RcGoD2YMwXRExfOzgyIb2dbu3JXaSTOx4RJ0u?=
 =?us-ascii?Q?X/lzNqrOk4iz7+aaERXPKOxbCmo3yofg7o2ODD3uQ35EhTKl/bZw38gS3t8E?=
 =?us-ascii?Q?x3N4un+lQkS6NmoeTBoTDoXCN0xo5rotru72D2BXc8sIiSjCoNDUxjpriSO0?=
 =?us-ascii?Q?F/4AyudYAsBS8Ni95K0f/yG3JHovmUns75NcU7I/OYg/2MvUvXR+KsYjZNK1?=
 =?us-ascii?Q?Yj3aE2C++ob56bzIDB4Tvzha7eGbQwPNKrxIysitD/xGISox+n7uni6EtWLs?=
 =?us-ascii?Q?jD7Gmxk/1lmYmzx4A9ZJ5P7KOk3wbFKvlMOVVtBkvuSJ3EfxAU8gMeIpRNQs?=
 =?us-ascii?Q?cu+drcHqvJXYXU4BNlU5ESN+aacQ1cRQvYpV71vbPlCsmOKZ393sTktOxWUG?=
 =?us-ascii?Q?+pC/hpeE4a/ObI+JER43h5hzcmgp09OLhsmFWrsmpw3KfCCc2BYGHh8Eo2GY?=
 =?us-ascii?Q?d3M2ugfmBwkxMtMSPgmDPOhPn8npiGqXyRUbaAPszF9KtKvIyIb6sTFyeu73?=
 =?us-ascii?Q?cU8wxOigp3Jy8tIowQyr74KpUmQzqh0NR3oM6gI4JDx8QcQSG/Kr84m6A10v?=
 =?us-ascii?Q?81/McHZq29997Tz9iwUGwN+PWVXpEFOX6AIXn7oL2caTwAomX9wmuYrRiDL+?=
 =?us-ascii?Q?HKqX4Szl48xVavzSgsD27pflKtdcZn5rVA897RsqHQLwWYXYCdXgWoiameb9?=
 =?us-ascii?Q?A/IyryMvXAX1HpyWPX2DxKOzNH2bQOjK6wT4lPIR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef5e127-ba3d-4b27-eb4b-08dde86b663f
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 08:50:13.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YNx8DGMrHumcn0B4Ic0sXt1zbUs6d+9RxIDNopV8EkglrBjdXrnzJqNgcVFYds60B8+eSAOLBTXf3v9krX41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6372

Change the 'ret' variable in ma35_pinctrl_parse_functions() from u32 to
int, as it needs to store either negative error codes or zero returned
by ma35_pinctrl_parse_groups().

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 54652bfbe6ac..cdad01d68a37 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -1038,7 +1038,8 @@ static int ma35_pinctrl_parse_functions(struct fwnode_handle *fwnode, struct ma3
 	struct group_desc *grp;
 	static u32 grp_index;
 	const char **groups;
-	u32 ret, i = 0;
+	u32 i = 0;
+	int ret;
 
 	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
 
-- 
2.34.1


