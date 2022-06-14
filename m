Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A95554A91B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 08:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbiFNGAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 02:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiFNGAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 02:00:03 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EEE35AA8;
        Mon, 13 Jun 2022 23:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWEj5flSzD8X5H+ttOLrguWqXE4HOU6GI4O/Cf+hTJGeCj1ehU6g15gDsi7RKH5w7MxPtx0VqkNsxkEnuimRyGg4nEtyB8BglM8ozJZSY3XVnfHlZiISUxN39XGt7K19Y5bZQTribCJkQqTyUCTZ7fgumHhsnffQqYiHQbpfJwI2HmLXc/ADXcpKuEGaqZmtL/B50B/NSLJS6ntdT80ONA1Y9WpYyHnmDWmo8HPtOvlr+oXInXRSTwD8FkIiM8RYaKIar3LDYj7BgWw4VkiSOkfhumI/+2w3BYBcfXWOU6asqtwLiIBX2OvrpqqiKGldgQ+yEknowu4lWf/7gjvZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytv8SR/Bdm3JHdcY7LEu5tMlZwxandUv0SonOyApRmM=;
 b=cT9nImlO1bF/ZffzzQGTCOXIxZQQ1dPbcb5yNAX1sgORrT8tZn7KSyFOXn9YHM9Zrh9zCNY59GWRur9lDQF5Tk1+l5/O3a3c65GR7PY+k/yjqo3st0Dtrh8uZtUCMR3coUCUtvZKk0SdPOhcU+eC1HBs4xh37lFm48G0c5fSvoTtxgHvuA8xj3yfNplCOjacqXmxEhJq8HPpvsz8fF1P4Ba5ibJ+ebqC3cJLocRkwDWsTo1aIlAwu2LtUlNf+MIwvcsbq4aooAGGV3yt7HWYVFWZ90GbPouPhgV+Xh+I7CwmADlILYaUzmuzDYO+dGCXGP3KWufdMLBpQcRDVrVjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytv8SR/Bdm3JHdcY7LEu5tMlZwxandUv0SonOyApRmM=;
 b=lDK1KSix6n/+jtf0YGAwHUED0EaCaQWGSmrlaw28WIN5MVkF4KaBGFETkk5PWFsdduDAiwq7nxtr8JeDc2yMD7gJzUm0BgEYj9RAHKxEEFD8Fzd/Y8seTofFoZgNElG0Cf+unnO9dHuixu8ioJOrS2XUcBoOEd1RHutbUkIroIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6167.jpnprd01.prod.outlook.com (2603:1096:604:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 06:00:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:00:00 +0000
Message-ID: <87letzkcnz.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/21] pinctrl: renesas: r8a779g0: add missing SCIF3
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 06:00:00 +0000
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8fa081a-b52b-4605-1e64-08da4dcb1e0b
X-MS-TrafficTypeDiagnostic: OS3PR01MB6167:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB616758E0F37A0E0CF43AF98CD4AA9@OS3PR01MB6167.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMh9UgaPJSUSa8vYFVahec0EXuXWydQkkpuZRrr1Gxd/t3H5vWS6h4wsBFkuTb+7OOIGF1hniqEIFsjQJ96FUG1VMOmTJS4SokEP1/F9xIM6YbevSTX4+8jq2nPzEhkMBKrSoWemEt2TYzsS7h79UgKngkITDPnYkG8us0hejTnkhea2uRaTCx6Ifvr7j0EsjZCWFcQsec7Les70e+lSH3XitOMcPQhPn3dWvq1xWtlJvORpPtYUp0fA05mre+Oz49nTG5X6GrOVBvuOljvm6brGoRm7IC3rKRgkc8GU7ZyPYIRHHOi/5CmQXRJkCeNMHjFtoQkPd/QXowhA5m9ZYHrVE6YcWY9iPgtuC3j7PyMojIaXwNdMfH1yUxRPYMrAnDRJP2WXJw/hnxaqvCVR792/qc4KlLKShVpOS4Sn9FgBAI+u/6qAJxFZ/cHuB+Sl0KLxNibX991CfDEcmbUbH+6nH+OFi/gs2F+ZKkcHykHOsevfeHIy08Zkytko8Ul1HKmiV6wR5takbmP0c5cp/g66ii+qP05Jn2+fe42uBYeIvGnb4sPnTvML7w7YrBwe1cjG0gIaqHsF82GKV7piosEZG1KNE+5PpsUvFQgCDsMPM8g40dkUSSpmIjkvFMPUNsR0wTEyHeJn5Ro0Xdo9yTSaSlioASYtqiKqV25QjiJR0689wGrMTJnH+fY6yADVIHA/m9SuuxFgsZljAQASr+bgOBvnIVo7dR0eGp1VefE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66556008)(508600001)(4326008)(66476007)(52116002)(38350700002)(186003)(316002)(6486002)(2616005)(83380400001)(8936002)(66946007)(8676002)(36756003)(2906002)(5660300002)(26005)(6512007)(86362001)(38100700002)(6506007)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AZ0ER+ds1pv6tMZyHsD+ZhY+ZMD+QTQXApLBPUkVxpZehjiQoWf75FESw/D6?=
 =?us-ascii?Q?uHH2BtBdOMwbZlQPJgZKoJwnHOKk4mlxf04APtMLcjyAA7FuEv1riVVISfae?=
 =?us-ascii?Q?iHEJd0PdQI+CKZ1nFK1yFnuKPyBRBdk6E4nqAdLq4gtOfp9yQtPPynpZ3LmR?=
 =?us-ascii?Q?Ci42Bx+dfkJPlFz4NgAzf2GXr3e+Vjvo8Rek5IIZFYPWusNtSLm4jsnSgQ0l?=
 =?us-ascii?Q?MkI4CxrK+BXtiJ2Wc+yCK0ddX4VDhHGLJDWvcelQkA7cgv5jRFRr0ag4/LDa?=
 =?us-ascii?Q?1KY1TmA0H+QYRH4Hq+5dumZMA3hJGXBABlqvsVteooOlDB6kEwyV9IzYDhKO?=
 =?us-ascii?Q?QvTtEesYO3TMEHZCgYrIRdRIwVsSEk0yPdo87yf7Y5xv/dVIWmeEBRCVCJcK?=
 =?us-ascii?Q?XXC+4AHqwzb/C50Yzj6AocIF2xOyKpMzX1SxvDxsnWv4gnpWe+DagLpS/6ON?=
 =?us-ascii?Q?Mf8wRv++SpP4XQq2W6Sgu/bfErXwW6b13akSFvrzrr0Ib3leS6SSDRCHkHvL?=
 =?us-ascii?Q?AnaHwrgdTlooQqNxBVIkEZHYMmuX6KeZuw4Zn6+lM01hIXpuW2G4Ts4HvoDz?=
 =?us-ascii?Q?OhETxaF6Il5+CmCOUilXonQbI6GgE3riQwmOUEsTfRylFrVR96+hvXc8Bt8j?=
 =?us-ascii?Q?xKm1l+WITB8lGjxYhUNjwT7Bmk8Qn1zOVAL3tyAsbubrUgGPRHbmhLjPG28d?=
 =?us-ascii?Q?Iq4o7hrJiAPzqWfuliWDazg7WP1qwIufd+ppdzTjB1KNda7snV95qdvOAuAQ?=
 =?us-ascii?Q?TInJw0qXLE7sKGS1/1+de7DfJLOmT2BuGX0m5AEyRSsEUwAXazyndcmnTqx5?=
 =?us-ascii?Q?TKXa7DIWqbsGBQwX/uDES+vgcODBg2oCAuAGKIQBy3b2iF1AiOShr0Vz16Zx?=
 =?us-ascii?Q?meEXodbcQE2ijDK7Y39K/C/DLYCqRTjd23vDb5Q0kvcD+xNWKPmblrhr7Ozy?=
 =?us-ascii?Q?5nC68JWb9SBAyWSNGKC0yyQTgmMatCcfoGA3OaNaQZlveqVQ/jvEWvvE73uI?=
 =?us-ascii?Q?mlgBZimdzwkTCF9lUs9HLO/8UNB97cQDFfo56THFtKNlXu+UIxapG8lxDuWz?=
 =?us-ascii?Q?6DlbizfYpDr3BhI2wuUDPiLJgVwzoEqc1G7Zo956RMr49hsVdNoW7Cp+9tmg?=
 =?us-ascii?Q?nK/QgbGP8gKowkx8ruThXrpSDfv/+RUCc04erwkvbivx+Hd2YMqEeyHtDgz2?=
 =?us-ascii?Q?jAcaZftStOtTdlAZE5ROMW2CwtSZBlQnmRCT19IsTcBk4wPWEqK2PVbENwuA?=
 =?us-ascii?Q?w6JhG+yLun4HEi0Vy1WSvG9iQypxAE7TMVoU3zDQDQRtlsnVnTgb9bFXhUpc?=
 =?us-ascii?Q?VDywBP5xouNHcfPigCsJmkn5q15sNjqSmPu+XrDB6kuqRMMbN9xkJIN5jt/U?=
 =?us-ascii?Q?kKRUMqlL2xCN8PTtTZ75CXRA1E5DTMJCChKc2tPtAUF33MpyVY2u/sax/G1Q?=
 =?us-ascii?Q?WiBzNmkEgdn1MtQNEctvESnewq3AVGaGzyi7IXVzWjxh5xnrDcRfPtXhiIgk?=
 =?us-ascii?Q?5eXOSkmQBe4wEzbdDvwkcvYCknnXI8WtMesMi7aGrgrqIAdubaWvTI4CwbJc?=
 =?us-ascii?Q?8AhjDxpb+hqNho7e77jn9slQdixb40q4gmMzETHPTDoNpHGJIpq1vk0DRzQa?=
 =?us-ascii?Q?WaPjPHP2fATn14xgnNdxg9oK6tFJ8cn0WHPDnqDeyRScxNNTylQ3rmaQDO20?=
 =?us-ascii?Q?51nXyFot71WlNxF/ueFH+jAf5p5nKl/xBfRXpyBSbedk0AiPc7Iox7cBlh99?=
 =?us-ascii?Q?kGMqU5i5TV9enOZyy+JWumsT/P0m/KGsdF+NI7XWRVD17wpJGtBi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fa081a-b52b-4605-1e64-08da4dcb1e0b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:00:00.4872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPUsWemUof4bM87eOhE5b95NuqxEvXElyQzkwqk8JaGuTYKQM2S2m43MCUGp4lyiqfmGwZbmk4llw0cztPG9x5lNsI31pf/ZwmdYx/V+QAY5NZq9pdLdVNfq0Cub8zdw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6167
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
Exising SCIF3 settings on IP3SR1 should be SCIF3_A,
and existing settings on scif3_xxx[] are for SCIF3.

