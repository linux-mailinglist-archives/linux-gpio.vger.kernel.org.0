Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B5854A928
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbiFNGAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238641AbiFNGAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:49 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ACA3AA4E;
        Mon, 13 Jun 2022 23:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKtHuaEPPjYCq67km2P3BMnjpjggLS631/xNhHoFuZ0TGv+cCw16lIFbVRweGPs1nL7D1NLLOh93XAIVuwfPJkQ9XxBJo2vtVnuQeZNmXOlfzCfjCBnuicjicf7n/+T2DzSvHbTv5SgI4qbL1uCHRlBqN9bdouutZWTQdJal0QxJVNlZx5+U88z2k/U5gpnBHGW69745laLKEt6gO045pVLdSXKzcHT9LVznOLvFxoQ/TW5jDt7fzNeMIuMkKT6/a3NANBBkA74dabWsoshsziin3/ZUlDwtlDLcClZjerSYbWUkGDBEMYWFjfgVR5VhbbqcuzO4EST9XHBizFsIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNZBF8ln7g6M1xZSGY/6TPREWCcVGoq9r7jD7Ot9fpk=;
 b=Eiq6ERxC8Fh+2llqPVDVKessPt3aUBPqzGY6Sk2KANTFgIE8D3WgAQ+5o8utZoEH0mBFG1heXgERmzwZnGNuNn6H5gbzO+6qmrA0i1Pwhs38UW4qOKroPAOjn6fCGPtv5LCu6Bc96oP+96Me/x+Ytu83+wwMDn/91GX1SzzQlTMfCUvW3royaiKN102G2SyZSHLt6A+EttUXt0JdBVdF9rJ+NVd5GqWc85R2YNv+1AcJ3DV0Yg8j2zjeoNsIJ4775J3BlWs2ZgKIqyhOGurGqLpEYM8ZvkWBZCEmJsL5qmnNLrqNVpKc1bOJYf5oLY4/Tm2chwsCO8AKNgML7eoB+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNZBF8ln7g6M1xZSGY/6TPREWCcVGoq9r7jD7Ot9fpk=;
 b=eQ2M3+XTsxCNEt4RGc72A9qUDXOfZU3KSKgKNqehUKMrtPEXVCTnXWG2mps9l2DNvJFzlVAcwZOzv+qL1i46qKogiowZGkyW5b+qIogEP9+XZrWf9IjN3RdzYcjiL2oU6vze2JTT8Xq8r43mtFzMn+R6P52q9AjAO0QDJnXlcj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8394.jpnprd01.prod.outlook.com (2603:1096:400:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 06:00:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:46 +0000
Message-ID: <87czfbkcmp.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 19/21] pinctrl: renesas: r8a779g0: add missing ERROROUTC_A
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:46 +0000
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 499163c0-d190-46ba-999f-08da4dcb39a3
X-MS-TrafficTypeDiagnostic: TYWPR01MB8394:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB839428BC0847DFE1122E8369D4AA9@TYWPR01MB8394.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8ho5MAQx0qEeTmIbsli4i1BKG033CYIyJkUArpV+El9xv24wkMdNMSY6GEENvnAySlw+wob6KgGOow3C7pYWmyrMDw6EC2/JoYEyOZOg4zT3Gi4Roun0OAUSex2tgsofDB8QHLZUOoMTPl4qo46m0HIS9ltkOiWdqzT2xTk2KY9SdKqdsK/pi2Bbc0D4vtp1VvBb+ONeiZDvxIzHVta8Rfcmmz1G86q6ilE/B4cimXg+cWwmZbioHA++SSmOgo4IRyPzzst+t/1DYsIQtoivRNV418qvrPg4UDClWLHptJKc4MCNNh4p5zZz/RxSq8pI5CpPIdI/ub0/u1OiOmhpg2JdWy27zQmV9A8IV7EHNbKm++1h6qXPwo49YbFygxMHAdI//a3j0AjDIV4YjQyOIa14IzPC1ycttCt+uMsEbxQp3jDlLbj5FAPg7KZGnatyRzQVBL5ObR4a1kfwJasQteMKtHy25dEpgYnuMS1t7DWjgX72XXWDSgU6LnM8192wLKtNidakDNHfbZSZ0GFsT0dTyyrGo/SMXjFfE3mdSqvmAQw0zqzCWcaAtebN5U7aOz1mP7AYaaNR0dJnm8f+iWWgnRJcg+UtdPYYbS1bvUsROC/a9ssatSlxMEIY7VG/VGxVDGTUpGKWlzYN2s3SHp1eO7xZHopwnqlM4hELH3jNwAALllbsFHPstH7Zp+zifoaox5XOVfMhjKvKIMFlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(316002)(6512007)(8676002)(2616005)(66946007)(38350700002)(508600001)(5660300002)(83380400001)(186003)(2906002)(6486002)(8936002)(86362001)(52116002)(26005)(6506007)(66556008)(66476007)(4326008)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TL/FcyTWlEJdX8JndzpzxxUd8v0Dk8dGpT09p9E0/6INCHc7W0DL+yvo7Tpv?=
 =?us-ascii?Q?Z4/kVy6SBdnrsoLgKTmWyZw7Ob+U2SX8/VYK/W1NLiRgqwdHnBEWcwZwzNB9?=
 =?us-ascii?Q?TMFMI2r/j5BHYRdi5pRqyM4xA/34mUhBYjdXUxAuwt/reYpcTv19q38oPimV?=
 =?us-ascii?Q?hPUfLMWn9wRVMcc3JieQYQy6TzTmcCMtU9COrfOJzos20B4qXAYV2elUaaYW?=
 =?us-ascii?Q?jBn4i406+tA0kEozrQaVcj63UgaIi7ZpHc2EF3AwSVcLIt5NKogRzDByq2bc?=
 =?us-ascii?Q?Mnc1LJwauk/gK1MsCZ2lMvt4UPV0AqrAxhZI+591MUUg1MeZ5cSID7Hrvy6d?=
 =?us-ascii?Q?4KQWYylJlrjL92+5S5kGO6Qdnor7kSyWMfjt8yA0KhZ26S+BzrUM6U46J1UK?=
 =?us-ascii?Q?HO8QL/p0G+i2nj5/4FFErNhsr7R6XaPWlcibfBnodn1WjowqP9m7GcL4m2pV?=
 =?us-ascii?Q?/8NmA7mrcsBYqepKlpJeKqqPvqq3aRngaBrVlscQXPY8ZwFkJeYiv8f2zQsu?=
 =?us-ascii?Q?J4Ws9Ozz03i9V4wC2qiiSwEkYZtulFb9apPr0IdC+34SRk8yXkZ0gtcLYNDj?=
 =?us-ascii?Q?t2SsDmgYJ8PbHTaYnN3gQG6HasV9P8OXR+ZRlIXalUFvpYQtREyZ7dAcME+W?=
 =?us-ascii?Q?wnbBgdiKo1HR74KKkaOLTkQsyN3Ycr+X/z8+BQQ6QF3auTFFvhJHNYAocJWd?=
 =?us-ascii?Q?ZCHotDKot6uM4ITUp/PqNZpzXqhZZsi8XEVTuFyoNiEmK+9DcH193X+TAG/e?=
 =?us-ascii?Q?4p+mq/cQePusuGMvaGashYys4UXuNWnrSpT3opkG9x7JwECHx4msT26Y49D0?=
 =?us-ascii?Q?feLF8oJenaIfjoc2OJpIpCz3OGM3NH+cPU7ZHwusPSncwwb6s60vaLjNto2+?=
 =?us-ascii?Q?w5r7xDlpfyk/7Ohz3i0kB+TxRjkpU4siHnrpP8zRbHqFLmthLUUkagLrq2vK?=
 =?us-ascii?Q?m1R80ypxu7ByQAunzbUxm/9UlJognwYfpZLtD6M+ISXVzxCdOLWPQHCp5usn?=
 =?us-ascii?Q?wu5T/dDqAWNLtarx/OSar1VTgOvHd4SQ6kGXaZ3jWXQnNx91sv+OUS5TaUR2?=
 =?us-ascii?Q?Q8XuytlY3X1610fhYqpTxLv77buLIMHBDQ49T8Px3910N2EUaf7NG0vV8zUV?=
 =?us-ascii?Q?nEJI//6DgvONv7ExSvpPN5jy9x0fNc+k/6umDdJAZIW7FCrH5Y2dDvD9KRWn?=
 =?us-ascii?Q?1gJ8dDktDQNFwFTrQALWpeNR1VsSpqb+7cy00wO6wFgWGeopYN1iVQJ1E40J?=
 =?us-ascii?Q?q7y4PhjZEfj1JOHYu9ABTzIsegxKyHSmFe+eAyeph09yzbSGF5UZTlBTuJ3t?=
 =?us-ascii?Q?13Wm7xi7ENrnpH6wN9VSlFd3NsuCaUy2ygYGgHGHS8SrMsNjFMXT0DhNpobb?=
 =?us-ascii?Q?3kMp+Hvd3uoqU9CHGHzMyFIoq5K1Q5UbCRlIoeKT9FcLW0SbusWTxwF2yY9x?=
 =?us-ascii?Q?M+1CtfzC+vWYzOMvvWDW2WtW1wFgBPtoica2YeWWJdI+i1cLlx8AOELtZqhD?=
 =?us-ascii?Q?S+3Ua/Pz1Q9fcxYp9mS+NiBAFFyMf65uHbgcTDiVeAwyAQPSJZahzAVtVoXk?=
 =?us-ascii?Q?50nQE9roT8ih53x4Btn4Ar4qhApmC8SOSfjt3Xgh2uoZtVaDED539Fx0frTz?=
 =?us-ascii?Q?nvuMm6GXv0mWTQjVtPGePLsYatU4+9qKXFk09+/OgJO38JawFcDfrk6b/QR6?=
 =?us-ascii?Q?TQG14faqWu7iJz8P9tQ0c+DhFgmoQjvcLcZYHeXt44aAk/PkHNQLK570NzfB?=
 =?us-ascii?Q?NFyIA8q+w4qBi+fhQ4hzr3xhRVTHmJVufB6497tHR0SU3MwaYycA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499163c0-d190-46ba-999f-08da4dcb39a3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:46.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zMC07JT3GwTHxSOziBY3XB6ra8NZ9juuz7mJgx6GOKHPEC9HzPHGUZpptlnieVmvlzgYwLow/QeXylN4tuppfGLyjLW/LDLeBjEoZ+Z0AW290yqPxFWv+5GE4IL5DfA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8394
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
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index ba9489d1074c..06a1b08a3cb7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -263,7 +263,7 @@
 
 /* SR0 */
 /* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC_B)		FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_7_4	F_(0, 0)		FM(MSIOF3_SS1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_11_8	F_(0, 0)		FM(MSIOF3_SS2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_15_12	FM(IRQ3)		FM(MSIOF3_SCK)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -370,7 +370,7 @@
 #define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	FM(PWM1_A)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	FM(ERROROUTC_A)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -765,7 +765,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVB2_AVTP_PPS),
 
 	/* IP0SR0 */
-	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC),
+	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC_B),
 	PINMUX_IPSR_GPSR(IP0SR0_3_0,	TCLK2_A),
 
 	PINMUX_IPSR_GPSR(IP0SR0_7_4,	MSIOF3_SS1),
@@ -1031,6 +1031,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKOUT),
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKEN_OUT),
+	PINMUX_IPSR_GPSR(IP1SR3_27_24,	ERROROUTC_A),
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	TCLK4_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_31_28,	QSPI0_SSL),
-- 
2.25.1

