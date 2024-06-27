Return-Path: <linux-gpio+bounces-7753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59291A76B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB7B0282456
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 13:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BA119308E;
	Thu, 27 Jun 2024 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RcynVBZB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E7192B99;
	Thu, 27 Jun 2024 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493725; cv=fail; b=O39HMrBmcCi7yUGFUGV7kF5f/b/mr1FAa860PMqKdPGmFHtBHGqGBv4jjVL6EPBhEqiqD/bm5U8Y4FKCwlJFj/xaEATJKST3Of5MVo8kQTsl5+o4Qw30i4qYqz3OiWOCy8lN1rc8GGoflxKABlYLH/E4gJLlaNilpgmOTc27vi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493725; c=relaxed/simple;
	bh=ADvmole6JgJdYpXOlGO2guY6+veLL04d1JHchjxWXmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j/AbFQ7o9Le0G6jinU70ZX1zGpJNbRZptqrwKTv16NDM0AcFyDnztWcXx3ria/j2oU+f5hbWJPBjE52dHbiRyufwhkzLpDU4ZeGYNS3fhHiMHop38vo7pmq7HNv8ecAljnsRcoe0/Tisk34gV2GVSjDodhP1F48aMw6EOfhtgiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RcynVBZB; arc=fail smtp.client-ip=40.107.21.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsSLckqx7h64EXU5K4rBhUwropADxYVILeo2B6pmdFodiohpCo3yqjR4c79wXHY8wzhHBBDAjgyzet7WzwNApxWAAjzBSgrO82lqApze70QeSdPSw2eEgHgcT4BEzw7rEDXZB0Qs1scU7UH3FpxyMT43SSPX+nEXMyB/7zJ/jePCY4kwlw8xiGbRNGoCMscr2IoR5vGq+RaHL1Z62akFh+qyJpqYjHXuZjz1i6SMDOJ4G20Qw/aQcsEYSyybqK/lIA+ZwGeJCZ/EL0qZT4XtTwhbH9E9OWGSYkXAv0ngEANfxrVDcAC5JKfwlW1vsR6+aQveWNaYINbbAgwsqVLdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr80pCQzIYp8i97HhnjiMCNfsEZ+FJnW1O/k3EO5c6Q=;
 b=hLEAZDFfkMaf/wRiaymSTCHk95hrg5Sa4y3yOLWwpaMREMDeL9nmD/RuT6e3omO3aKoPXYO6g/M7VfSvoKcR8U0/6n9yiXqerIVPSGc2M4DdDrsKT7N99IE6x/zjidw0/PwVcV7KayhwKyKDWtX3ajqKqUh9o+nu7c7QVe8x32P2+AIGHedWZ3hjEg4qcXr5nxRnSLDGOP8ht5/G2oftDhgh41d9168LOKO7i/fNFir+Cjn0Rz4/qleolzRBk1iAqPuppx8QGvl2zb3z6PFNn4F1X7AipflkwtZAWuJClrGBNEPSdkNf/0SDprg/BkdtlYGgYo7SqufoC4mJP4DBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr80pCQzIYp8i97HhnjiMCNfsEZ+FJnW1O/k3EO5c6Q=;
 b=RcynVBZBzxd8pW6s7zOk4HY9GZ58lYFl+o6MlSmb4SW4gEZ/uwKSOVu7PZBsptZxvYD/CarkluHJ6T5l22IqDFG2Sgf8cC7/6/HkLs+Hi9fnzUF1tIP5mxKaMu5ffA8vttMUOyyfXnPF/22UZGQaAIqQ4soLqA9BgHDzP4/AbYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 13:08:40 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 13:08:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: linus.walleij@linaro.org
