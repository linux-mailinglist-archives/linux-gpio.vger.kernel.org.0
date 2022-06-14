Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D6454A90D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiFNF7V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237887AbiFNF7U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:20 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5130235AA1;
        Mon, 13 Jun 2022 22:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu6u9QIee2W1AjEWCR3YhapX+7ridnvgXh4TEkOrAgKH1m8rR0oS75M5Qi0inecYv1S7uDaA3D/EISfnwNQrnphj7gAagYNiaul0GXH6Nfyv0MzaZ5Q9DDZMbDHr6sZXRV2XMovarOp3QH7h7RFJrLrc5xvtLJywQ0vKMMwqGWtapeYXjxuUkfbRYKpVdbdr2w++HO/hElZXeTqrZecJB5BywKeNMgEtzEvn68vAU0aO/K74KUtKddt7qOe17JI+YDwElVHANaOcatukTrdmL/PCQRBuTYnTWjK0Y43xHEsXiSMbUf8HUNznZPHFQiJn6i670BpZ2hHiHihnCZh65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ejM8h/jOMERPpgtd9ckb0pUVgV25sUUdf351U/YLAg=;
 b=BBqpCDeylTZb3h18YSXOW+42cK8NYrqmjKI9vMe3JxOQZOTFSOp/6kx8gIwWy2d7ef4mSE92q6vH4yuitLW5vBiG8O5BORfaOWxhWK8yrRQGu1dykfE3QECm9ppZERT6tekoI1aPwvMBQ+pZcsy0Bd2s+EWKT9E8Z68p0LyjKocQu6MzWlU3GZsJGF4NGgyiHlG1BuWFgRsRetOm7v69o0nLDVfe0F8AzjBSPfWL89c3EFSswBo0rOA5OI+xaD9UTGVrpamgVBdAtk6BeYlcOvP8dqUDqhPDrsaEIcvrwvt1yuOfC4PmRooBsqXqEhEmQBRvf+kM9RAFWKV7EG/cVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ejM8h/jOMERPpgtd9ckb0pUVgV25sUUdf351U/YLAg=;
 b=FTWWaKhLRXsLfabauVdaWvvo19g344pdqSJYDYM164elRQF6yP//SR4tCInAbb+6s2zYfJJPjAeWwmVjC96ix3AgiJ9RqLMrr/xjTBAtRzvaVdI58xbNwXDpx3IDp/4tfsN9hWBrt1FClnMQdLVlSRNHxtIbcprI3xI+Up86YUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3768.jpnprd01.prod.outlook.com (2603:1096:604:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 05:59:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:16 +0000
