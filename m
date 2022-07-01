Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37EF3562872
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbiGABkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbiGABkC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:40:02 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ABF5C975;
        Thu, 30 Jun 2022 18:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2FC1T/lxU6nerNJwfMVib4V2uBuFyxFveOmgECC6FxVW0Vst607mZKrCkaR3b4WHT4gHQvtYkrUWIBHgyNzHC4JsaQSA1FTCt/Q6KiCTrVo2U0gm1scANsYp/bG2vRvV3SpEEMo1ErfQNdLkIrc/Wk9/sUhnb2HmIezQ/u3khRuatE5a5fk5hRMTB282Vld/7uvaMDXNfpH8ZnKOyyxYCh3Rq303naJBTDQc1pzOjF8qZYEKkixQ69ESowOnnhQ01akQ1QtnrN5tKEISRdTXQcX7L5Vau7DcaMTaQXxH8ovehYhYR0hQDWhJs44ec2GXizETU1jLQ01MK+xTJQ89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrVn8cgfgjKiAjptFbT+PXWvJhDnbtcIfJfHXlolAns=;
 b=OalZeuT/oayCdPIUi+Qqahko3JolCtHlZjau1w4V4owDBzs5cE2CfU8JVYD7AVirOfq4tAjV0gZwmZusYr9DLthQvEVsOAbb7uFSr6n24VUobBM5dMlh+mQS+bnhBtSg9/KD3z/7y/6sd7bqiBlG0v10xDsOjBUJ6J03lUmDlnLKpYPx4roW9pw3w8KOi5wPfsIYFA4VKXyTNjaj2871ETazJAnAcdFmi6UcoVBI33/CIYdJboKXuTo4YsAPO78bhYjedENJVK0/zTJkp9by3nVqo+kApXV1Z0p4y4kGmC5wWme0AAYgGkVRPHn4IgZzXR7ix6/tkhH2vIScA/dD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrVn8cgfgjKiAjptFbT+PXWvJhDnbtcIfJfHXlolAns=;
 b=gn8urln7I9zQllLsVr0ZwxcfS+0dU8ot0myLAJFOXSNAdLB7afTZL5R9+/NUHNcPe4m++x2uhEVL3LpGp2ynVKYg773QeKHfw59hcuP9jh0YFQbBrlVUI8oRHMCMmt7LiSDQBOZdPmDEDGiA6nzelcvHEIxHzd9B4dSdQz60nOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:59 +0000
