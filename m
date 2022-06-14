Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDE554A92D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238292AbiFNGBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiFNGBE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:01:04 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248713AA5C;
        Mon, 13 Jun 2022 23:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu0m1+n4z83WZy4i17vV3IQLh1+njhG/eK9/Y3pTXhS5ap+sKHhmzua1L+EcNIrVI20a+b4M9FvtkHfU1YN8wVCPgesQvFbvI+WkGAz+vS6CjG2K6khbW4qPTCzunBupSfMavOQF2b7WLBhuXgALEYv4kh5jT1udydb/1y7bv5Qeo4hj+/xo/WitGe5Fb6yd25MVHLA2LVrneVm9wb/w4VihpcMrXZLiUyB6/0HLsymNbp+eG12x81S2kAcYYTFS7PKUKnzkuHVF+x7k3y7BMQBf5C23OP4fNyrNiA31YZ2Mb7LftvJCR3+fStD1/KH+ycQUoCd/D/AOqeoeOV003Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmwxGuk50NoA4p0VXSPElOoBT/0IxPHa6hvuBXgx81E=;
 b=U/g/5zJDeJS/PIkN7N6z6ePAcUhFSPgBu2xD1u0P1RFR9KhQgFNoSyJmW5vq/T2M897ppCKLNoYhY3d911huAjzhi/+/i2V5axySCHffqq3Kdow+rUfdLxWl0K9d7a9g8IRXxTQEzTthuO/utKRE6azKBGuo5OyyX+kj3wa6idZJTBfFk8LCAY0N6rw2ZTHdUfl7QK9u6oRCCXWkIT8G9I1G/0MIPbjsg+zAQM0O1OLG17oKW9Vg+Jhz+zzJR9TvmgCEspBQQnbAQ21jVaCGUmKC1U71zLftTb01YSkiIaikU0yTrrpNDhTNi/8UC+QC6tA+4DyyBE+W+Yd//vlXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmwxGuk50NoA4p0VXSPElOoBT/0IxPHa6hvuBXgx81E=;
 b=VkZJvML+VAfFwl219GRX7D3/y6HQc0svcys8s983tzxvh7wxPnTnZvTsK/x+ydnYUjkizRsvozr5CewJI8xO1OrACeu4W9aOgbxfK02wJnv/eiLtHf990jFg1an0PSOO4XSDh1LjGIhWus7onIkXnigAuuPN6tXS2fk/as8M0f8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB3093.jpnprd01.prod.outlook.com (2603:1096:604:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Tue, 14 Jun
 2022 06:01:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:01:00 +0000
Message-ID: <87a6afkcmb.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 21/21] pinctrl: renesas: r8a779g0: add missing MODSELx for AVBx
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:01:00 +0000
X-ClientProxiedBy: TYAPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48dbea0c-4c3f-4052-f35c-08da4dcb41f7
X-MS-TrafficTypeDiagnostic: OSBPR01MB3093:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB3093918D178C7E4AFFFC32CBD4AA9@OSBPR01MB3093.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPqpx1m1iY0za1UQfocvVakObIcBHdp6eg4Q2euoAfbt/YJe4QYgjq3Gzz2pBExAHpIEwBaEzxl1d0N1V5E1pxed/t8zWIC4wVIvIEuKfEb+hOzfuNXMf3hjfFBBCDaGCOxjm+q15gEtPpSeaR1tuucqd0DOGKaavgwSozjmV9rLQiYHEa6pKLskMi6wb3pcGp6B4DgP7ilX54Vt8tgSbXLQfpmKv6/2gtcE+KkUNSx+s/9mqa+lhf/m/GGhUbJsoS7fzi7jzJTNlBqOBEEuV+R0A++IVJqnPSTxMUl/Ll5rKHpx5HqlnZzIMxTBXX5tuS7K42Oq2CKMzwZjgrmOX0rIEMXwTy/1UxmRRgpxftzmkN2iMCU81uJw6nYAOSaU6tHEuM1wGi/hxCP41essSn7iTPCFvsOWYaYLBBvMpPQOiKxmCIb3FiqCaz9KuZJEklWcKUng3j/SLMnlEkFSgJvSw5fP0GYd1xFV/pxDLbmd/a3tXELSsXPiUVOAS7T7VU56+HfMQWZT/TGt6o+jT67vITyPQN8GIyBPnVTHv9l10ZzrHgvSMV+vkyEi4SvKCBOUFelf+BmrkUKyCkA9oQBlq2FXKA2exnGj+JkamUvRoSQoEdAQseH+8engMf45k2Ol02qjZ/MRLJiIwS2Zr8Pp68hJc5CRP6+YPPaO7fiT+WBfJgFJtPcDhWMyZw0GsWIsugkNjDHqe+hDNdkpMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(6512007)(36756003)(26005)(2906002)(6486002)(6506007)(52116002)(5660300002)(186003)(86362001)(2616005)(8936002)(508600001)(316002)(66476007)(66556008)(38100700002)(38350700002)(66946007)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AOL9JSXruI59nFysAfPe46QSOaL1m3bFIcm7Tdn8MVWlun/VFWTsZv3q8m91?=
 =?us-ascii?Q?TI7rjxQJI3X4w1hdb/MVWoEcru56jU1kFp7wViqmCkBirP56IVXFz+RLhqDY?=
 =?us-ascii?Q?kpXUyrdoP3d3/nEQHjtla87jd09WEq5380Qt5og3do9u5a7kVNxhVC50ROqs?=
 =?us-ascii?Q?XtN/Gh+XOal55Ji0AyofbFV3g0WMO0ghy/lKdyGoaFacjv63KSN9xS4xvoRN?=
 =?us-ascii?Q?uF2O4doQ5nckr0SuJ5jYRkhRcum9mb/zig6gRDPemOrJHmJtPyXmHcOEGr7d?=
 =?us-ascii?Q?gbWiwSc+mbCeQBCBMBQhAcoX7lbhaONUNL+FsXY4MXZ/+wV9kUnRaflFl5tf?=
 =?us-ascii?Q?FYpSdMP4PuQCK8YdszvtibcG29ugf++OpffLth6PvTVL/bKFmO8Vm6FMfcI8?=
 =?us-ascii?Q?dsYYwB1cJGiH8m22qQB5NM4n/7eSLYHVdJcmCtGrzLUMwjwU52IEG7o/OC9C?=
 =?us-ascii?Q?2HFHkpprp+walB14ruDL+T5uwhmqaQSrgKt2FIRDDHB6xGYrEkrlM+Ab3bXX?=
 =?us-ascii?Q?+C+vQiipaPpuXguBiS/Z3m/psneUwDZO2igtNPMrPSOOjrnekJ+3/VPaU1gr?=
 =?us-ascii?Q?dfPUHU2X7Ywkhrb60PkV54LjANhAPlgXT8cDZsvrbzLzB5ZEvHojsLKcLbvE?=
 =?us-ascii?Q?A3UXT3oLH7yCucIOjZyIEKP1U/PmZXRzN5klf/40gHvfTLvfofts2WfI5wVv?=
 =?us-ascii?Q?q+L3ebw44Xjn1SupjF0DIai2aBMfykZE3dcj7cv9K5Gu1e5I3ERmZQ+BMxDp?=
 =?us-ascii?Q?APZV+7jLdWCwdoIZR/Qh2c1igY9FbLsQ8HvdQ6x2F2E0aIas/g10QxcMTR4p?=
 =?us-ascii?Q?Wctc7XKDz4LHkkD7x8dU0eRmriIJ69VxEPTAibrC77xStVOPseJzXQmyaTKp?=
 =?us-ascii?Q?A6EALvMfo1ZwFs0Br2E0zryoOkGQ+x4GiyuPTgDGqOFWbTOl5uIwNltt796A?=
 =?us-ascii?Q?QBBJhYUjBx4/X7D6CHVHBlUt5M/Fo7hNPH06IB4uDohItDpwQ50By3N7y/go?=
 =?us-ascii?Q?rJws+vJZDD3H+RC+oUHCFfm+xkCxX4c9LRjpaNe0evohPPdYmQ08Ja1jJjvs?=
 =?us-ascii?Q?58Pc7/Ub7gtRTT/lu2RVN6aSqUXnatcIy0b2cGTr/1gtck6CNA2FFXSUI6nB?=
 =?us-ascii?Q?QI0keE/MyFxxGfs8RY0Gyk2AhF3xTU0W/UMAKE+yI9B3YmewVVS7cqokirlZ?=
 =?us-ascii?Q?lrLZO1QlGmrooMBXrQwIoByoL5zTyWLqfxlxlpq3HlX3Hreo8WjW7Yp6U/UI?=
 =?us-ascii?Q?Li48f9y8Jl63NJ6lX8cc0eal/T7ggtNi8z6eqEQ72LMg/WAqBIMXbjJhZP0U?=
 =?us-ascii?Q?s/g/ELD4OM3g3H746KL7zWDYb+6Thj20L8lSIwSVuA5IvrocU7IJwwZM1/jA?=
 =?us-ascii?Q?8po/I8M4r/pTJ/4IpvSLC/vvfxvzr7lOzEyyGWXu/yzy45k69QV7354XCqfc?=
 =?us-ascii?Q?SRwdMdkzHZPV31tmBXTaStIRGuVt+CIwJel+t4PN8dT9R8H7riCdU9u6edrg?=
 =?us-ascii?Q?jcrU5UAErOKNQJEi9ZJo8MEx/MvfiBPcon+Y+pq7pq+e6U5A4yYJpl9PBdhk?=
 =?us-ascii?Q?4twqk8wqOKsQoYUOesCLgb84uY24/4ViEY2buEQ6orQ9/onEUDTH2EDPyOyr?=
 =?us-ascii?Q?vMbs1jVCZ+/E5degi+fLPYf4ZbIopfLCtKSgD3hqaHOFAJGKnmYr9s9oXvJu?=
 =?us-ascii?Q?FZUFkYAqlplw1QsdL70FIa7wPimUnomiKyb+ofiBPAf+51fADYIBtrzVp4cu?=
 =?us-ascii?Q?vN7QSxjciSwHr4PU2DsNmkZFJ2A1/MDE6+2vJ8Y4odp3DaHX/Y1Z?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dbea0c-4c3f-4052-f35c-08da4dcb41f7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:01:00.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsp5ZxFb4N1aKjNL06xDpAuRCWqJyrBWnuY/QiG7eLsGNH/rQ+94M17Rrhrz4CyxSAxPZQJXR5UT2bL1wrri8afR/iKMUqh3ZGrLuHhCQPJrVdZr/6OWcaDELFEsOluU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3093
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

