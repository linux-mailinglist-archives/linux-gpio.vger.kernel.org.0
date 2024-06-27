Return-Path: <linux-gpio+bounces-7751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDC91A767
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 15:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72CE3282370
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 13:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0311A187342;
	Thu, 27 Jun 2024 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gc7udDbG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7818FC7E;
	Thu, 27 Jun 2024 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493719; cv=fail; b=LoId+b320f8zfGBu3UNmkfuUBqb//AgHqZeMPGHbzoSynKY6OWbWV7CnKD3A0m3qg6j9kGVNZZJNZZcg3e2XGX1WFXUtjIje2aqxo8DpJrCn5IaZzdaVBfCWazJHCpKa3wUmZVWPzLQ+r8fFOmM0vBj7tNhgzj3iofa4FuNVYrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493719; c=relaxed/simple;
	bh=ucnk2lZEAD5gWnQd1rO5+ZsZzkIQwZgMlLuFm7vviys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GOq6kPDTmexhdgJaD0W4TNW290P24JvfDqKSauw5lZ8ypCBZAF+j7XJ8BOFiynTEbrs5cd2+hTB272fStW0wOYWFCiLg8R7SjirsEBtoylOx8T8lOPf1ylWo1La9OTo4Hcu6grrHELGTby2/Tw0BS9Atd52gjLftc5Z8//DR0Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gc7udDbG; arc=fail smtp.client-ip=40.107.21.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnlCr9ChYlI6kQUeaHoKn03fYNXeZ5oG6gsM+f2ZJtIi0U5SKzjJWjchyH6GsoJo1rmo41Z2Pb1H4uNq04tPGjnTS4RLH3c/h2pWY+0s4KID4RIAUwYf/TSY97/nJMkIP2LHruBuanhFlz+N7vMkbQr6zfJ8QOFzi08wchy+yDsK0Xynh0TJ8bXU5U8Ni7F2+muG0Ofh08eieSLADmiQ53RDZK15HDAxykDEEtOQJhx7NR2k2ViFWrQ1KFYevzeNuFB9rIiBZOYfMT18SEeRR1hNZ24TJ5tyb0pXf38tL8YT+9dTK7jTptDcmONwFgn6KPyFCAAnvhYAc7dz6DzoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEPjkbtopGPCqQGVhbKL63hX74x+Yp7vh2Xl01udzas=;
 b=IQdhUbfxcndDG86+Il3DjE4MPqvOKXHMioYPgU0naDG9d5bZQhnS2FXiV+MJvuMNVOzYYaiiKp9/+RMB14RcFzuJjykUyVx05ZS9GKoomkyROnq+Ih5ZZlKKOmRFhnY8yFbb0fWcEK1oypcrrwbheVmh9S6b8tYspk002X+HFOfAXnDChvJj1k4cpu1FpDb9lNty1a85/J1F7V/j8bi6SgGAvmSWFgLLuRI6FPXc4+kAKcWYJBhq4ncbELL/wgUr0zN1b13ps2+WO7mQ8RZmjCGcKS+SkfBGAmYmkvl9mXRNwqAue1JVoibfM8TrvNyM+byaQkgx14JEAq7D3PQdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEPjkbtopGPCqQGVhbKL63hX74x+Yp7vh2Xl01udzas=;
 b=gc7udDbGhVucaJ+HkzEWnBzexEGdBweL4RBRJ0oM2MD8UGYAHoxTCbGQ9TEbNFc6oTNZRWxDHElUIJCwcGqV6J25z9QWKt6cz7kA8rEDS3l+tULhzxfCqtV+zKJ5vDlnK5DzHC/diD71B5GL+4LmgUuhL498JH8rhcjCaVNqRes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 13:08:33 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 13:08:31 +0000
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
Subject: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based of_node_put() cleanups
Date: Thu, 27 Jun 2024 21:17:19 +0800
Message-Id: <20240627131721.678727-2-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 83d0d0ca-de72-4d2a-58db-08dc96aa3e0e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jnDrPcxcWOVkairHXrW/WUQj/4Hfm9NYOzmQzOXL3TLWqoBp0Nkn75AByagV?=
 =?us-ascii?Q?8P6rJn9GukkV2BIgbJ2o15hWChnbgn2SyhcC44H7dhZ5TYMGcCohhNfpf9e4?=
 =?us-ascii?Q?WX1ufeMenAa0Re8GUhu6I70AbFuAPYr/NLBYGKYmpPNq6Goh6QLnrTpa2YrH?=
 =?us-ascii?Q?d8M+puKP95zlgxJl9Gwg9xPySIf0zsFnc5BilW/A7J+7OHL2EoDDyDt7XGGH?=
 =?us-ascii?Q?hEiKVfqJoJqNqn4uE1Dbin2k3oU7XPhPQYDj7D2FzujDjGT+apyXLg0PYDrV?=
 =?us-ascii?Q?5zClILeZsMfmxUxL62FMv7XAaiDRvmZbP8mHy0WxYlB2DO4lCYqeARji2QeX?=
 =?us-ascii?Q?yY+dArEeMpz1j8v3ji9nZOIeuPspWqU1JsJu3gmnLOtVmD9368+5flL1F/Pl?=
 =?us-ascii?Q?3ciRQ/djDfxasHJ/fhkzWv+XrE8LM+Xxpeihgj3yRuWfFVq3ANLrRlj/7nue?=
 =?us-ascii?Q?fzbqYZSnvKXH2SvtsNF1534sBBpplFhdTtwbA+D1XqKq5his9ODMyBseW9SN?=
 =?us-ascii?Q?AWj5NOucrzjotNBr7Ipcm4FqRP2m+O//q1w1lP9Iwt1E10rOT7IBtQuhhZRA?=
 =?us-ascii?Q?0f3MOGUokimNM/wkTbixIOe9o1rjjoiNKA3792P5YAsaC+9Gm5hH+DF9pD29?=
 =?us-ascii?Q?8MP/mOyiBUATgXCTxnbgpUC+POeIwrDpcjoDSJmkTIAJpfPvSd+EyyFgLx3J?=
 =?us-ascii?Q?XWRGFW2uZ3Hw9SydOtIJ8B12w5QcqCtB34i3XLiJyUNP3oztFsA8onYs28LY?=
 =?us-ascii?Q?W4yXPSHc/bWPMHC6EkIdVF6F7KCUk2XhVTS8sjL5Rtyl0UuWylvMVdvmHTwh?=
 =?us-ascii?Q?9G5vPGALz5fvqSG7N0uFhOpYnPWtbeVlaSlBoI6FMqQ6U2htWCAFQfvpxQOw?=
 =?us-ascii?Q?qziXdkiq5lvXu13luh2MZbLy9odkEnGfEiBYA23foD1Ni1xDMQaK+da57DJ3?=
 =?us-ascii?Q?IEUZo7itsHlIeh5drgiKimZ4/pCtoNKjhCKwrZ6SEzS6g0Wbjmms5U7x7vRX?=
 =?us-ascii?Q?uU/YB2dsFW7RU9gSZ7crWz80545mPTw03OWqktVMX3kX3D/2TJxHHrW7KNIe?=
 =?us-ascii?Q?sIy1+NZTCkmN6MH1BkVScOnN5G5CT6neQaONbIxLU/AoxJ4me3XusHSNSe0+?=
 =?us-ascii?Q?fkEztIw9fUgA/NjKaOqPjGrTyg2HDaR4gjEqZmChklXEAGOGiaOqv4NPEfVU?=
 =?us-ascii?Q?z8mUq5mDCigVCMveX5ebOUdrZC0HdmHhWpIR5C3bWUQoMMPj0sERvJzS1PxX?=
 =?us-ascii?Q?WxUE7bDS6umVqk4H/V+oIRSUD+FmGwttGD1GdduxrCXXPMsiiOW42x5ufEjK?=
 =?us-ascii?Q?2hN+ESzyFPhhkg5hY+ic5zbqlzWZCz3AvAqMm8O+3SYgacan/kwuOttt69TY?=
 =?us-ascii?Q?QgYsHgz0F+VxnulLvRdB3Zt5MZsZAjLoVWWVKFim8YItvNg66g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wMeS6pSoLvaU1Uon4luVGn7R3jkU9C0FPqE/nO/w+pCjnvuRT53UhTAqZFTw?=
 =?us-ascii?Q?gx3bkMImSm0efyniXI9EYckSYBIVYQexKnpPewfyl1eUySeiwaYkkl/I8VYX?=
 =?us-ascii?Q?cOXQIAgXIplfyDWOOlniAiWK1soxOIF//bBIzFpQrZU012YNwP+IjZ5cDt7m?=
 =?us-ascii?Q?mTZnluLeA6/+mIjuv0j5Jn6WQ+cJVUObDjRJPqejL3D4Q3nwUMXUAeosZclG?=
 =?us-ascii?Q?6ub79p/OYHK98LHd+3NSBeTJsXFz1YrXXeJgyXJIcHYxHGM0VaDt8ftqpt3H?=
 =?us-ascii?Q?HicrmlvHErG4Bu3oHooGl070u9QcwOybyFBxDt2sVC1cF8xJnd80Qk630jig?=
 =?us-ascii?Q?LG6yqbz8QWBvC5HJQTdxLoBWN2o4g/Nzr/RCB2I8IZKQm61jClltdViZmTaf?=
 =?us-ascii?Q?NWZ+Z6IDECKk8ZyOZ0sy0+dJKtOv0v4STk4EEGtm9du2vCGFpS/418dv/0D8?=
 =?us-ascii?Q?pmhnXmtorqMtEhLqxYRaYBSXDCsNTtsPDs6PEgFbMiOiLhaaPsFO6dwIrUCf?=
 =?us-ascii?Q?HpQk7iStnc1r0RLLTjUqEXtW0/FK3Z7xoY26kxkNg1UA4cksXnfckbRWPaiP?=
 =?us-ascii?Q?lmpJVBEua3yLNvdJa0qEZ+i1WrruUnGrM20VPvXuRQoW+WsiYkhvQdqQ3/iS?=
 =?us-ascii?Q?UIEEpCKViUZ1+tu8vhgzFa+umAVZL6ttjAPr4Jpg+jxB1ujhb/1t5ReKzMp+?=
 =?us-ascii?Q?FOwyR/BCpNQscD8177E2Bcox8mxvGZ8XV1cbBZ4fkjF4nXMxUo4+VCrPYVO5?=
 =?us-ascii?Q?kRzO6i7El9Q6B2LvXeK5QYp0rvXkPYcKAVaPLmqASq54wUUgfNr5sTL8yfC9?=
 =?us-ascii?Q?pkpTQDkg4P1WyCNhJxxHHy9MxdupZ3OIuhjPSxHDv05lRSpfJvPNLHcdGuMS?=
 =?us-ascii?Q?fP+aU+1KcvacIbe/EMj0lnsLkn2+97/Zbv/Q69QmdprVrpk499jiTpelinX/?=
 =?us-ascii?Q?0BlRo8nnZpBhlmB3TmzlSiSwUc+pjlmSXhXIqtHBO8/GOyjqSqDbQIgOHGfu?=
 =?us-ascii?Q?T+bXAiPkIUx9pf0eYyR0vgmE0tV9RiEBKqH3M2nMbOyfk9/aGG/URInueYIV?=
 =?us-ascii?Q?Pf6evunq2khi72ccfdxVpm1wMc56drQc96cf5nBpNkpzA8CQ4ls9KK9jy4uO?=
 =?us-ascii?Q?hfI7ahfx+XQpJJsfopgx1+ERtoQsKOd9r+2W3qWC7yNUYp6Yv+AUIjkPgmkN?=
 =?us-ascii?Q?oq1i7rXsjmLw0zmn9GGa9o4i/2ddOzv+N/mMduhvqTsz6jD1KuQSQjCXUOMW?=
 =?us-ascii?Q?kizGiZvy4UO5P8OvBm/7YEAiKiMLHZDeUb/NEgMCI1VwuKEqpRD+YYxBHw+Y?=
 =?us-ascii?Q?4J88yiVcCVwLhTR/TT6ceR2UFxd9lo2GllfZtrB48ltnMx/WWWF0qt05sRrc?=
 =?us-ascii?Q?mZCjfAvZDTUScd7VbXAy+mdNJrG58m85TMJ5QqmEMZY1UNcXxuQS9xgsTc3l?=
 =?us-ascii?Q?tDvoyDANijdjQ+gkgtBeuFpKkaYOTfAMNJk6XkxsGqgTjfzNYi6S3a48kPwt?=
 =?us-ascii?Q?yE4b5+EKQxLkt7tvtodHI6knP93y9GtfHbGjW2lrxOFZ4gfYBVhDBbldI9OC?=
 =?us-ascii?Q?vLHApEHDlo0OwNPAbgVYAaeKwIu4sFApSpwTw2EO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d0d0ca-de72-4d2a-58db-08dc96aa3e0e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 13:08:31.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2RT7p9iJhXzKkSfhn/SHUHqA/kQFMdviBF2L3EcfksBGqh3g7D6S1PworzeSzILZhp4H52HyB+kDYOD59NgJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 43 +++++++++----------------
 1 file changed, 15 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index ef9758638501..f5e5a23d2226 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -822,53 +822,48 @@ MODULE_DEVICE_TABLE(of, ti_iodelay_of_match);
 static int ti_iodelay_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = of_node_get(dev->of_node);
