Return-Path: <linux-gpio+bounces-33944-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCiuFCOjvWl8/wIAu9opvQ
	(envelope-from <linux-gpio+bounces-33944-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 20:42:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9E2E03FB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 20:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45F3E3100C77
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 19:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECB33AC0F4;
	Fri, 20 Mar 2026 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ti9zUk7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C433F5AE;
	Fri, 20 Mar 2026 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774035139; cv=fail; b=C7+LQ9kcudzQbPboqcRoAtZxqOFs+hWG1u1id91N7PcZwEbAacR5yk9aRm0i59EfDrxGMEjtAoOOIoHitzpS4S9AvEMsaurUoNQdR3nDj5oeuqqyv3QzE3UURSZLyv1W3j6TOSKJuYv+x5SqP9CVSD/9J0sZ+T13U4nZznWmJTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774035139; c=relaxed/simple;
	bh=6kCVB6pt6+20h7AbSfWcwR6bAJWroqnL5XR214Ckhts=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LGrspDz/J6V/erKNX1c8PybWW9RvIEThhcz8hHCrKO2a3NAqjzP4+IkNDj2ILSaFxtwFKwMTSvAdBn4V6EQ5AbStpSNeVC9QnJlX2oqSDymRTLo9ieghpDv0whFrBS8QA5NR6r9bqLzj8g23/rtGJ+DRA0Ri8MdHGS7+8DCjzXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ti9zUk7U; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ3MJN3C2lnbUu2En6FROJ/sTaxtstLUJhmfDzMXF09bbjCLjjUAz/LyKaVVUyUnShhgzrsbImGKpoGfTWLdes9c8jymMHh8BM42wih64okgKKP7xNE4XEFBKEiUlQj9U9As1V/hxQuxqPgl4giIxKFAgXz3WXWjEn6eB/LZ/O4C9uPJyjooxaQrBi1UurRxoJ4EHGWkTjVj/sB9clSKJDlRRQrYTUduR87VkT2u3FUr+sNUTjGromnIE0PNUsVxivxITKupGssNXinhhsIpeJsjBStPwYQ3aYMTxk25KxSN+5aKq6QSpVhthaNVT1g+zifNZGq+yYrQFijU7fgHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4BBVTiRyrzodU0nRWZwppkX/hxXIPS7n58Pzp+twh8=;
 b=jwy7oY0azXlczV4XQhanLeHhvAbv1pCBRhlujGdkhPCsr8OLgpJHvp1VvJ+fOX5qH/KZR+eva6gE3tW1SpcKJGwXabt23iRzYCceQaJ6W3NHhd/2qveYQv6s9W40tgqpRVoDkLCrmIFl+PS0uyf8fOBQ+JzVASlzrZ/jPV5MBn9CgNLqupaVn8y8p0enZdgqvYZAoroEyHjFOLalO9D5kBZeeVjQpPW+qyfjZnhTLJkTBzZQ9liBAZKkOJHwp+kh3TO8Oh7RmMttEr9eUVCkNDv2eZMNCQ8FPlTaDjAu0aatAKzCssJNgpYl4XLQDFlMNtILaaZ3hWWxHXwDIDFaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4BBVTiRyrzodU0nRWZwppkX/hxXIPS7n58Pzp+twh8=;
 b=Ti9zUk7UQ7sLJTdHs3A/R9F9Io6S0NsgGsZdsCR47aZDLG6a/Sa7PXu+Br46bUSg0OAtjLLAkmDC3EKSdKc5Bzsg2OubsuyIkeFLO6mlBRogrBcBwxJwcxyDFdHlUyy39oa2FT8T7ZrR+VWJCtwQQiTxFe7JVGsm+GO4reLlWE5xm+AOs7sj+JWxq+d2/pVOP45HHA/8KyuQVgyF0m2hfiORwfqC88+cIrQYEq5zVHytXCkG5daaWd7YZKPKJ0tI4cgck9G2QV5uVZ5HoOk/2bfAFzyBffeYz/g4ck5n51njR1zbR5VuRBWWx3+mdb4uWcTnovb7vMRTwWxWsBEUfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB8PR04MB6970.eurprd04.prod.outlook.com (2603:10a6:10:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Fri, 20 Mar
 2026 19:32:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 19:32:08 +0000
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
Subject: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Fri, 20 Mar 2026 14:31:50 -0500
Message-ID: <20260320193150.2508850-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:510:33d::21) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB8PR04MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e349652-f318-4092-a0b9-08de86b75fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7416014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kFoKeZYZjzZQgZGYlQH5uViGbxuJw9IGM0FC7ZLpB28dPeyQHXDmgG9Mqyv0dd4EB0g70fWv91ucpC/LJgZlkiW7EwLa6atfoSHioCtz6KDqGFiLaBfcSRSa3M0JkS1rXlRFCIrGgxg3LuT9MaF+eljXevNuOVOJwm7qOr7EIYdjWsG8HRZPGeX7HQykFHqoYzAwwSGMpxa5XWQaohM8oQceicmLGi6Byg0HKM1nQHH2sdRv80mV/nLrDClMC4U9Gwe/QzIt6Jws3FaRVpWjCL1uB7Vy9208274Ker8wxkbQMJPECYFZKbe2QZa9bDHU30cXSJeV43GClH/3bCuGsKEiEs/JSuXsXVU0PdrgQxaCrVU8etjLDX/RMMiKwFb0ewOzm4Cs0PP+I9vwXXvMsk4AsmNom+mXYUqxI4p3qHp0v1aOtsJBvsB/3DJOmeoubYDbo2sxUiNKY9E0D7fb/WIag9Aogx7COBNuexmKlYRJwEsLYpQ1ac5busyRQRB1RiXgs4YLJo7Hp3oBst0j5Cnb/6Imb/uHcOyAcWX+xA6e/TY6Wg5WD37jtrhawncBccMpoZ/ucDgwWiXHajaIe/1hIctRpXBIm0wnMWxmnoaQ3tTm9MbwHzQ6brvtifuFtj3IVA6nN8kzWvQJYqhKyDcVHbhX4sU9jHrP175AUqA58Eps5oSjHZtCa4IuY/TTOQSiRXFanZ55IN7AKu01DF0LbmydwapAU+a6MjQj+YeF5iHn+uNE/NzbrhGM/DelrTWGzGqcHBr8jVD4P548DG7IUv091IWjkkD2v5iXraw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7416014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r2u78aAjjgM4YOzHRg9KBlktCSRCL0fE58RJkKijrN9TqgaQQCORzbz3LEK7?=
 =?us-ascii?Q?qTtpPiNnfGx5Bu5qazund1YnxEwXVYchgloqgq1S2Jd9jj+2MTjyUZtIuWcT?=
 =?us-ascii?Q?kDKPaJ3fpE846H05EvILNJMjrK4bW8PWBXGTjzx7dgl/uERKKpk7yDDmNhHR?=
 =?us-ascii?Q?l6PRtxvUURsMlbn05UfgREX80uC1nUU3pPOemOsHwP4B4m/LUrkj4Rquy29Z?=
 =?us-ascii?Q?R9KwQknScqqywG0MfYJ3Odunc5To3xZvxkUpdJl7iCTz1Yj+Bqq5ZG277p2v?=
 =?us-ascii?Q?N9qFHorNekrQCwGpCcImHX0bXWVDmv1KMte6+SC1TFJS1yrCnWSwjPOlPZWO?=
 =?us-ascii?Q?10WxwVZLjAiS4jYQ8rbP6W4hcFFT2ufwRhWz98k2pXFUu/a34wQB6gFAQeCE?=
 =?us-ascii?Q?c9W65+PfbkLavBMOYHj0VeoKAiJ2tv5vaLAgkEVAyCUvjo+qWnBIboXfbc5V?=
 =?us-ascii?Q?MHZv1jIlsj8ffSsQ6ZhKqAwKhpfFrgqmJBUQluLX1zNd+ijBRaMGdBjXHYwv?=
 =?us-ascii?Q?P8tDjFHvDBgWoCcFypZlprh1F8QKm2SQpJmjC2+O7L6rJ6gmWHcyjRlcauiD?=
 =?us-ascii?Q?U6awSFXOr6sfBW/YxT+s48+bFdYULB68g0LQMeXKvXQI98FQxOWwVk58q1rq?=
 =?us-ascii?Q?i7jw2Cz81wRdNiIGzq6vrYPwVPaezSZIR+exrxkK7nlJSI0fMvF0HaH2HetX?=
 =?us-ascii?Q?QcyTHIPHquTy9N1ISDpV1Kf5UvNQXCLvqJK4QPBtTVPaEZyUWbTCcKOSM9Lf?=
 =?us-ascii?Q?IgIctXmbZSJ2skl7IsroUzvq3JQXX4YDmUI3i8egfyYvxd7hiueETsI6+hvy?=
 =?us-ascii?Q?bvUhLg5PumDeLBGfBs1yFWrxF3nVUWLCckKqQfEgsXFpheltqKXjki2O0nwq?=
 =?us-ascii?Q?Zvf3WcnQTL4doRmCKknhWqrVMkqI92D43DXYgp606n89NEXsy6yzUNizhACm?=
 =?us-ascii?Q?BVUDpceOMFPnZ0d1ZVi5kyvSthHJSNnDeqMauxIr19ybwIeHmEJUZ/CE/uEh?=
 =?us-ascii?Q?kYl+Tm1uFnlZBGHWVMUtt2ls47xv5A3QZVxzaHVqlLIp2qOJlaIH9gpEKHag?=
 =?us-ascii?Q?UgcLNhP68s3WK7U2TkHWueQVFLWyWdPWNOYbUY6IN8D07JsFFdVURvQ9EnrK?=
 =?us-ascii?Q?8AcrllSTLMI6N36UPdiZ1AxTTg1pEHTgSsCqJpvi8/9JgLWGx0wwpdVyqOKA?=
 =?us-ascii?Q?pGZV0C+4TAy9N89P60ihc9Z/yJWNKjA0lpRuoHCWsg5eS4FG/FHsBk+KKGto?=
 =?us-ascii?Q?9EwKi+7qkx25BRhe4zuJ5FvuPNX949EjUxrtRb80IgvePey9X4GeIi3KmmQU?=
 =?us-ascii?Q?g7kAFNxyAWLyI3XNZwGYkT8B52eeN/Z+5NqmW54gqpI35au+H2+FZJgXTslw?=
 =?us-ascii?Q?f4qvCw4Zi+vzhGq12m8CmH7rCIkt0ducM0zulFdOvafoY5GR5U8oCT2brYME?=
 =?us-ascii?Q?PMQn0eo7UMIKbFah7VQntEEXOUFi7hLrv39CtR0ujxTk5ack9L27DOaXunbB?=
 =?us-ascii?Q?/1dBjzBmrzo9dz0dMRH0I7WCM+lQpQL0oJweFVpLe6aJ1gECVOl1NO0BWyzJ?=
 =?us-ascii?Q?/imINyhZoSNnzpkO4N12tsWyuj06R7cxnfmWL45CiECRvxZFwe5cWmTz2h2y?=
 =?us-ascii?Q?15DC/SmZuKK7t77pPRuHFalrxWsRhowRtoHLOkr4o85pE1oQwfMe9GCm2zp9?=
 =?us-ascii?Q?JeY4MPA+/wL81UmG6X3fcnWiZ4KMkOlPM62jJFBzg70m0AVWjhHEfVKsV1iH?=
 =?us-ascii?Q?+cnvHQv45A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e349652-f318-4092-a0b9-08de86b75fbb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:32:07.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6gL4honNJ7m15e95jG7mxScLo8mccguG80iGNXyTmNfY1cG1SFxO1sCS7YiLGIolG4+vYzj6acXsPQpcbRLhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6970
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33944-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EAC9E2E03FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
trigger due to a hardware bug in the detection logic. Since the hardware
does not support Both Edge wakeup, remap requests for Both Edge to Rising
Edge by default to avoid hitting this issue.

A warning is emitted when Falling Edge is selected on i.MX8QM.

Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
cc: stable@vger.kernel.org
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Changes in V2:
  - add a check for i.mx8qm and emit a warning when Falling Edge is
    selected.

 drivers/gpio/gpio-mxc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d7666fe9dbf8..095bcfbc56e0 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -584,12 +584,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	unsigned long config;
 	bool ret = false;
 	int i, type;
+	bool is_imx8qm = of_device_is_compatible(port->dev->of_node, "fsl,imx8qm-gpio");

 	static const u32 pad_type_map[] = {
 		IMX_SCU_WAKEUP_OFF,		/* 0 */
 		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
 		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
-		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
+		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
 		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
 		IMX_SCU_WAKEUP_OFF,		/* 5 */
 		IMX_SCU_WAKEUP_OFF,		/* 6 */
@@ -604,6 +605,12 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 				config = pad_type_map[type];
 			else
 				config = IMX_SCU_WAKEUP_OFF;
+
+			if (is_imx8qm && config == IMX_SCU_WAKEUP_FALL_EDGE) {
+				dev_warn_once(port->dev, "No falling-edge support on i.MX8QM\n");
+				config = IMX_SCU_WAKEUP_OFF;
+			}
+
 			ret |= mxc_gpio_generic_config(port, i, config);
 		}
 	}
--
2.43.0


