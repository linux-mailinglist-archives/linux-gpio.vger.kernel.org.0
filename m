Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8386A56286D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbiGABjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiGABjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:39:49 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830B038182;
        Thu, 30 Jun 2022 18:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGX38d5PKmzJkCiQ1eZG9WNUUGsd7M5uB1dSTbH4g5piIXYCIA4sFdMmM5Z47ZO/x2Fu7op0Iwsv65d0ArEqhrbWAfjP7sIrUQiFuEIQExj6OGdABAccM31E+mvR1Vj8+wOJmrHCbl8f3M2kze1mBbUnK3pwUbNhZLiTwcUiKWKgYPIWCJDaTHu08vXQtbvy5+0X3rrA4WTowljbx5gQUMlbxuBpPIG0KFIn6nHRYUkRCaXQRP4Rh8z39Q/zDIP/VwRh+Dsh3URHp8dIhwvWXS8QKOnGfS9iTDdrmpw0GTog7ZMK8AwfgrUP1agW6cBTaO4qvA8ZWSzJx+WUrjOZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iHfLtS2DnSH3fy/ZEAdxeNaSQMlivQhM5OCed5Oj2A=;
 b=mK2lvd0VdiKH9BbuoKUvo0bfj3U3GnuVpol5HpT3eXRsQ1Pf1K01YMnVLeqZBPdb1QtAfRAq8hGMoCabiqf5fNnFJo+Gg6SdNPTfbIwGf6GHN7ix4kCETodolF6Fm4RaVhOsyO1jtNERtZwt/C8KHG3HqUrSluRqTXYveGZYLC0Gfi7ayyyKuhUV78A4H/8b2FDZsAJrgr3M/9pxBHLAQB3rCRCl3Ciq1U58J4pDLxTTzM4N5A8dG4VTdwDr7Ri/gNbmcWZ1gY9GA+bIgO/BUdZjkkiP2ML0w8rNBOXQrtz4kHP3P1MVjMaFGIoNbMq/b4IhQ2i+E3nLn3yv1W5FgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iHfLtS2DnSH3fy/ZEAdxeNaSQMlivQhM5OCed5Oj2A=;
 b=UiD0v7dmsAeZJ/bbUwAc0x+/7zlWEHDIxb1+fk74TXk4XkvCgfJ0YegvdWReWRYVOF+18bBcTfglHH56qT+kF/RxcdSJR7/uVbf1xvZRiF3NzrZaFD8wLQS4s2s3BmqPko3NyKQgrc4Kl7hZBf+FTgWQCjonDOA3+KUEQizVIAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:45 +0000
