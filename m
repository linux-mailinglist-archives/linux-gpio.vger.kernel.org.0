Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D76562866
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbiGABjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiGABjO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:39:14 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A748738182;
        Thu, 30 Jun 2022 18:39:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/zZsv5WahWH9qUbrLs29sPMc+zaxypiGrqUF8MSZGH9Djh3VNMV35CqLM6Cakqgb5CN8tSx2mVJR53XIQqGKlMA1fkb2+/r6Z50OpP0u4WupbgO6P043bLFA4l3IqSH5RFm/oL7nFCbbK6npLRXeGvCJgsVgcCBLRBXy3PtPtiiGrnIEer1UC1ey35NNCUJqn3vx5eVwghnkILMLPzsOY559aGKrmOB7YVPmsE9OHVhYQtsB1SZrEBEp9neG0z0jgAs0u0ui54GYs43br8pFcnh2sK4rUqMkDmYht+hDScDTKKNAUlAO8iYk4J0uBmFD7XyFqx5uDI4UkhYF5WA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iq1vWxQfCloT8qm833Bs7DEvUDg44nR8OAbV31QC+6E=;
 b=mHsNu/AZyw7UtIb0qLJXPjY+N0ibidnvtoXdQyHHlwOYr5/PxVv7BZkNO97VlmD4H3wF+hxuFiWZ3oQhaj2cs2j/ZpOedbY8qYiJUHT6eiySAwYZStJtp2gie4D5987n2QtTK6rGqTNvciQrAi8MjN3LDIDJ7mal7vslmlGzDLzW6MAHqElg8bgkuGVigveroYg4BTTjX49DITL9wrK51N3aWS0K8947ZnyR+hDZlQHvcwriZ9RYI12EY3BMIOaqAan7Iy/2MXbviSTsad2Ir7jy5eSFfXRIho+Czz3uRrpIXHDsPvF1OKA9INf/MhYFVSm6JtBD8yXUF+Cnh3J4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iq1vWxQfCloT8qm833Bs7DEvUDg44nR8OAbV31QC+6E=;
 b=Wn9PLGOxwFtDqyFKXxk7V5bq1Ouu0Q1neP+Z8yW8LazuP8y3fA9xPpbnfFV76mhgTejZh+wMvXAMjgyHHN1+ov1y39VFXLecPb2NbRhi4kn0UaXEIIOioLAQOR8j4VfXmqJ0YNvr22E63/HYB3BDahSkJm15QJ8dw6g9zDcF3jE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:12 +0000
