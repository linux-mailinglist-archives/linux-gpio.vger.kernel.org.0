Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1CC562868
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbiGABja (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiGABj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:39:29 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CE338182;
        Thu, 30 Jun 2022 18:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRsgiYuWIJ8228JpJlQgBALqtlcYeHHyz23IG+rq402ht/RbOWIdGDy/a+kJDn+37FfQWC4POc6Q5lj1Cxg2kW7h4gjrXsC0bH5SpRWDNUTxq6qzQKUhnvh2GBFq/DKfi1SVCCc0kTOnq3TWeiryt9EoGyvxq7qYkOb2VGXXt+dVJtH10aZRkCszWu40KfvAx0hUo9vaOr1n/d37x10fBNBOgeLU7OQSNbY2Lf/LOyte2J79iIY8KdqEEIyvDgAkHCm23E5n83VZMrM8+gTSmuTnA4QpOEbzYfhhOFTvpRKWjcctocpe0Yt3FosnNVUXEvV7Y1SOscwN7M2+WnX0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGugNRMBOLPIQu4uOVw7giKzz5xyIUIXJipfNsn9iYE=;
 b=lzAVXvnuguwFcEtiK4cf0HXOzNiZkKUW9tlQcdP/4fBO0/aTjt2BgHvaRl59m6VK5lFHDi34Oewcn24IF4b1+rcLwGRZWyFHmvJQr1ZCAJT3fabqbnGqJ05ZcnJ3tuY2Q3VWjVfTP3IY/o+zcJjpmVBPppAIaC8V9UMpRzmUh8cM6pL7GpsPwTZ7dgaNdY5GcU6Y1z6TOE/Bgqz8aRnaiUBWF+p3Al7B8fSurXd7Kds4f1CUbi7KuVh6te74xTboYqH+BQoByMZE27T4z6fhvs3A60vyYvVINzTiAkWfaEn7aWl+cdX6ALNe3T1GVNb3AoMDHB6KFkXmTjytN8iLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGugNRMBOLPIQu4uOVw7giKzz5xyIUIXJipfNsn9iYE=;
 b=SdaBUkxQgnQyDqhoFZG+cJeXFSQTZf1leMS1u4FJwlqb+LPo0eX7kyWpseGtyFpLaF+mJNA5ohcwsjPURUa+O5J+slAO5bDl7RPiR2YyUVX1HuT4cxSA7oHbkt4ub1m9S9jAFEgJOXQnYoei3RXh+Yy01aXcuf8pQ2pER2onrmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:26 +0000
Message-ID: <87y1xdsjar.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 13/23] pinctrl: renesas: r8a779g0: add missing HSCIF3_A
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
Date:   Fri, 1 Jul 2022 01:39:24 +0000
X-ClientProxiedBy: TYCP286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1f4f5c4-7e12-4f2c-e105-08da5b0287a2
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVOSncx7kMHKM9pfXv3F+YTO9prn9bErBmXVIRj5j0ljW613IHbw+9JM//9D6Yz8abg/YG3r4TY3JsrE5MobrWTa01Uv4CkrmQhzx8T5ZWGPjyooWUkeYYCm53eWpMHSx4+3jtgaW1Evq6f0TySZwfP+AgUajvmketSn1dtcAe0rO1WicMHa2bN5P4Z3MN+ACCrqiaEGrQKuwm18ky0rVg23zOJHhB49yO0cVkN2FvTabv5oRcofxsQVRMz1OcNefDLu3YyJ4qGZKrkvNcFG/ewOSRHImb7YMId/ddZxwxPrgXaBA5di85Eb298Ou2M77/vVZkoFDUkcnbwZ+FVAy4ZISJTDQTNE1dva4R/JgPwuKGjQN2QgbSRwt8L6InQ34xPpNcRMcEhaIst5AjHRdsrQiGYkCkZ9bQLB68L4Bvs+CTdHs8T2t61rajzUFRMfw3fG/UQCZAP9nzJ42AsnYwpTwLvVobo+OBD+PylDlcesZKqN5EUMc1EcBFpuhlWkEPbzyAaHOzyy0unPpOrPA4vuEf/nXzg17ZHc4L1NSPwngATMy9/7zyJnnwTxBYNwDMg6F1smJ68eT6yqmn7weFKONg5vYr5WVrDJf46LTe5DdvcuHtPWXvE+QYS0sC1dvVjl15U02tpDqMfu9mlbIh1flgAUeCpzS3M62lKLwIvCWyP+Ua6gzhL/SPwVFpSEFhiKvCUpvj9kfgN6ddoqJAW9fM9DK+PatQSAbYrGrHK9D1VDU6ssIQTbwD5MqK6Z21BN1Yh9nD9hZaJ96Ct30W0b+JJ8AMaxKymeicZkfFTgPk4drHjIOPRsYJn9IfL6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0mKZnEI0WQvH70cgCjtpdja/n+B2kI7GBTIYKdUtc2ek0nkkrBamU8CwlQ9?=
 =?us-ascii?Q?YTXf+DC/UZSCzI6j5sboYBIW4mj16nDreY2wgN8OSjS/zK+POfBHGce0rPMv?=
 =?us-ascii?Q?f2ShZtDGtN4EFH6ked2rb5b2CM+JRDD0BJS5aWrXfpZpy34QdMIpJsTiZqbN?=
 =?us-ascii?Q?QTiKHzF8Tv8TysUY7dK/Lq8DxCjqTFquzmfaj4uF/lwfI7knuOpjOsXxnQeQ?=
 =?us-ascii?Q?p5OrJnqKKKxMnP95cYzJGw4jrrp3e191fgvrNydUB8cgBLyDrD9Nq4CWrjzw?=
 =?us-ascii?Q?ho55DVaOg7Du2+4UKApTTM5F7U2AT5UlOUJon3tCowO1EZ1o7nnQg9e4kUQc?=
 =?us-ascii?Q?mV9sa7xGHZAn4oWR57BKONZFJYJBUkONvkQoQ9VoMPGAvRv62ioV7PtOaeBC?=
 =?us-ascii?Q?ahFwfeNAP4tXB/m5eMFMC73TCw/9X5O59GOztoPnPwyeTmeROeURA0mjZPHo?=
 =?us-ascii?Q?quoSn/KouILOb/1La2cGlJKo/QI0aLagPxKkEOXTeiHvzfcbFG4PAaEGYJVH?=
 =?us-ascii?Q?G31DeEI2KkxxhhGAD0QDWvNm75o8s0BJ97WcAqYTAgW3wWkJtdeF33vMF4B7?=
 =?us-ascii?Q?LhEc+vC3SkW/+1BAit3tGYI+9xoTOGWcKFThGopiXvyHw+g7NBdTeTmdxPAI?=
 =?us-ascii?Q?uSZmlCjiMDs6czvtF37S1esJ7TYQ+6APxXr620S4Fhz65YErnLS30YI/HhxY?=
 =?us-ascii?Q?PANttAYP1X9BV+DxN1vDWFh0Zayr1sgyvOYUUYOjwXfGthx0564oXAPkGtm3?=
 =?us-ascii?Q?ecHNKnTgPfg5w2tlFQTkppfgEfLCXx9hykBCSy0O+2k26dVi0bMua7Wmu+Oj?=
 =?us-ascii?Q?M3udEQnEIEeBQgfE3jFeDySzUj4qtn8WZKEATYu0eGfMoFMS1u0ecse+8Jcp?=
 =?us-ascii?Q?4SbSCktM2tW9yJ9f+xXfo88dPvtw9r5UEZ/5McR+ewWbsgrlMBaon9q0MNpu?=
 =?us-ascii?Q?MOn58lyRjlI2S6M2YPpORII8dfOmSsGIPKP/k4etvyB0RtC14iN8orI9LgN0?=
 =?us-ascii?Q?3swy/pnZftS/WM6a0KkFuTvzntCqg9yG+GP4tu7TDDYnjhJvCO9i0Z0JWfPj?=
 =?us-ascii?Q?Q5alNftVXtNea02Lsq8MhPNTjOn9anlLG408s0RP1IW4x4eq0rubRR4/cGb1?=
 =?us-ascii?Q?1sWWGkHc9vwTsHv0h+spMgytIImIv93ebk2o9GD9MvrjLUnqddLotXB0qxBv?=
 =?us-ascii?Q?LoEtUjZrSGXIduxTi9QPeKxt39F4PuK/cM7Djz+sNiqhEtbQ289p2JTSxOQr?=
 =?us-ascii?Q?C6Y5/wIvtd/n2dp/436vXtJ6NUpV7yPS4k6w9hmh2yxHc3424Qc+SnY+/qYu?=
 =?us-ascii?Q?fhbMFGTeOEh3FGBWouhxWyCDucaNC2tn/chs0e/mgV7Z7iQNkIaMbZOg+rWE?=
 =?us-ascii?Q?fUuYBLeK1IyvwOuStqFj2vjIaZr4ofEn/mKjvTfbDOkgyqv6U2RAfgGcdw9o?=
 =?us-ascii?Q?Q4H7yv4LMknb8UkYRtK5qhFWK4wVbf3SAvzxoqKI7g2KEC1iDuNJd7wB2LSC?=
 =?us-ascii?Q?XERoutGOEgSDxc1hGlijfAFQQFh9nD6FFKsTQz0r9eRvMbP1YkAAjvBzYkEb?=
 =?us-ascii?Q?KWQK4bhgSw4junz1KNRzHtKbCThHKuPjoaW/BCsHRaQJoivLoeJ90wOyHI2Q?=
 =?us-ascii?Q?xLTG/n3/j3kZ0inFMDE47YE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f4f5c4-7e12-4f2c-e105-08da5b0287a2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:26.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DomoWrGaot9mnXWxidljlTZ/EXj2vMXJlkPZ1nzXugavOz8OBA/Vv0VGCOttE8WeNhvi9AXg8kD9CDchgAup++/RATYzs9R5k/WMChz4D0B4Kf/9lqzyfbqjBdscOT70
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