Message-ID: <87v8shsja7.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 15/23] pinctrl: renesas: r8a779g0: add missing SCIF3
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
Date:   Fri, 1 Jul 2022 01:39:44 +0000
X-ClientProxiedBy: TYAPR01CA0016.jpnprd01.prod.outlook.com (2603:1096:404::28)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead4d764-7300-4ede-49c7-08da5b029374
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XiH6AGtGVLgf5P98G1Ouib06xJrveVLJl6iV3RrgdwzbshupJ7KCFRg30m0KfUir1b9Wn4IMpvMHzcpae5JzSpTGEFm+S7mRmN0gn2wGJeFR+iaPJapPZlwi3lJ/ykrULE8VV4kbmIvfiafzJP9kIG77FpGRXQJ/FPnMmgPhlpQcPXzJtMrq83g3HJVaCgO3tNJLnBz1nYfyr5FM7uUqI07dKtsBCZyUmU6NSfHaHgvu+79Nuvt08SwCezfXsudYYveu5PnwtokVDTyQ8DUQ68NXyuDgKlYA+MbY1VgM6/ng8H5b3t1F8RgJ9wUAvMfIfINKlqNAr7ONbHfx+6vu4rANwyeHS7g+5hdjhoMRlcNvrKo/Twh/YQKJG7Ne7Nh2DRVE0ZmjG7gFvC8B8U7eD8+7edT4bNE/sXpVHlaAoMatJg6J/+9qB5rcu7gVNh9u0xWlD7+QsqfZobhlNixvpSExymof+yv2pfGSamsv2xzKWEytHNCUYKZqlGLDTW9j6Ylby7ArgGnHXT1EU+HOse4SZYZfb0g+rPIuKC83rWmmiJYCpWmHQS/aPJtRT4rQphgiQFSsFaDTwUqH91qZUZByhEL0k7e+llZzdDnwC12Ssue2M6uwfba/wb3CH9JdQXTVc1dPN5EieQUH2j1LDFCVtMYLun3/7tQ4lGa0OAymSYPFxpTTuks0SyosVwJFSPUTL2GPb45BtuvpY22hoikANEglN8BI5AfvQ7prLz3Wn7mnQlzjmtMWaGXvMM0J3RAt7oAqz+Uj7kNFf60LhExFZnAJG5KgPlWTp4H3/IZQDGZOv5dR45EHtmCC9I90
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Skihe9rzKM5AzvTCDW8wl7gTAIhRUCDl475WOgbiiTumTjfEwzZoBaRYBQL1?=
 =?us-ascii?Q?jHAWa4fqRMCCnKs3IMsPHlFvMpGQovxmxEyJHHgxRpaSB8tI3fq1CDoScF1S?=
 =?us-ascii?Q?zeYGkPzbDioblugWH6NPP7Tw1ehACgjb4/487BVOw0qo6DI4op3aRgFBUYZk?=
 =?us-ascii?Q?BZ0TTdArkf4EFscPzaMoAOI/kxUme0G1gK/V5iIse6mrIr+nAhP5+3XqVWUE?=
 =?us-ascii?Q?7F07p8XP03DfeBZ38+Nle9BYc10g5SueVy0BSCjwTxrKuq041NH1exO123Rg?=
 =?us-ascii?Q?VSXQLDDrqMNIuab6+p3iuwCipIfT11GuuVaARKO7Oykw2MyFXtNPVrDr/YI1?=
 =?us-ascii?Q?vfzwtnNDgigg8GCGDIkVIwhUcaVyINUaKjR63NSbRPOszkMu+T2biohQtIK5?=
 =?us-ascii?Q?3xtPOJ/5oTV5RuaK3SwPZY4C3mW/Vg04Rm8FMl26rmMgs9YZ5Snbj3uuTBKB?=
 =?us-ascii?Q?jpb0NcNeiSE4gRAxSrDu3LCxV6oIlSVs+e50Mp+5iLpSYwq0F2eiBI3P2gAB?=
 =?us-ascii?Q?+hogCa2YbACWeyraamQy6NOqzRIe+2U3EuVr/GiJX3o8tM6sOzXQgRwZwkQh?=
 =?us-ascii?Q?uN3bhX3d21cj0DB4ZnerF2f+bWgSEwI13DdS0dpubeiXj+A6p4h+gxNxKZFN?=
 =?us-ascii?Q?wgCHF+lSiWq6aWRQ0gipce5a21Km/Ho289wIPXb/jJBww/K+mcIB3IJBCXc6?=
 =?us-ascii?Q?qw0L8aCqp7a2ryV4ySHmTZJ0p6wZOFs4UZNIIGDJIccfdldi5R7G4gwZuqrA?=
 =?us-ascii?Q?oIacHEmlNzynMYGAmDKP0nagxJLvshxUJl13hK+NPyVcsJXqiIbV/xdKyUQZ?=
 =?us-ascii?Q?6/kXbF+EdciXVX6nX5bvnYeKTEocjNJIJruXa5S4F3fKPBzcQwVqlboOKWSV?=
 =?us-ascii?Q?c2M9IoslZMRjRQ3y8aBcqU1k+9e+pYmRZrjyRaISwimNCT+MkVypESpSIVgf?=
 =?us-ascii?Q?N3bDh5hVRqJWxxgCO3rVlAjiZ2pENR0ml4ZY/f2Pw2CYKGh/Tyw15IvsGeS7?=
 =?us-ascii?Q?9uoggQBiQRQxhgEsfCbBAQgdWu9Kyn/GBHlmLcKnjg37SVCONNAk724g33jX?=
 =?us-ascii?Q?+53hHWrTFbNsJeLpX+xtgc76xT/oU5Ou+Faa6XwjjpV3bwFeMTT5ImYzGGhR?=
 =?us-ascii?Q?4bI+zbdIDzZOGgNNf5SFLa4fWkNjfOjS/f3xJpViPtap2F8uImIgjQPyGWE4?=
 =?us-ascii?Q?o2mP620A6hjr2XMEOd8vJLGsYxh+eqjF8Sb7XQTGEOS94wHu5IZTCn6r7Z1P?=
 =?us-ascii?Q?NdfKDx+ldvx4b/cJXFgXjzFji19YVrWXaHuJYr3Hs2VUBi6zYsbWS5o5vocD?=
 =?us-ascii?Q?YxIkXa5RTqJ7a/UsuxHLGUH7qcszybiljm81XKbg+Qh0eo4kAs9sY9mDHyXB?=
 =?us-ascii?Q?+YjaCtkX7tVJOY5wXB+za/6Jmgd7sjkrW3/t2zVeEOvh9ctON9TgnTGxRyyA?=
 =?us-ascii?Q?nSoGU4WCRK1n1hhg3X3ETTfc9jmmh2FA6Z8vvYg+XUZnIVqiaGm9iuVzn9Hb?=
 =?us-ascii?Q?V4f+48AEPZBPwQK64jDErAVJ4IlKDGjJhTjXDiMJP2TtTNt+buFCAaOxH9Ta?=
 =?us-ascii?Q?WTaAur1s3sda0ynz5s0Rl7BSYxDDLWkGrNHho64O+RNEo3I0IW8SE/cpCwUd?=
 =?us-ascii?Q?kRNzVzAvfW/+l+5m6e11vio=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead4d764-7300-4ede-49c7-08da5b029374
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:45.1105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5WZer0sv6WmWdpd8z1MDvkySVQi9/WjzP8LEAIt6eckYZfi2hObZIUoiMOcKVVOCaNe9+0TMDGFpRDjCFl/IBEC+Zqs9zZrIz6ypLq0wSzo2C675V41VihtNWG9L7Uu
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

