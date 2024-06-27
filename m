Return-Path: <linux-gpio+bounces-7752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3296491A769
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B192D1F22159
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 13:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B36C188CA3;
	Thu, 27 Jun 2024 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JOtETm4y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F131922EA;
	Thu, 27 Jun 2024 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493723; cv=fail; b=QUH1/Dy9wOHbDOLaJ9mk3BhGbymwEB77IRej7s0SaNIEklkK3Y8aBXKmjuj06QSiYrMXI9aWOcaKjT8j6yth/v916J/gehlk7lS4U/8dpEnyRIguJz6Uhp4EXTB4UNWJm5IteCcJkvpyGm6glS60glcWnZHkf+09HwXw2RvaO0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493723; c=relaxed/simple;
	bh=PEu5390W51O+dBL4pUKASiKHhOpoFDsy7jM2HmJJl88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hXKFaUURGEEMXdSW5V4U26iD1Fq7XmpESbr3ApgyM7+YMsOWTkl2A5IlhFYnJnSfOndWUWup2c1jgteKROyK/E2bRrEAlse5UcONsRO0UCMYgnIM57p1MCmEkiBWqulxFes8glwTrfwc9qwZbJL6uFfYiAH/DlyIcEjc1ObdXBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JOtETm4y; arc=fail smtp.client-ip=40.107.21.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3gwatTWrQacJ7ePPMrm4nKgeMUQCR+69Ix/XQGYzuVLSEFHHI+YTkXgdE+VWwWxKWa2wMmTvVQN8osmVonh11jVZCFpsfycyMD8HOLKSpJnos3mdbfhMmuJXZFFap4TRHfAV+R0QyHj979TtsusCcxGAy4cE9/Jrw5AatjP2T5J6GqjJthZPMoLRZtkdX46NcdCQ9l468v5Xco796e2Q5rmYog9fpdxo5BEys0IqPQ+pNYFbIzZMsgD2d5LRazJ4KC75/2nsQMkpLc6QZv/sWhqFVhUAsgWSoLtQTVF0vebgoPeGghJu5WXAGfG9Fn30jRYVd/OSW1gBGvXcZq6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXSa9726LU2iufWruhMP/0XPEMaP5HzAdhAb8N1XeGc=;
 b=k3ZdZdB3JZievtsF7LamWHE8EOLNO8oYyAP5fcDeyGpTRhnZLlLEqxJz8B3zOlOe+6Ei2TYs3kmMyPTuKyrAScs8ufgN002dNPBWzLOQhune6BVXs6dc1/sLTL8B5Z6NWNLd79gpovN5GGb7Zyd6j14uf0ph6N2z4Hv7iPfA7tc6zZqGHdNTUIGkatAU1wJ1HFmo92mHsfNS8zzqbRWptHarDPaVrEMQVIr89JH4jYkQchz3MleQOyuSnKfD9t8EoQzCLGVxwYHE8K6Vjcx3ubFMnbkmjeHHbfAzNg8BysQw7Na+osRDm9YdbAQAtjBcTOsrSuJSbgcA+5QFA5/jAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXSa9726LU2iufWruhMP/0XPEMaP5HzAdhAb8N1XeGc=;
 b=JOtETm4yN7SBTkW+z46E7yL2DzLBipMIYk9FSAcMF4Ma4s2QRm4Sh4/AEeRf36w7tNAAOO6g+gi8HP77wmcpBVswfWUsr1FcCzBvM5Wq8UlbWS9zA9Tj2Pn0u56Mlr1Z87Xm650E9A0uhBE4GomFF96uZECMMditKgt5e4g/S8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 13:08:35 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 13:08:35 +0000
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
Subject: [PATCH V3 2/3] pinctrl: equilibrium: Use scope based of_node_put() cleanups
Date: Thu, 27 Jun 2024 21:17:20 +0800
Message-Id: <20240627131721.678727-3-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4c0b3c4e-ba80-45c1-28c3-08dc96aa4083
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XCGU89Z34IW0aHUOxaUC3jKtedROroR57fUwNimbzmgcCJqBS+JODsD05gor?=
 =?us-ascii?Q?DH1q8Ecs06rgkoqhEY5XQnghq3rn3IkIOzRA187LeABQqUIGUunuzbLrQGhD?=
 =?us-ascii?Q?ysEYcS5yUNOKiClf0cw/6MtMqQ7zdI+nFF3lkb6yBohwONYD65VUj4Q49XS5?=
 =?us-ascii?Q?5kDP7/cmHbtzhRCS4Q/AZ+iEZuu1q+bQvrl+nRM8JzfsY8qtRu6PXaUR0Ha4?=
 =?us-ascii?Q?lZM0nQR9GhxKZXXv6ZCC6Y4sPHBrikdxaH8WL1wHTcdmWZiGaRhYtNFR17+W?=
 =?us-ascii?Q?fovanwG7mH5y4kn9pn6irLK1O/DQejEGuS0BF6y7zWtFsmyJxENupDFBATo9?=
 =?us-ascii?Q?Brh+eUsXC0n861s04wv9/u6L/czekEL1fmUFZvqA1IEO8dmjAuXxYhq7YD2r?=
 =?us-ascii?Q?yIO/Im8APC+HUeXZqTaDJQD1/SHLAptp7oz9yzaQQC2gnqynmD14yUsn0Zmy?=
 =?us-ascii?Q?qDMPJHZ0zoueV93atQQbgNF1nVc8snFkYQ7/CTFSqn6fYjb652zCgZPbf1QX?=
 =?us-ascii?Q?F9cFVCOL0XdUK8S3qni7mbW2MWM/a1L7AmRo25kPXSUVMxTXdK9c4HnIetW0?=
 =?us-ascii?Q?YTv2gZLKvP8eugSv9V1/ooEWGrZyQlELpL4Uz82SvUY5KZKIeOIhfHDjsGK9?=
 =?us-ascii?Q?KJcIMdiD17OvkP6/aVq1AD7Txr56jHGXCdKXEjkezhxUrWBuqJHztfp0wq3E?=
 =?us-ascii?Q?b5fl/G2eJEkK2YmcmEo5K4uZF9BFeayRI2CLTldDQ10RsSTtwOtj657XYPjp?=
 =?us-ascii?Q?//SiPOpcWZ45cUETN/QhMgufLF4VgAMnYhyZFdM++Yk66QAZQXON8NPzAfs+?=
 =?us-ascii?Q?PUdY4cyGHKXk/yLl09umV/XAGIx8HavNDQ1OtuZncRmF6daaKJ9AotMG/yyL?=
 =?us-ascii?Q?lRX+50QMjrBuFa/YRZZQn2BSjRM0Oxm4u09nHxk9jqUNv7Sv1WkIwNNUaoQL?=
 =?us-ascii?Q?EoECGVnNXoyMo6aKFH74xRjbnt9tU1Jn6QdLxYD6pTGc4I/58PIZn7f2LdPH?=
 =?us-ascii?Q?L2by9pL1ZSYWrTt69hJ3AibaccTSHaW/0+QDnYdOVQrFdW4x+SWlhRAHkBds?=
 =?us-ascii?Q?QeTvKeQmgOKUTgTwOzqDjqX6/A+o0R30x0X2TBkEvJjMzCSD8Plqdi89zggC?=
 =?us-ascii?Q?hv7K5MMnrnUN4X3RsMyF1VQPZGGHan21+8h1rgdY635751iGhHE6glywioML?=
 =?us-ascii?Q?rajVnB+zTXruiMv6Wa2vbSL/zA/xP3VIMhlazmvwq5QB0OO55pa2AxDXyJAC?=
 =?us-ascii?Q?+kDtmG4xJJ3rKEhD09gZvZJsSsmvOmQsdeooxArn6JJg2M6qRxvBl9mwhK5G?=
 =?us-ascii?Q?5Ly0cVb2L3nx1dAUSPtm5HdaqZll9fLe9bLL7poFVAx70icAqsid4nh9gPvd?=
 =?us-ascii?Q?M1oMkdJnwUiiUzZtZWQHVEV3XZuSwl2Dsdrb1uZGmV5LcLvwjw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LLSuCaQcBAKW084JQKjzWW/bmwVjdmdqhcopmiNBwFUzN3kVpBAA9sISdEaK?=
 =?us-ascii?Q?Lm2nBLX+/DyEJqQkApJuWdBFfj2gbWxCyYqVlaC4cjq2hPBBqJpj3AnIL/QP?=
 =?us-ascii?Q?A47bsXXQb6OowSvwfvcajxKiJThjV/OJpXNVleSTxUlNYawwi44s6k4UjTVv?=
 =?us-ascii?Q?ZOkTB9iLlFW+Q2dQ/DbBEpX+9Qz7/AgNcZZ40iX+d6ahAFMW9qzSRU6XtuyZ?=
 =?us-ascii?Q?uIQazSkMFuOmuE0W/Ybm+EUsecWt5h0xIdJ3g6CXVf0lczB0+wjaGUp5St4i?=
 =?us-ascii?Q?4HM/57V8XKC16sJgV2yvXqWMaFMdtESocfGnqVig4AQIjvrU6QfkzqzRSbDF?=
 =?us-ascii?Q?AYp+N6pDF2fUHvkpd8Q/rvKioHN+ndpMhhbEf5P8sFggKfFktG2GYC/K8Cp+?=
 =?us-ascii?Q?sgow4NrxVQwfP7X6gLkEBQoAZDfd2NbbLO7NBZrH4rJZq9hb5i+UIRViRntH?=
 =?us-ascii?Q?5uRCaO+UGXynMjGHjkrYS2l47MaWaRJ1vQSkYr1w0PVMoyfd/Cs8n3HoYRPN?=
 =?us-ascii?Q?yleMBFwGeYF31IClZ0SQBKrLn4/1m+NtMUZJteAdXESFYauh7rsZMZSXkcBJ?=
 =?us-ascii?Q?jeBZaQHps10bMmw7FGo3/yBTnQ4g6p6RaSe2PXSof5F/0LYk9rAMexIQbQWU?=
 =?us-ascii?Q?C6+rB2MzRk7wMNfHbcil5BoBDFhRUTx0g6Moq9daGBHPeWo3siEA+DquxsUl?=
 =?us-ascii?Q?7HAYA44/hSxMEV72tEvh3+uUFV3K1/x02nlQ6GxONz752OOE+J24M+8c7mPb?=
 =?us-ascii?Q?vkBkLVcDm5cY1eL/PvZho4OWiwHTZxeXnxOtd1J4Lu/CGwY9qFG4eeGGP4tJ?=
 =?us-ascii?Q?VRccET6/0wzjlVE/+agH5BWuxntEpZtsfDfzFKlsiIpHnVHwIqdsJ25WCdbF?=
 =?us-ascii?Q?DqLWyNFmBXzOlZfloXDwVeNq5VRwy//5wSvj+MrKvZAwehjgvGHXu0GrDjTJ?=
 =?us-ascii?Q?gnF49hAkpk/sdrM9H3Wcgf3/1BFaXtQOcVC8HkwEDALCBDkisLZq0SM+8M4q?=
 =?us-ascii?Q?Vash32AVblRL4bsTiXlrIIf5mkR7X/Vb+tz1VrwHD+FOZYa+IqBAdr9HOlMa?=
 =?us-ascii?Q?ipsU7JuiHZ02qcdGKetIdo8S9Lo+ezF34n2yuwsi3ChTU9L7NLBL/dzDzuX/?=
 =?us-ascii?Q?0AndfoduhLEickjdv1iYFXkpIHGxFtcg/h4t1IPFOnrRXpaonLNkdqcTC2yU?=
 =?us-ascii?Q?gT0vXlAfBkpUBL4MItNTBNAGjAeKw2PFtg0YcUyKR15SF1xtYwUJOJWQWV+7?=
 =?us-ascii?Q?Pp9iWG8AR9OsViOse6TGjvdjw83dFHv2BgARE3ZRso5Zwv+Aw0RuscV91z1b?=
 =?us-ascii?Q?FXEIg2HnqS7dMIdw/LtunFkCf6ejDxvBJIROfzis5VL8yhewydmhOedoPx3q?=
 =?us-ascii?Q?Ce7cD13S22YtKe4ej7PGgGAzpLYwrjUyLUZtTvuDTbYBaAqmySl6pJzyDft2?=
 =?us-ascii?Q?59GvEA25pnEW+yFih/XoJo7RgWo9FY9syuFeHPHb9ywqyz+yjtHibo2k+ucG?=
 =?us-ascii?Q?2TWZacCrVMqgfBss1w3S90WEyZvaVEmO8pKqf9GHFpN/B5z2GtWShEkq2Isu?=
 =?us-ascii?Q?3NkgfK0biuqKbnZ3rkB4xfjt3WYzhbq1wmXxy836?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0b3c4e-ba80-45c1-28c3-08dc96aa4083
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:08:35.2484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9RNPTLo/U2Z+T2sk0unfJKLZ1Ykwc43K0WwVJCXdfVNlSwKG9s7Bei1aZTLHULke2L8mYGnkl7WPfR3yqIkLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index a6d089eaaae5..3a9a0f059090 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -588,7 +588,6 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 		       unsigned int *nr_funcs, funcs_util_ops op)
 {
 	struct device_node *node = dev->of_node;
-	struct device_node *np;
 	struct property *prop;
 	const char *fn_name;
 	const char **groups;
@@ -596,7 +595,7 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 	int i, j;
 
 	i = 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		prop = of_find_property(np, "groups", NULL);
 		if (!prop)
 			continue;
@@ -635,7 +634,6 @@ static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 			break;
 
 		default:
-			of_node_put(np);
 			return -EINVAL;
 		}
 		i++;
