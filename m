Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E68154A91F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbiFNGAQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiFNGAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:15 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EC335AAB;
        Mon, 13 Jun 2022 23:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHnV9+eNhSjicUmCxMrEV5i7HapFEsxrHoI3a6c2SA38yW3xkefmpeNiDJ44aMUoTREeUatPI0W8irA6Y9g9ZI96o9Z6MX304tUebNo/JZnTFwZFClFxj3hdbnjtnQdR0Yw1Xqcbxb11UvXjmUvPah9qp7AbrVhRJn+2h/iz9ZfDBeI5gH++9vsQ+0u3PPYpUbFBa23+QWU+OJwzAiL1pN8UkvQxvd934TnkHih/iwO04ZLv1rbp2c5VGctK/NuShOQcX3pTHXQyvNqh0LBf8DnDT6NLSW3/lREJsUwk394QrrYB6/+MtHJcmrDorrV6+4izIaTUzhD0DnAg4pm/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qL79rZAuOdwlKyHqHMaWX6vis/CXiHpItS8+NySH73Y=;
 b=DPQJPTeCZiQGHgXVeHaUU1iqnNzBppFOgSmMLRrKb21akvIq5rKkTS86Psvg3t7t9cJq49sFIByXRzOJyK99MtQAatVmql0GhhuxsZeNU6QJXY1iMUaDNq1adIyfzPNCMx8UcFCavuapgvmMbSluyupiDS4117FU9c9x8n4UJBlj0h+51+9/RfevhcF49Zbla+23dquB0+azmOdVyPHIWC/NMSW15SYZejVxMXev8IcXTc6LeweC+zr412XF/iI5jPX1Y38BGPWDWInFQqpAg7JcbALk2tFt3/yZ+ktJ645/yg9VW/JpjgJEbXgoAm6mglkrN8lcVeTwkdFOG4eNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qL79rZAuOdwlKyHqHMaWX6vis/CXiHpItS8+NySH73Y=;
 b=gaVJdAEI1GM50a0W2hylIj6JNqSp4YtuteHZ2Zq9oOFsVF6f2FrPXnUgBBPi/j7+v6l2s4B+stChoZYYk93BOC/uFy9MotnfJ09vXFHkOkVHv5HP0xk822yJA0fcnkPBoB8VJTJE/0qBljKwZyboE4Rt6YECj5wOuXPkO7TUdoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3093.jpnprd01.prod.outlook.com (2603:1096:604:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 06:00:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:12 +0000
Message-ID: <87k09jkcno.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 14/21] pinctrl: renesas: r8a779g0: add missing SCIF1_X
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:12 +0000
X-ClientProxiedBy: TY2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:404:e2::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdfab48-0141-445b-d1da-08da4dcb250f
X-MS-TrafficTypeDiagnostic: OSBPR01MB3093:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB3093B8B073BBA5DC02691562D4AA9@OSBPR01MB3093.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNr8ZZ2BsCpIpV6L+AYtlsGfk59NYbaU2C8WC6EF8EX1dZJIZF1xEFaOYif+UQrCfLAtRgjx/sIvif9nky4iFES917MSpv4ZFXZ+Syd3ppsrdtiRMLLd89xAkS9IswIeXc7QlVHYXi6/4WlkKcrnuNKFtHuR3YArHFdhq0UoY20kLz5RbHpDXllru3Heb/PmmG2WItaW0XxWyKD8QtWg/ccVHIjK2bPdfAAQqPVwpIQA+b8VwjqDIPdLQmYIx53WToU1bgCVEbwL8aJV0iOW/cM5K8RUtXIq2XpVCtnNxFopX8fRBUz6TAd4Fp7N+wvWBEaXwzwa5evmM1O0c95a4jM3iyoJYqZFBVoYRgIHJ3w5TG/OUAdq2Or8wqW/fA/QcX2eb3+p1DSs6wZpr4rqQVQ6G8L9ooZ2fTY6eMlbH/qYJYOftsqSN/Dt8Gt8bPxj3oGbbvpKKZx8duGgZ3OfhnXVtgwGZcFAd4QqYtg7Cqmp2uHvzJ+HxSYIevqzADqn6iQoahqwND0pp2hBH0g4NDfr/H3cnk6keffB+SviYaxSEmuSr7YEJbpFZiqMNNvp33h5Vpm4jRvxY1MQc70pAO5DJmWCYEVHNnhuyA5BJqkwILPHRq2j4W8cUBrgcoV931VUf59BNrMxXOf+3Vpaph9Kt+YGUrYgeMJKOR7dCPssVf7U13dBd6apXgiuCy+jnLRYGOqqyc6TmmaRfiaiQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(6512007)(36756003)(26005)(2906002)(6486002)(6506007)(52116002)(5660300002)(186003)(86362001)(2616005)(8936002)(508600001)(316002)(66476007)(66556008)(38100700002)(38350700002)(66946007)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DDu2cV6+nQBSCdzs0VbhuUszwLpvYWdqQDTFe4GKaaHxzfTn4ID/5ZewLGr?=
 =?us-ascii?Q?KzO/rhsRW7KQeSWA+Y2NWrj2Irtk/jOyogFXWy3qYZDtZmKA78gumC9/SX5C?=
 =?us-ascii?Q?m/qr7LvDe6oClZ23+2FFIZt/w1ryiMvuCZFj/tM+KdZieG+D2OMPEoIUy4jI?=
 =?us-ascii?Q?GeBPdlm4gt3xyIQwLDglnCQaGonBSf1BhW6HkFfRvYjVr5hGPgsbNpvWI/3z?=
 =?us-ascii?Q?V25GD7EHFZ0XxlOI9Y7PywlklMu+j4Ys8oy8awxYZThhqKd9d8UWfLHcSKfH?=
 =?us-ascii?Q?8M+nRUt2c9Y3eXvYKVN9g+f/9u7vVWllMGTNOx/r0Coxw/KgXGTxLPAtS68p?=
 =?us-ascii?Q?aqzb/LeEHck+gaHov7Ddj4X5WHraQ1e/GF+vyvtd/4Fh3y2QuWHotyqSoia2?=
 =?us-ascii?Q?kbcJ/KdPXqeVJNzPodT5kT/1Uoc+BLMLldZzLu/A5pETJNvyggUe4ObB5CJl?=
 =?us-ascii?Q?IYO45QHWvDtxB1ekMel13CeJlZUafqBEwbADU3pwVfnMwR1lldzXWt/I4Ntj?=
 =?us-ascii?Q?31laX3xzlIzcLvNGC8PYNHWAtQtZsYGfagGOfUErZqq0HFYqe4Md2aVajPfg?=
 =?us-ascii?Q?zJrrWaaVjZgkoGBsgbDbUchJbxc0ZGP8b9bACTtKHtXxpbBNqhopSvy7lA2/?=
 =?us-ascii?Q?0CSPxxIt2z8dMBOhnGp5SuHlgsXrZMxQGEInHDfP1Zv/LGsTO60ZoXKuHFoa?=
 =?us-ascii?Q?MgrBgIgfs/fvbRNQPPECj+5vZVpNY0DIOERgb+FPdb0Yba5vOuduAlGWnbO2?=
 =?us-ascii?Q?mrvr4z0OVJTd+KrQSFsJQzcaQ9VfJPosiePMwDmka8QBXaUmcHX8wS7SvUlX?=
 =?us-ascii?Q?CgoZu6UwAXR8IUeFtvmK+5v56xfBL82f6DJdVYqLhvt59BQtKM+YhkeQYlqc?=
 =?us-ascii?Q?hZauIbkTHMeo3N5cwHD2QBBK91HtYuM/AxvY48yZf4Apu8rlbUWhcjxFwscm?=
 =?us-ascii?Q?EeY7MaVbgPh/6BFpkBIKlSuoxlJrsaekPpLGh4NOhcCucmuiHq6C2V75E9jp?=
 =?us-ascii?Q?JHMV73j9sWDfmQMT1zbF4ToMwhhtJYrbF5IG9kCO+QSLdmyE9zfBGFjbV6/K?=
 =?us-ascii?Q?jIB9NeXUccbgeLTC3RVYDGwuzxshGlRbgruSkENhwyzD6g4IsPZDZF2OVQUi?=
 =?us-ascii?Q?rQjPHQ0tZ3wWsk9NEBEXPjpfD0kiMSIYqD1fLaPoyX0X7DROu3QTUXXcbQyG?=
 =?us-ascii?Q?QStaiNopm8eMDRZCNpvHFEva39v2H5ZfPPv0PCYwygeCxki9t8q8JGjZPP5R?=
 =?us-ascii?Q?XIOz1v9be82B4eWNHLjpYoZN7csZKBBvkT7PV3YOb/8fKNtPwl9WDPdUOOKD?=
 =?us-ascii?Q?XbYbldEZBu7pQQGXYWvuJOKyt/X3MEHuBWo3H9uiZe4Lj9iONAHKk1ABHLso?=
 =?us-ascii?Q?MAlFaTNcCl+4wHc7lPPuoKPnL00m3HocXrGmDoKnLVlYjI19FusFjtq/i61i?=
 =?us-ascii?Q?occF5Z8aydA0DZ1AE+NE8e0p7IYSFhf/lAoskB07Q37/oQ/qe7BLGRXxvx4L?=
 =?us-ascii?Q?n0pJZtGRcEw0ii9b6VX5qoK/veYQhyOj0YaLeSEgiSub480ALrHP2IZstQPW?=
 =?us-ascii?Q?aPt82197LF7OCcIhzRL0NBtxQld/alaojems53OOEoSU55dYP+1OHp+o7WLK?=
 =?us-ascii?Q?+f/Lvzpiiv1h9RFo0j3aqktd4g6Jg4Vlek+gaj/vRd9be7IZCgwVQd0Tm5mB?=
 =?us-ascii?Q?L52RsQbubCb4XqMMdMNkS1oGelRhH5KD9lpE52OMyIYqko8YhFtuhhfsSbD3?=
 =?us-ascii?Q?BFl62yY5dHqnjEpS2ualaYpIKii708KnysobpPY2tO0mpM4DFttS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdfab48-0141-445b-d1da-08da4dcb250f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:12.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axL9Neh2IUS5/kE3z9KSI86wxz+p0c6W2SNICV5n5ulwE7oCnxlio9r5+YkdsXEUNaT6trbSYUph8mqqchDnQbEh4rccnN1yXbpvcvcr9BuFn6FWFZFARtZWOyuMHc8a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3093
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

