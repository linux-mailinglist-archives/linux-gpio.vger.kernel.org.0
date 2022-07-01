Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB42562864
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbiGABjH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiGABjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:39:06 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B71538182;
        Thu, 30 Jun 2022 18:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX95+LS1T29vdAXALhDeHNYIcyU5ZhGG4ArxLXb/F+Mauep7xovz9vgplR1Z5Z5YUD46k7PhLAvtwktqa3Dhb/SIW8KL+II6B+1aMhlTRHs08tHYPFCY8KsFDe9G5cBlm/LHpmEzXrRgfW9cjMOa9GYvcK4gw7qg6f4hquGqaCnDmi+SaGV08OZgPawMhJVbhSuzjJp+K9KUQ9WzgPbMYMxjbxUD52gnT+hhYFDM99Ff9m6rbTPtHq6c4GXSlYWQrVUAog6N4xmlCnETWpZlp5C76KjBkvht749Pi0rqJ9jnMQ4yqZUZXqQyagyMhgUV/VfgPXVSGCq4iNR0QH6VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7cRdFeNH4rgX1bnb03qMi6g81WqNEtufyux8YkEPTM=;
 b=ErffJPMT1z/Y6rUDUSU0HkFlwRadonQlCaHz+xBBYAZI5+QeyPpR7yTqfQ84fF9vg/4ch5DVbAsyGOm89Tnv7t0EWjSkjWGgjx6E1KRpl+a95ZZMz2xsBqJWxKptgd3UIhMW33daKYTc98Dj5xkxenEWVNtKvnWBQ+CmAKbhLeKH1WhwUk0SwMBTQ/Wp9kzYyDMGIH7o7QalQs89ysiDuV+Z2epI15aJkFaits9xQLsCRKMxG1DsLUmpv7UvN+1cPnrxafXnQbd3pnfRghSzmdwwpFj7lKHE75t7TAR53qQDsrFep5EXB456JTY/Lv8wlPf8oyCn6jQ3iaYYd1ltXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7cRdFeNH4rgX1bnb03qMi6g81WqNEtufyux8YkEPTM=;
 b=k7uuzuvnjjpecKa2FLskXkcX58NGXlyzVLsKPKxNHLPt9+erVS+Hl2XrtrvSVdz8tMxWeTHrmSIn5SjdaTL4f5/d6qMQmXFgKzD81om0U5M5O1WC3ttSQMYJYYDgr7HySY3qjYN5MI+pkMnSQpx2ljvs58xg5E+WPvnN3SL7SV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:39:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:39:03 +0000