V4H has SCIF3 and SCIF3_A, but current PFC setting is mixed.
This patch cleanup SCIF3/SCIF3_A, based on Rev.0.51.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 71 +++++++++++++++++++-------
 1 file changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 8661cd5a2a38..114b558d75b7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -296,11 +296,11 @@
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_N_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_N_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		FM(TX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_N_A)		FM(RX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_N_A)		FM(RTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		FM(CTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		FM(SCK3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -326,11 +326,11 @@
 #define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP3SR1_3_0	FM(HRX3)		FM(SCK3)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N)		FM(MSIOF4_SCK)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3)			FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_19_16	FM(HTX3)		FM(TX3)			FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_3_0	FM(HRX3)		FM(SCK3_A)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N_A)		FM(MSIOF4_SCK)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N_A)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3_A)		FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_19_16	FM(HTX3)		FM(TX3_A)		FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -796,18 +796,23 @@ static const u16 pinmux_data[] = {
 	/* IP0SR1 */
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	MSIOF1_SS2),
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	HTX3_A),
+	PINMUX_IPSR_GPSR(IP0SR1_3_0,	TX3),
 
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	MSIOF1_SS1),
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	HCTS3_N_A),
+	PINMUX_IPSR_GPSR(IP0SR1_7_4,	RX3),
 
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	MSIOF1_SYNC),
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	HRTS3_N_A),
+	PINMUX_IPSR_GPSR(IP0SR1_11_8,	RTS3_N),
 
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	MSIOF1_SCK),
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	HSCK3_A),
+	PINMUX_IPSR_GPSR(IP0SR1_15_12,	CTS3_N),
 
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	MSIOF1_TXD),
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_A),
+	PINMUX_IPSR_GPSR(IP0SR1_19_16,	SCK3),
 
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
 
