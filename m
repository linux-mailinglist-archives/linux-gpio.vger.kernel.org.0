Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2171656287F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbiGABkq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGABkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:40:45 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640F438182;
        Thu, 30 Jun 2022 18:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVaFr5tqedZaebQTMdNDkOfDf0dGCZ2p8pzVYlZNklLDr4nkErSitZFLh7lqyZjNXYzjOK0FcnOVix2tGMqV9PfWw8DGhGQY7jWe+fnZn+5KkM/5zHMQVN/JlSJQUqN5/W8CVHqeepsaXhhXHvqPzlTp/V0UQs1XfRR7QNQFkCBp6saGULKIZ8Bi0fCbiVTFRvqJjRYAhXR57UUfRLLMaVetJHfjqEyq0EQTwo8r/n8a8RuBsfvABjSLyzUlRIbaAztxYMK7nSuNHL/GkoAh/y+voNxzL+WlQ9SMlBkQb1G04BFXZTXkxyjXDoxS/regCh2d500/+nDdhVsSNyQgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H91nLi9bnBRBhNgLjYu4MmECQFdDIhRiDdFIAgB4nnU=;
 b=k4GlYqop1K7tlSLwfx0hGU1fnYBzmzlDJtIBceznolstWlD13BwcSr/Ba+p2ywy9iZae9rrRW2mAfPVkCIaF3k3KDMKkYv4BF2kUT0kbYbpfjElenVuV2NdA/KXxHPUp89IEbbkf7o5qvI8YLEmQ/3O5CLCFQlBHLpELUY2PeStnMesOMEEPcdwy5ktV9SALI7yHsT2oQAUTvhL64d4W3rGId/HvLFkEjjpbfq0KwPi9xzMeoNgu98NO9rR4uta+6WVvUDOX2vxvdKx3M7N9fDpC1u/xgObwtIRls9RTrDpKCt4nYJzQpqqAhxLUe/FWqAyJVayg9k8VPQglSqev6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H91nLi9bnBRBhNgLjYu4MmECQFdDIhRiDdFIAgB4nnU=;
 b=mGQpwu7p7nK1vS2OR3r4xwRgn9i/pQaQq2HEW83P+u9Z32Oc+k+HniY8HL73go48X9Y7+N5zV6PR7GHFYUaWyvQ02WOsBDCi5isFn7OjqlthOfOyyxnwQq8DyrwUdhCT71tf+OCMjnTHEBQkEYC6JL3ofe72/P28LKjXSGNiNh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:40:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:40:42 +0000