This patch adds missing SCIF1_X.
Because Document has 2xSCIF1 with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 48 +++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 634ef17b76f0..68b1c1ba2450 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -295,13 +295,13 @@
 #define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		FM(CTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		FM(SCK3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		FM(TX1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		FM(RX1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_X_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_X_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_3_0	FM(MSIOF0_SYNC)		FM(HCTS1_X_N)		FM(CTS1_X_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_7_4	FM(MSIOF0_TXD)		FM(HRTS1_X_N)		FM(RTS1_X_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR1_11_8	FM(MSIOF0_SCK)		FM(HSCK1_X)		FM(SCK1_X)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_15_12	FM(MSIOF0_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_19_16	FM(HTX0)		FM(TX0)			F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR1_23_20	FM(HCTS0_N)		FM(CTS0_N)		FM(PWM8)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -847,19 +847,24 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	MSIOF0_SS2),
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	HTX1_X),
+	PINMUX_IPSR_GPSR(IP0SR1_27_24,	TX1_X),
 
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	MSIOF0_SS1),
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	HRX1_X),
+	PINMUX_IPSR_GPSR(IP0SR1_31_28,	RX1_X),
 
 	/* IP1SR1 */
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	MSIOF0_SYNC),
 	PINMUX_IPSR_GPSR(IP1SR1_3_0,	HCTS1_X_N),