Message-ID: <87zghtsjb4.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 12/23] pinctrl: renesas: r8a779g0: add missing IRQx_A/IRQx_B
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
Date:   Fri, 1 Jul 2022 01:39:11 +0000
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cc3d292-78eb-4350-6d10-08da5b027fc8
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C569xz7PnylO06pV+y8S+AfUuP7Telkzw/ws6HSsNBMojKtPqXl+41o1u+CDOVkShhq7lFc4jDETckPyROO5fcoPx8IkpSIkbbEqs7teA2Q4yEHdCJzlXTJ9iU7pPOb49drzZ1QWQyI7KF1g8e+0aa18bbUVX6H1qqv88Dw7qoPCQ7f1u6fDO3TMkkvY6csnXZSlNS1BRbEWi1BNdodAF61f+sQ19UXAjgHS7MUND8aXk/K4u23+cLMQnHANW6J2j5lK9LN5iE6iqmzQ2rqc2Ew/9ZXebviZ+B09t35rUzntauqE+vEyfsoDj80Hw9O8HiChIBqW3B46eqZ8FH6mrdHdpd9MskkBQYAd7jh5wnu41w/ubZdxLbC4kcJ1QpuVH23F29vOjiRW/LOHwoZBmlVZTDjb/AajQ51hjPMAcx/KG6VzYPpzGI3UvoL1hQZkoqpJW1RHcSs3IqpFxOCfzp7rJC18ev3H13t9nUG8CP9ivm2yngkL/xFQg76bJnXZIORLNlwzaclRg1uRHXWQ4KLg+Hb1Ec5BKOsnvogBNhQJe/HTcc/r+Z4PSL061io7kh0cTwNoC0OYv/VgvMPm7UyPwAC3pu6MYY8aDD4qf2IILCqHwZjWPeA3k+M4dMUj68mV6Nvw2deYhdxycOftze5NYM/9mj1rEUIcdWLWPynLLZ4wApxf5wlCJFHK7RGiDNnQ4M/a7/CKWUoVmzI634ozZUZMblBJmyrcPggoaN29hrb4wxzK4gXIrHvbu3kPKuJR85uuVQj7QnqYVew0oDBTK51SOLsB1I5WtvHwzgjjhb/n6E6guo/8HAUPKvHT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:mt;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3JWOMel+a5GNibNaHrX+zE/O/iXaBOFxQb6OsrtFosLl3hk5/gbADJN5yayE?=
 =?us-ascii?Q?tjlSPHRR4f79siOCP4X3Eo2fhXDAwTgr8KS4Rcl5RfKX3tB464QYdnZrutA4?=
 =?us-ascii?Q?sVFj7fCF/bvrJmNUCraDkoG3ABU4nT8FRsudptDEIyvdp0P+sR4elEYV+mM3?=
 =?us-ascii?Q?q/XplWmtDEtZ0CX9xW0kRw7+8xM1va7ACbtSYZ9q7dWldX54ISKh2DrE9GTG?=
 =?us-ascii?Q?IK3p4JMX0ingi5zjVxjxTOj722aXYHM6ehujPk2y8pG9XQevckfTkUZ8ywrs?=
 =?us-ascii?Q?nB22kfuWDypTlPh7lJ7GWulUcdkPqMn/yxdIlu05OO9p2W+k9mOyh9ftEFG4?=
 =?us-ascii?Q?CRa1MPIZ1DF2MKp5ees/A1m5WPRw7Rygow1/FUrJttk0zCAb155wQFRCFAy1?=
 =?us-ascii?Q?ui5DeY4YSHZM1zIx86po5ALJhsFWcxNEkRYPR9lzKNRWn1BFQMBdUQ17ZfK+?=
 =?us-ascii?Q?CR1KdqA4lAKTeDXraJORLchQD0LzjFs8kDcab4S4751RgXMZSeil8i6fUvo1?=
 =?us-ascii?Q?anWUBCjSsy4Fmbf2Np26vMxE0IyI/cxY9/MW+nfHYD4lu8sD/34hwaHFIiHW?=
 =?us-ascii?Q?BUxXl+bSVFBESsWcJ5DkPIHPl78wSGb3wC+qpvyxi/mdPPFw+mywsRivBNYz?=
 =?us-ascii?Q?fqwF31TdlihYx/XmA816WnWwgQidDd2m45Yx+QuscQFo03ibgjyM+EuAMoVf?=
 =?us-ascii?Q?fpTPOzgPCPGENEq3/uJtMu8n/v+kEyd86sfLIxTG5VsIBSCk1yYSciWWjACn?=
 =?us-ascii?Q?QWxUfJNN7lWqXNeR2iGd9tYccJ2vnc0dY3sBV4WSkhdRi4EicpbL1BtqC1Hl?=
 =?us-ascii?Q?w23Vt2Nie6hdomgzSaqksSV8x2hpW4l+5rkdBxzSsuEbikGwlLfL44QQF5YD?=
 =?us-ascii?Q?ISRdCC3KWJhIc2+HMWjnXVtC6wq0AiA9qDtT7GHcFz9EQgrQGM2jKjPbEzol?=
 =?us-ascii?Q?EVZIG810FSNuvLDU8ihz4Kxgtm8Kq2VBbna72W7JWFKivMJWmIfK3fKMelUX?=
 =?us-ascii?Q?oB9UyjsTnn6U3RQKjzMGl4Wy7rkmF+p/l3L3DykaR44SbyA08EeAQt60fyp/?=
 =?us-ascii?Q?IxodDQAgI0aku7d6S+jweizNn2AnZlCn8oapEFec9d305LsrKYXQ33gsAmOv?=
 =?us-ascii?Q?uNP/UZDgzPk+fBQvIZQaRqDD2QRHSDfcDM66449oINHl9taQGZTOBgwSLzt9?=
 =?us-ascii?Q?z1gOs6nw2xjQDQ5w9RiRpxPnhHgIztBaPHTo3LEN6yjAFa8V4Y4h4weu96se?=
 =?us-ascii?Q?xCTvL/lYSlhdBd7swg2iumxwrk94Svcf57G4XgVtMonk1smfU9RPB2eHNFdr?=
 =?us-ascii?Q?mdApeRhIUjKVg4OIVbqo1uet5TrAketOQY96+PF/7TUQLxXNojUeB6NC0E4c?=
 =?us-ascii?Q?LjRA6cfPe0BGXAbi4k7RvvFV0ruZziHBD4tv17Gc/UFyyILO1fy2CfXfha57?=
 =?us-ascii?Q?tXtaUHKDXuTKikJ5tlugwhIiq1J/ybc6TOCci3zuWE0HALt8UFYTC+2X33HG?=
 =?us-ascii?Q?wLjggmn61/fsgaJr3X6KUGA+jNBdCdTIek35BMkL7aiDLhRAZJ8jdtEthxwD?=
 =?us-ascii?Q?LUBoHKxY/+PEWvLduFeMYaAzVS7ok0uENDVY32YReJRZ5+kFteAc1bqmdRW4?=
 =?us-ascii?Q?8DIii2GNsJDQlhTqa44H4JQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc3d292-78eb-4350-6d10-08da5b027fc8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:11.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2Kw/9L3A7q4d2cLrP7wYqrNuLAC/pB4bPQtRJELxbPSnCYq3jcEX2jldcKe6is12I+Z22zw3fg2dsN3zHPRhMA/QOogPFLvKNk7JIuc6qd65pkT1LMw+8d4js9uYoWa
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