Message-ID: <87sfnlsj9t.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 17/23] pinctrl: renesas: r8a779g0: add missing CANFD5_B
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
In-Reply-To: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 1 Jul 2022 01:39:59 +0000
X-ClientProxiedBy: TY2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:404:e2::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d560e906-d5f1-41c5-2453-08da5b029c27
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqPKxJ+R/YM1gT7gBg3px6I9CHw8Ifi+VNXVqusBdCxRZ6qQcjJX8C7ennqAhL2GH3edQJibi4cnIig+JUQgH8ZsEgOqUlBYMKdzFi+gsA4CJCZWcjnlda7ahGoSaKd81vOSwplXpOe6uMLCrxfnCownXpAa0d+jBTDVvIDJ7XlI2FQbnPb0BGsGFpkWTD5wt0EOgHUFRWoAepPzj100v0xV+eTpQIYvIWqu1n/+/r3WLj/Hp1TJcoCwUiclmxqUGo8Ssjg/2M6coa12GG8iCmIildgsrLucfHhrBS/oOPhU17M/0kTyPWVt1JOuMfNiHdsMwoiK8PW0JnzZq8eYsJDMnkXz7l7ggH4bnlft1xN2VLVKO8iszgkaWsFPkW/RT6DCpBKlB427YOPZeIV8Zv1Iu5O2zOPMdjuCux40QKLwzupRU5tSyn07AuhqNPdS8z0H3XlBL8ZJ2SIx/nWUoWX6JQuiiQoAXiaoy98pVso8LflJyVZXcOOJN83yrtWA04Bk00RobUoo31XPD90tSRYRKq/eJy8JQq7R2tWAbH9zaPfp9Vc2viqJMGEOPoDfiZ2LwFJoe1gSMKr4foN/mccKdHHtZ/ZqtmMJLHzcwCOelD75u22CNZiXE1Ecpr431ni4VKMtxwufZir0QgKuqi+isK8wiTexNgJGV8L6TAufuFSFCPvqx9+Xhm6aE68Aau++eMJJ64pAsw/xFIhSn+GKmnyPmR9enBGNVWI0VR+9ExNdE8EZqEjWqDiStj73gUS3NnUn9a7/DowSqJ/Z+ekDEOQq/tYDEb2R85jrQZo/n32fdGZ/G438hCsxVGFg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2yJ9f+yfll2BVT3reJ53Y7SpTLiv8uqEJEvVcohkFKgi83S19BvwGs1TOb4f?=
 =?us-ascii?Q?dPM87CG9zi6jiJv6q2EJa5olDQSkOcyhofo6GSQFZd/FMXaoIoqKHGvlZTJu?=
 =?us-ascii?Q?kUSwc48UmVnlRdply1hkytwhrkYKa1px9+gtwxkJHMo9hc64Zcu0frloeqiq?=
 =?us-ascii?Q?gRTLCw8d4ODmf4WjV5xCgOwksKzSFAgheXTrZm+YOScaZQX8y1W1TjFbgEsz?=
 =?us-ascii?Q?fprTF/akMXjbuxEi02gXBv3HfQGFki0TMnHHBhj7Zj912wOEIXSKYRKLCc32?=
 =?us-ascii?Q?+V+4eOucQ3MypbyxvhO4orR1cFN0F3TA88lKGy55aeS22hoJJubAXGEIgir+?=
 =?us-ascii?Q?LC3lZnvwW7L+kacmf0SfdY45L9BrtTqZBrNMQOKCJpsq+Qmpszy1NosS84Kk?=
 =?us-ascii?Q?CUkkL3C0MwnNQvHU/210faqrJm/AI/OHlL8U56ODQUW9yUJzGznA4tGfGKkW?=
 =?us-ascii?Q?9+SRmyLWzZWaC/omlUR5gvXBKF4G2oJ8cUbGGBMn5r0h6YRwtYObRUwa+uLn?=
 =?us-ascii?Q?UGIElP9pNNNvRVZsq3hPDpwf1KTygYpHezwpkwiHMeW1ihPr/Fe/OybqJXZK?=
 =?us-ascii?Q?R+RVX5qmCy8zygnDnbA+7+03HcbmIxEpvu2768lRTOa2Cm853R1tEW4N76bE?=
 =?us-ascii?Q?RmMt6007Id6sFLatWbAMFOznOeMuA+J6L+SPeyawnM8dTLFCrKyi/y7YnhTb?=
 =?us-ascii?Q?b1swotBxKqKpZ/DbUD8h3m2B79zz3JQuxuN42BeADQEty4DaE06JrHDXSD0H?=
 =?us-ascii?Q?L+oITwsY/JgFEFFo4sOXZQSDXCgZNsu+TpRsWMOehlONJwKDRB2RVLoJQhjp?=
 =?us-ascii?Q?A74mwjvKeHrmJjWcb+mORq3UVjIhcjZJEvI71xD7PmVeIIdWA6GM4orA4EAD?=
 =?us-ascii?Q?4V4n9SYVNdUSNtc8OK90Z3kiuW71gEWPpNVN7PLc+5E1S/NiYtyLm6MFYBM1?=
 =?us-ascii?Q?NxJPYEYFHKcIZs7jMWHE6uYIdnTfa3FunTO2mN/oPsBXlMXNAYhxfsXP/WbH?=
 =?us-ascii?Q?AEZReLmAM1RrYaL0uWm/WxpKqf/ab3tvulP/RAevX9Otr/Zjp3yN0299+bkX?=
 =?us-ascii?Q?6aWm7v554rviohoJb7O+3bEjsCTEQoT+0NEoFnsHwXfC2QQOCy+5yAycXGxT?=
 =?us-ascii?Q?jIk68jTwc4rYADs5FzdRWIIFYhms2Bl0OGHTfHaeHNfZ6oOe13kH8OJX4vkY?=
 =?us-ascii?Q?aSVgfjSSLcIH09baZgZQjuFnoqOp0UV8QX/BNDGauOz8oZlxWxnAAs8AYpCl?=
 =?us-ascii?Q?5I6ROXuzVN+iX8Ms/Qg9fMPpsyjoruG8f4L9uJANbbiFc9ZGPXDad1R2VyNn?=
 =?us-ascii?Q?P2quSj5sj7BMvYoTdsiIvSY2n/r73bPkT2sJ+6SLbedGYIZO++JRmnms6hQf?=
 =?us-ascii?Q?1CNhqVqEQS61Q7spEfH2k3CXvrp/34BcZC0diF2DU9VjilIKNSOKKK0gznWL?=
 =?us-ascii?Q?DX1GhTVmumS1pVBMAIAxB1qbQGw1ahAWl3C/uLB3jCIrQQxV0gPpO19obuaq?=
 =?us-ascii?Q?G+BkgR5xloi+OMpZZGpPtKANnkv4sHqxv7S7mBMqRNt0RehDVRg+qkK2giT5?=
 =?us-ascii?Q?y6rVrQ2O/iAou1p2sZtOsJwlIJXEoI9PtIprV4GxJxhGrr24HJnRDChK8Ga1?=
 =?us-ascii?Q?N1Fuk/mGUA0FgR/3WdaWULM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d560e906-d5f1-41c5-2453-08da5b029c27
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:59.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwU5iZquwZEHulNZYmUfT1L0c820TRXAlnWX3qsC1C7gqp8sdeU+iyvvX0ordXZQ7D1ze4s9D/k099SnqyGC1mWKvVXW1wWNB6mqjn5zMTKYJNmCERejQx4+Kb39aD7L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7362
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing CANFD5_B

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index cff48ba6f5d7..c9331c008802 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -306,8 +306,8 @@
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		FM(RX1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_X)		FM(CTS1_N_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_X)		FM(RTS1_N_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_N_X)		FM(CTS1_N_X)	FM(CANFD5_TX_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_N_X)		FM(RTS1_N_X)	FM(CANFD5_RX_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		FM(SCK1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -828,10 +828,12 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	MSIOF0_SYNC),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_N_X),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CTS1_N_X),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CANFD5_TX_B),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_N_X),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	RTS1_N_X),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	CANFD5_RX_B),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
@@ -1469,6 +1471,15 @@ static const unsigned int canfd5_data_mux[] = {
 	CANFD5_TX_MARK, CANFD5_RX_MARK,
 };
 
