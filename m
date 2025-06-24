Return-Path: <linux-gpio+bounces-22036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA946AE5BC3
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 07:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2761B63A49
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jun 2025 05:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141CF227581;
	Tue, 24 Jun 2025 05:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mux+Xq19"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1097A35946;
	Tue, 24 Jun 2025 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750741879; cv=fail; b=YoVTHqFPYIEvO9MRYyZbQ3sReXeSBySOxde5ZszhME7ZAFSmw7/51rukW8VL544pmE2nAp5UZb5vIhSdJlx5AD3RUSfkbSSx4C6kYEHebXHNH/cuk4JyGqi+hs1nStc9dBRCODuz7/A3FmQ2xLab/hqN60KeGIco/NOLReo3+8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750741879; c=relaxed/simple;
	bh=p/Nhi1MlPXMAYAY4g6MW06EhRVPWxj3sMO0mlzemhVg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=M0OuUCrVgeW1Cj5EO5D4i/Ksy5sPNnKUCv7yEGR7CQ/2lXcsGoGSYTgFZH8/muwpJcG2cJ8qUArHDwKmgJXffMl0O+tq3m0JeOWKEfAhWheSS2RhHp28+TLBW1QN8p9mfNso7VAfS+/fsHs0Py9Ge7xgeibsQX5jHtBNGhjH0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mux+Xq19; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR1U9MpIgMGIReDxUYWdieQQlSiUKJYJ6syELqpZ+eBZ+YJwDTbjvJqtMQvODvoRxKil5nAJZe7rf7nZbbola9zcMrelrEOeD4Zb7IEdOoT4DFsZ8WTIFmzB/Cj/Epk/QBfBiWlLiEjUuB0U2khcBYCHZ4vlZ/vhARm1agOgHE5WgaUYskqa5y5WFkviyZWCRTlD0RHnhKtZEmAeiRReI8dI8K0t4XLItXa1eKu4Ekay8AvVPMUCcm4dlFzPSJL3mGbmEDbSlfxd+MUER7Haz4S5cABSM/hLGOfIIFsVdXqgOxv3nVSzPdH55T1CHUJ4UiUVlwTpmwk/XM02SbcTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyHDCXMvT4DIHHymJQ6141qT/O7DHdhn8+0R4Wq/B8o=;
 b=Za9lMKX/3UCA1sCz4TFbZU6g/YJ2d1pFL4mV05TWJkb2Bq1HXHGTPZvLtzxntSV9FMZRoeyqUbO3KRlGZQq9vARYFAihWlpYOcmPEtfn4xsRkihYIeVVgEdpoaMCT5xNxlL/SaQx5Z/Aq3bYIcC8txYWhWoBHSpw+0us3vW0Zr3hnYaJ2q00g2nhrcK30zP3OQ1NUtz3LQOPzi0Si2Sul8vU9adM8GkDtkL8CLOThQxlvId9m/gy9RFdg7X7/pvBa1XlkcSHXxqlEfKk69e4oN4+qY20M+GXvWhtwiydhwxQJ4oND9nezwTvBBfe8x5UaiaVVZFuQUn+dO/Ub0Gy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyHDCXMvT4DIHHymJQ6141qT/O7DHdhn8+0R4Wq/B8o=;
 b=mux+Xq19FM9OXvOYN+J/te/tDUAPXW5+0kWe3sUrp9QwR7xB+1deyGxjUQOpaleHwcqy7esab49XQMfy+v8s5d9d5LJjDgp452Y719udJyaxKRXzjuf7xkfBsxkzPJZicwT3vSfZZE3vQNrE/dNAw+AntC+gTLR03mGJuCeymF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB15007.jpnprd01.prod.outlook.com
 (2603:1096:604:39a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 05:11:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 05:11:14 +0000
Message-ID: <87cyatrafh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] pinctrl: renesas: sort Renesas Kconfig configs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecv9ragd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jun 2025 05:11:14 +0000
X-ClientProxiedBy: TY4P286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB15007:EE_
X-MS-Office365-Filtering-Correlation-Id: 6626c0c9-6e1b-48b5-1741-08ddb2dd8b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jtMpKa2olxaPPyePFJpsFHX+f5I9lG/OcSgGdyVLG978OuAhQb/yy1jfE9Py?=
 =?us-ascii?Q?ywo0YuCJIAEpERz21iarIJhSwrM9mfBdH6xTZt05uAOQbtFxnH/X+ZWZY6VO?=
 =?us-ascii?Q?LjjI/ApmQB92SVrM0OqqYVmKBOIb5nJqolrGsDs8f/lhtTQS+71QQPdPWUPo?=
 =?us-ascii?Q?x9ICyTlUXjPIhyb8YS7G9XFFtBTVt+ZHGKSR3ubAKrBbLs+iJcHzs0ihkBPb?=
 =?us-ascii?Q?UpOzfm3htZwnHH+o7en/g0ChRv2ZxMEGFAbVBEv30hT5yO8LGrJUDna1HjAu?=
 =?us-ascii?Q?s7uIegvbZUgwoEAIqAWFkimAbrdsNPa5Iuod3b5WQ12Nw4XD1eRlyKxZsOpY?=
 =?us-ascii?Q?CR9r4aoBHJ+7O42yE4xW9DG6SGxTQnjnR6On43rRCRNBxkTtCNtWIz4JBKYG?=
 =?us-ascii?Q?W+TOdf6i+Rci6FEGGmdki5BwXJUFueMz1m/Z7FuZfqFOOWlyKt7SBTX3fXHb?=
 =?us-ascii?Q?Zx3eYrLtDMVVhxzbyk5KBstlXWjc7ed8FXje9TihBNOU3425WrT04st78BbN?=
 =?us-ascii?Q?hgHKeuZcqXowl11O8N/ai0J8hci/f6cg/HN5jIlhLjj96Jlui/FTVlldndA3?=
 =?us-ascii?Q?BMAE5rpyL937/QsK6RBgBjnBMhEr6UQrEAF3Nq/7GjD+gW5zwL4VQyUc5q5H?=
 =?us-ascii?Q?AtQbasIcZO+1ziwBkA6sZxY2GoSrsq4B2Kx1NGsy2zShLfKmqgmSGUDmFaEu?=
 =?us-ascii?Q?jHLTfJsZwC6R4PllS6rR3ZwyhFd2g5p7t3INydqhaxOM7V436uRKt7g5nZ/g?=
 =?us-ascii?Q?0Q/ShM9dbD8QGD4Yb1P78xa/TkFjbvdRN3108cYtAEUoS9LELDJm0lP9w0Tw?=
 =?us-ascii?Q?w/ck4iYEvviqvIrlDsb/L6fRwHf6QkMEK2ZL9TrTf7QZcn6Io5f8fXMOINmn?=
 =?us-ascii?Q?oY5cWuGG/6xTttJYgiWQaeBFLyy5lvvYIjvkBzS7qjiZD0+eIirwGyj/Exbn?=
 =?us-ascii?Q?QosRmx4Qt9s/EH7PpMlFJ9MR3GaqO1LMoGovO6exgTLu4bJVuUv+7Mrs8S75?=
 =?us-ascii?Q?1TLDHhWxF2C41zqeKmctGi0UN0SPKoXaPSQ/gFoIvRLPQqmpwBJsa55dB75u?=
 =?us-ascii?Q?FguVtXBf/9Ybyaold5QATTPxpQFb6t6qzcTIUAODmrx/WsqZFINg/4tJef5x?=
 =?us-ascii?Q?bpKUviFYo8aLVaMA+4g49SaWlx6mrtBEGJW8BqyYPFNbrbWBhxXXzWjx7FTC?=
 =?us-ascii?Q?6PpO0r3RtngUnKpLHDsWyLejLbw6TMirjibOZCNDrEMFqnBXGj4w02yrPvsV?=
 =?us-ascii?Q?srPhzLtvOFM/g4vHrbPAV1jm74dZeTcCDiMQiUr4Jkjyd88BksLSpBXBDeK4?=
 =?us-ascii?Q?vhC1uPdpXsFfaDv+RWQglH4xmxMZWOsiJLTFe/8dPvf31ULvRbXetluyJhiJ?=
 =?us-ascii?Q?DZDBZUKJkVoIXWAIUA9QCcTOGtaSOWWEf1K36I7Eg62A6lkZmy5YClVWHRVX?=
 =?us-ascii?Q?N6CKn8g7pfIV658xlUlS5PcdTEUQkECnisaIWWV2mSUe9lV3y1/xlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+a/u8gHO/oV/g8sQGaUXQ/QULcR5CX+vJLrmxD3vsElK2wie6FwrcZCLkq8j?=
 =?us-ascii?Q?1tNxV416phjQZk59gN9UFvn6Tp6nCPmShKJDCUfDGniuFmjo0M7jKib+q5ou?=
 =?us-ascii?Q?RdcbBik+wfdC6UNTpD2200yEjm4n+1J1c2cZL4bsF8gFb7ORrN+0FEQmEPPs?=
 =?us-ascii?Q?tydIWFkA1m2m6rbds1681SFq+hICA76QDUkz0C4sHGgkHxc7E7ma3nupEk5v?=
 =?us-ascii?Q?qXpZrQtM8paFmYvTXNkXexU+gq3vKaRZCU9Si4JyKqP6ywXwanuiOmYiNmVg?=
 =?us-ascii?Q?e8FHPLfCl2NjBkUcB5nCrGeUoCUz0iETXSZr7HmoQNTZBPSQ2Lo7K6BSbCOk?=
 =?us-ascii?Q?5I3C3PElPeWNGctpjYT4hl8f/VxkjfWbNpzvR1NFtrIPY5JqzErOX6XSyB5w?=
 =?us-ascii?Q?xn4Gw/cYXLlvCnfSMsYhQQ6n5zW88t5Hwr8vcPnjN+gUVeBqlcvb5F08JGOX?=
 =?us-ascii?Q?FO7OdQzWz5/DqnizfyMXKpajB6G+xTJbJOzSVItvqkDlxbTA091rI+OqYQya?=
 =?us-ascii?Q?NQ2WL+IrDtkPf1MFGi6fozcZdxbzYfZnAeckAPt4Rsp63kXP1d0RXJbU8VAw?=
 =?us-ascii?Q?mp7CCFwqO5CKcvji5CZvsq1aKElidsZTmgZljeqzuav8/NWWHKKOYgEe+Y4z?=
 =?us-ascii?Q?Wany9N5vYplGfDYwrAWrcktTzndfJcPVehtYDPug4B88ZVnZPBsTtsLDeZTP?=
 =?us-ascii?Q?ReSz2h7tSzmyYDkzlPB+efaW4bG+ac5Gj0DPkKZ6CkKzI5BD+7JxFLhG8g/4?=
 =?us-ascii?Q?EP0eY7iJlSTfQ6NRS/Vrdbu7T+mtdZQS2OY1Gr0RzZpsS7XpUAsYiXMGbaqK?=
 =?us-ascii?Q?m2pcBb4+i7GRiLB7zhCCOP6XDeGcYIUp9CNNA9r1cTD2LAm5gHx0STWlhfFJ?=
 =?us-ascii?Q?ggateEJ2rkvqRfWcEHuOrksabqeet2OI7YWmigUHwwtX9L+VBlV9YPpL1H9M?=
 =?us-ascii?Q?4+V7KdYDLMTYtHKBTtz3Yk7G8x8Iv0pK3eUSMQngyIO2qbkSojpr1cdJpEq0?=
 =?us-ascii?Q?sJ0W1AjcM6Jkv9nk1oCI900oxp9nP/Rw/v+6DaLQ6UjzRqmISlbowAUlm+ok?=
 =?us-ascii?Q?jSZyolhDCEQsSqRj54BToxf8IH6onp8GJvHSjaVwHVXPBaelglQ+jJR7wcIn?=
 =?us-ascii?Q?5M78ewcKl463OnA1kAKLY/BaxOR/ySAxAfLL/HWDUpSIpKPfmpU/IrBgLFDg?=
 =?us-ascii?Q?L/hqE9aArevPcMqAbg40vKJXFSDrVOHKebjTZiZj5wkhv164mbMiovSEfJPA?=
 =?us-ascii?Q?6g+DtCrpFQlytkyOw+cuARH2fcZatcv3oLAKBBKCT0C1H8JBcseGT1DiQrhT?=
 =?us-ascii?Q?PfwcNcHjV/aF4Nec9mpbhjV5TqlEKNGAQf/Z3zpDfBoe+7WQZkSZ8ssuFQ/C?=
 =?us-ascii?Q?cd5diOEW6gTpHZdhPVyuAIKi2F4GpKFVQghnpPVUCM/Q6LHN0M0UwGas7t9M?=
 =?us-ascii?Q?Xxc/BMubUQAraAx7wdODpabEuiVjqE1NjEoWvtWjSe0BwWgbX7zubdhw1c6j?=
 =?us-ascii?Q?pqVUfZTEP9dISiW4r2VLKVmNHeOCbRz+YsfTpj9kLbmnfgidkEbd/aItyiZy?=
 =?us-ascii?Q?n2cU4+Z5UR0N7YGvt0+KV1Mlzj1/n/L3hh/UPOAsLU6Xvb+OSQq3uZ7EwP1J?=
 =?us-ascii?Q?hIDE3xS8ePtu51sUSFlOk7o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6626c0c9-6e1b-48b5-1741-08ddb2dd8b15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 05:11:14.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXJ2QsLsQ7o5VLbQLSMjZBJSs3FnMqPXU7Bo5AtZDNz+P1tmVaFX/izfHVYsOL8FerTpEZB3PUGkyJY5QglgPmxv79jGZNfpWLon6cSdDD9g4WWEZn0XBXYQi6ELxTmL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15007