@@ -872,23 +877,23 @@ static const u16 pinmux_data[] = {
 
 	/* IP3SR1 */
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	HRX3),
-	PINMUX_IPSR_GPSR(IP3SR1_3_0,	SCK3),
+	PINMUX_IPSR_GPSR(IP3SR1_3_0,	SCK3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	MSIOF4_SS2),
 
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3),
-	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_N),
+	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	MSIOF4_SCK),
 
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N),
-	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_N),
+	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_N_A),
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	MSIOF4_TXD),
 
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	HCTS3_N),
-	PINMUX_IPSR_GPSR(IP3SR1_15_12,	RX3),
+	PINMUX_IPSR_GPSR(IP3SR1_15_12,	RX3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_15_12,	MSIOF4_RXD),
 
 	PINMUX_IPSR_GPSR(IP3SR1_19_16,	HTX3),
-	PINMUX_IPSR_GPSR(IP3SR1_19_16,	TX3),
+	PINMUX_IPSR_GPSR(IP3SR1_19_16,	TX3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_19_16,	MSIOF4_SYNC),
 
 	/* IP0SR2 */
@@ -2199,6 +2204,29 @@ static const unsigned int scif3_ctrl_mux[] = {
 	RTS3_N_MARK, CTS3_N_MARK,
 };
 
+/* - SCIF3_A ------------------------------------------------------------------ */
+static const unsigned int scif3_data_a_pins[] = {
+	/* RX3_A, TX3_A */
+	RCAR_GP_PIN(1, 27), RCAR_GP_PIN(1, 28),
+};
+static const unsigned int scif3_data_a_mux[] = {
+	RX3_A_MARK, TX3_A_MARK,
+};
+static const unsigned int scif3_clk_a_pins[] = {
+	/* SCK3_A */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int scif3_clk_a_mux[] = {
+	SCK3_A_MARK,
+};
+static const unsigned int scif3_ctrl_a_pins[] = {
+	/* RTS3_N_A, CTS3_N_A */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int scif3_ctrl_a_mux[] = {
+	RTS3_N_A_MARK, CTS3_N_A_MARK,
+};
+
 /* - SCIF4 ------------------------------------------------------------------ */
 static const unsigned int scif4_data_pins[] = {
 	/* RX4, TX4 */
@@ -2476,9 +2504,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif1_data),
 	SH_PFC_PIN_GROUP(scif1_clk),
 	SH_PFC_PIN_GROUP(scif1_ctrl),
-	SH_PFC_PIN_GROUP(scif3_data),
-	SH_PFC_PIN_GROUP(scif3_clk),
-	SH_PFC_PIN_GROUP(scif3_ctrl),
+	SH_PFC_PIN_GROUP(scif3_data),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif3_data_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif3_clk),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif3_clk_a),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif3_ctrl),		/* suffix might be updated */
+	SH_PFC_PIN_GROUP(scif3_ctrl_a),		/* suffix might be updated */
 	SH_PFC_PIN_GROUP(scif4_data),
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
@@ -2761,9 +2792,13 @@ static const char * const scif1_groups[] = {
 };
 
 static const char * const scif3_groups[] = {
+	/* suffix might be updated */
 	"scif3_data",
+	"scif3_data_a",
 	"scif3_clk",
+	"scif3_clk_a",
 	"scif3_ctrl",
+	"scif3_ctrl_a",
 };
 
 static const char * const scif4_groups[] = {
-- 
2.25.1

