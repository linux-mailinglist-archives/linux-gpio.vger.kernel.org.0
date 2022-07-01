Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CCB562881
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbiGABlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGABlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:41:05 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E527B5C975;
        Thu, 30 Jun 2022 18:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bp93L2RD0c82jaOxtrzEAGqICv1x9S6o+7RfdTBdRJYpshV3yea7CewQgQ98wFmEVWhFVWpKEjZk96zczpb9fI14g2Z/KN85QTLClRYXjunOrqGkoNpOSlio0jxx0LBclpcZVclCe/7ZTogRAL6Wish2QHbX7qfV0XMPdH/5XV16t7mT4+WylvHuSFOfpm39ID4/o4/VLTf7yX74zjOUwv3VvmWjRufkg85wOiEfA4NHiP1lNSda+4gJ6pFfe2LfphfTxy3yJZHTRcCyDwHpDE7OnufKCZxldwHaxVC4GRWJlxbYyLbQgX2O3e2vgJknaDGIn2O+sM3H3rpkloebSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leWZRJk42Wvw2wrPVVOVeom/vayvTDC1RWvVxjfqy/A=;
 b=UtHcWIlLN+F3d/nHnvJaVhsByuSBzUuSgEPHIziJe0eajs5fJvxtIQjRahTCHf7pjTPt/QSNmqKrX3wxwq/QItMlYoL6jaHueXhwzteKr4xuS9+CbYYVEDiVgpw5dPMtfYSb+sRJ2QcHjWA0jzU3P1KXlzqjpw8nmJzuHuvKtRoe2JAZzokhE5ht7t1ITjpmg+Rbzw1r4HU+NnyH6pYDokFK6TS6ttFEV0FTtZ2SrK1uBwkYQvPCT3ZCoVOaxy1Uts+5Lg4fxz/Y7xeUaMbipNdkPHRhh6/FRQQ2x478ZkOohok9gZlz3DQ1aHNgmz5rnTQEOBuTOIcPxK38EJX9Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leWZRJk42Wvw2wrPVVOVeom/vayvTDC1RWvVxjfqy/A=;
 b=dImI8RdY/SlkP5YK4FjowIzmtVElHHi9jrtheKkUaHeaV39jnTucU2kbDTHahqlwCagVGhSc9NeWAKjkb2T6FAN4ockA7RAEm6aPOZF4KrKNyOc2j8F3dOR2j/VrV3tdWiRNhd4qqM5rkha3NWSv04hpYwFY1YsTOurZ6ukl0HI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:41:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:41:03 +0000