+	PINMUX_IPSR_GPSR(IP1SR1_3_0,	CTS1_X_N),
 
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	MSIOF0_TXD),
 	PINMUX_IPSR_GPSR(IP1SR1_7_4,	HRTS1_X_N),
+	PINMUX_IPSR_GPSR(IP1SR1_7_4,	RTS1_X_N),
 
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	MSIOF0_SCK),
 	PINMUX_IPSR_GPSR(IP1SR1_11_8,	HSCK1_X),
+	PINMUX_IPSR_GPSR(IP1SR1_11_8,	SCK1_X),
 
 	PINMUX_IPSR_GPSR(IP1SR1_15_12,	MSIOF0_RXD),
 
@@ -2210,6 +2215,29 @@ static const unsigned int scif1_ctrl_mux[] = {
 	RTS1_N_MARK, CTS1_N_MARK,
 };
 
+/* - SCIF1_X ------------------------------------------------------------------ */
+static const unsigned int scif1_x_data_pins[] = {
+	/* RX1_X, TX1_X */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int scif1_x_data_mux[] = {
+	RX1_X_MARK, TX1_X_MARK,
+};
+static const unsigned int scif1_x_clk_pins[] = {
+	/* SCK1_X */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int scif1_x_clk_mux[] = {
+	SCK1_X_MARK,
+};
+static const unsigned int scif1_x_ctrl_pins[] = {
+	/* RTS1_X_N, CTS1_X_N */
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 8),
+};
+static const unsigned int scif1_x_ctrl_mux[] = {
+	RTS1_X_N_MARK, CTS1_X_N_MARK,
+};
+
 /* - SCIF3 ------------------------------------------------------------------ */
 static const unsigned int scif3_data_pins[] = {
 	/* RX3, TX3 */
@@ -2533,6 +2561,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif1_data),
 	SH_PFC_PIN_GROUP(scif1_clk),
 	SH_PFC_PIN_GROUP(scif1_ctrl),
+	SH_PFC_PIN_GROUP(scif1_x_data),
+	SH_PFC_PIN_GROUP(scif1_x_clk),
+	SH_PFC_PIN_GROUP(scif1_x_ctrl),
 	SH_PFC_PIN_GROUP(scif3_data),
 	SH_PFC_PIN_GROUP(scif3_clk),
 	SH_PFC_PIN_GROUP(scif3_ctrl),
@@ -2824,6 +2855,12 @@ static const char * const scif1_groups[] = {
 	"scif1_ctrl",
 };
 
+static const char * const scif1_x_groups[] = {
+	"scif1_x_data",
+	"scif1_x_clk",
+	"scif1_x_ctrl",
+};
+
 static const char * const scif3_groups[] = {
 	"scif3_data",
 	"scif3_clk",
@@ -2920,6 +2957,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif1_x),
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(scif3_a),
 	SH_PFC_FUNCTION(scif4),
-- 
2.25.1

