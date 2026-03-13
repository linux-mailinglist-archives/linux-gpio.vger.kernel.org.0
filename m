Return-Path: <linux-gpio+bounces-33395-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHU5InxstGmWnwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33395-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 20:58:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A102897D1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 20:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41F5330DF13D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 19:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59095361660;
	Fri, 13 Mar 2026 19:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oN8ibBR3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013068.outbound.protection.outlook.com [40.107.162.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D91DA23;
	Fri, 13 Mar 2026 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431916; cv=fail; b=peQxWQk5GvsuWk8+P3GVfge6wNvPcgswyXyfjnsXf6LcqomX7ELpI8fvPD5HqZUoz+3FYwAhJPfN3U5D4gNFantIDl4usiWSKV/H1BkFk9heH8JuBFlaUla76GYuudeZWw+VMXjkMunITXtZlcaAMiyEfuunLqcb5BEIEjXJgyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431916; c=relaxed/simple;
	bh=iPvyPnchzpO5Dxf9SdprmDigEacOHcLu+4NATRRwyQs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aZ8PncqK8JehJmCvwVJKOrQCoWS3Id3blUTUTQxR0sgcodv0h5YjQWIBjSZMdC5PKvbQ16FDZpq8D7pkVLnmuerb9VZVyq1d9Ql6j8GThGFVJ7i6AOeWtZKbMhNNRFFX8oYWuAk9dP+WawlkCFFLmV5kCgLh7r/FTDHVhZh8o2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oN8ibBR3; arc=fail smtp.client-ip=40.107.162.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzJuea0ch3L6/d+9e1fd474ChKXvrp2WnXq28/MD1N+WtgDTTamn/8wv0aW1va/l5zhHr6ocx3UCfhPmQAnYhiZMnQ/pGr6csF6uM3mfUbzuRO6BeDpApdqeaMDOjNWw8Rjlah6T89zl7T5zkely/t1+lL7yspCupEnqJCw3DqViov4hbPOqHgx2XayyAXqBo/SAjlL1X4lGwWYS8fGoZdzyOLs2T6xSXaxdus63wFiHnLW/rqxGyllV7H/Bw3BakGPwwU5JjM9ChPQEUkSRGgwKin3HBdvPVGoV/ENB+SdaLASZcTZmls83D8Ja45ElBCQln+s7ZabxLSxFOIWurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAl+eZiO4I2B87wuOjTaceAvWunN3Jfv79uANp4fmaE=;
 b=CX085BB4KA3KkWIF/9q7vdtii3ihQQNobV5Y5UKfAG8X8lTD5Pxnc9LZz8sfRs/3VujOQ+hY5CuKAOdHL1ZdXIF7FXmdzWr3gos6DOYBb8a5ROmXblUaP4/i5dt3WpTQrD45E6W+JtMkZEKgOfkZs6ahBboEZ/oGFF1zQBQN3M8QLbRzpN8w8QoyCtqinKn7orZKbso++AxrXHAPo68xM3r6yFsSckz1P7Utv9Axd51EI2kVqL/WFOsvN17ylHlcEmVwRxGEExjhyEi+mwBfvW/DZ75XlKCA3hGiIBkuL3NfR3Ki9QYjM5uAylSucztuIuhZi9AiviI2CsOWzIa7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAl+eZiO4I2B87wuOjTaceAvWunN3Jfv79uANp4fmaE=;
 b=oN8ibBR305kdHABwFXzfhLB6u2PctNytgCI/WrNnuCROU3epnSffz2TLN2gex1W9r/lnOu3Z/sV++a50t+pYeVx71yRwwanOqnUwhf24xp8d0QUErGIziTJecsB0xgha2gylk6ZL05Tw3fXSzonrzngYTI2i4X0eOubp4laWsqtXNhHbj43J8UDAAKOonEA3/Dgs5DCLL0RlxQRKmLHTPlPuWaFabIiJDxYNv3KSAZIbXOCN0erlMzFyD6is7C6WdgK3UO9l49yvSWtNGqSn1Xa63cccvTDPRH119aOTgAKCXJtzu2rWy4iOiXJt6NgVlb7K5gVPZ0J2O3GK45nMRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 19:58:28 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 19:58:27 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Fri, 13 Mar 2026 14:57:56 -0500
Message-ID: <20260313195801.2043306-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0062.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::14) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 75918422-2a6a-4434-1516-08de813ae41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	+BZWT9YIr/DlL+B1xOPMiiBO7FrqEPyjKNW6N8nyHTrSv9SBuvNBMwJ9YXnBg4w4A0Xq6h8OlTe4Ni+sx1lf/u/Cg579C3d6FLrFVy6yuiSUxHth9J+G4YeKC2rMaORjJO5MvVaUNs/n4eOUunsh3LuAc5JgoaM3Q9Zbm4QAh86PHY4SdhtW7nwF47kl/J1GFNpcL1QRxgrLRMmeTT+MHoz/rDKnRXWrjHubu7n9le8dUWLJJc1mNpnAWbR1B5NvxnKK8LzF0ZGu0azMCVoMlp7qgBpu/GkXpu8CaHau/vjBpr7adEcatqRBfZUOjCGYox3mWpyweuIdjkmsCNEmiXvV8SPNBIpsZzAuc0ESKuD/xnyyK5CVdQOpTqX+fDRvivm6ZFLKv+7vAeluvnCzx4u57y1iAaJrTKUwxezVy+PvwRk5TpIKmOsdSOptWpZ5lvNNKRh2WMuXUyj9coMtQ8dsDGTpb38hXyBFCTqsQHL8ipZUBU5/hu+EAAkDQS2/UPnNiAcftZcMvfuCs3C9U5DUYPkWNO8o+7G+DDSYFTweZHnRhcRGdCJ5faQyDnQ0flUHEIExxFmTz3LK4bASTKtnwW1wf1Fd4ceut8NZjpz9tNlRxcP90CpALLF6hJdbcum8ozrgCmkENg+UuYE+6KDG2UWe6yv+KH1ckncJt0jqAPVpxHUTZ0/TOld8qucm1tL1hDOKETzBzZzaLzelxhWWdttJAYZ+n686CXpMG8BZdaJUdJT/QwZR+542Wxb/do60WPWRuv+P+uqesuIntSPdVKKe3G7yC0bX6Hn3P5lics2j9j+bS4rhu03etm5+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yLV/A0TwWMO0am10H4JP+OBHbKaazCoO6AsS+cEaxsx/NssCx1ZSpmStfKyB?=
 =?us-ascii?Q?Hd6gS0itdPt9U+By2bliaJHUxWFSEZZBG0xikVcutKy3WYUTKJeWgem/BR7A?=
 =?us-ascii?Q?lH0IZD4h+efIrc9pRaCKOis4iYAFvgzHp2TepJfMFcs8cs+NxWMf04LWapuP?=
 =?us-ascii?Q?lYFBnEuYxtM4fcI0mr4m9J5E1AJIgh+lAd6GnS+Vlk3Wg1z0GY9D8rX55LZT?=
 =?us-ascii?Q?HRkpfCznuxm1vWJX/S786eWuWpgFsvy1KW9LiQG8mZbXizJUtmaf1fd1tHxf?=
 =?us-ascii?Q?egZQMhAjC1G1mJYHxrvRWS/kQk16d7NMCREZ91j6xM/qwjxa53Be2tAKKFJz?=
 =?us-ascii?Q?1htHYjpFKDyGyTKQC28H4gAKt8qkU+Iqtm3zdBEv/Xc6hJR5/MChWvzQ8HMm?=
 =?us-ascii?Q?ADzL6s7IB5K7MkmmYix3TK93ziVTno9jedm7IBt9p+GmB5B66R1u3KdMpl4/?=
 =?us-ascii?Q?TLlp6PzG1CwXQgENZGhzzW0jKaRohea341U/f2KHSvGT35Lj5dHpcFT4PbS0?=
 =?us-ascii?Q?+faS8asw8ttLJrM+CSGZlXAnx3fVooDbwyZkXGmP4Lm2y8z9ckvC/wY88Owk?=
 =?us-ascii?Q?wF3FJK4Rb7Yy+mGksDE4DNGFoFaVtkCchIVW6A+rRWz5f8THSDCdtgV7hhXT?=
 =?us-ascii?Q?QP8IGgHAd00HcvDa23SCTpoJtw8SeGq3CxPmEAJ9nkxHEa1NKRZFevLs/Qw9?=
 =?us-ascii?Q?LIEkJdXMIScDbBSBOj54au6GOxQ0P67x9ctnykKZ1F4rrT2mVwZ+VmoN5kb0?=
 =?us-ascii?Q?fNM6+5zU+4TENMCArDhJErHytBOMGH/3C1Zq2Ph1CT/XmuK3XDWnoEojlWso?=
 =?us-ascii?Q?5UCF/LBMQ9hQNM/aoDKxn62SLqsxxttqzXBHiHeD4NNw13PoD8e0YJuM1IBa?=
 =?us-ascii?Q?Qh04N5cyTDd7awTIKvpu3DjUPHSgSaS2raYIRZ5vqdjP4iXEzO2uDBh1GrvM?=
 =?us-ascii?Q?qg5DmAC6g3yEl4dvOrLHXFl/JKHRLdQtQBRw1tldmYvrmuiPQZLZoFKD6Fdl?=
 =?us-ascii?Q?yK1jcMW1F/pml09gGV5xisNJWg5tAHHd/cfm1zBAi0aQrBlNLZJxC2aX9MeK?=
 =?us-ascii?Q?sDM93GlgaI68xQ9/Q2PRC6T1KrpGTNtTfFbYnm0CQ9YaSVBPIW57xysJYhXC?=
 =?us-ascii?Q?0hckNVWiniYu05KQbx3JmYQjr4d8po6xfphskeSGS9QWBauMv9b9v9ZeX76k?=
 =?us-ascii?Q?rHUrSZlH2NooOl4ugkcA4a7isQZOI8Itu5aMSJD2X1U+HFnbHf3SZRQgAMpw?=
 =?us-ascii?Q?F+E7Dq82AcNvjPx09qaU5fp3jC4IOUxiPltD2PxRlAo9UjkOubuUOm+ru51D?=
 =?us-ascii?Q?97jqW9Aupdn+lc/AHEPkF0lgX2rJyseMoaiN69Jqc1B0s/lMxLhWnROYNwSR?=
 =?us-ascii?Q?Lgmyhy9Q65/dyo8ciUQ516cmAjjEQ/ulg/FeOkvjaiDuMKB9eeNjNDmeNbCv?=
 =?us-ascii?Q?mlr79lT8iqK/4Tnizt87PVIyRcufAVutx6UpsGd356GKptMDUu2IVucCBOlq?=
 =?us-ascii?Q?2hl/nM05gEYj/ulMa4Cpc73Idbh3VHMNZ704L6xx1bwr5Tylv0/SWR64uw3/?=
 =?us-ascii?Q?lFSOOws16yA25dVc6a1Y3r4SkB1WZXR7v59MKG/VJc4UaZLYl//LyaSfKRmD?=
 =?us-ascii?Q?oNvXes1T2k+z5VNzd8+XTN8BR+jxRkRZvTw2WSFeIQ9O7r5FR88a0t2bOlZg?=
 =?us-ascii?Q?0HSJq5UHpPRBLrq2q4f3xNPP6qt1KseQinXKH+LtTNyWv8/KLQ4OeN4TMeqB?=
 =?us-ascii?Q?gB4fEKJEUA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75918422-2a6a-4434-1516-08de813ae41a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:58:27.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQasqSuhZTiCDGer7MRJ64VOUQqIu6yOVEcPsL/hbBIaaEM7GUkO2cwSEVeM5D6K2D1OzstU7UuDORLAm6artg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33395-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: D4A102897D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v12:
 - Fixed the "underline" warning reported by Randy.

Changes in v11:
 - Expand RPMSG for the first time per Shuah's review comment.

Changes in v10:
 - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
 - Add a kernel CONFIG for fixed up handlers and only enable it on
   i.MX products.
 - Fixed bugs reported by kernel test robot.

Changes in v9:
 - Reuse the gpio-virtio design for command and IRQ type definitions.
 - Remove msg_id, version, and vendor fields from the generic protocol.
 - Add fixed-up handlers to support legacy firmware.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (5):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  gpio: rpmsg: add generic rpmsg GPIO driver
  gpio: rpmsg: add support for NXP legacy firmware protocol
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 +++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  32 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 743 ++++++++++++++++++
 8 files changed, 1176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