This patch add missing SCIF3 settings on IP0SR1,
rename IP3SR1 settings to SCIF3_A,
add missing scif3_a_xxx[].

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 68 ++++++++++++++++++++------
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 8af0bc89d4e1..634ef17b76f0 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -289,11 +289,11 @@
 
 /* SR1 */
 /* IP0SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_A_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_A_N)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_3_0	FM(MSIOF1_SS2)		FM(HTX3_A)		FM(TX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_7_4	FM(MSIOF1_SS1)		FM(HCTS3_A_N)		FM(RX3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_11_8	FM(MSIOF1_SYNC)		FM(HRTS3_A_N)		FM(RTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_15_12	FM(MSIOF1_SCK)		FM(HSCK3_A)		FM(CTS3_N)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR1_19_16	FM(MSIOF1_TXD)		FM(HRX3_A)		FM(SCK3)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_23_20	FM(MSIOF1_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_27_24	FM(MSIOF0_SS2)		FM(HTX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR1_31_28	FM(MSIOF0_SS1)		FM(HRX1_X)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -319,11 +319,11 @@
 #define IP2SR1_31_28	F_(0, 0)		FM(TCLK2)		FM(MSIOF4_SS1)	FM(IRQ3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP3SR1 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP3SR1_3_0	FM(HRX3)		FM(SCK3)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_N)		FM(MSIOF4_SCK)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_N)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3)			FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP3SR1_19_16	FM(HTX3)		FM(TX3)			FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_3_0	FM(HRX3)		FM(SCK3_A)		FM(MSIOF4_SS2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_7_4	FM(HSCK3)		FM(CTS3_A_N)		FM(MSIOF4_SCK)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_11_8	FM(HRTS3_N)		FM(RTS3_A_N)		FM(MSIOF4_TXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_15_12	FM(HCTS3_N)		FM(RX3_A)		FM(MSIOF4_RXD)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP3SR1_19_16	FM(HTX3)		FM(TX3_A)		FM(MSIOF4_SYNC)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* SR2 */
 /* IP0SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -825,18 +825,23 @@ static const u16 pinmux_data[] = {
 	/* IP0SR1 */
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	MSIOF1_SS2),
 	PINMUX_IPSR_GPSR(IP0SR1_3_0,	HTX3_A),