Message-ID: <87tu8nkcp7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/21] pinctrl: renesas: r8a779g0: remove not used MOD_SELx definitions
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:16 +0000
X-ClientProxiedBy: TYCPR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:4::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c322ccdf-fb07-4bed-b2c8-08da4dcb03d4
X-MS-TrafficTypeDiagnostic: OSBPR01MB3768:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB376875565621906A303D7A87D4AA9@OSBPR01MB3768.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtfsxJ4kvFsn55AOKew5mMh/xnUJMijsp9vcvKtZ5/Q2pE2iGlALIJrdGLB3Fzc7aBdNM8O3MX2QQHAq+qeGrVHWW1rwoQzvqKVEVw0u+dMaFY7fOfiv7Cyez7KN4Nc4s70Nt90ZMWxSTUUJBwl06JWm7mCaE0XmhNG1iWB1Qe5M71//dd7Vu8N7Yg6NuDcUH438kIh0poD62gcwU79P1vEEeeQbpHj9HsDAy8SQm5THCTtVfvWbjTSCT4hdCXZki7oFPV9InzaEXZxZnvbHOhGfPcgdv+UZsPuq4SkxTJEk1FVVZmRLdNvPHhsyaT2d6hEUttORDWG2zV4gfFLf0zyNIQ+UVJm3bvKsGPtIP2C6v8IYhyL4Ij7vNvyvV6YcK8+VjAq5w8yKmopqLkKpoM3zDukKvJIuRgpp/FDH0Ntnn8sY4Qid4mgoF4OmvH9Uk0sTRHcuZjyfA9nySDYA2vlLoqoitCZasDn/JPDXjKlLdTXROtL7++JP8CWTKptrk8j19BeaxvXER8strlJpda5cGIgu/9BNMUS6nAGaTeA36ZMgLi1nZ4u0scc79bS+jxjE1VKp1XIoN0I2roKK5224RbwEUMUMcA/VXx6CtcbQOn2oY7AGfvFaGPxUCCHwTcAyH4ylC4GO5LiTvDDXqUyGzWIouElw8HsjEnav3A4BBbIt3u/dke4L22NwYb/MtnFP8mFqeD9pxRY6h5ho1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(36756003)(4326008)(6512007)(8936002)(8676002)(186003)(6506007)(26005)(2616005)(86362001)(2906002)(5660300002)(316002)(508600001)(38100700002)(83380400001)(52116002)(38350700002)(66946007)(66476007)(66556008)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?heCdaFWVB/U+7rOrdGLaKbn6UcVSkt2Ms/ORARZFDyVLKQN4CVHT+2l2/5O0?=
 =?us-ascii?Q?NQUwGRzRToj017ya/p1yC4p6xjOYCXEMjpKH1PE+nSwbAbkxCk2f3HZ4zmJ4?=
 =?us-ascii?Q?PeyzXZRlfB0Xn1SztQVEbPAqxTh4IZK+NgwM0Eh2/7xfxVqm2F8p+fD/43AD?=
 =?us-ascii?Q?xtGk8tpWXdtyUQk4hD5cJDb1HcMviQFj1gC/S0wI29msTcOnS6N0OE3SaaXu?=
 =?us-ascii?Q?mK9Fj9s5WjCgKGbtxJvBTmlcOmUkV5pNqFsiIPWcE6tbDOGQhHNsAMAEwWhS?=
 =?us-ascii?Q?V4NC7F4rCfmdM3xKfrHBU6HBVvdNehtLKQ97l1alZsINIbSsk5zwyBJ69dHP?=
 =?us-ascii?Q?Pvc+asZKq2dQKE378stVfi7df7wN4+wv7LLgVIyE62qWxW0eG3v3Iiuy03Tt?=
 =?us-ascii?Q?hRO2hx0zGQ7KUCE2cg26IkNwVdjZXVxYl0W/BjcqV7lJJKqB0CcGBQh1h9hM?=
 =?us-ascii?Q?al/ohzsvmIUBqoLUBFQXwSsVNlL3Z34PC/fT9qpJzf8otMWtL7ch/t78jCFi?=
 =?us-ascii?Q?oVzGC9CFWsZYMSbQTEsC3oEu7DIaXsqAB/4Oes2Cgkp/hEMwbcWWLqop0sVW?=
 =?us-ascii?Q?Tm6n4FBr51ulMMCLzLDmgNq+K9f1nr2futTpfOyXnhuYZbgC44nwdhqWzIOl?=
 =?us-ascii?Q?3h0R1okJDw7BQQpu5jZqmmZlGusG90P/mdGXh9oeyjaXIAm9pGDLRta8sfif?=
 =?us-ascii?Q?TjLVLdI2tUEKTUzq4HtofO/LiHeMArjC2puW0yZuRz0uB9SiEea3PDSPn9Pv?=
 =?us-ascii?Q?c57ElOqJTLbOq5DyKNMCu/wtU5Ss2ZcF8epLyjk2kuoSC4JJlAKyadxFqg+s?=
 =?us-ascii?Q?XekkeIgUxZ5cvTBU4MvlCNDvU5oFn5Qaqe9ZR+WbCpHh7L2wvUpqQy5gzQKt?=
 =?us-ascii?Q?R3tF0b4wyp8AGaqX7y/YSMzhVz43D3zI0RvGy5Us2Y8OJRAvcM0izP1PFSPj?=
 =?us-ascii?Q?b/S6eoFeVjpzlxCyLXeFfJEjCPGDKJ3pT6pDQv3e4lKGRPeVhOJhYpeg6WK2?=
 =?us-ascii?Q?K1FAMT72ZfdqxwMTTY7jpNEPoBuRkfGLEgky4gIBYc3FNvspql3e5fcaIawF?=
 =?us-ascii?Q?h+jy+lvj6YhTRLHgyYFFdZj9VWW1EeGj9JtRQsFKEGITSbtjofGRh6Pvoj39?=
 =?us-ascii?Q?VP//8tXlnx13K/MVh0Ww+5yCiUJ+aQojHrynZRIaIYmDYHIWAST3JMyBmpEd?=
 =?us-ascii?Q?wgmpsFQDN530LF2RDsMDkdKH3r6A+InIlHH8AHz7+Ug9oICQy4lv7i9nwbpZ?=
 =?us-ascii?Q?qXXTqfAX7WrxHiYz0EoadVCigc5ZBZlTGLLupUoGYSl/B7+XoerFTA3l5L/0?=
 =?us-ascii?Q?nvz2wM3U6drA9+FBWSZjachqSO8XhsRoWuyd9iLUSdaurCOF88To+Q1dK4PX?=
 =?us-ascii?Q?0kHQBdSsCoOTGM6SSKz43prO64lgvs1TZdOe34ABfB3mfjJ1ABa2LlhtmlHs?=
 =?us-ascii?Q?nQGjupCEJnVPxoxFPrH0hM0eSXKexlhfV+qHkLK1TF0PRTXgW9ppCRLcm2Vk?=
 =?us-ascii?Q?s/9gcsBnrvJaMTpqmtcXuW3hlEyfFi0APjI7iIuApeBpuTY6+AkznPXCPJPD?=
 =?us-ascii?Q?fxpsB9dkz405Mli7aAQHt70uNuq2Cz1sRBVEGkjw7tiSr+xe0JBFgOSsqji1?=
 =?us-ascii?Q?0jKOZhj+F9D7i6n/ifdnowQiFq8TUQAByfidNn5A4ojtvC9Yb7VTGGeP/y+F?=
 =?us-ascii?Q?wnKZqm3DaqNvG3ao9lBj7+m865oqsY96POcATb7Zq5RK7x/k8+WDsbc4NxZt?=
 =?us-ascii?Q?9S2Yy2O/HT3EG4WiwVgSgLqTotOmnUcQyY2DsiWDlGTV5obOJj6r?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c322ccdf-fb07-4bed-b2c8-08da4dcb03d4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:16.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lF/yXqYcOqHlokU3PCwDDcIILJjU7Ix/Kl3bbPma9Kc2LpcrKkJaZJ1ockV0i300INfN9b+vvMF49hY+Fl+mK0GU76abj85WD2a3r4uh3NJiFG0DdM10Ap/T62T286R9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3768
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