This patch adds missing HSCIF3_A

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 56 ++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 579ad8cbe890..8a2dc7e9498c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -296,11 +296,11 @@
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR1_3_0	FM(MSIOF1_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_7_4	FM(MSIOF1_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_11_8	FM(MSIOF1_SYNC)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_15_12	FM(MSIOF1_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_19_16	FM(MSIOF1_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_N_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_N_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_27_24	FM(MSIOF0_SS2)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -795,10 +795,20 @@ static const u16 pinmux_data[] = {
 
 	/* IP0SR1 */
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	MSIOF1_SS2),
+	PINMUX_IPSR_GPSR(IP0SR1_3_0,	HTX3_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	MSIOF1_SS1),
+	PINMUX_IPSR_GPSR(IP0SR1_7_4,	HCTS3_N_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	MSIOF1_SYNC),
+	PINMUX_IPSR_GPSR(IP0SR1_11_8,	HRTS3_N_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	MSIOF1_SCK),
+	PINMUX_IPSR_GPSR(IP0SR1_15_12,	HSCK3_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	MSIOF1_TXD),
+	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_A),
+
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
 	PINMUX_IPSR_GPSR(IP0SR1_27_24,	MSIOF0_SS2),
 	PINMUX_IPSR_GPSR(IP0SR1_31_28,	MSIOF0_SS1),
@@ -1561,6 +1571,29 @@ static const unsigned int hscif3_ctrl_mux[] = {
 	HRTS3_N_MARK, HCTS3_N_MARK,
 };
 
+/* - HSCIF3_A ----------------------------------------------------------------- */
+static const unsigned int hscif3_data_a_pins[] = {
+	/* HRX3_A, HTX3_A */
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 0),
+};
+static const unsigned int hscif3_data_a_mux[] = {
+	HRX3_A_MARK, HTX3_A_MARK,
+};
+static const unsigned int hscif3_clk_a_pins[] = {
+	/* HSCK3_A */
+	RCAR_GP_PIN(1, 3),
+};
+static const unsigned int hscif3_clk_a_mux[] = {
+	HSCK3_A_MARK,
+};
+static const unsigned int hscif3_ctrl_a_pins[] = {
+	/* HRTS3_N_A, HCTS3_N_A */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 1),
+};
+static const unsigned int hscif3_ctrl_a_mux[] = {
+	HRTS3_N_A_MARK, HCTS3_N_A_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SDA0, SCL0 */
@@ -2319,9 +2352,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(hscif2_data),
 	SH_PFC_PIN_GROUP(hscif2_clk),
 	SH_PFC_PIN_GROUP(hscif2_ctrl),
-	SH_PFC_PIN_GROUP(hscif3_data),
-	SH_PFC_PIN_GROUP(hscif3_clk),
-	SH_PFC_PIN_GROUP(hscif3_ctrl),
+	SH_PFC_PIN_GROUP(hscif3_data),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif3_data_a),	/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif3_clk),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif3_clk_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif3_ctrl),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(hscif3_ctrl_a),	/* suffix might be updated */
 
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
@@ -2521,9 +2557,13 @@ static const char * const hscif2_groups[] = {
 };
 
 static const char * const hscif3_groups[] = {
+	/* suffix might be updated */
 	"hscif3_data",
+	"hscif3_data_a",
 	"hscif3_clk",
+	"hscif3_clk_a",
 	"hscif3_ctrl",
+	"hscif3_ctrl_a",
 };
 
 static const char * const i2c0_groups[] = {
-- 
2.25.1