+	PINMUX_IPSR_GPSR(IP0SR1_3_0,	TX3),
 
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	MSIOF1_SS1),
 	PINMUX_IPSR_GPSR(IP0SR1_7_4,	HCTS3_A_N),
+	PINMUX_IPSR_GPSR(IP0SR1_7_4,	RX3),
 
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	MSIOF1_SYNC),
 	PINMUX_IPSR_GPSR(IP0SR1_11_8,	HRTS3_A_N),
+	PINMUX_IPSR_GPSR(IP0SR1_11_8,	RTS3_N),
 
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	MSIOF1_SCK),
 	PINMUX_IPSR_GPSR(IP0SR1_15_12,	HSCK3_A),
+	PINMUX_IPSR_GPSR(IP0SR1_15_12,	CTS3_N),
 
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	MSIOF1_TXD),
 	PINMUX_IPSR_GPSR(IP0SR1_19_16,	HRX3_A),
+	PINMUX_IPSR_GPSR(IP0SR1_19_16,	SCK3),
 
 	PINMUX_IPSR_GPSR(IP0SR1_23_20,	MSIOF1_RXD),
 
@@ -901,23 +906,23 @@ static const u16 pinmux_data[] = {
 
 	/* IP3SR1 */
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	HRX3),
-	PINMUX_IPSR_GPSR(IP3SR1_3_0,	SCK3),
+	PINMUX_IPSR_GPSR(IP3SR1_3_0,	SCK3_A),
 	PINMUX_IPSR_GPSR(IP3SR1_3_0,	MSIOF4_SS2),
 
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	HSCK3),
-	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_N),
+	PINMUX_IPSR_GPSR(IP3SR1_7_4,	CTS3_A_N),
 	PINMUX_IPSR_GPSR(IP3SR1_7_4,	MSIOF4_SCK),
 
 	PINMUX_IPSR_GPSR(IP3SR1_11_8,	HRTS3_N),