@@ -708,11 +706,10 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 	struct device_node *node = dev->of_node;
 	unsigned int *pins, *pinmux, pin_id, pinmux_id;
 	struct pingroup group, *grp = &group;
-	struct device_node *np;
 	struct property *prop;
 	int j, err;
 
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		prop = of_find_property(np, "groups", NULL);
 		if (!prop)
 			continue;
@@ -720,42 +717,35 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 		err = of_property_count_u32_elems(np, "pins");
 		if (err < 0) {
 			dev_err(dev, "No pins in the group: %s\n", prop->name);
-			of_node_put(np);
 			return err;
 		}
 		grp->npins = err;
 		grp->name = prop->value;
 		pins = devm_kcalloc(dev, grp->npins, sizeof(*pins), GFP_KERNEL);
-		if (!pins) {
-			of_node_put(np);
+		if (!pins)
 			return -ENOMEM;
-		}
+
 		grp->pins = pins;
 
 		pinmux = devm_kcalloc(dev, grp->npins, sizeof(*pinmux), GFP_KERNEL);
-		if (!pinmux) {
-			of_node_put(np);
+		if (!pinmux)
 			return -ENOMEM;
-		}
 
 		for (j = 0; j < grp->npins; j++) {
 			if (of_property_read_u32_index(np, "pins", j, &pin_id)) {
 				dev_err(dev, "Group %s: Read intel pins id failed\n",
 					grp->name);
-				of_node_put(np);
 				return -EINVAL;
 			}
 			if (pin_id >= drvdata->pctl_desc.npins) {
 				dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
 					grp->name, j, pin_id);
-				of_node_put(np);
 				return -EINVAL;
 			}
 			pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
 					grp->name);
-				of_node_put(np);
 				return -EINVAL;
 			}
 			pinmux[j] = pinmux_id;
@@ -766,7 +756,6 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 						pinmux);
 		if (err < 0) {
 			dev_err(dev, "Failed to register group %s\n", grp->name);
-			of_node_put(np);
 			return err;
 		}
 		memset(&group, 0, sizeof(group));
-- 
2.37.1


