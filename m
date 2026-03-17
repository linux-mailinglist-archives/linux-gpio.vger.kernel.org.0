Return-Path: <linux-gpio+bounces-33675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNd3M+yxuWmDMQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 20:56:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404282B1D3F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 20:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA024303A875
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 19:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38436341AD6;
	Tue, 17 Mar 2026 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WTzcj9Dr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD5342C8B;
	Tue, 17 Mar 2026 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777112; cv=fail; b=KHJ2dmxH+Po/IXjqLjGwwYt0As3JXUWNCQlN32ocdz9COn7UgIhVgO+F0v6yb7qCwwHfmYcAS2etMR1T86nwzS/JaUpFz1jOO3cbuRVlChgnMOoTBS9d+NBYuv7o9vQsC/Rvj5KslMnkuN2VorTkRBB5o8mcB8XB9LozU5uBLZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777112; c=relaxed/simple;
	bh=vnAk9tf4nNGuk+2iR2fhufbZLrCZYHlpI8QitenyjfM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=haFf73txEG1xBXvPqHFCFIsqG7IE4M1xxqzLX1JtekQkC7cMKFgi/xSS5bMJ74r2laLKJ3POOb3XmPUhYor3yCjZQVmPEnnOlH4HanR8Evednwy9LndlAEhaB1xZfus8MaZ50JoBk1vObF/q6njGJGIondyun70ChoRPZLUTRSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WTzcj9Dr; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm4vvxMGA7OLKoU0joG6OsejsuLh3hbrGIH1u+7dwKozfLAHK2j6vVcgCGNm5Da93mTvt8C1ZWSIl4notxwqvqJp0V4e81w/dQ3NDmkD+B29Wf4l4/hX7LNiEnUo3AbE8yEEheHA+CHpKALbWF0SossGKoyIXezcZ49jXto0MDBmLk6+ZpQJR/dAT3NtsKtklnSvsUep1fdNEj5sn8m5PvdhV0U7jW3imqlwwiJDlWPaDvlPNAAt/f6xqE+UfvEWk31MWufFyldmguuI20KeE3QZ6SWnuSL4tvxofe3tjWc/iU539qpiAoCBbNWZ0KePrO4SRrsEUQguUGA8mPzkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXLd88qfXMWqBjQiNVEXsEHV2Qg6fQx9DVXnrhELwe0=;
 b=Ubdle5wM+fT4jGcdJOJTyVRIi8Uf6tNl4M6/KQbtAlXpRCaBj0ju0cOBdiU+SUxSfzxjJBQu+mVMIEhHAHsGsvXI5I9Puq99jV4Py+Ovh3SxprfQMVeOym+r/+35rJgjGhiu5d4BuYLerg34R5OCw5am6wVK+jNoVS22ke49lK1duldlxOj9Xh8q83OSrkBkjvJz2VqWH+8J24agv2h3IAj3UrNShfEZ7L/KS2gtLgflt0n+A69ieqo/0j8wC7gHROjV8yLWIfvmvP+DBC00UKkpID6slA9X1zv7cWNe/Uqd6dmaFj6bepJIUm17rI04J0Y/syDAqEriS27A7yZY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXLd88qfXMWqBjQiNVEXsEHV2Qg6fQx9DVXnrhELwe0=;
 b=WTzcj9DrQXzaBcE9yxDntz8D/vDaSHMonF9M+j18A3y1pv9ZfSTo1xqdAL+vXw4+tQO1Hz3WCLMQH0kuLdmH67H27iG8dJU1zy5isG1hYxkGtO1W8m9ihwMT9L7AyRkRBjIu+eKwngY2HOVbzlRstPXQd85vLyy7ZPpTsVaa5AOc+kIqb9+6xv6HQtqPAKPptbbmBfRTMz7Rwj7Y2xF6HRQ8/4nBk80lsAEkQ7agE/s/LYqwA6E7npzmlTQkBD0j8Fx4ePQwmOdZn4pIA0GP0V30Ib7CEGDMfNJp9PLPBKJyiP5Q2BbUAdO3rwj0YH8RSkhR/UPfUn6EpSDxx0E7dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB8PR04MB6938.eurprd04.prod.outlook.com (2603:10a6:10:117::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 19:51:46 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 19:51:46 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	stable@vger.kernel.org
Subject: [PATCH 1/1] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Tue, 17 Mar 2026 14:51:16 -0500
Message-ID: <20260317195116.2301985-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::11) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB8PR04MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: e9859084-9710-4e0f-ef29-08de845e9eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	SuS1L6URa+KHth4aPBz/0XJFpow6zMi0zM8rqRwDaRk5IPv5RiNqeKF9zRGfdeNXeowmgJyrKkVYRWuOoOgyjjd4PWbSDsuVNukckKuZ9J3jt1sQLxDMvgHpSsi4d/Lp9yM9AJW1cf2WuUCjY0ips0NiZO2vGSj+BrrwTitOouGOS6D9UliykXBmE4f6XH+oOX6Ijqv3Gt3FUbWnrT1APdXdIPFToMapgCYuV9FJCs/6qaFcsuzkxS9R1v/NaWjE7U92vzoFfzv9ILdgBTQKfSq8pLPkkstt1Vn1RmJV7lT2s+t4v2+zOjfRmqH0ssAxRC3HahHHIt1R18qNkpM3GFxo6zIC8uarHDoOeW5DlqdWmdP7F2M6DNBF4bCuswwd3mSNPTq6NzV2pkmpDEfnn5x2qvMIcGoYxeWLzf3zY71hlOSIpHfU39aTkFeyz9Q+9tl0HTlBuUNVPmWIiAUZwQkf0YjlWMXmjGLDKbyLdMKQzpMRKxPTCWpyRofBSplKX+LDB6ExIDhNQkCA48FRMCxiJ5YdNg13c+5zxrYnbhzSPEEDTsCFLbnNLoPTxzbqZ7PO/JLNLo2Z/3BI+MtAiVwMI6JSEIsm4GwCk/bERKwzYzjLPlAWw0cjY5U2m5kck66rA5DBOpElwf6tJ8Q3j6puEB7Mx+/Xy55XjB8YV3nQB9zIAlFI4EP/8wVL2QKai4UHhooiTCXKaRrXpzWBsxMLwoNbb2CMFlz9h8uA2xcCBrzLvCoIRVB3fG3jgF0Fw5IgRQiOLhjBjtgreAdYq2K0UwP29AxfQw5oFk3BX20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x10h4LqU4KrYwedA7gzxukvsQM2P4fWCLSIlVKBIKbAAXd50+DpBif5R4uGW?=
 =?us-ascii?Q?x4h1ScaZjk5YIwOHUwSCMzMKQTdCXuqXjXKKFDgl5SgsEE8KzXP6pBszt6F3?=
 =?us-ascii?Q?Yh3OPNo7WzQyryP0aPIPu4am1r1GJAkUYpHZmzVo36Hx4vnWn+HWTyc2xJyC?=
 =?us-ascii?Q?NQx7PDXI+XbkNuwe58fKAH9b2bYaA9WNonkBH3xeQyZM0nJPu5agAogxfQKR?=
 =?us-ascii?Q?02gRHoQLidhG7vO16RrKiihDTZdCxMdml9oZOe14vWBERTNGJNLxopVCbYKn?=
 =?us-ascii?Q?zcr81BzOVOhd9c6Cuu5BqtPCbIT7CA/cMkBYvvEWw5bd+b3DvBwuNiWZOqjP?=
 =?us-ascii?Q?8SHBAVzKksiP8Oa7a37pHpPDjFRZIylBFmZD/On8Xv6zRxBDCEFeM3oDAKU+?=
 =?us-ascii?Q?f4GgyzeeOJ1UvGtppMs4uO4/xl40FCN3Z8cYbmLRViwFdr09bzoqQG6PMdZI?=
 =?us-ascii?Q?3QbuP2oPdc4v0bAynZnMQnnH5MTVIysAjbLExW4yETb0yt7smCEvZXqQ9L0P?=
 =?us-ascii?Q?cjjnWYFvHHfe0pJNyTZ9r8KVWKxfJ+yRGuyBAFVAgoN+y7hefJ0YUnhwUQOP?=
 =?us-ascii?Q?5kXQanCJOyuH8guh3X1EEGCZm15LlRS/XgYrOoM4zKX2bMNtElJq/k5s+HgT?=
 =?us-ascii?Q?D/eMGo2OdMUlpBSohQ4kRGdHXu5xqxPoMO170A9wDU1RRJ9L/y/muvI2v5J4?=
 =?us-ascii?Q?9WM/1LZz8VVcObREdUDIWEBPk++mZ/3VgHnn9hNS+JLmtsS6jJkdrFZT9j3k?=
 =?us-ascii?Q?5Z73W63M4aODIzM9asv6QS6DV+yWjAoeBeI6GshydEBeAz/8Gud2qxjoWdY5?=
 =?us-ascii?Q?tmX4sJ7mLSn8Wlxrlm+dpSFD3XLM5IaruUjlPd/FW2XVx1p4lCRBXxqyLQen?=
 =?us-ascii?Q?Bv+1uNmIk4RyL6wD2xLljmJzvyiewiqghIngVfTDEF7zAp1eXGfFupHtYghc?=
 =?us-ascii?Q?C+4T9WNPWYcxP5Fcg3fHXPOrum5vaz6h3xpF6yjpDXC7VLck9Axl8o7svjVs?=
 =?us-ascii?Q?ZSI9/3aDp3oA7HrfYWinWw0TwWO4Putr9jagC+4+617BYyTwX00CMU3W2TRs?=
 =?us-ascii?Q?Q5n5Iv/Cce9FUbuVkXX3yNErXRDhYf04R8AYG468xLs10TcykhJ0boCt1Ay5?=
 =?us-ascii?Q?T9iMMd+pGzcBg6Ija71QgG/rq1wBfvErLVTiH6G0jEFyHcF551ZVXaWH3aqn?=
 =?us-ascii?Q?7933F+l+1SPg0QASra53m81GHgxvssMZ2Vv481UInIXQB15knAd03a+xXl6q?=
 =?us-ascii?Q?6fSvvSW2/d3DQZ00dyx8IPjUc7ygFG1sVay0mBlrBClTrGwqi1VJp5xaeffv?=
 =?us-ascii?Q?woVrEQSIe9Ev0DngTlmR1cgRJfHWpzIWli3uPva9jTn1c5drw562Tpi1PSak?=
 =?us-ascii?Q?lfIpb2O9AVeQnVQYY+OJpycMxmlkt+WeXgmowKi+DqREIwTGIle+VlL7F/iI?=
 =?us-ascii?Q?sdgE3+RKMnmGMCjTT/gBTrxC7VEx0pyCHhhIQzKFyH9+5+I0ZTFkr9X2nwQy?=
 =?us-ascii?Q?/jDLSDDgMXGJsJ8LoZmpgUY12Xb2vn+zP6xJN0iRElau6oLyl2xV3X83Cw8T?=
 =?us-ascii?Q?e+hW8rz/JGIJORS+WY0BEw0hZn8KtvFgDPlbQb+ptRudiDYxwvGVORblq4Wt?=
 =?us-ascii?Q?2P4Z/ywxpuXfjyQimvTKLNU3jFA2EFTHcUehuRW9oT+o2pAo3nP5ZQEanHpS?=
 =?us-ascii?Q?38wMl9/p13uVtpishTZ5NvqQNOkadkPKHf9fFyaRdDfEIGNdBpBSuALJus1m?=
 =?us-ascii?Q?pVYlWsPPCQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9859084-9710-4e0f-ef29-08de845e9eba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:51:46.0749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tp4jQNFfWusVtFl77lC/1wauOKliFt/YNqyDHFRkP9GHb07U5ikbYU0ls0CAKTG9eF3F6mp3xOV7CkZ/7ZUvsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6938
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33675-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 404282B1D3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
trigger due to a hardware bug in the detection logic. Since the hardware
does not support Both Edge wakeup, remap requests for Both Edge to Rising
Edge by default to avoid hitting this issue.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
cc: stable@vger.kernel.org
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d7666fe9dbf8..f8300690ac05 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -589,7 +589,7 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
 		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
 		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
-		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
+		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
 		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
 		IMX_SCU_WAKEUP_OFF,		/* 5 */
 		IMX_SCU_WAKEUP_OFF,		/* 6 */
-- 
2.43.0