This patch adds missing IRQx_A/IRQx_B, and tidyup existing IRQs.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 2b2a1a8756ab..579ad8cbe890 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -285,7 +285,7 @@
 #define IP1SR0_11_8	FM(MSIOF5_TXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_15_12	FM(MSIOF5_SCK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_19_16	FM(MSIOF5_RXD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR0_23_20	FM(MSIOF2_SS2)		FM(TCLK1)		FM(IRQ2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_27_24	FM(MSIOF2_SS1)		FM(HTX1)		FM(TX1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR0_31_28	FM(MSIOF2_SYNC)		FM(HRX1)		FM(RX1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -320,10 +320,10 @@
 #define IP2SR1_7_4	FM(SCIF_CLK)		FM(IRQ4_A)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
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
@@ -337,7 +337,7 @@
 #define IP0SR2_3_0	FM(FXR_TXDA)		FM(CANFD1_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_7_4	FM(FXR_TXENA_N)		FM(CANFD1_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_11_8	FM(RXDA_EXTFXR)		FM(CANFD5_TX)		FM(IRQ5)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_15_12	FM(CLK_EXTFXR)		FM(CANFD5_RX)		FM(IRQ4_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_23_20	FM(FXR_TXENB_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -770,6 +770,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	MSIOF2_SS2),
 	PINMUX_IPSR_GPSR(IP1SR0_23_20,	TCLK1),
+	PINMUX_IPSR_GPSR(IP1SR0_23_20,	IRQ2_A),
 
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	MSIOF2_SS1),
 	PINMUX_IPSR_GPSR(IP1SR0_27_24,	HTX1),
@@ -840,14 +841,17 @@ static const u16 pinmux_data[] = {
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
@@ -883,6 +887,7 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CLK_EXTFXR),
 	PINMUX_IPSR_GPSR(IP0SR2_15_12,	CANFD5_RX),
+	PINMUX_IPSR_GPSR(IP0SR2_15_12,	IRQ4_B),
 
 	PINMUX_IPSR_GPSR(IP0SR2_19_16,	RXDB_EXTFXR),
 
-- 
2.25.1

