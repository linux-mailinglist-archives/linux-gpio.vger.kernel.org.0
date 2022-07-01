Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60A9856287A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbiGABkw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiGABkv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:40:51 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BF738182;
        Thu, 30 Jun 2022 18:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaEOeWbUXG5yiRk55+K0BptN+8oFNL4c+O0fSb0bkuz0gFAapRHPJOECGynIXSZ06RQCuZ7wekWUqRJYOufKi6pKJMk6MN/gvG2cYdQz+e7ug6muKOo6pZnYsvjPkLUQXPhx6+HzwXy9Mk/ZzPq52pybvskiNXDJB4vpR3xzFgFF8ngx6YS1O+hJqVHAzuKW6AmsA245hS0nR2aTBOk6cws3UGASw845M04Tg1jw01Cso9H9i/RQ7H5yW4Fu/C8pdxB6dkKLIIPU/kfrqccsxeIEnbInmtgnVIrvAmCgtN5At2cvYEjNl5IV0zjI0cCg47XD72BhtkEeyfZqt9zHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAVTZyT11j0l8haicR1RreVPm7GCeWjdeos/oAFTnP4=;
 b=hfKd6w4MJHQb10R435zkm1D0dXBPewes7hfjCXGG/mXcftwtXSQM0K48gXC5+xV38ajkhXzj2pg+xFNUD6+DoNq6OaVrPFUNfRgiVaOxXXturYi/4ARivyKpJgmkeFPqffaEKb7TVfICrPkoo1sP7txq3085GtvSjD68vjzMOtlVLBHwu5Ri1dVupoWiLQw+zKccQ/aKaC0D/7fTbuiBj25a9j4Li7GYxztIeyW1PBYkdGHpDvWnph/AWm9LirIJ+S6pAy8gEi2TH9LMqlD1pCTkILPmCszsDA4uMYaixtkCd+NKGfoIrCY4vwUVM1kwW4Co9cnxrYljGQN5wNjiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RAVTZyT11j0l8haicR1RreVPm7GCeWjdeos/oAFTnP4=;
 b=SjCmKh9HuYyGHlcakX7iXA2JImimu4Xp41REJp5J0khmWwQJcn9TpYOa18N+flY6JPCXem9ZtnQdjxftHDJgIKKrqUW9RzDeC5OpcEepmegbS1lqPxA1LBpB7L2pd/i5KI/m9BucA1ouVMGjnbAfINEElP+u2mwzWaBh322Z7Fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8850.jpnprd01.prod.outlook.com (2603:1096:400:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:40:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:40:49 +0000
Message-ID: <87letdsj8e.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 22/23] pinctrl: renesas: r8a779g0: add missing MODSELx for TSN0
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
Date:   Fri, 1 Jul 2022 01:40:49 +0000
X-ClientProxiedBy: TYAPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b9a1028-5bb0-43b0-db27-08da5b02b9f0
X-MS-TrafficTypeDiagnostic: TYCPR01MB8850:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YZzMXwVdndCRMGaNNZ201Hfw2t7HU4fyQQfu/0m9yqvs8dx1pXHtnYQ4xxnvfmelJgAOvaR8CH3+MRhs2oI/N0siFpYQGMAr/gJsp2DI1PYD8O4CQTTEJIvmVZ03VYOUPCqOU4bx28Dj6UZtEVsSb5naOsvfjLf4N14T9VlooKKg3NWRhDwQ4F28O3ECYINL4dmjWwVpKQ4F6WoH2Rdq7idcubiRQ8XXwAL1QVTy033yzYvaDle2yha7rPjyXFwfMx+TzVP/K2P+zJVIsIUTGQ4sMXdpjEAcElNKf7WrPvf+utIDvZIG0PEdE4NRoGvQNXKdI4oAWwHlvFxSg56w3Q4R4pVN9VEmDTo3PkztfONTNi7DDzRUCsBucsoeGsNCrE249auB2PWRgXqxsqZeRFdQvIs1vQ38CBTkqd2vjoA6mNj2L33H9BfmYhDAEanArjkGQXDFDpbJn1uCPyRfQktG29ZXiLltHWvZxDgd0rQo8wSrTM7hx+RemoPsP8L52H/l2Hk2Ddy7db+khGfSb80TsNCa116fox+aILtY7zOV5vVZ8K5TLjRAcntztJAPJQ6Vi5qkzxsmwwHQpcbc5B5CQtb5vU024HanBO4Gxalqs9XUIgTomLASe2VCw+cA/ZILz95SFLJ71dBK/+QUIteqmOpxRjw6+wogVb4bIO5wAbV0UoGpvgfcOdmNeUzgd4pH7U6/aA/k4OiVr6TAHDSysRaYagjSiGSJhHRNF3VG+gjEWzruxPE+qE/id+toSHwfEy4WosbJ08a2erBOpblPAiJly+3/A5KieTeKOL194v90dbCPWo82LGpDmN9Z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(36756003)(110136005)(54906003)(316002)(86362001)(2616005)(26005)(38350700002)(38100700002)(186003)(4326008)(66476007)(52116002)(8676002)(66556008)(66946007)(6506007)(478600001)(8936002)(41300700001)(6486002)(2906002)(6512007)(83380400001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rgogK+Hy4/ma0gUk2y6gdvMwAitqhCxKVNCPIg78dr7M22fO8Jx8gsBWgxH4?=
 =?us-ascii?Q?nxdJXBuye0i3TDRtRFSpTG45uYP0BruQEqbCbd0ZrLbMGtFGPRxSFf3KrPEi?=
 =?us-ascii?Q?Jrhn9L+UAv6z3O+RRBrCBY6VHHK80ISgO3J/VeuTx9IB8fX+TihUf+kk+Zoa?=
 =?us-ascii?Q?DV+cNRYSkSbgvO71SlZc5QpgFkaOkhZrz3Vnn7c4HSCTopJLjzoylXO+t+kK?=
 =?us-ascii?Q?RifqPoKO3gPSDmdAYVWSp+KpSWDxZ3euGPAlAkeggxBfl4z8z4ixqRxnyNcg?=
 =?us-ascii?Q?xvlYBsnzMDdLNUGBo7z68Tgp0pfwwI6zRu0rNloxNM2UCgoSbNRkbLK8VPKR?=
 =?us-ascii?Q?qELQBVwfXnmf93uMk6C/uDicADCztf9tvoVk7UUqxvpMr+W7AUhdKgCBWDFH?=
 =?us-ascii?Q?UYYlNRwK0mWgoa+9ftKGhPqEyI3ueZrXdvR8pMf/UamvRR1mAzLAO3QcW8Fx?=
 =?us-ascii?Q?YHMgLuz0c93e+itK9HE2Tko3YUwoTz9KvNEYAijti+kcSp8tBHn6lTEyVfhz?=
 =?us-ascii?Q?8+j/sdvEmjSmJjmCurn6Vc30seg8WLPvDHfw1si/EzlCavdWt1iFdDxr4qfq?=
 =?us-ascii?Q?WBb6NQcqQaZAd7rIyslIAxyAKzgZn3WntSl88TciZrsNTeXLqhUXujlLNkxW?=
 =?us-ascii?Q?kjJfC8F9qC7KP3GLvWfsbNW5/N2uQJTIRtYHE/gnsLCsEnch2OU8cMQ6s5z1?=
 =?us-ascii?Q?5D1AOy2JakDxaD72uhweo37tYnSOJYaZjFqAiN/J0hrTk03hihuo9JujIhl9?=
 =?us-ascii?Q?owYaUxOezhpmTjUZqb5qlnGH8ujP/Mkyj/QWIaOwwFeS828hQhOntcltZnfx?=
 =?us-ascii?Q?J04/aQv9gmJPqu08P1guGvfmeK/ymc6OXcKhmNaCvn7P31yW0Hg2EaKnynKT?=
 =?us-ascii?Q?CEZuSQRH5cN4cJwxjxFPHN76qxcEm2Qes4WD0uyMzc8vgPGSk5uRdLGUxx5E?=
 =?us-ascii?Q?HF54Mi5siYdmHdZjrQCnnZZ8/5fFz8f2S5CjlnjrIe0fYX3oqQ+8ho1+qzHR?=
 =?us-ascii?Q?yQUApoq6BdFajFKGudBocEC6LzprNjVB4KNs6AdF9jCV/K4+Gvy+LtWoNEOJ?=
 =?us-ascii?Q?/JLPchaeHz9cEuoogg7wiCYTgen0Uvg0Wcr8xUjZiSUZhjlmi0E+wT8PfPXa?=
 =?us-ascii?Q?S4bhjUz05hJZtyJYrDY52epbgVjfq5VKAbAse2s1Q3nFUn6l0Yhc/Dd8mXko?=
 =?us-ascii?Q?nB2iHgIfmo++icrfy4cnUXYS5SN+tSn/JXXpZuvXeSbFBjzP4iJxqd0gdV/1?=
 =?us-ascii?Q?Tcvt9+vGTxrFO2H+OPwdu2OatgApGA6M6dN/mAe3hYtcn672UR0HOZKrm8q9?=
 =?us-ascii?Q?64Os1cRCET26PswG8iyd3CaDjOOxE2lot8kmPpTKxwnMzPwXbPSGB/mudtr8?=
 =?us-ascii?Q?IPUPNy2E3I74QQSnWwKAbyL+/LZaTdYm8pwhetvDG9lIUoylXkcyQfmnCo1Z?=
 =?us-ascii?Q?xapeDbDvlwVkLDHMz5uFBBGTRACiJebkK+pIDhDicxS5eJoWqj5GpFfRZohv?=
 =?us-ascii?Q?T4UIoLYUWpB7yB+qY/F4bb9xY9LjDHcvXmuryKbaLWO3OVwsr7KSWC1JLj8Q?=
 =?us-ascii?Q?ukeYCIOPvbOdDUJtRy2944vDuLSG37uQ4DZj5SrJ/S90vOhLFYzi/bL4rYdt?=
 =?us-ascii?Q?pFK0RU8RQ0Z+osBrgPJOxk0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9a1028-5bb0-43b0-db27-08da5b02b9f0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:40:49.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2Id3kpiQ+skgWPrJxnlRkFM573RvcUv1VCdatD7p/Xv0UOt8bJuyg7F3jqm2/4kmBO9NbLWm2p3KwmBMPPp5+Srd9NmhGWAoyzttKLofhGqtmJiGhDULSb8smKtvl7v
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

TSN0 needs MODSEL4 settings.
This patch adds missing MODSELx setting for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 9ea31f3f01e5..7834e8be3066 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -691,27 +691,30 @@ static const u16 pinmux_data[] = {
 	PINMUX_SINGLE(AVS0),
 	PINMUX_SINGLE(PCIE1_CLKREQ_N),
 	PINMUX_SINGLE(PCIE0_CLKREQ_N),
+
+	/* TSN0 without MODSEL4 */
 	PINMUX_SINGLE(TSN0_TXCREFCLK),
-	PINMUX_SINGLE(TSN0_TD2),
-	PINMUX_SINGLE(TSN0_TD3),
 	PINMUX_SINGLE(TSN0_RD2),
 	PINMUX_SINGLE(TSN0_RD3),
-	PINMUX_SINGLE(TSN0_TD0),
-	PINMUX_SINGLE(TSN0_TD1),
 	PINMUX_SINGLE(TSN0_RD1),
-	PINMUX_SINGLE(TSN0_TXC),
 	PINMUX_SINGLE(TSN0_RXC),
 	PINMUX_SINGLE(TSN0_RD0),
-	PINMUX_SINGLE(TSN0_TX_CTL),
-	PINMUX_SINGLE(TSN0_AVTP_PPS0),
 	PINMUX_SINGLE(TSN0_RX_CTL),
 	PINMUX_SINGLE(TSN0_AVTP_CAPTURE),
-	PINMUX_SINGLE(TSN0_AVTP_MATCH),
 	PINMUX_SINGLE(TSN0_LINK),
 	PINMUX_SINGLE(TSN0_PHY_INT),
-	PINMUX_SINGLE(TSN0_AVTP_PPS1),
-	PINMUX_SINGLE(TSN0_MDC),
 	PINMUX_SINGLE(TSN0_MDIO),
+	/* TSN0 with MODSEL4 */
+	PINMUX_IPSR_NOGM(0, TSN0_TD2,		SEL_TSN0_TD2_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TD3,		SEL_TSN0_TD3_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TD0,		SEL_TSN0_TD0_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TD1,		SEL_TSN0_TD1_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TXC,		SEL_TSN0_TXC_1),
+	PINMUX_IPSR_NOGM(0, TSN0_TX_CTL,	SEL_TSN0_TX_CTL_1),
+	PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS0,	SEL_TSN0_AVTP_PPS0_1),
+	PINMUX_IPSR_NOGM(0, TSN0_AVTP_MATCH,	SEL_TSN0_AVTP_MATCH_1),
+	PINMUX_IPSR_NOGM(0, TSN0_AVTP_PPS1,	SEL_TSN0_AVTP_PPS1_1),
+	PINMUX_IPSR_NOGM(0, TSN0_MDC,		SEL_TSN0_MDC_1),
 
 	PINMUX_SINGLE(AVB2_RX_CTL),
 	PINMUX_SINGLE(AVB2_TX_CTL),
-- 
2.25.1