AVB1 needs MODSEL1, AVB2 needs MODSEL5 settings.
This patch adds missing MODSELx setting for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 58 +++++++++++++-------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index c96d95907972..195b0959a73b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -745,27 +745,29 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS1,	SEL_TSN0_AVTP_PPS1_1),
 	PINMUX_IPSR_NOGM(0, TSN0_MDC,		SEL_TSN0_MDC_1),
 
+	/* TSN0 without MDSEL5 */
 	PINMUX_SINGLE(AVB2_RX_CTL),
-	PINMUX_SINGLE(AVB2_TX_CTL),
 	PINMUX_SINGLE(AVB2_RXC),
 	PINMUX_SINGLE(AVB2_RD0),
-	PINMUX_SINGLE(AVB2_TXC),
-	PINMUX_SINGLE(AVB2_TD0),
 	PINMUX_SINGLE(AVB2_RD1),
 	PINMUX_SINGLE(AVB2_RD2),
-	PINMUX_SINGLE(AVB2_TD1),
-	PINMUX_SINGLE(AVB2_TD2),
 	PINMUX_SINGLE(AVB2_MDIO),
 	PINMUX_SINGLE(AVB2_RD3),
-	PINMUX_SINGLE(AVB2_TD3),
 	PINMUX_SINGLE(AVB2_TXCREFCLK),