+	struct device_node *np __free(device_node) = of_node_get(dev->of_node);
 	struct resource *res;
 	struct ti_iodelay_device *iod;
-	int ret = 0;
+	int ret;
 
 	if (!np) {
-		ret = -EINVAL;
 		dev_err(dev, "No OF node\n");
-		goto exit_out;
+		return -EINVAL;
 	}
 
 	iod = devm_kzalloc(dev, sizeof(*iod), GFP_KERNEL);
-	if (!iod) {
-		ret = -ENOMEM;
-		goto exit_out;
-	}
+	if (!iod)
+		return -ENOMEM;
+
 	iod->dev = dev;
 	iod->reg_data = device_get_match_data(dev);
 	if (!iod->reg_data) {
-		ret = -EINVAL;
 		dev_err(dev, "No DATA match\n");
-		goto exit_out;
+		return -EINVAL;
 	}
 
 	/* So far We can assume there is only 1 bank of registers */
 	iod->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(iod->reg_base)) {
-		ret = PTR_ERR(iod->reg_base);
-		goto exit_out;
-	}
+	if (IS_ERR(iod->reg_base))
+		return PTR_ERR(iod->reg_base);
+
 	iod->phys_base = res->start;
 
 	iod->regmap = devm_regmap_init_mmio(dev, iod->reg_base,
 					    iod->reg_data->regmap_config);
 	if (IS_ERR(iod->regmap)) {
 		dev_err(dev, "Regmap MMIO init failed.\n");
-		ret = PTR_ERR(iod->regmap);
-		goto exit_out;
+		return PTR_ERR(iod->regmap);
 	}
 
 	ret = ti_iodelay_pinconf_init_dev(iod);
 	if (ret)
-		goto exit_out;
+		return ret;
 
 	ret = ti_iodelay_alloc_pins(dev, iod, res->start);
 	if (ret)
-		goto exit_out;
+		return ret;
 
 	iod->desc.pctlops = &ti_iodelay_pinctrl_ops;
 	/* no pinmux ops - we are pinconf */
@@ -879,20 +874,12 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 	ret = devm_pinctrl_register_and_init(dev, &iod->desc, iod, &iod->pctl);
 	if (ret) {
 		dev_err(dev, "Failed to register pinctrl\n");
-		goto exit_out;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, iod);
 
-	ret = pinctrl_enable(iod->pctl);
-	if (ret)
-		goto exit_out;
-
-	return 0;
-
-exit_out:
-	of_node_put(np);
-	return ret;
+	return pinctrl_enable(iod->pctl);
 }
 
 /**
-- 
2.37.1