Message-ID: <871qv5txvt.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 11/23] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
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
Date:   Fri, 1 Jul 2022 01:39:03 +0000
X-ClientProxiedBy: TYWPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6810d37c-15e6-4166-e7de-08da5b027a9e
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBHdBPRwqP+Ymv/CloZ6wF6j9dQcnT/IiUteXQRMBNr5bCqBN9hMUdjTrpzF8WDRSJUplqXMR98O+Z8ABoIurMj8HzBA+86N1AJKkGmxmzS5YQlbG0kf3k8/mbo/nOeEfX5uQwk3oQOm0lY5AlA2LWqfXjrIUcuX3idF2aHMzr4EruJt64gZe9vyBYH5fWyltX24karaaztmZisjtbHuHGk7NQGdo/E7YRqk6bq2bhFBYAoNebcmy34bcbcAAqP8C24yuIzTpRSZg0qC2YnmEhK9OltqSkjfBdduPYUe+81U5rggJ8B66B2Mv2JVLF5FSMrNpVcm8wQorxRZGBwhtDRO/FVDhf5jB6ahPmFen3+AUfVn3fcbQDBni+5ybvExKEbmRjnJHExeoG/43Uq4ATQNQ717+ytggDe6mXnVB7TdPBoDiW65czoYLrCW57E/9VoOU/R5Zg1SYjrq1LYTZrPIzIAEbsyDQWDJIAb+l6ta7ixIHKw0Kvv0b1R/kqHVAgUjlejnp8HqSYPRFe6aSaBOutcylmrO2bBeowPOJmTRNIRZ/GReAasGcNM1Cobd12xCbSW73RF+J/dITMtmhPvEnnKEVFVU7hb1H0wPZWyIptjWrn3h3VOmsQTeMi+Azh7VV7c+1/9kstE2ikMKPTFlcTitfdYDlnjAWy+6IYjrWEb/L6Vi6wqjiuXenu3p3PQao2RAq2AVQHJvYcbTLE3j1GDOPbtKzvJ/8BasrAyf1wOWlphsJiyK+jRHNeP8MZA8XUHEEBipBT2SGiOmafgdMobBjsizHuAwm6uPsWdEnZwXz/5OytNu9M/aX31I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:mt;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smdpAUaKu3UqNltayME1eESgdeXzHawOyo5aElawmflD1ibz2TvGGpLuvBU2?=
 =?us-ascii?Q?T6rQJ68dfQ0PDjHqi2lxoZT3o1Iws3xbTExsHoyRAaop9PMDbF7cseUS9Y4+?=
 =?us-ascii?Q?1e6KDqR/rNLtFH51K2br0whxrWqLj3i32qGgiagEJpBCMZ9YY5+x5qS0eNA4?=
 =?us-ascii?Q?w7D8WPdc2P9hn1RSLfiIk7LtvxVQWzWzh3twIsK5KfUEZFZk7u/V7FHkllyi?=
 =?us-ascii?Q?15+k6L/rbs3NEzN4ZZXonHHa6LKHrM+4lrq8yrONYVVLiZBF+Fr/GV/PCflj?=
 =?us-ascii?Q?C9PqqE9ROg66dNuC9NMBgduD7HFyTYowqwWyNtkORwigpz6Wo20e3B31J/ku?=
 =?us-ascii?Q?o6nzYE87PukD2E25dKYwJJwQHC+OAgWykye8AicxgGJ7AAuy9UptksjbVFGY?=
 =?us-ascii?Q?y7jo3xAdVWnzoGqmnrrXJwnjN0bdtkXgzczY3SLyTjSKhXKO7OLyDyuX8sWx?=
 =?us-ascii?Q?lo4RXJEIdI+U/j+6MxLjfJT02ih9Afh8DM6gRIXedBAQqLHUo6oVILs3cOlU?=
 =?us-ascii?Q?EmQqAJOU9S678FVY+RpR8ntu16KkkJs8ZSNGOg0bEMSAe+H1H9/4FPwbKvd0?=
 =?us-ascii?Q?YfSClJNc9dR801WoOrRN6PiZkVgi6Cbf7Kg9/pLY6ygRis3UvJaEI91eD8/I?=
 =?us-ascii?Q?FTX8LDpfJ9RBXy1hBZGH+JX0I7YcCf0bN5IR5oEdMlavJXZSvCFJAqpLZ1gD?=
 =?us-ascii?Q?NRZPoD4Rjy/Wj+qcyZXLjnB2VAVKdPnZ5J7BuW8STsfcy/Qp8/nuNmrMxzrR?=
 =?us-ascii?Q?hO0gZrQZobbqKpM0BHQbxl4GBCPADw+GRwDmkqgq71OmvOKjbWgQ+AdEZTmL?=
 =?us-ascii?Q?O86yVzRHiMRhTfzsPQj4Dbh4dn36rFMDVcC+OL0IX7v61paWn7QqDDcEQP5t?=
 =?us-ascii?Q?JjKd7ulaoSycgQObB8gcqNopklQOzGNxisrw31iOTjfVrFygcrSXcJilLymv?=
 =?us-ascii?Q?mwPfGlG0uY/88D+ik4/LvT6UBbK9UrcgkETZ4as4UkLoksq/Bvr5OcItyxkx?=
 =?us-ascii?Q?g4zL6hEOLummKi5l9E6Tz44HNdRthN2a0mywOWA0h3TaHgZSv0tj2zsfxbyw?=
 =?us-ascii?Q?tRnRrkr9UrU24/urk5i0mZclwozXK3F8SUF5uf5pVofS2CQcBfyMxatvrsht?=
 =?us-ascii?Q?3ufYz1VIDIGTJXRb1XeyXPi2y6G5W1zFebQjtDFY/PE/aH1cPeAF9t918tGW?=
 =?us-ascii?Q?R2lz+581+BR30qVHlba9Pzpt040ZJLrFWf8F/PWaPnh/y5SrN5xdrn7jd4yh?=
 =?us-ascii?Q?SuwzycTGyK11QtrwYYW3sWFnfggRAxLsR5cd8ZZptt4V3D/2n4mdodK2UvdV?=
 =?us-ascii?Q?pe76YrOFCvjapXcDlinsRvUWraUttjJN96uHsCWRrR0/QhhhKNI3H/LTWPIC?=
 =?us-ascii?Q?xXEaa7vPTaxhzg6nthWADmh9YlEjEitWe/S9u9eqquiJ5Flgujo8eDXkhO9i?=
 =?us-ascii?Q?fWAQqyjJf/cAn9B3+yErT/I0JNn8ymtuFrJgEvLJm8hgtgJ9+t4EBtiIkCXm?=
 =?us-ascii?Q?p2g7rMKuDaURWjXAMy0aa1etFF9khmir3eMasosEqLFFpaeEcfGAQ8QUKNfR?=
 =?us-ascii?Q?6tXWfAN3SXdYLOwyOozwa5eDPymGG5GhbL4NjblfGr4gPxUKoouXCCB4hfb2?=
 =?us-ascii?Q?as+TOjTGO/OiyF5vua+V63M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6810d37c-15e6-4166-e7de-08da5b027a9e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:39:03.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etSZ3LlN8RXaxkWCNyYGwDdGU5dPDHBzaDp0zJ2MsPxlgRwdjvWzQAI1zStRUyBEqXaM+mOmz7nRTXa+F3/WehQldZdtfwKu3x3iGiiAu4Dk6DBDYbOVdN1S5sWtR+M+
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