-	PINMUX_SINGLE(AVB2_MDC),
-	PINMUX_SINGLE(AVB2_MAGIC),
 	PINMUX_SINGLE(AVB2_PHY_INT),
 	PINMUX_SINGLE(AVB2_LINK),
-	PINMUX_SINGLE(AVB2_AVTP_MATCH),
 	PINMUX_SINGLE(AVB2_AVTP_CAPTURE),
-	PINMUX_SINGLE(AVB2_AVTP_PPS),
+	/* TSN0 with MDSEL5 */
+	PINMUX_IPSR_NOGM(0, AVB2_TX_CTL,	SEL_AVB2_TX_CTL_1),
+	PINMUX_IPSR_NOGM(0, AVB2_TXC,		SEL_AVB2_TXC_1),
+	PINMUX_IPSR_NOGM(0, AVB2_TD0,		SEL_AVB2_TD0_1),
+	PINMUX_IPSR_NOGM(0, AVB2_TD1,		SEL_AVB2_TD1_1),
+	PINMUX_IPSR_NOGM(0, AVB2_TD2,		SEL_AVB2_TD2_1),
+	PINMUX_IPSR_NOGM(0, AVB2_TD3,		SEL_AVB2_TD3_1),
+	PINMUX_IPSR_NOGM(0, AVB2_MDC,		SEL_AVB2_MDC_1),
+	PINMUX_IPSR_NOGM(0, AVB2_MAGIC,		SEL_AVB2_MAGIC_1),
+	PINMUX_IPSR_NOGM(0, AVB2_AVTP_MATCH,	SEL_AVB2_AVTP_MATCH_1),
+	PINMUX_IPSR_NOGM(0, AVB2_AVTP_PPS,	SEL_AVB2_AVTP_PPS_1),
 
 	/* IP0SR0 */
 	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC_B),