Current V4H PFC code has many MOD_SELx definitions with all 0.
But these have no meaning. This patch removes these, but keep
its definition to avoid unreadable PINMUX_MOD_SELS.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 72 +++++++++++++-------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index d049bb71dfe8..76d2cdddebe2 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -566,85 +566,85 @@ FM(IP0SR8_31_28)	IP0SR8_31_28
 /* MOD_SEL4 */			/* 0 */				/* 1 */
 #define MOD_SEL4_19		FM(SEL_TSN0_TD2_0)		FM(SEL_TSN0_TD2_1)
 #define MOD_SEL4_18		FM(SEL_TSN0_TD3_0)		FM(SEL_TSN0_TD3_1)
-#define MOD_SEL4_17		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_16		F_(0, 0)			F_(0, 0)
+#define MOD_SEL4_17
+#define MOD_SEL4_16
 #define MOD_SEL4_15		FM(SEL_TSN0_TD0_0)		FM(SEL_TSN0_TD0_1)
 #define MOD_SEL4_14		FM(SEL_TSN0_TD1_0)		FM(SEL_TSN0_TD1_1)
-#define MOD_SEL4_13		F_(0, 0)			F_(0, 0)
+#define MOD_SEL4_13
 #define MOD_SEL4_12		FM(SEL_TSN0_TXC_0)		FM(SEL_TSN0_TXC_1)
-#define MOD_SEL4_11		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_10		F_(0, 0)			F_(0, 0)
+#define MOD_SEL4_11
+#define MOD_SEL4_10
 #define MOD_SEL4_9		FM(SEL_TSN0_TX_CTL_0)		FM(SEL_TSN0_TX_CTL_1)
 #define MOD_SEL4_8		FM(SEL_TSN0_AVTP_PPS0_0)	FM(SEL_TSN0_AVTP_PPS0_1)
