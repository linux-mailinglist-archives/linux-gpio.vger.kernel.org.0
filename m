Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228D554A914
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238457AbiFNF7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238080AbiFNF7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:59:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864D53587D;
        Mon, 13 Jun 2022 22:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqilGV+bec8zt59sl8dfOxiP+DbsK4KjYxREcSVktTRgBeCCCEv4GcFf1FPGcydTZfZVKhn3XEy7gVHDMJyEu9kDFIVictA6iPnLLQ8GgF2bAhNQHpFcQTizyN0Dk0Bdcz+w+Xzt/l1RcTBcagpH7trPKv2R7jS2f2eyt3fCKQtBV1pz4hGrFKq8u9T47SiC/SCRFo80BIYBKgbszsVJLhTKeQtrUtF8DwXccq8zpArTC/PTvKOWh2H70wP+beaKuEeCAh81SOCoD/BzjUWHQMaUp0nCC2ZYveHanInQuuh+8dj1Dchok+v/MInowjBrRKJX4NyswbZxcugc/yr+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICTFAVGcO0ZFEbsO3mEoW2ayFTITgAP4R7h7sreJBts=;
 b=khy/JEfcY+mE/kK16lSVFtyln8af3c7Qmy9qGgGOfkPKDExcyfUeOW95s8Sy1sY+Enhd+AEoU7CX4UwQHKyvpUbYNj5MQrpYWLppI8paXO1qU7Iy3oU4VIy2iblZg221irpIbfgXZCduz0bqY1QbUZSmKknYmEF6oMFMo/4/9jFbUKav4k1J07K/Za1Kg70ize3w9jY6EqIIA5SuS376t8VrRK3NXMaRSuqeqTBAjwQ9h1+iAptj25UzQbM8FhfDM0ViSElETeWpzAGY0CkCPfN+e5Xb8Iof0dGaUsjG2y4+qIUYgOhV2dCKxh6b3xFc+qEbFV/B91DoR3VAftLapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICTFAVGcO0ZFEbsO3mEoW2ayFTITgAP4R7h7sreJBts=;
 b=jNgLhSfmcjoY+ytyDQRsmrWiPCKQW0vPtYNFlpztKmgzurG4KGXyM7kTFM2FHD+NYrwoz0nvSZyuAycE5gByK4klVXV+Q1xjZ8sN4msVky3Z28rVYbavKeoyCWzjYF9Gw6lHgpsDq2g8nSimHSAHxK2O0FOEdw3QLTL5iyQe9ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2142.jpnprd01.prod.outlook.com (2603:1096:404:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 05:59:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:59:38 +0000
Message-ID: <87pmjbkcol.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/21] pinctrl: renesas: r8a779g0: add missing IRQx_A/IRQx_B
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:59:38 +0000
X-ClientProxiedBy: TY2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:404:56::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fb25ee7-9736-43ec-b986-08da4dcb10f0
X-MS-TrafficTypeDiagnostic: TYAPR01MB2142:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB2142B72D686B8FC7D187144FD4AA9@TYAPR01MB2142.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IffD/VMiJKL4Me0LeM5eLDLtGSljBV6hXAChT9+NAtPRCzGEJk88ZN8RQJpKGwO/Q3EQ+yPTj9UtRgA22ww5GM/lE1KulYm8iLRJqBN2F5rWqUZma0InYf8z6aUUPXlPL1yCrSo8eN6cPbXr7HG6BgK+O3KmxImoBJMowbBi3+q6s2m3F6ZJMeG/s4jLB/KWfrjRd8vv3R7lRL2kIPqYONhWKLwJ3/AiXYWVyVWgrRTHnCMxn70e4ioHy7IhYi6sgZJtMCRiH/Jg8S9npxgKiOjB5QdA5AYOHJ3pEgrxPeZE/DO7nYoVDOyjse5UBhf3unb7TJP3NU7r9KIFH8PYEg6+6Ptuu6ZuM+Xl/8uZcamp+mMUVztkqXa1gJpmsPqiM6JaTfkkTGAtH9iSj9DhDzuKWlDoG5xnQYvYbpmLmFqyok9YNYzGU4u0GSTJ4bbcai/j+HtQZQvcQv9bEZRpG884iamLfFCjkBjZr1xYBC0zN2F/0A7ra1YR/VPgc7Tp/HNaGfYQuPugXV0UEvVgYU8d4TMRDS6rTXFR63BNbQ146oRZnWc3JW9fWbXUOf+wf6x3IwjYXnqO0zuZlvhb8XXqf4A+2Xw+gZ6la9+hWhz4LJ4Y8iJCvfj95CV/rKLi7aDhgrcPykWetfxhgs6Y8wTVMYUejpfp+m32Iw0xKTUERYp/e/eN1Ef4lkpYjVHVGjDKB5bHteKGAq+5k9U9Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:mt;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(8936002)(8676002)(4326008)(66556008)(38350700002)(38100700002)(66946007)(5660300002)(66476007)(316002)(83380400001)(508600001)(2616005)(6512007)(86362001)(52116002)(6506007)(186003)(26005)(36756003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OvGTYZkz/Cx9i8AWtZnfTIAeBoP3A4Zn8RoLf0JeArbu66XgsgBL6/YVQ38I?=
 =?us-ascii?Q?cUil5gAUG/Adzm4UY5HjA5QWkL9SOf1npBeI5kHSu3pGUlSfVLffxMk/kqjS?=
 =?us-ascii?Q?WlKNlkOFcw5Sqc6lqMOtcu2Pa8JJpelbKIN2vvuCdIvjuv8LYCpBiw5pkabS?=
 =?us-ascii?Q?QkHU5T+pbDM1IQz0a0WjXvQp2cCN0i0EULY6KqVMxv3JGjBbW56QjAj72EsX?=
 =?us-ascii?Q?PHb1Sjl0JpeNntdO3SjxoR8kyqPgl1ir741N6+bSCVG1/TFlmdWaA9EGbid8?=
 =?us-ascii?Q?rYx75lf/Amvv1BaKyR1Br6X8GR43Wi9Hkql75LF9yUwp0+pnNbPgS7cQsEkC?=
 =?us-ascii?Q?PXE9Y+qqv81w537WGRC27gyzZScSpsYmQh5NYOd9wCjLmWeF+LRV5SssDUNw?=
 =?us-ascii?Q?uuQSojnw5v+SnPYa7tOp/ns3+jlqykwyrgHVV8mTliUlPN4m8IkdAMoFMGXd?=
 =?us-ascii?Q?G5TNh+BoIJfLJocaYooauoOIBD0z7Zc9Kg+zGG4uyDAtJSIEiZHLSrRvpkaP?=
 =?us-ascii?Q?lAntFkqGd1TRC6ia9hxQGHf/KFkrNo+EIp8WVZcBpcV/NmkvbY/bIdoYE6OS?=
 =?us-ascii?Q?x00E/BA+PLaM5O/Jb01JOGZT/elbzI4JqaEnfnwslbq4Vq1fSNld6uaEqBR9?=
 =?us-ascii?Q?1k7/edxB+smU1iyOrlTR7d3wENkxzZauBMD2UfefO17N0JlYZ0Pfj4/Y11qO?=
 =?us-ascii?Q?EtjW36s3Rv3N8nPOrWzRXI2f3+UEGGj9Ip9b7EXb+AkR5CAg2SWgvQ96YhyJ?=
 =?us-ascii?Q?bFVRkQqglGyRqenherNg3jMOK1D74+0Z3ICyRsCWh89QJlCtRSVIu+NiuP2m?=
 =?us-ascii?Q?L9w/4uuDalqx9BWnWNTomAit7rgd3oQDgoO9XFBwUyM7Cfxs0kL0wJPif8pc?=
 =?us-ascii?Q?WXeITvoBsxadEoqaoqFIhC7vlRt1sx3i6ru9Jd6SJcfJswdYgyOW8TZJslmJ?=
 =?us-ascii?Q?8CNhzJCmmGzkMzab9kAXwtHBj4O5CzzDJDhoDTnRAq/f2nNDtHPvr/mAMXly?=
 =?us-ascii?Q?uUn70Ap++UEhXaAkp2+cXZm70OlV4IJMqA5aFZ/Iggl05FBupSMbcZKeRp3F?=
 =?us-ascii?Q?Ko7M70dXSZFPwpGQRF/OVjs3jCd8GpkzUtmuNwCLCB+7/HkYOs2e2e1OtbbL?=
 =?us-ascii?Q?gOBUBKzkSEUbj4FUGeeTmqH6Ox1NusTkTnvqee+f+ouK0vA/bwMrdcNqoLr6?=
 =?us-ascii?Q?KFypF+cRXgDgBMjtYZVIRGO1tjsya8hwzLBkSviUmKV0D9rIgwI8wVSgZFal?=
 =?us-ascii?Q?OQPkasuOct7ycPJg/xrl7xPHwWpTSTiH+YtAFnMBYgzTjmYMNe3j5gq830St?=
 =?us-ascii?Q?NcgM6+jntQ4rG3gAlV9TsI/1Gf1cnR68Kfg0nnU3kL4X+0T/wFvz8OsFF7BB?=
 =?us-ascii?Q?Nc3kOV2KczxZM/npIIeZcryGeMF/9feMf7B7K27CiItdazGarwryBnODiLyr?=
 =?us-ascii?Q?19wSulJzSO6dUQJ5ktMLib8KxTMn2QzpRpJxHocKOeBsKcIerUg0bEO6F6Qo?=
 =?us-ascii?Q?eAOk1mU1vkDrLdl6X4cbsrP/d+FynlhxXTETfbB8qUTSo7qy4fGN6q+Mc92Q?=
 =?us-ascii?Q?6HmtJ4o5KkMmBNyI/QTNRL4ovdJVW1cHdGVQEMOf5AVARt/TtMW5r3mOrrBN?=
 =?us-ascii?Q?7VZr7Bc/olmQr+JXlCdsFnxavIOz5uzDzKPAhPrnvyYHU9CQskUJEdp5PIze?=
 =?us-ascii?Q?dSoOQVrMcROuZ7L1YG3a4aexo3srIbrFFs02TUR0MYRnXwlcIl+yaZZxprsm?=
 =?us-ascii?Q?rXfDX40KuEfQ4k2KmbPp+R0v750ihSQEHWZ6bzms7qNHo8AZtRXq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb25ee7-9736-43ec-b986-08da4dcb10f0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:59:38.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOe7UuCarKqSxFbPso/8ir6MCn8qzRbbctHGRW7+UTGrBWswf1m+r3l2ZxJ+6NC8jbE1jD7E6a1YyWE0I8k9CxtUn7bcBcysZffyFNFRJlyCDOmAHh3mGy3uL9rI7rZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2142
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

This patch adds missing IRQx_A/IRQx_B

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index e70e6aa82268..4e4ccbc32dac 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -278,7 +278,7 @@
 #define IP1SR0_11_8	FM(MSIOF5_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_15_12	FM(MSIOF5_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_19_16	FM(MSIOF5_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		FM(IRQ2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_27_24	FM(MSIOF2_SS1)		FM(HTX1)		FM(TX1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_31_28	FM(MSIOF2_SYNC)		FM(HRX1)		FM(RX1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -313,10 +313,10 @@
 #define IP2SR1_7_4	FM(SCIF_CLK)		FM(IRQ4)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_11_8	FM(SSI_SCK)		FM(TCLK3)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_15_12	FM(SSI_WS)		FM(TCLK4)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_19_16	FM(SSI_SD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_23_20	FM(AUDIO_CLKOUT)	F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_19_16	FM(SSI_SD)		FM(IRQ0_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_23_20	FM(AUDIO_CLKOUT)	FM(IRQ1_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP2SR1_27_24	FM(AUDIO_CLKIN)		FM(PWM3)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
 #define IP3SR1_3_0	FM(HRX3)		FM(SCK3)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -330,7 +330,7 @@
 #define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX)		FM(IRQ5)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		FM(IRQ4_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_23_20	FM(FXR_TXENB_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -799,6 +799,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	MSIOF2_SS2),
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	TCLK1),
+	PINMUX_IPSR_GPSR(IP1SR0_23_20,	IRQ2_A),
 
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	MSIOF2_SS1),
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	HTX1),
@@ -869,14 +870,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP2SR1_15_12,	TCLK4),
 
 	PINMUX_IPSR_GPSR(IP2SR1_19_16,	SSI_SD),
+	PINMUX_IPSR_GPSR(IP2SR1_19_16,	IRQ0_A),
 
 	PINMUX_IPSR_GPSR(IP2SR1_23_20,	AUDIO_CLKOUT),
+	PINMUX_IPSR_GPSR(IP2SR1_23_20,	IRQ1_A),
 
 	PINMUX_IPSR_GPSR(IP2SR1_27_24,	AUDIO_CLKIN),
 	PINMUX_IPSR_GPSR(IP2SR1_27_24,	PWM3),
 
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	TCLK2),
 	PINMUX_IPSR_GPSR(IP2SR1_31_28,	MSIOF4_SS1),
+	PINMUX_IPSR_GPSR(IP2SR1_31_28,	IRQ3_B),
 
 	/* IP3SR1 */
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	HRX3),
@@ -912,6 +916,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CLK_EXTFXR),
 	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CANFD5_RX),
+	PINMUX_IPSR_GPSR(IP0SR2_15_12,	IRQ4_B),
 
 	PINMUX_IPSR_GPSR(IP0SR2_19_16,	RXDB_EXTFXR),
 
-- 
2.25.1

