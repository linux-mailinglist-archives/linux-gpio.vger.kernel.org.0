Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92336FCAA1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 18:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbjEIQA4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 12:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235526AbjEIQAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 12:00:54 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2044.outbound.protection.outlook.com [40.107.6.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7546730DF
        for <linux-gpio@vger.kernel.org>; Tue,  9 May 2023 09:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwtKDn2kbi3AM7rZRzzjliTHLI3PTswHikuJpaTH74L2nJ8pYjHF7baIzm9afulXHK5dl6dVxoIV/PSUoNoXFGXqWCrcY8xZ6og2p9Cs9y8h3cDDdSvGaiP/Qst64+Gsi/HBfXVYsLUhGFbgY3bE+mQvyaJ5Se+flnAELQCKzhlTC6Lai0hFZTlQTESyr7A5Qdzq6Ju4QtoLiW3xB19kjDwAK4pvGLvNVctOiPhJLGbl4LQmPyvVWyOg36w2wzeWH0LLbUmtS7Fc4FudzFAY6/59t9/pfRZYibv85SpaiZO9WVh9KLz9fNhW+JmWKa43ooIk2QEbDu1Tt0wnvDmBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+wYwyEqeCxyIbJXENFGTSLz1rEoFKjD48R8BxRYtPM=;
 b=f1IRp2sgrUoHhsnot0pm/2c+25m+LgB4iadtGir/WUjSSaMPCjnYVO7UF+7b70QhI6feDDkB5nFXOeDkFp8dLorcBWRPD99QMzTd5jSI7z2fbffGggUYQSEmj3YOjLSn6RhK92gbg4YS+lJv2WWcPnHwFGldVWlJqcpKVyRNNkoaS/dwKKuDt8KqZsrud8iih+10Md9PvqEGvBCBgb/0MCzTKbaueoGjxUsdp1LU63vtf0Q47qghvzD3N99VV9lHKzCPcfBzGLbVyHgmJtj6NuQscl0fdwMDHYJ8qnSkA2KZi7I+DlkpmaZtK+lhoODXsEluxh5NRANjoVM5MBZynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+wYwyEqeCxyIbJXENFGTSLz1rEoFKjD48R8BxRYtPM=;
 b=Bf5U45q7UVv5I6n6JVyPm/s1BjJtTi7IuON2eyuRLlqbT89HrtkWvxbRfDZVDPMiXjGdsxKJAUqUkipXIKAbJDB/0ZTPVSJbjiqcw3MwshXupt/pkkeswcdOtMfGN6kqTl6j1jsgja0fBUrdwHkNP8M+iBygGWWg1sVgCE0SfHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7677.eurprd04.prod.outlook.com (2603:10a6:102:eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Tue, 9 May
 2023 16:00:51 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 16:00:51 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com,
        Fugang Duan <fugang.duan@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2 1/1] gpio: mxc: use platform_get_irq_optional() to avoid an error message
Date:   Tue,  9 May 2023 11:00:16 -0500
Message-Id: <20230509160016.1074446-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 852cd8fc-67e7-4817-a67b-08db50a68f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFglhLdEvquT1Oizfreirk+UqmUytSahzpoc7Kv74pGCJBSwLleuNRTN92gs69P0V5FkcsQfL5sg0h+QWZPRjtVuHmR1RDq46ue8BX6DfAWDbSTLT027knvph9U/Pn7S95FMx4Im7LficWLZzD2QF5zN1u32Oh649KdryceGxq7IcL9+nVdrd7lMKC0nvHLyZifsj66+6hXsy3ifWeVo9cwCHM3pPFv8ks2xgxax4W9gbdYldRCAmOxFB5yw1oRGk0rXEjFFGu1ssKj4klSRdjBd9JsApVSme0Qdy1nktEMeyg+BFZv/aAkrQ8kRkPO9v13+xgLmzmFd+ZyDbd+Dtvf1eiiS5jiqq2ihtE7/FY0ynq8+TyV3pHrC2HC/KjWN6Rvf8EXKS36blnzjcL+KT8DQnfROXXCGaqwm05LJ3dIcrTJ7MzJpeC40QQ7dDSUN2DpVBJw/4LS+ayIumMC/KK2dPmUA1mrARSl7hVJd1Bq+M/eMPEjPtVn0mATs8xer3y5ntt58LWQopUNZzzwuPlecWEXfbSbKbTvTQubxay0EP5LN7BZOL4cIEtogKQbAywHe72paYGu+Lh4XQeQw8lay+NK4PHNDlTpR2cNEDZXqfCqArjeMnAcA81EGcssA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(86362001)(66476007)(36756003)(52116002)(110136005)(54906003)(316002)(478600001)(4326008)(66556008)(6486002)(66946007)(5660300002)(41300700001)(2906002)(15650500001)(8676002)(8936002)(186003)(44832011)(38350700002)(38100700002)(26005)(55236004)(6506007)(1076003)(6512007)(83380400001)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iAk05bBtimjQAclzqUEtzXUxcJAP7ujXttKNmWQiomSmVId7t2vHiaoXP0ft?=
 =?us-ascii?Q?/d8MVjjTbhQoJLcu+gP5BeqvQa6Y2ydl/jSR2GhIdyn0hGzUsh6LTKw1DX5/?=
 =?us-ascii?Q?G2CJWrabq4BNFfivzD9BI911ks0UiMm7SxGSV2xrTGpXrmyrldn2KFO1OGto?=
 =?us-ascii?Q?CcqP0l9qNONXhnUtnbOxPi+idAvDpyJMmFAqH6KX7mgHv4HSIwh+qjpSoXpQ?=
 =?us-ascii?Q?GwQ6ZEvPq+q9ZHWQYbe1hLDyD1EAu4fGbVaFWb9MFYN5CgM0f7rMxqKv7j3h?=
 =?us-ascii?Q?ktVAZZNgNVmjPjMyhGS/JInlXmpZ3pVApqbQPA6qXXKgzisNIeWSSSufhd9M?=
 =?us-ascii?Q?XfTlmREmqUTCVLxHrdW8zEeEX4LGUqXmXPZOh2y+rLIsGPWU7UnYWwjoZO5l?=
 =?us-ascii?Q?PuanDiNMzxHDThp7FxqSZ21oso09LVmWIwgUudmEXHrZFTSRWmhmcUuEzUFE?=
 =?us-ascii?Q?9FEa7Ga1yuESrNdua+3r8GhAaeWhwCZE6U4TYnWXacoScHbDbnoYPcLRU9Pz?=
 =?us-ascii?Q?Y/aadq70BTDpqaQryz71j3i5+VTzawDP711N9td66iVLLnmLSaAUaSqvkvlH?=
 =?us-ascii?Q?2pSrSo+1OQtyvW2RhSesbsqflBmhmxsqCGv441Qlkxy6ZXEsuovDwrVltliC?=
 =?us-ascii?Q?kF7c2XGQf7AXWXuybdCXea7d7BbGHwb9Z5oGU0QsIwQOJ87u6bJ6Z6LLrdgv?=
 =?us-ascii?Q?wuuP0ukK5A/FTXwhmVOSgDk5OuDG/4oy3avQzY+kwkvZ8kdPMLO3M9SNoQp+?=
 =?us-ascii?Q?sUVFFcZhVUBgch05bTBGk2mf+r4DUIatW4Yq1aitQQ+iZ+ggMWhmmwUazGId?=
 =?us-ascii?Q?jGoDu078OXVH8ngJ3g7ugpiWgr6su+FoOE7Z/93scOjxirvqnGTPtoH/EU5+?=
 =?us-ascii?Q?aq7UQVEqs7b2XaoKHm92YWDSNWccjnmGOIwzUH9PzGFTrJYFB5kgLwz4L2tX?=
 =?us-ascii?Q?vcdFF7l0mXPUUIsznD41JJe8UB0O/VJFHhfcvyE0fWbyCAyjriF+4xxkEzzK?=
 =?us-ascii?Q?UtZ/fXzdzQZXZzEtg2rEYqQKHccBNA7NREBinIg2rSyejWLepuTYnR3n967b?=
 =?us-ascii?Q?6SA44nv2ryeTv/9krtfWtp1iHY2HwC4xKbi5OYniYwMWRjjECVqVohStXpJV?=
 =?us-ascii?Q?GHvouLfILHPqIHJIUEu8SIBxRq5OU8YTRmxRoJE0p2RgPZrkoKomkrnDSJm2?=
 =?us-ascii?Q?Iq5D7OUpnQH5gptIuu0ZI7Lkw4UPLmtGF1MMp+o5h4fo0h0ZwS7PhLq1XAh/?=
 =?us-ascii?Q?Bs7dyCDQd19x9CwmfRA57IfXm+Z2XQQmBReZMjm3Uqq3vdKVD/y8J9wNYxCl?=
 =?us-ascii?Q?UldNkbLE9xRDdFYUT57cMkFh3Zs5dxtf5R4ORoXZqFPXSqQ//gUq8xrFc0o/?=
 =?us-ascii?Q?FZK86ny/zqMXeOOFuGl+sPNUl2UaYBKKfmlB/kVqZNwKkM4CUzI90ogM5K4I?=
 =?us-ascii?Q?fy9yDnxvTOqkCcrVPjFo23gMQO8Su/OYdI3W5v8bxheLP0YWblc1AfOkpi5j?=
 =?us-ascii?Q?GzYUR9BpukFJhDz8H8BDpenRnZZlEW0ij34oMDzkY0yqpyQBn4kUVrdQKIEb?=
 =?us-ascii?Q?4wFAUikJaZkfBZZuy4JGCKshVsWhHG+x/KtxtyG1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852cd8fc-67e7-4817-a67b-08db50a68f79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 16:00:50.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9A73QpS0zulc5JWlJOdtWanxtGGyFH9ewnqdnQMqb9NdlXnRJStQ/f6a87orcs+Mtfe6+I8ebYOUnKIx0Z5haw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7677
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Use platform_get_irq_optional() to avoid an error message for the
optional irq.

Restructuring the codes to ask for the first mandatory IRQ before
the optional one.

Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 v2:
  - restructuring the codes per Andy Shevchenko's review

 drivers/gpio/gpio-mxc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d0cec4b82a3..b8fa44a3fd4c 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -405,16 +405,16 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (irq_count < 0)
 		return irq_count;

-	if (irq_count > 1) {
-		port->irq_high = platform_get_irq(pdev, 1);
-		if (port->irq_high < 0)
-			port->irq_high = 0;
-	}
-
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
 		return port->irq;

+	if (irq_count > 1) {
+		err = platform_get_irq_optional(pdev, 1);
+		if (err > 0)
+			port->irq_high = err;
+	}
+
 	/* the controller clock is optional */
 	port->clk = devm_clk_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(port->clk))
--
2.34.1