Message-ID: <87k08xsj81.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 23/23] pinctrl: renesas: r8a779g0: add missing MODSELx for AVBx
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
Date:   Fri, 1 Jul 2022 01:41:02 +0000
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab35fadf-a5af-4478-a6d2-08da5b02c1ec
X-MS-TrafficTypeDiagnostic: TYCPR01MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3QswKgosKSMxG1JewT/qBxE/1a9OgeufTV4dHcdXv1BuJGnE3Jrl8+P7BCvhdSBlMKPwWT9AYZ1Wd4SdxQVTUPYTfb48RnbKfy4I6aArl00T7PZ1MZF7tNPZo/bEmelSsQOl54UmWvgoUfC+oKJmryZXFb+O+ROwDBvU6osO8QScYFOEGiT6GRa7MPFwXQ7o0KzvbHQV96mj4XxMwttS31y+YNv9BvYdb09kvtbfxJarVG9EHItjTgmxNQl/eDVzPgHN3UVku8wgEJHOwFORfJPLQ/jCjJ4Fa4OsmpoYkgBOiHZNmmm5D3tZIJkpEVkANuNbe3BOVcZ2cX2jsOkjJSGzvgVMmV3DOYiR5PuSyBQ4qkmGydUs1g/8CMvtuKk7+J+abgE27uqaQLVxgRLrJDKALTolUT7spCNNmMCi2IvQL/tvt9DbZe1PhV1FCM3z6GrytCyiq5Tm3z7JSqNTPNpibYvZH81Wp/mLdM296Q4sdNkujU0YhFjGGwISAdr9zx/vxe2y6bcuE7MmxJcHWBghlVnb5Fr9UnLAEuYKfZKaEEq5s1V18iKqR5YU+RYgReghku3e+XVduLzKhoG69J9JTissiwONN6Cma9Zhb1dbp5m6L9ZoIM+kJAwtdAi4JIpLTEgeSsMxPq+79akuehMswBQrh4PHZqalWiGnuDZvXxrB2RPWFcdG0DOhwZiSkgP4EaFr1s0CTy7OeF/BSPIADAicHhmtJBC42+s8Uz8ZU0jpBceotG5+ExCNN+1ZiQ22ErfOHxxd6lOJmSQwY4td26u/JPBtqbmaBzlgWwpQtyxhht2UrhxNE6EqnHK9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(110136005)(54906003)(316002)(86362001)(2616005)(26005)(38350700002)(38100700002)(186003)(4326008)(66476007)(52116002)(8676002)(66556008)(66946007)(6506007)(478600001)(8936002)(41300700001)(6486002)(2906002)(6512007)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u2ijMUyt0QWCt4KPW/kuZpf50uUNWwwUVy0Mj62ARihwzL2EAiBJDdmmj09r?=
 =?us-ascii?Q?47p79z5YDLqogP9r/kN0lhpfzo6rB/HDD6cWnNj9bbP+05DNkXCt6kc/1nMk?=
 =?us-ascii?Q?xMCw14K7SILsU2o+xV8ZfSLEHIoQO7xkFlHzqFftqVJCbKeCiHJ+VOXl/Iao?=
 =?us-ascii?Q?lSDqnuKS7ikYHtwIHrgEC5cTJCqln0I++qlKyo95A7cXYlzCodqRN+jKhcLW?=
 =?us-ascii?Q?RCHKb0+9+gCoEbz3ep86JRHOlC+k3u5TUWLeuZZorW5oLs9SCsHcJsaycy0u?=
 =?us-ascii?Q?o2yCayewI7TIu5Lnwl8DMC3k279SPNYJ6jfHm1VUvXESGLMjYIuzjijQkJjR?=
 =?us-ascii?Q?CDjo+NKfYqIPap7AUM8JIOD05tq2od1Js4bdMmTDLgEKC67ArlQSbIFJly65?=
 =?us-ascii?Q?D14jAiJleL6xOHHLXUm9Uv7+rghf0bjwF5/w0BwVaBX3FZxzML2ftH0Ztqoy?=
 =?us-ascii?Q?IWFbnCCBu5k1TOqUjn5JUgqvxHMyo90bayjwVtO0lrW8mbUE95Jfm56VJG38?=
 =?us-ascii?Q?B/JZ2wAOUIOy7vP6WMelmbX1V8CXvmvkeb/QIaiRUxog9KYhdt1m9P+iGo5w?=
 =?us-ascii?Q?1IqJ4hcrmTzta12NsG0lbSaVZrAayJ/F8MDPJeTOgp6l5cTsGvFaz5kLZrTV?=
 =?us-ascii?Q?KSbIDlGU+3nP/vMHPfzbWAibPEKuEpe6kWba53Xt4GKYIymG1+SOu+1Yc0/H?=
 =?us-ascii?Q?2PBKP5Q/MYMCh1NSL1xGH8ucYh75DXNxA6FGh9ph4xNGRYnNluaZw0Wn9SI7?=
 =?us-ascii?Q?fQThUMek63DLIMU/rO2fMuV6/u3pKOGQv7ohCuhfrYG+dsbq0eGoO+F5yA9W?=
 =?us-ascii?Q?QkvjSRgyVWgDTbHAdXVoTGJ2W97ObnwEYpiUx924Ck/7DAvvhO1ibyrpU7hx?=
 =?us-ascii?Q?kLsfteWT7fxD+KmTZrelFAvWGGAf9vVC5SUj09H6+1SjUod/XCbOjfll5bMi?=
 =?us-ascii?Q?2xd7LAJAXWq+wbrG/g5b5tOjNp4QJz4iojjc2u3b6MK8uHmpOVqCOUUK+LQT?=
 =?us-ascii?Q?Q4iCHAcMAA7NgC7SclyXtZFHYgtOaXt2jUEoplfHSBQ9xagytZX4AkVkdcw/?=
 =?us-ascii?Q?n9fzPRJZSzhgzqONR6GG4TB3TQDKJBBUM2cwGKBv4UOmtLLVRsLhkJbGJRBI?=
 =?us-ascii?Q?9o/hd0Lu49aPDH/vi8eIkzP6EqyJZK/Lkbv4RLOyWqaEspKTba4vQXjW1gOZ?=
 =?us-ascii?Q?xsHh/w8x/9it2WBYLF8ML5NS+89S/fBA2KaA3vJ8JD/nnF8nl3m/tuJNop5p?=
 =?us-ascii?Q?nxM3prvbxhPtw92yxRL0Tr4TWo1wRmHKmjBZmPdyZa7vE2bmvjPhNDpNNhHc?=
 =?us-ascii?Q?9VodduMG+gba0YUPdDFtBTwdVfUbhQbbBx9IGGzT/ETIOa8Tx6dRRJzJu581?=
 =?us-ascii?Q?oilFKyk0RqPca3oz2wwQv3UxwgEyzS3biacZnvHmAmZdDIImoT1poioqfL3K?=
 =?us-ascii?Q?0dxm06RYeZhbzaJKHDOr3y03YHduTx60XhwxUzyaWMR/gkJnpYF4yXOoszOS?=
 =?us-ascii?Q?+nU17X2+Aq9CShYL8JuYiwU4nXm4KIe1gkBw2UaDaOVkFB8Ef39lSSU7f5Cv?=
 =?us-ascii?Q?66CO6NrPCT0CJqaA1XNVzqvAAII/9iqZZev5y996EIDM33F6RmyM7+ZHpeL3?=
 =?us-ascii?Q?LzekbrFWgEn/EunXPfkTOaw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab35fadf-a5af-4478-a6d2-08da5b02c1ec
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:41:03.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ksHG1/GN6ocwnt4AvdZE5NJWsaZ7arQWVQhTwjnMmXHwsd4jR3z4FFXIzbTXLvEFuG07mnprrhUvYNLzflP+cKVhncX6lnEZQUTsZAXJxHromwUT5Ppr+yRVcJb5EK81
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8850
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

AVB1 needs MODSEL6, AVB2 needs MODSEL5 settings.
This patch adds missing MODSELx setting for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 58 +++++++++++++-------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 7834e8be3066..10125892ed24 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -716,27 +716,29 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS1,	SEL_TSN0_AVTP_PPS1_1),
 	PINMUX_IPSR_NOGM(0, TSN0_MDC,		SEL_TSN0_MDC_1),
 
+	/* TSN0 without MODSEL5 */
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
+	/* TSN0 with MODSEL5 */
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
@@ -1031,23 +1033,23 @@ static const u16 pinmux_data[] = {
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
@@ -1056,17 +1058,17 @@ static const u16 pinmux_data[] = {
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
@@ -1075,14 +1077,14 @@ static const u16 pinmux_data[] = {
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