@@ -1060,23 +1062,23 @@ static const u16 pinmux_data[] = {
 	/* IP0SR6 */
 	PINMUX_IPSR_GPSR(IP0SR6_3_0,	AVB1_MDIO),
 
-	PINMUX_IPSR_GPSR(IP0SR6_7_4,	AVB1_MAGIC),
+	PINMUX_IPSR_MSEL(IP0SR6_7_4,	AVB1_MAGIC,		SEL_AVB1_MAGIC_1),
 
-	PINMUX_IPSR_GPSR(IP0SR6_11_8,	AVB1_MDC),
+	PINMUX_IPSR_MSEL(IP0SR6_11_8,	AVB1_MDC,		SEL_AVB1_MDC_1),
 
 	PINMUX_IPSR_GPSR(IP0SR6_15_12,	AVB1_PHY_INT),
 
 	PINMUX_IPSR_GPSR(IP0SR6_19_16,	AVB1_LINK),
 	PINMUX_IPSR_GPSR(IP0SR6_19_16,	AVB1_MII_TX_ER),
 
-	PINMUX_IPSR_GPSR(IP0SR6_23_20,	AVB1_AVTP_MATCH),
-	PINMUX_IPSR_GPSR(IP0SR6_23_20,	AVB1_MII_RX_ER),
+	PINMUX_IPSR_MSEL(IP0SR6_23_20,	AVB1_AVTP_MATCH,	SEL_AVB1_AVTP_MATCH_1),
+	PINMUX_IPSR_MSEL(IP0SR6_23_20,	AVB1_MII_RX_ER,		SEL_AVB1_AVTP_MATCH_0),
 
-	PINMUX_IPSR_GPSR(IP0SR6_27_24,	AVB1_TXC),
-	PINMUX_IPSR_GPSR(IP0SR6_27_24,	AVB1_MII_TXC),
+	PINMUX_IPSR_MSEL(IP0SR6_27_24,	AVB1_TXC,		SEL_AVB1_TXC_1),
+	PINMUX_IPSR_MSEL(IP0SR6_27_24,	AVB1_MII_TXC,		SEL_AVB1_TXC_0),
 
-	PINMUX_IPSR_GPSR(IP0SR6_31_28,	AVB1_TX_CTL),
-	PINMUX_IPSR_GPSR(IP0SR6_31_28,	AVB1_MII_TX_EN),
+	PINMUX_IPSR_MSEL(IP0SR6_31_28,	AVB1_TX_CTL,		SEL_AVB1_TX_CTL_1),
+	PINMUX_IPSR_MSEL(IP0SR6_31_28,	AVB1_MII_TX_EN,		SEL_AVB1_TX_CTL_0),
 
 	/* IP1SR6 */
 	PINMUX_IPSR_GPSR(IP1SR6_3_0,	AVB1_RXC),
@@ -1085,17 +1087,17 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR6_7_4,	AVB1_RX_CTL),
 	PINMUX_IPSR_GPSR(IP1SR6_7_4,	AVB1_MII_RX_DV),
 