Message-ID: <87mtdtsj8m.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 21/23] pinctrl: renesas: r8a779g0: add missing ERROROUTC_A
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
Date:   Fri, 1 Jul 2022 01:40:42 +0000
X-ClientProxiedBy: TYAPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:404:28::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21e6b6c8-fff2-4591-c630-08da5b02b5b2
X-MS-TrafficTypeDiagnostic: TYCPR01MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfm0KrWQGBFCX/E9KA4bheCVE6VtTTVbUmuc+2eQs7FTA3zdATlRYwtYTpmPb12tg/b5xJSnkvcmQpddJRdcPR5Y35AJktwV/YzEGc3fX6e4cBJq+5Khx0OAFMyWMl7c7ovjIDuGvgrdQO6A1CX4EzxZ0fuu9EjKgAKkJ2gbv9M4XJXO3fezFwdfE9Gmx40asTeDwbIfaHRt8DtpjLR0o2l4Jx60+GIer+qbEucD5Lt5xMAO5Of8muqvK4laft6fvrDae6APjtzCJysqgyas/FXFlRzZo1lASOcutj5xiDoBaEwb8xNQiIEFjqGI3tlt0JIWKHhA17dP1mMX8TvqW5zv4vj4/N3/k+YUfsZpU0sBjMiG+t2sKs4QVmwKBCa/MqeeOMaSmzG9qpA8LHDltLrNTUjcTLRuP+78pv60a8yQZ3Q1H5ChLtIzemlnwePpD2vOuFr5xglN/fuyqQW2Hf5KX1teQwniNljRYJ6cFxOFPARTFG1ciT3y0ZeCJx1Ke4N0s3XwsYy5z0AT6udgKzZzvJPT93eMolkitzIDCxiFGc0Gw5CJomZCHwIwbkGSgI4jbr5Ld2Z6TrTX/0XiSmMuSkXH6emROAaRFy0zlTWjftjT4XonfekMFMp26o84C5L9mtg7SYVeQuqwPk3jgdEqDLO5B/esecps3RNdvWd7UQqekBBV65iDb2JIXPTYYHvUPZ+VnvY03NM0ytOT9XYbfOc/QEpFtxS62xT9v1Mdw3gc6r9CrE9rG/hBEvmmCvMNFblX385WVjb++mJMIP09dVK+51tE+IOkvNQKez32L0Ln39maCnqIHgbWUdB+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(110136005)(54906003)(316002)(86362001)(2616005)(26005)(38350700002)(38100700002)(186003)(4326008)(66476007)(52116002)(8676002)(66556008)(66946007)(6506007)(478600001)(8936002)(41300700001)(6486002)(2906002)(6512007)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ncabNhEs3qfxQyDU4Q02OyR+R8XJ1LFoStU+u7qlZP9WNA2iCnsu5ervbI6?=
 =?us-ascii?Q?Lwqd0y2hFfu+vncOtsmKu8grCIuCi0XashHOAUmBglpA5UmkFuw94hTjDWLX?=
 =?us-ascii?Q?WoLrQpyCbkKk6YOfhUXD9ElHOfh+tVsA5AgynGu2sqPshcAF11JLF2NH/tCb?=
 =?us-ascii?Q?XdVrQqS6S64w11voSml+X8633rQWrelb86C2yGstNOSx7PTREH+eD3hMAnVg?=
 =?us-ascii?Q?09VOKPQki716hm5BvRsCOzrZPNAfUn9HKHgsElGyWRAZu505328MXya2AteD?=
 =?us-ascii?Q?aaqVK/2bfRQM0IbTySIe0o+KjaPvyV9oQ7KLKqEPR48NnNfl5fs8LyawhD2a?=
 =?us-ascii?Q?05N6d8TORoCyLaLgOrvTx9GFmaU0JqRqWqpvUAysu7KTjLuRawCRGSV6UyA3?=
 =?us-ascii?Q?64cybudavZH+KSJVsrjwfu1QHnLK+FWVQ5znnaJAxjzgxT9NkO+m7ZOf0myk?=
 =?us-ascii?Q?EX2kLbL1mgTCH1CMFTsvCWl5MSwF++yxtAKtXz1wdjpz83u/GP4Sf/Tj7H/9?=
 =?us-ascii?Q?d7Lk3nKwmlgLqG6El/mxCMDyDD/BGhx7tb7Th07ZiCr6gWoy9HFVDDq8+cHO?=
 =?us-ascii?Q?Q9xOaD3aIHXqZyU/2NvYnxEY4AvQ3IVWBSiQkCIdevVHCJKUm2kRT/7cCPIO?=
 =?us-ascii?Q?aDMFpb+CEz/zWCatYgrxSwanXd77D6r+EJPiF4Dq4G24xthg6f9RzNt5dWBR?=
 =?us-ascii?Q?THO32Rz/sSRkiHpeKZnG8rUZEDh2rGOwXxloi5+SO7oyoANgmaHFZHs/3Jq1?=
 =?us-ascii?Q?HkAwIFTJepZw+7IfYZQwskAli05yfdDBfPWuwijSu3X2dXPsUmAG2Hgs6KJW?=
 =?us-ascii?Q?VD4ASyWWAbcJTKKscEqa2hIN4CFX76arHvZRnkDYJOaI6lw8PHhWWf8Id8cT?=
 =?us-ascii?Q?rew2HwB3SnHItIQUc0RSm9w4JRD3k+Los8KJ3S6wEY1elw6gWFDTkgjr/SKL?=
 =?us-ascii?Q?T2J4oTDKKaEwWSi3Lsxh1yDV+0GZopTw1VYcqsUP/Tze272PKMLuib1YGmrA?=
 =?us-ascii?Q?pgV6HAehc9KA7/4RoORh2Lbza1O6LKW+8FpIQ+8lLktzgnjJm2wfWMZXoRKF?=
 =?us-ascii?Q?kIDFRt0OGrvusYd3cuA7V9X+Cz97CSCWmPLPVy8wc2AQw7jrpT3rhMWD3ykg?=
 =?us-ascii?Q?un3TzNhCO+lxQK8fYL8XTPA8bVKgOKyXZUxlGoRsHT3IXraJPlRnslAn1fA3?=
 =?us-ascii?Q?kXthk+D0g5s5QVxmXX5GdGxddqFlF1KU38KguwpZvcxKXR44QY9zDtmLlSYl?=
 =?us-ascii?Q?De+dlTb2WEcO8UZkZjL53Zu1WwwaIePgymXuXC5Z/nIrB+sTGejBSB5ok5KT?=
 =?us-ascii?Q?xPy2Fv6BmUs/6dmkRk+c7MUNa3FlbnO7Rbs57nwuh3JpPneuCBPGpvsihFWr?=
 =?us-ascii?Q?4GkuOjdJvoM2jbkK1LOGPx8ul5QKJP4TeZOPxykDGi9cfjLBEidxLiOwdCl/?=
 =?us-ascii?Q?Qau5VULzLhX175rsqHcw55g9u4zsB+kPSQiejj3n2muyTr1tNRLtf7VI+Bth?=
 =?us-ascii?Q?VohoRBZ/EKKT9u0Gp5lNYfCutTYysBrHTd30ZwJC7W7frIgEKz5LH0+7Hi0P?=
 =?us-ascii?Q?kWoMKZzw9lZ5e+UblU8b6jsTazUjxnNe/y2D+s6gCNUsCHFUfCKL2/j5n9Eb?=
 =?us-ascii?Q?24wPt0ood7FoVFwTwrIm0tA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e6b6c8-fff2-4591-c630-08da5b02b5b2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:40:42.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqUzyz5NzOPTI+taL0m1YG/dbvgX8lNqmOWgTbE++GXcce4iom0B0MQSVND7eld3OnO2hlHUJrhdXyLHCF69PzJo9KIcfCSINzy3TlmmjoBEWUXOFpduDgRAHfT+PLib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8850
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

This patch add missing ERROROUTC_A settings.
Current existing ERROROUTC should be _B, this patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 2e84d2eabee0..9ea31f3f01e5 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -270,7 +270,7 @@
 
 /* SR0 */
 /* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC_B)		FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_7_4	F_(0, 0)		FM(MSIOF3_SS1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_11_8	F_(0, 0)		FM(MSIOF3_SS2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_15_12	FM(IRQ3)		FM(MSIOF3_SCK)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -377,7 +377,7 @@
 #define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	FM(PWM1_A)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	FM(ERROROUTC_A)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -736,7 +736,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVB2_AVTP_PPS),
 
 	/* IP0SR0 */
-	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC),
+	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC_B),
 	PINMUX_IPSR_GPSR(IP0SR0_3_0,	TCLK2_A),
 
 	PINMUX_IPSR_GPSR(IP0SR0_7_4,	MSIOF3_SS1),
@@ -1002,6 +1002,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKOUT),
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKEN_OUT),
+	PINMUX_IPSR_GPSR(IP1SR3_27_24,	ERROROUTC_A),
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	TCLK4_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_31_28,	QSPI0_SSL),
-- 
2.25.1