-	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_N),
+	PINMUX_IPSR_GPSR(IP3SR1_11_8,	RTS3_A_N),
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
@@ -2228,6 +2233,29 @@ static const unsigned int scif3_ctrl_mux[] = {
 	RTS3_N_MARK, CTS3_N_MARK,
 };
 
+/* - SCIF3_A ------------------------------------------------------------------ */
+static const unsigned int scif3_a_data_pins[] = {
+	/* RX3_A, TX3_A */
+	RCAR_GP_PIN(1, 27), RCAR_GP_PIN(1, 28),
+};
+static const unsigned int scif3_a_data_mux[] = {
+	RX3_A_MARK, TX3_A_MARK,
+};
+static const unsigned int scif3_a_clk_pins[] = {
+	/* SCK3_A */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int scif3_a_clk_mux[] = {
+	SCK3_A_MARK,
+};
+static const unsigned int scif3_a_ctrl_pins[] = {
+	/* RTS3_A_N, CTS3_A_N */
+	RCAR_GP_PIN(1, 26), RCAR_GP_PIN(1, 25),
+};
+static const unsigned int scif3_a_ctrl_mux[] = {
+	RTS3_A_N_MARK, CTS3_A_N_MARK,
+};
+
 /* - SCIF4 ------------------------------------------------------------------ */
 static const unsigned int scif4_data_pins[] = {
 	/* RX4, TX4 */
@@ -2508,6 +2536,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif3_data),
 	SH_PFC_PIN_GROUP(scif3_clk),
 	SH_PFC_PIN_GROUP(scif3_ctrl),
+	SH_PFC_PIN_GROUP(scif3_a_data),
+	SH_PFC_PIN_GROUP(scif3_a_clk),
+	SH_PFC_PIN_GROUP(scif3_a_ctrl),
 	SH_PFC_PIN_GROUP(scif4_data),
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
@@ -2799,6 +2830,12 @@ static const char * const scif3_groups[] = {
 	"scif3_ctrl",
 };
 
+static const char * const scif3_a_groups[] = {
+	"scif3_a_data",
+	"scif3_a_clk",
+	"scif3_a_ctrl",
+};
+
 static const char * const scif4_groups[] = {
 	"scif4_data",
 	"scif4_clk",
@@ -2884,6 +2921,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(scif3_a),
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif_clk),
 
-- 
2.25.1