Cc: dan.carpenter@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	u.kleine-koenig@pengutronix.de,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 3/3] pinctrl: freescale: Use scope based of_node_put() cleanups
Date: Thu, 27 Jun 2024 21:17:21 +0800
Message-Id: <20240627131721.678727-4-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240627131721.678727-1-peng.fan@oss.nxp.com>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To AM6PR04MB5941.eurprd04.prod.outlook.com
 (2603:10a6:20b:9e::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5941:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: a823f49d-7519-4192-4d78-08dc96aa42ea
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y034Y8qI3fOVPluZrs3n/Fo4YmGOMLNkF3nhiB0xOVIj4+O5BvyBkso+unhG?=
 =?us-ascii?Q?xI83B3xfeeOG1mxSmmPAh0uJuXgDXf+25zjxiVjZau+5a/HuC1I1LTDbUjgJ?=
 =?us-ascii?Q?GE8sstQ5j34nDoz3V5M3lJj29+9LJ7iSdSDIxsnk8wDVqNJr7fNRXWCqGBvV?=
 =?us-ascii?Q?dAY9475tX9V9FgGz2jNq2RFVYTLpzteqGmAP7GVyJ8QMQGxQyJPMTXZSTd3w?=
 =?us-ascii?Q?XA/+a+kltFxiA6QY4yhrLAWNd9wRt8i6cCNzCbQxdecrJUtZ28LNvygGcLIo?=
 =?us-ascii?Q?cTJyA3wHTQuFDk6VjmxBBelid9dn5dexpZl64yX/ra7+bs6iIUtTwGhMzqFM?=
 =?us-ascii?Q?mMu3azouw3GtTmgKme6f5u5HTRN7MLWtlK30Bes3ocJTe2vUgAAV5MhMid98?=
 =?us-ascii?Q?Tu9KT77pse5/oioa+9J9FI66dNF+WLxwq14evg99RKB5U1I6Sgog6pTiXOYv?=
 =?us-ascii?Q?8Io17V9teL5xfju4Nn0YQhkh9DfqTV0fLVvwhlQhKlFGVVxIY660A8Kp+dDz?=
 =?us-ascii?Q?7zOGgLGIDiyeE6F5ttuWB7gdq3yVKV09dTL0qf7rTVibd0dmejbqAId6H4xc?=
 =?us-ascii?Q?2CZm23VkfC8+3uDqkuXtOPm8o5DwFtkxnLG6kuX7zvczxesSqswnr5RrOe/o?=
 =?us-ascii?Q?4FCBEnmGi1ThxCvtJ0pxjOwdSwINv9FQaef6BBfCU7yavWK9YiUNkeFghe4A?=
 =?us-ascii?Q?NNM8yoxiboI6zeNhwIA3rQqSYmya1ylLUtpwQW46wT1Dxl2Kpnc7h7+XL9UJ?=
 =?us-ascii?Q?ghYlDPHxynjgPeujtTd9VZc9yxjFpfxfZIyqbEBdwRCFaZLtI7BNECveVr+H?=
 =?us-ascii?Q?KxBvZGkdpyzO8zAVAkvb24DFylHdAOEkUuS+IViyngNi/snH5p3qsiEJdBFc?=
 =?us-ascii?Q?KNR1jTyq1hYo+m26It3X141QrTIy9PdZUdQj6sHObzw8YN1HP3kppYrbmEzn?=
 =?us-ascii?Q?qzie6Qpbj/A3yi0mTbeeaM3jboo5+DR7CWnxoiYG5IvVbxV3+WxZOHl5CgW1?=
 =?us-ascii?Q?wtZwOd/j8UbNKppM1HY3WfYtsma32jh8uzD+ba+Q2OaK1R3cp9ShpC9C5ASZ?=
 =?us-ascii?Q?e+v/6/tTwAmDL5/GNVj5LTy280mRdw6y7RGosA356wzXChH0CDMYN40xP3zG?=
 =?us-ascii?Q?KAU1yS/HdIvJ/+SRHuvPRbco2l+IsAs8PXUgos8dU5paYCfKa4Ki0gdGpuvq?=
 =?us-ascii?Q?72l1D6hiBjj/Iaj5mz9LCZ3rrsQOVBm5QXbDj43oo9JZi91cP07cW4bA6hEy?=
 =?us-ascii?Q?bfi31QykNMjP9iAa0A10MZrbsUD+KeJ81NoT3y8v+MaTqF83aw8Pvxb+HBwc?=
 =?us-ascii?Q?11iBEjSR/0qq/h12YAgsDPRUCNa36Xjfqj9uftORXBvTr9BHuROkYfR9etfe?=
 =?us-ascii?Q?Bi3jsYpG8pNjOWoWm63LysFnlQzpcPxQ28ci88tJ/TmQZcQaUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVKo8UGGi0BL0/mRolNi9bjr9IDI5/T3wmVS4Gh6/aHDeetLREWlZCm0POf2?=
 =?us-ascii?Q?R+7MTGFLCQuqBnWFxaLWY355zO01pIuH1PgJqVSHUweTCV2hcSjgFMV9TyUA?=
 =?us-ascii?Q?ZwpV3b9XxbYjNNNgRGsjOiFZHKAwBjVLqVhVI5Ubg87HTtbDB8oVgBOUh7LY?=
 =?us-ascii?Q?og0hZWC42idbI3VA2A80bN5z9e8OQ/IxhpS9eZ0AV8yzsvCFKSkbyoCdiv6X?=
 =?us-ascii?Q?7OG+5rvvaoSPNqnFiA3RnAmmXPIB+uHClbzJgmuF4VbjALovX1TrkNKqvp1s?=
 =?us-ascii?Q?kAWEp77UQDkE5mVtJ3u35EJu0rdlE1pcOhUt6ckau2ZzL71JPZdAdcafBDaE?=
 =?us-ascii?Q?oN2wUiOCniZd2Yo2j+ytFijMZ3u6ajMUh2kBv6GylfKJ4mKMotsrXWvyr6fZ?=
 =?us-ascii?Q?ST8WDBvSlHI42vcWZEKZSiug5ABivUio1R683arU2qrWedu6Bk4ruoxRBqo/?=
 =?us-ascii?Q?ARONHYE4sqN17Xq6HLzRiKLzZlmLaFZLw98aeAirRAEoKAtb6t7Zpg1GjsHu?=
 =?us-ascii?Q?kvTOUWkSVmomoT1x7tRl+y5d0ZGtb9SAXcT/LnXjuHANkovVeFu2H9RoiVCr?=
 =?us-ascii?Q?zqFc5seN9eg07ul8VkzsSU9sjmXOYOLxL2N+84I90BkbvY1aTxbq9jicWght?=
 =?us-ascii?Q?BwBp6LBp6jyuWGxTR922wJLI7i8pJcaqINnZFixfljDhZbbm3dP0RMRjUWz3?=
 =?us-ascii?Q?Lnn3z7AiO5dnDONUw1HBhYVrfJdeH+RXtzneTxqnZ7D88qslQ6E/pyN4ExmC?=
 =?us-ascii?Q?qGHuaUw5fEG/YLP7HC7lLwlNZDnL7tCTYqE/AEzOHcV9mwUB5PtBou14PpHL?=
 =?us-ascii?Q?l3d8Nuj1vvhHM8JJRY3KnoNTZjiPr7NX+qeljvfVbV1dUzrEHYodIvXUumrA?=
 =?us-ascii?Q?DbD2c9zveWZCU1w51vtmf1HM3Z+gEZ42dtA7G5DmfwsAjlIdQjqLSUxofJwu?=
 =?us-ascii?Q?PQR3YF73H80GphwCCAd0PIdPOJ0nJ5Aa+xbVrME9ZFaPfMGVGBh9vKDEJJJ0?=
 =?us-ascii?Q?u9fOa307qQOFKEVlBk9NkI1XScSFZ60rTo2L4A8QmSlZcEGgdV/6xrl3/FnA?=
 =?us-ascii?Q?Cge9eUclkjPDCYSiIGU4MIm/BF0CNLygQ2AxfAd4tWmWdhnNTiCZt9fcnFz8?=
 =?us-ascii?Q?01ehEppSaP7ZRYtOg2k8YvuUzgW5hf/rgR7pyOMUnn8Mcrz6VxNhqyqIGL9O?=
 =?us-ascii?Q?6rP3lIAHzA9DkKSDp6zFi4yZETZDOUD9E2v1rLay/Ts62r1E9/F79x4h21Sg?=
 =?us-ascii?Q?DOJNDAm9PqEQwAGP30tlM+kFn5QZATolNvrnb+IUFyH0dClXzY6kgbG0VWt3?=
 =?us-ascii?Q?XeWNdvKTQCozhmzcrW4qbosInkLekl5JpdAJgAxizmxA3ZK1Mx/zJRYZvMYp?=
 =?us-ascii?Q?20zirpXy7hdtbtvsp+OM0r5rRMhiV0WIIYfamJ4eUfgjEKrqmYH0smFxQuN7?=
 =?us-ascii?Q?SxDMugWSgR4xMkRYL5WPUjygad3gcBpwYL57uKI2OmUQXRNhOI/J7x8Bzcn0?=
 =?us-ascii?Q?/IW0EWe9llryNR6Wy1sVepGld3msKEK0Pg/ON0UiaTa1XDUlAftfcsJ7xF2x?=
 =?us-ascii?Q?hy6xaauTZcTrFm3ZZL7nFZ6Cz5RRVEsViPw53HQY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a823f49d-7519-4192-4d78-08dc96aa42ea
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:08:39.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzOptCBbzqh209xZKp5uZhm8q1HrGqDQT+JoDtjM/CP9Qv4pQtAaIuIZnffOyfsZ8eWU7AWuV9qeEenLGvsQJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c       | 25 ++++++-------------
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 16 ++++--------
 drivers/pinctrl/freescale/pinctrl-mxs.c       | 14 +++--------
 3 files changed, 16 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 1ccdeb86d8a7..9c2680df082c 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,7 +580,6 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct device_node *child;
 	struct function_desc *func;
 	struct group_desc *grp;
 	const char **group_names;
@@ -605,17 +604,15 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
-	for_each_child_of_node(np, child)
+	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
 	func->func.groups = group_names;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		grp = devm_kzalloc(ipctl->dev, sizeof(*grp), GFP_KERNEL);
-		if (!grp) {
-			of_node_put(child);
+		if (!grp)
 			return -ENOMEM;
-		}
 
 		mutex_lock(&ipctl->mutex);
 		radix_tree_insert(&pctl->pin_group_tree,
@@ -635,21 +632,13 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
-		if (of_property_read_bool(function_np, "fsl,pins")) {
-			of_node_put(function_np);
+	for_each_child_of_node_scoped(np, function_np) {
+		if (of_property_read_bool(function_np, "fsl,pins"))
 			return true;
-		}
 
-		for_each_child_of_node(function_np, pinctrl_np) {
-			if (of_property_read_bool(pinctrl_np, "fsl,pins")) {
-				of_node_put(pinctrl_np);
-				of_node_put(function_np);
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
+			if (of_property_read_bool(pinctrl_np, "fsl,pins"))
 				return false;
-			}
 		}
 	}
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index 90c696046b38..af1ccfc90bff 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -508,7 +508,6 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 				       struct imx1_pinctrl_soc_info *info,
 				       u32 index)
 {
-	struct device_node *child;
 	struct imx1_pmx_func *func;
 	struct imx1_pin_group *grp;
 	int ret;
@@ -531,14 +530,12 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 	if (!func->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		func->groups[i] = child->name;
 		grp = &info->groups[grp_index++];
 		ret = imx1_pinctrl_parse_groups(child, grp, info, i++);
-		if (ret == -ENOMEM) {
-			of_node_put(child);
+		if (ret == -ENOMEM)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -548,7 +545,6 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 		struct imx1_pinctrl *pctl, struct imx1_pinctrl_soc_info *info)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	int ret;
 	u32 nfuncs = 0;
 	u32 ngroups = 0;
@@ -557,7 +553,7 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		++nfuncs;
 		ngroups += of_get_child_count(child);
 	}
@@ -579,12 +575,10 @@ static int imx1_pinctrl_parse_dt(struct platform_device *pdev,
 	if (!info->functions || !info->groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		ret = imx1_pinctrl_parse_functions(child, info, ifunc++);
-		if (ret == -ENOMEM) {
-			of_node_put(child);
+		if (ret == -ENOMEM)
 			return -ENOMEM;
-		}
 	}
 
 	return 0;
diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 4813a9e16cb3..edb242d30609 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -490,16 +490,14 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 	/* Get groups for each function */
 	idxf = 0;
 	fn = fnull;
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (is_mxs_gpio(child))
 			continue;
 		if (of_property_read_u32(child, "reg", &val)) {
 			ret = mxs_pinctrl_parse_group(pdev, child,
 						      idxg++, NULL);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				return ret;
-			}
 			continue;
 		}
 
@@ -509,19 +507,15 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 						 f->ngroups,
 						 sizeof(*f->groups),
 						 GFP_KERNEL);
-			if (!f->groups) {
-				of_node_put(child);
+			if (!f->groups)
 				return -ENOMEM;
-			}
 			fn = child->name;
 			i = 0;
 		}
 		ret = mxs_pinctrl_parse_group(pdev, child, idxg++,
 					      &f->groups[i++]);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
-- 
2.37.1