-#define MOD_SEL4_7		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_6		F_(0, 0)			F_(0, 0)
+#define MOD_SEL4_7
+#define MOD_SEL4_6
 #define MOD_SEL4_5		FM(SEL_TSN0_AVTP_MATCH_0)	FM(SEL_TSN0_AVTP_MATCH_1)
-#define MOD_SEL4_4		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_3		F_(0, 0)			F_(0, 0)
+#define MOD_SEL4_4
+#define MOD_SEL4_3
 #define MOD_SEL4_2		FM(SEL_TSN0_AVTP_PPS1_0)	FM(SEL_TSN0_AVTP_PPS1_1)
 #define MOD_SEL4_1		FM(SEL_TSN0_MDC_0)		FM(SEL_TSN0_MDC_1)
-#define MOD_SEL4_0		F_(0, 0)			F_(0, 0)
+#define MOD_SEL4_0
 
 /* MOD_SEL5 */			/* 0 */				/* 1 */
 #define MOD_SEL5_19		FM(SEL_AVB2_TX_CTL_0)		FM(SEL_AVB2_TX_CTL_1)
-#define MOD_SEL5_18		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_17		F_(0, 0)			F_(0, 0)
+#define MOD_SEL5_18
+#define MOD_SEL5_17
 #define MOD_SEL5_16		FM(SEL_AVB2_TXC_0)		FM(SEL_AVB2_TXC_1)
 #define MOD_SEL5_15		FM(SEL_AVB2_TD0_0)		FM(SEL_AVB2_TD0_1)
-#define MOD_SEL5_14		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_13		F_(0, 0)			F_(0, 0)
+#define MOD_SEL5_14
+#define MOD_SEL5_13
 #define MOD_SEL5_12		FM(SEL_AVB2_TD1_0)		FM(SEL_AVB2_TD1_1)
 #define MOD_SEL5_11		FM(SEL_AVB2_TD2_0)		FM(SEL_AVB2_TD2_1)
-#define MOD_SEL5_10		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_9		F_(0, 0)			F_(0, 0)
+#define MOD_SEL5_10
+#define MOD_SEL5_9
 #define MOD_SEL5_8		FM(SEL_AVB2_TD3_0)		FM(SEL_AVB2_TD3_1)
-#define MOD_SEL5_7		F_(0, 0)			F_(0, 0)
+#define MOD_SEL5_7
 #define MOD_SEL5_6		FM(SEL_AVB2_MDC_0)		FM(SEL_AVB2_MDC_1)
 #define MOD_SEL5_5		FM(SEL_AVB2_MAGIC_0)		FM(SEL_AVB2_MAGIC_1)
-#define MOD_SEL5_4		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_3		F_(0, 0)			F_(0, 0)
+#define MOD_SEL5_4
+#define MOD_SEL5_3
 #define MOD_SEL5_2		FM(SEL_AVB2_AVTP_MATCH_0)	FM(SEL_AVB2_AVTP_MATCH_1)
-#define MOD_SEL5_1		F_(0, 0)			F_(0, 0)
+#define MOD_SEL5_1
 #define MOD_SEL5_0		FM(SEL_AVB2_AVTP_PPS_0)		FM(SEL_AVB2_AVTP_PPS_1)
 
 /* MOD_SEL6 */			/* 0 */				/* 1 */
 #define MOD_SEL6_18		FM(SEL_AVB1_TD3_0)		FM(SEL_AVB1_TD3_1)
-#define MOD_SEL6_17		F_(0, 0)			F_(0, 0)
+#define MOD_SEL6_17
 #define MOD_SEL6_16		FM(SEL_AVB1_TD2_0)		FM(SEL_AVB1_TD2_1)
-#define MOD_SEL6_15		F_(0, 0)			F_(0, 0)
-#define MOD_SEL6_14		F_(0, 0)			F_(0, 0)
+#define MOD_SEL6_15
+#define MOD_SEL6_14
 #define MOD_SEL6_13		FM(SEL_AVB1_TD0_0)		FM(SEL_AVB1_TD0_1)
 #define MOD_SEL6_12		FM(SEL_AVB1_TD1_0)		FM(SEL_AVB1_TD1_1)