This patch adds missing TCLKx_A/TCLKx_B/TCLKx_X

Because Document (Rev.0.51) has 2xTCLK3/TCLK4 with no suffix (_A, _B),
this patch name it as _X.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 281bca886307..2b2a1a8756ab 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -270,7 +270,7 @@
 
 /* SR0 */
 /* IP0SR0 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR0_3_0	F_(0, 0)		FM(ERROROUTC)		FM(TCLK2_A)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_7_4	F_(0, 0)		FM(MSIOF3_SS1)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_11_8	F_(0, 0)		FM(MSIOF3_SS2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR0_15_12	FM(IRQ3)		FM(MSIOF3_SCK)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -341,15 +341,15 @@
 #define IP0SR2_19_16	FM(RXDB_EXTFXR)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_23_20	FM(FXR_TXENB_N)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP0SR2_27_24	FM(FXR_TXDB)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP0SR2_31_28	FM(TPU0TO1)		FM(CANFD6_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP0SR2_31_28	FM(TPU0TO1)		FM(CANFD6_TX)		F_(0, 0)	FM(TCLK2_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP1SR2 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
-#define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_3_0	FM(TPU0TO0)		FM(CANFD6_RX)		F_(0, 0)	FM(TCLK1_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_7_4	FM(CAN_CLK)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_11_8	FM(CANFD0_TX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_15_12	FM(CANFD0_RX)		FM(STPWT_EXTFXR)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_19_16	FM(CANFD2_TX)		FM(TPU0TO2)		F_(0, 0)	FM(TCLK3_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR2_23_20	FM(CANFD2_RX)		FM(TPU0TO3)		FM(PWM1)	FM(TCLK4_A)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_27_24	FM(CANFD3_TX)		F_(0, 0)		FM(PWM2)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR2_31_28	FM(CANFD3_RX)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
@@ -376,8 +376,8 @@
 #define IP1SR3_11_8	FM(MMC_SD_CMD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_15_12	FM(SD_CD)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_19_16	FM(SD_WP)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_23_20	FM(IPC_CLKIN)		FM(IPC_CLKEN_IN)	F_(0, 0)	FM(TCLK3_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP1SR3_27_24	FM(IPC_CLKOUT)		FM(IPC_CLKEN_OUT)	F_(0, 0)	FM(TCLK4_X)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP1SR3_31_28	FM(QSPI0_SSL)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 
 /* IP2SR3 */		/* 0 */			/* 1 */			/* 2 */		/* 3		4	 5	  6	   7	    8	     9	      A	       B	C	 D	  E	   F */
@@ -737,6 +737,7 @@ static const u16 pinmux_data[] = {
 
 	/* IP0SR0 */
 	PINMUX_IPSR_GPSR(IP0SR0_3_0,	ERROROUTC),
+	PINMUX_IPSR_GPSR(IP0SR0_3_0,	TCLK2_A),
 
 	PINMUX_IPSR_GPSR(IP0SR0_7_4,	MSIOF3_SS1),
 
@@ -891,10 +892,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TPU0TO1),
 	PINMUX_IPSR_GPSR(IP0SR2_31_28,	CANFD6_TX),
+	PINMUX_IPSR_GPSR(IP0SR2_31_28,	TCLK2_B),
 
 	/* IP1SR2 */
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TPU0TO0),
 	PINMUX_IPSR_GPSR(IP1SR2_3_0,	CANFD6_RX),
+	PINMUX_IPSR_GPSR(IP1SR2_3_0,	TCLK1_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_7_4,	CAN_CLK),
 
@@ -905,10 +908,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	CANFD2_TX),
 	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TPU0TO2),
+	PINMUX_IPSR_GPSR(IP1SR2_19_16,	TCLK3_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	CANFD2_RX),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TPU0TO3),
 	PINMUX_IPSR_GPSR(IP1SR2_23_20,	PWM1),
+	PINMUX_IPSR_GPSR(IP1SR2_23_20,	TCLK4_A),
 
 	PINMUX_IPSR_GPSR(IP1SR2_27_24,	CANFD3_TX),
 	PINMUX_IPSR_GPSR(IP1SR2_27_24,	PWM2),
@@ -951,9 +956,11 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKIN),
 	PINMUX_IPSR_GPSR(IP1SR3_23_20,	IPC_CLKEN_IN),
+	PINMUX_IPSR_GPSR(IP1SR3_23_20,	TCLK3_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKOUT),
 	PINMUX_IPSR_GPSR(IP1SR3_27_24,	IPC_CLKEN_OUT),
+	PINMUX_IPSR_GPSR(IP1SR3_27_24,	TCLK4_X),
 
 	PINMUX_IPSR_GPSR(IP1SR3_31_28,	QSPI0_SSL),
 
-- 
2.25.1