Current Renesas Kconfig is randomly arranged. Let's sort it by
alphabetical/number order, same as Makefile.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/Kconfig | 228 ++++++++++++++++----------------
 1 file changed, 114 insertions(+), 114 deletions(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index e16034fc1bbf..5a30134edd54 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -86,16 +86,52 @@ config PINCTRL_PFC_EMEV2
 	bool "pin control support for Emma Mobile EV2" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A77995
-	bool "pin control support for R-Car D3" if COMPILE_TEST
+config PINCTRL_PFC_R8A73A4
+	bool "pin control support for R-Mobile APE6" if COMPILE_TEST
+	select PINCTRL_SH_PFC_GPIO
+
+config PINCTRL_PFC_R8A7740
+	bool "pin control support for R-Mobile A1" if COMPILE_TEST
+	select PINCTRL_SH_PFC_GPIO
+
+config PINCTRL_PFC_R8A7742
+	bool "pin control support for RZ/G1H" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A7794
-	bool "pin control support for R-Car E2" if COMPILE_TEST
+config PINCTRL_PFC_R8A7743
+	bool "pin control support for RZ/G1M" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A77990
-	bool "pin control support for R-Car E3" if COMPILE_TEST
+config PINCTRL_PFC_R8A7744
+	bool "pin control support for RZ/G1N" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A7745
+	bool "pin control support for RZ/G1E" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A77470
+	bool "pin control support for RZ/G1C" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A774A1
+	bool "pin control support for RZ/G2M" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A774B1
+	bool "pin control support for RZ/G2N" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A774C0
+	bool "pin control support for RZ/G2E" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A774E1
+	bool "pin control support for RZ/G2H" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A7778
+	bool "pin control support for R-Car M1A" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7779
@@ -106,24 +142,24 @@ config PINCTRL_PFC_R8A7790
 	bool "pin control support for R-Car H2" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A77951
-	bool "pin control support for R-Car H3 ES2.0+" if COMPILE_TEST
+config PINCTRL_PFC_R8A7791
+	bool "pin control support for R-Car M2-W" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A7778
-	bool "pin control support for R-Car M1A" if COMPILE_TEST
+config PINCTRL_PFC_R8A7792
+	bool "pin control support for R-Car V2H" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A7793
 	bool "pin control support for R-Car M2-N" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A7791
-	bool "pin control support for R-Car M2-W" if COMPILE_TEST
+config PINCTRL_PFC_R8A7794
+	bool "pin control support for R-Car E2" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A77965
-	bool "pin control support for R-Car M3-N" if COMPILE_TEST
+config PINCTRL_PFC_R8A77951
+	bool "pin control support for R-Car H3 ES2.0+" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77960
@@ -134,26 +170,34 @@ config PINCTRL_PFC_R8A77961
 	bool "pin control support for R-Car M3-W+" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A779F0
-	bool "pin control support for R-Car S4-8" if COMPILE_TEST
+config PINCTRL_PFC_R8A77965
+	bool "pin control support for R-Car M3-N" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A7792
-	bool "pin control support for R-Car V2H" if COMPILE_TEST
+config PINCTRL_PFC_R8A77970
+	bool "pin control support for R-Car V3M" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A77980
 	bool "pin control support for R-Car V3H" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A77970
-	bool "pin control support for R-Car V3M" if COMPILE_TEST
+config PINCTRL_PFC_R8A77990
+	bool "pin control support for R-Car E3" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
+config PINCTRL_PFC_R8A77995
+	bool "pin control support for R-Car D3" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
 config PINCTRL_PFC_R8A779A0
 	bool "pin control support for R-Car V3U" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
+config PINCTRL_PFC_R8A779F0
+	bool "pin control support for R-Car S4-8" if COMPILE_TEST
+	select PINCTRL_SH_PFC
+
 config PINCTRL_PFC_R8A779G0
 	bool "pin control support for R-Car V4H" if COMPILE_TEST
 	select PINCTRL_SH_PFC
@@ -162,13 +206,58 @@ config PINCTRL_PFC_R8A779H0
 	bool "pin control support for R-Car V4M" if COMPILE_TEST
 	select PINCTRL_SH_PFC
 
-config PINCTRL_PFC_R8A7740
-	bool "pin control support for R-Mobile A1" if COMPILE_TEST
-	select PINCTRL_SH_PFC_GPIO
+config PINCTRL_PFC_SH7203
+	bool "pin control support for SH7203" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
 
-config PINCTRL_PFC_R8A73A4
-	bool "pin control support for R-Mobile APE6" if COMPILE_TEST
+config PINCTRL_PFC_SH7264
+	bool "pin control support for SH7264" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7269
+	bool "pin control support for SH7269" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH73A0
+	bool "pin control support for SH-Mobile AG5" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
+	select REGULATOR
+
+config PINCTRL_PFC_SH7720
+	bool "pin control support for SH7720" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7722
+	bool "pin control support for SH7722" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7723
+	bool "pin control support for SH-Mobile R2" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7724
+	bool "pin control support for SH-Mobile R2R" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7734
+	bool "pin control support for SH7734" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7757
+	bool "pin control support for SH7757" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7785
+	bool "pin control support for SH7785" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SH7786
+	bool "pin control support for SH7786" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
+
+config PINCTRL_PFC_SHX3
+	bool "pin control support for SH-X3" if COMPILE_TEST
+	select PINCTRL_SH_FUNC_GPIO
 
 config PINCTRL_RZA1
 	bool "pin control support for RZ/A1"
@@ -204,42 +293,6 @@ config PINCTRL_RZG2L
 	  This selects GPIO and pinctrl driver for Renesas RZ/{G2L,G2UL,V2L}
 	  platforms.
 
-config PINCTRL_PFC_R8A77470
-	bool "pin control support for RZ/G1C" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A7745
-	bool "pin control support for RZ/G1E" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A7742
-	bool "pin control support for RZ/G1H" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A7743
-	bool "pin control support for RZ/G1M" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A7744
-	bool "pin control support for RZ/G1N" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A774C0
-	bool "pin control support for RZ/G2E" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A774E1
-	bool "pin control support for RZ/G2H" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A774A1
-	bool "pin control support for RZ/G2M" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
-config PINCTRL_PFC_R8A774B1
-	bool "pin control support for RZ/G2N" if COMPILE_TEST
-	select PINCTRL_SH_PFC
-
 config PINCTRL_RZN1
 	bool "pin control support for RZ/N1"
 	depends on OF
@@ -261,57 +314,4 @@ config PINCTRL_RZV2M
 	  This selects GPIO and pinctrl driver for Renesas RZ/V2M
 	  platforms.
 
-config PINCTRL_PFC_SH7203
-	bool "pin control support for SH7203" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7264
-	bool "pin control support for SH7264" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7269
-	bool "pin control support for SH7269" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7720
-	bool "pin control support for SH7720" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7722
-	bool "pin control support for SH7722" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7734
-	bool "pin control support for SH7734" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7757
-	bool "pin control support for SH7757" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7785
-	bool "pin control support for SH7785" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7786
-	bool "pin control support for SH7786" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH73A0
-	bool "pin control support for SH-Mobile AG5" if COMPILE_TEST
-	select PINCTRL_SH_PFC_GPIO
-	select REGULATOR
-
-config PINCTRL_PFC_SH7723
-	bool "pin control support for SH-Mobile R2" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SH7724
-	bool "pin control support for SH-Mobile R2R" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
-config PINCTRL_PFC_SHX3
-	bool "pin control support for SH-X3" if COMPILE_TEST
-	select PINCTRL_SH_FUNC_GPIO
-
 endmenu
-- 
2.43.0