-#define MOD_SEL6_11		F_(0, 0)			F_(0, 0)
+#define MOD_SEL6_11
 #define MOD_SEL6_10		FM(SEL_AVB1_AVTP_PPS_0)		FM(SEL_AVB1_AVTP_PPS_1)
-#define MOD_SEL6_9		F_(0, 0)			F_(0, 0)
-#define MOD_SEL6_8		F_(0, 0)			F_(0, 0)
+#define MOD_SEL6_9
+#define MOD_SEL6_8
 #define MOD_SEL6_7		FM(SEL_AVB1_TX_CTL_0)		FM(SEL_AVB1_TX_CTL_1)
 #define MOD_SEL6_6		FM(SEL_AVB1_TXC_0)		FM(SEL_AVB1_TXC_1)
 #define MOD_SEL6_5		FM(SEL_AVB1_AVTP_MATCH_0)	FM(SEL_AVB1_AVTP_MATCH_1)
-#define MOD_SEL6_4		F_(0, 0)			F_(0, 0)
-#define MOD_SEL6_3		F_(0, 0)			F_(0, 0)
+#define MOD_SEL6_4
+#define MOD_SEL6_3
 #define MOD_SEL6_2		FM(SEL_AVB1_MDC_0)		FM(SEL_AVB1_MDC_1)
 #define MOD_SEL6_1		FM(SEL_AVB1_MAGIC_0)		FM(SEL_AVB1_MAGIC_1)
-#define MOD_SEL6_0		F_(0, 0)			F_(0, 0)
+#define MOD_SEL6_0
 
 /* MOD_SEL7 */			/* 0 */				/* 1 */
 #define MOD_SEL7_16		FM(SEL_AVB0_TX_CTL_0)		FM(SEL_AVB0_TX_CTL_1)
 #define MOD_SEL7_15		FM(SEL_AVB0_TXC_0)		FM(SEL_AVB0_TXC_1)
-#define MOD_SEL7_14		F_(0, 0)			F_(0, 0)
+#define MOD_SEL7_14
 #define MOD_SEL7_13		FM(SEL_AVB0_MDC_0)		FM(SEL_AVB0_MDC_1)
-#define MOD_SEL7_12		F_(0, 0)			F_(0, 0)
+#define MOD_SEL7_12
 #define MOD_SEL7_11		FM(SEL_AVB0_TD0_0)		FM(SEL_AVB0_TD0_1)
 #define MOD_SEL7_10		FM(SEL_AVB0_MAGIC_0)		FM(SEL_AVB0_MAGIC_1)
-#define MOD_SEL7_9		F_(0, 0)			F_(0, 0)
-#define MOD_SEL7_8		F_(0, 0)			F_(0, 0)
+#define MOD_SEL7_9
+#define MOD_SEL7_8
 #define MOD_SEL7_7		FM(SEL_AVB0_TD1_0)		FM(SEL_AVB0_TD1_1)
 #define MOD_SEL7_6		FM(SEL_AVB0_TD2_0)		FM(SEL_AVB0_TD2_1)
-#define MOD_SEL7_5		F_(0, 0)			F_(0, 0)
-#define MOD_SEL7_4		F_(0, 0)			F_(0, 0)
+#define MOD_SEL7_5
+#define MOD_SEL7_4
 #define MOD_SEL7_3		FM(SEL_AVB0_TD3_0)		FM(SEL_AVB0_TD3_1)
 #define MOD_SEL7_2		FM(SEL_AVB0_AVTP_MATCH_0)	FM(SEL_AVB0_AVTP_MATCH_1)
-#define MOD_SEL7_1		F_(0, 0)			F_(0, 0)
+#define MOD_SEL7_1
 #define MOD_SEL7_0		FM(SEL_AVB0_AVTP_PPS_0)		FM(SEL_AVB0_AVTP_PPS_1)
 
 /* MOD_SEL8 */			/* 0 */				/* 1 */
-- 
2.25.1