-	PINMUX_IPSR_GPSR(IP1SR6_11_8,	AVB1_AVTP_PPS),
-	PINMUX_IPSR_GPSR(IP1SR6_11_8,	AVB1_MII_COL),
+	PINMUX_IPSR_MSEL(IP1SR6_11_8,	AVB1_AVTP_PPS,		SEL_AVB1_AVTP_PPS_1),
+	PINMUX_IPSR_MSEL(IP1SR6_11_8,	AVB1_MII_COL,		SEL_AVB1_AVTP_PPS_0),
 
 	PINMUX_IPSR_GPSR(IP1SR6_15_12,	AVB1_AVTP_CAPTURE),
 	PINMUX_IPSR_GPSR(IP1SR6_15_12,	AVB1_MII_CRS),
 
-	PINMUX_IPSR_GPSR(IP1SR6_19_16,	AVB1_TD1),
-	PINMUX_IPSR_GPSR(IP1SR6_19_16,	AVB1_MII_TD1),
+	PINMUX_IPSR_MSEL(IP1SR6_19_16,	AVB1_TD1,		SEL_AVB1_TD1_1),
+	PINMUX_IPSR_MSEL(IP1SR6_19_16,	AVB1_MII_TD1,		SEL_AVB1_TD1_0),
 
-	PINMUX_IPSR_GPSR(IP1SR6_23_20,	AVB1_TD0),
-	PINMUX_IPSR_GPSR(IP1SR6_23_20,	AVB1_MII_TD0),
+	PINMUX_IPSR_MSEL(IP1SR6_23_20,	AVB1_TD0,		SEL_AVB1_TD0_1),
+	PINMUX_IPSR_MSEL(IP1SR6_23_20,	AVB1_MII_TD0,		SEL_AVB1_TD0_0),
 
 	PINMUX_IPSR_GPSR(IP1SR6_27_24,	AVB1_RD1),
 	PINMUX_IPSR_GPSR(IP1SR6_27_24,	AVB1_MII_RD1),
@@ -1104,14 +1106,14 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP1SR6_31_28,	AVB1_MII_RD0),
 
 	/* IP2SR6 */
-	PINMUX_IPSR_GPSR(IP2SR6_3_0,	AVB1_TD2),
-	PINMUX_IPSR_GPSR(IP2SR6_3_0,	AVB1_MII_TD2),
+	PINMUX_IPSR_MSEL(IP2SR6_3_0,	AVB1_TD2,		SEL_AVB1_TD2_1),
+	PINMUX_IPSR_MSEL(IP2SR6_3_0,	AVB1_MII_TD2,		SEL_AVB1_TD2_0),
 
 	PINMUX_IPSR_GPSR(IP2SR6_7_4,	AVB1_RD2),
 	PINMUX_IPSR_GPSR(IP2SR6_7_4,	AVB1_MII_RD2),
 
-	PINMUX_IPSR_GPSR(IP2SR6_11_8,	AVB1_TD3),
-	PINMUX_IPSR_GPSR(IP2SR6_11_8,	AVB1_MII_TD3),
+	PINMUX_IPSR_MSEL(IP2SR6_11_8,	AVB1_TD3,		SEL_AVB1_TD3_1),
+	PINMUX_IPSR_MSEL(IP2SR6_11_8,	AVB1_MII_TD3,		SEL_AVB1_TD3_0),
 
 	PINMUX_IPSR_GPSR(IP2SR6_15_12,	AVB1_RD3),
 	PINMUX_IPSR_GPSR(IP2SR6_15_12,	AVB1_MII_RD3),
-- 
2.25.1