+/* - CANFD5_B ----------------------------------------------------------------- */
+static const unsigned int canfd5_data_b_pins[] = {
+	/* CANFD5_TX_B, CANFD5_RX_B */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
+};
+static const unsigned int canfd5_data_b_mux[] = {
+	CANFD5_TX_B_MARK, CANFD5_RX_B_MARK,
+};
+
 /* - CANFD6 ----------------------------------------------------------------- */
 static const unsigned int canfd6_data_pins[] = {
 	/* CANFD6_TX, CANFD6_RX */
@@ -2424,7 +2435,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(canfd2_data),
 	SH_PFC_PIN_GROUP(canfd3_data),
 	SH_PFC_PIN_GROUP(canfd4_data),
-	SH_PFC_PIN_GROUP(canfd5_data),
+	SH_PFC_PIN_GROUP(canfd5_data),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(canfd5_data_b),	/* suffix might be updated */
 	SH_PFC_PIN_GROUP(canfd6_data),
 	SH_PFC_PIN_GROUP(canfd7_data),
 	SH_PFC_PIN_GROUP(can_clk),
@@ -2618,7 +2630,9 @@ static const char * const canfd4_groups[] = {
 };
 
 static const char * const canfd5_groups[] = {
+	/* suffix might be updated */
 	"canfd5_data",
+	"canfd5_data_b",
 };
 
 static const char * const canfd6_groups[] = {
-- 
2.25.1

