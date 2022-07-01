Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A9A56285D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbiGABhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiGABhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:37:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2115.outbound.protection.outlook.com [40.107.114.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7705C942;
        Thu, 30 Jun 2022 18:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbYg/05oAp7yNDn037gx7quuywITbSLT7vRpdYGCMR+taHm0MjQt6BvAdlOX6/eZ7lYbWlr2ts3Ho6lrD3WXHpD0pDiMQPkOmoKIf8hQMWaCLHYyhhiC6oUSzk8PpV5h0Dr3f/muOMycr77w33I3J/3rjXwRqdlNT2aWXGS0eopT8TzNux0p57OrL0ryoTzdlpU7hLjgMQ3/qNIOugiQ4TSoT1SjTRt+n+qRwC+YGEeCTmEdvUqGjeNY30w4tDtlrTVgOL0LVBTZbXho8QBt+XjPDzGAGqGQC0SpFqd5Jdcop8KzIKsvXC3VoCi+cvxHF/GzYVAonb6YGTXQHmFVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzMF7KhfxTmlN/u6JhFBa6YWEk8DeXRRznsqQDr/m4E=;
 b=k8R8jksIzsofGoJkLSAOzFnlJOesP8xVWecB64suOSDoW8hkGdoD7xXSIXT/QwfAs+TTo3OIxYh4p3LBmKJA6k/dJ+jgV6vlLp8R/DoUPKPADcIoTzz25duduqaMCLKB3krIffw+KqJiGEuarYKGzSFJZcbsYOEzMMNPdJHrMOSiqmYyTDVX6FbuTDD7ba9I5J0ywxu35pT6MKDyYD7BalvnNsPaeSmcOIBS24gy6UqrkkcCV0T1WLQ7vOjNza8ssvfsvGfHFQaE4o2g1mE7UnkvN1QWWYPrthLVkolDFOV663Ww4UyhfmXE4SL7zEB82j4QmXZsQQvFogB0vRQUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzMF7KhfxTmlN/u6JhFBa6YWEk8DeXRRznsqQDr/m4E=;
 b=AmKuaPsuTxHu2YfCVqGy3kbQAVK9uheMVkrXO2cvipfFv2qZOM7Q5P2boisOZjC3n7H2lVAmhbbE09mfKyBaWzHXrNEtQy407SidSKQxqgUbnSJT7kOdYFw0VNSGjhvXq6itvSvyqzwM/C9Mq0q6vIc4XFHqOdJy/JNZUiG6Q8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:37:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:37:22 +0000
Message-ID: <875ykhtxym.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 08/23] pinctrl: renesas: r8a779g0: remove not used MOD_SELx definitions
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
Date:   Fri, 1 Jul 2022 01:37:21 +0000
X-ClientProxiedBy: TYCPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:405:2::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86c63feb-6acf-4261-31d3-08da5b023e5c
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pv4h8d1D/AdabcjyiBFK1Qwp3lfgl1iW97Md8Rewc4Th0jJ6T94b/cyKoAvRMKfYdcCpGzk/LSMcAa7JzpylfR4bwYA4PXoYY20UBS6WozTBN6kdvhoKkjp6vl3HMrs1cFn1fi7b7F1XWf4zbtZ3sCa1zk5ioEbovqdM9Ua7LaI9hlcA8YZB3OEroVbnAE+hcc0xiDd+88lQr5FVjltBtZxGcxYyj9SfGituqTPlOZhV3xxEeBrcX1RjocnVJ9DMCC4f7gutltm5Z6oIXHZ+xCDN+r0GA3blDzF7fJ0YwRAhJ6wyAYAZU1TmPQeGJaO3Gdd6oyNS9Dkv7mdeT+B68no3xIrUTWHNd3au7bUEpYxheu0RD///rEpH3HyPjSxGZtuy+HIOPRiN2VMLWgH5p/xWrFDYz9Dquaw/okLiO5WFRTPHPD9NpQS37d3ASL8LZaMj7RGp8gJZLHlkwxjnsEogeY4LWt9bbS6TY3mb0k3Msn/RjYHLsnxelqpqtt3kgMemx/dpynQ9eTSTygOf04F8oPhuYwDM+wG720sB+/TGyGQ/+Jb7hIY9GW8R9ttgAykb+e029FYeDlLAHmLpe6JD/IkY0I8Vp1XBxaaCP6FMOZWpsW465vzCtggC/JQrL0YxIUp8SBv/tlWmkUb6QdFN+Eu0m0zcj2aoIvYi3PonoAZqRBQdWLWq7P2H6pO5ASIvhdnj//L9vYWTPxYS1omGz/KBxpGcGwUPuwhbHahuJZFrF0v46zF69tDLL7zloihXU9yfmwA1ecSwby15SA7RHAUIAXZrjrvueVRmgALnu0s/jYe83Vsjuzumy2YJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o9HINlI/7rw6HJFQauGfsxVq2aUrKJYt8saVbUNoLpqfldtt3Y0TR5IDlqgd?=
 =?us-ascii?Q?oWbQ80wq4YsmczrFwrn7vK4uYYosLEdTxNmWjiAqWeBYLVtbe8GlFO0ZHiCx?=
 =?us-ascii?Q?ArgGZGqq3OYXbJLUjjb2Q3VCgOm8NOclXJ52waCrGJGRylqAi9yvjgYotLu2?=
 =?us-ascii?Q?8shvJ50V0JarYXIcp7edl2NC/6qQ5c7b8QDTei2OMWIX/DASUUnrWBNUg6uT?=
 =?us-ascii?Q?Cs2RhVxgW4NloLN/I+O5UbDfRn0LGSz8sxVMcDind9EZGKcpVzo5J7MgI8KL?=
 =?us-ascii?Q?DhuWBsgc2MNzDyHjetYiPF+HyECpWE2oZLYPzndjv8kMRK4vQvj1Tq+MtUu9?=
 =?us-ascii?Q?jwpwTMApCV1HLpnSJ7M9fvinUCLnJ4XzJq/PU1qsGs+1q9hrlnEtm57oWn1i?=
 =?us-ascii?Q?u3yiKtw+YLTlURW6laWUU7QHHR/hig5OiFfCpKcxlGvyi/FF5NZclguWCkgZ?=
 =?us-ascii?Q?L1y4OymQA5rSU/4fmX0Y8j9wS/G6NM8ae8KAsJwTO3kV+K4MLklZQe6K/2KM?=
 =?us-ascii?Q?0SPutEzUoRorxgBLrm1bZRNOfu1InY87Qwb67VNATcacrDsOk7CqJ4eIO7Qe?=
 =?us-ascii?Q?Qm/14v9oSWv0O44ypBQLajh9lwSUvNioHmKEI4W7rKWGw8D9CS7ernZnx+Bz?=
 =?us-ascii?Q?JtYdlYHkRniQJxSnMGfyK8jMq4dDBvBcOm6eJay4KmvHeY8eyc3ZaXLz2JPV?=
 =?us-ascii?Q?VzNE2EYuoy9A42XtUMbkRbXuAOTgh1n1tIHqwig50G+wlzLcw8G9YXjKtWh9?=
 =?us-ascii?Q?1INFnuAuhbB3CQRRgvfO125NEV4/PtumGd34sBOZWj+0PA+sziNreLERWlm2?=
 =?us-ascii?Q?pOTbFrt8PJ1zTErVGbYaB1nywCKDEMhJPbkIm4rcOR96WeJa1Rz5ISnf1OX+?=
 =?us-ascii?Q?yrrWF9+7eD0qtgjQwvfz616RUfj4K2dM67aV5cBWPbBuDN9+K9iNPcnrDGB7?=
 =?us-ascii?Q?vu1C2BdZU7agVmWFpY2LycijwaL3+3vaqryYlSacCN8CHHxQjvfBFhyXMPQg?=
 =?us-ascii?Q?V45U/HY8WmkbCz9mG/mylOGTMIStYDgviH31oRQYDl6mm+B8+15xvOTBWsLJ?=
 =?us-ascii?Q?C45Yjmr012/+9wTkLriCsuw4DLdnL5OMcy9yQgy7+qMkGUXiwkwjjLpROEZN?=
 =?us-ascii?Q?Be3LM96tnvy3nyjMKgYPdfBEQXE6Q60jFt0qFrcRYsQUPFlXK3qew/5jDYfo?=
 =?us-ascii?Q?mBgUY/725mIuORiQ3a1qdFgp49E3TYee8Mw6gJXfSXqfr9zdQaSdHhgmSSS5?=
 =?us-ascii?Q?me83LQNPMyZr9kwvEsDN64ci8JYnOnvcu0MA5gS+nr/K/W0Kuee568MXtvIE?=
 =?us-ascii?Q?BJmBNd3QVUmO88SrmBWMB5/dVwQGLbIoQStJ7oGk79Ha21BZt/3ow7hK9AqY?=
 =?us-ascii?Q?QoW0mJ7Zla4rFNNzYAqloZKr6lxGyV9RZqv2eK+Fj7FweMXatsoRjoF+7c4a?=
 =?us-ascii?Q?Zw+2RLe+1RR2b80gPkFVV3wAoD+I2YFQ+7AKkNolpcSPEAAmtpEWANIoRueO?=
 =?us-ascii?Q?0RXBXE2b4PZZd+VgOWG90VQhJ68SrY2y+Zm4BD17+ZqE0OjNNQ/koBGuPv4K?=
 =?us-ascii?Q?NaWWiMyp34Tkct6G3tEa1p/IitzRwhfx5X0vqquY66WGXLErbNl0GhxcO8NT?=
 =?us-ascii?Q?dGH1bM+kwGkt1T411BCDROs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c63feb-6acf-4261-31d3-08da5b023e5c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:37:22.1731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlJAEA/3qf6/4Ksh4aYbKEnh0V0ZMfh84Z4qG8bHCTngpCyzaNoITO9iwIDDNCd/EgiWKNSAOGXnwoR+0SiYBGhype2SlAio5I22pJDdmtWneouzWblIHx9Quw1Woxay
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7362
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

Current V4H PFC code has many MOD_SELx definitions with all 0.
But these have no meaning. This patch removes these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 72 +++++++-------------------
 1 file changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index f14834b5fcdb..d590f9108ea6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -566,85 +566,49 @@ FM(IP0SR8_31_28)	IP0SR8_31_28
 /* MOD_SEL4 */			/* 0 */				/* 1 */
 #define MOD_SEL4_19		FM(SEL_TSN0_TD2_0)		FM(SEL_TSN0_TD2_1)
 #define MOD_SEL4_18		FM(SEL_TSN0_TD3_0)		FM(SEL_TSN0_TD3_1)
-#define MOD_SEL4_17		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_16		F_(0, 0)			F_(0, 0)
 #define MOD_SEL4_15		FM(SEL_TSN0_TD0_0)		FM(SEL_TSN0_TD0_1)
 #define MOD_SEL4_14		FM(SEL_TSN0_TD1_0)		FM(SEL_TSN0_TD1_1)
-#define MOD_SEL4_13		F_(0, 0)			F_(0, 0)
 #define MOD_SEL4_12		FM(SEL_TSN0_TXC_0)		FM(SEL_TSN0_TXC_1)
-#define MOD_SEL4_11		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_10		F_(0, 0)			F_(0, 0)
 #define MOD_SEL4_9		FM(SEL_TSN0_TX_CTL_0)		FM(SEL_TSN0_TX_CTL_1)
 #define MOD_SEL4_8		FM(SEL_TSN0_AVTP_PPS0_0)	FM(SEL_TSN0_AVTP_PPS0_1)
-#define MOD_SEL4_7		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_6		F_(0, 0)			F_(0, 0)
 #define MOD_SEL4_5		FM(SEL_TSN0_AVTP_MATCH_0)	FM(SEL_TSN0_AVTP_MATCH_1)
-#define MOD_SEL4_4		F_(0, 0)			F_(0, 0)
-#define MOD_SEL4_3		F_(0, 0)			F_(0, 0)
 #define MOD_SEL4_2		FM(SEL_TSN0_AVTP_PPS1_0)	FM(SEL_TSN0_AVTP_PPS1_1)
 #define MOD_SEL4_1		FM(SEL_TSN0_MDC_0)		FM(SEL_TSN0_MDC_1)
-#define MOD_SEL4_0		F_(0, 0)			F_(0, 0)
 
 /* MOD_SEL5 */			/* 0 */				/* 1 */
 #define MOD_SEL5_19		FM(SEL_AVB2_TX_CTL_0)		FM(SEL_AVB2_TX_CTL_1)
-#define MOD_SEL5_18		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_17		F_(0, 0)			F_(0, 0)
 #define MOD_SEL5_16		FM(SEL_AVB2_TXC_0)		FM(SEL_AVB2_TXC_1)
 #define MOD_SEL5_15		FM(SEL_AVB2_TD0_0)		FM(SEL_AVB2_TD0_1)
-#define MOD_SEL5_14		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_13		F_(0, 0)			F_(0, 0)
 #define MOD_SEL5_12		FM(SEL_AVB2_TD1_0)		FM(SEL_AVB2_TD1_1)
 #define MOD_SEL5_11		FM(SEL_AVB2_TD2_0)		FM(SEL_AVB2_TD2_1)
-#define MOD_SEL5_10		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_9		F_(0, 0)			F_(0, 0)
 #define MOD_SEL5_8		FM(SEL_AVB2_TD3_0)		FM(SEL_AVB2_TD3_1)
-#define MOD_SEL5_7		F_(0, 0)			F_(0, 0)
 #define MOD_SEL5_6		FM(SEL_AVB2_MDC_0)		FM(SEL_AVB2_MDC_1)
 #define MOD_SEL5_5		FM(SEL_AVB2_MAGIC_0)		FM(SEL_AVB2_MAGIC_1)
-#define MOD_SEL5_4		F_(0, 0)			F_(0, 0)
-#define MOD_SEL5_3		F_(0, 0)			F_(0, 0)
 #define MOD_SEL5_2		FM(SEL_AVB2_AVTP_MATCH_0)	FM(SEL_AVB2_AVTP_MATCH_1)
-#define MOD_SEL5_1		F_(0, 0)			F_(0, 0)
 #define MOD_SEL5_0		FM(SEL_AVB2_AVTP_PPS_0)		FM(SEL_AVB2_AVTP_PPS_1)
 
 /* MOD_SEL6 */			/* 0 */				/* 1 */
 #define MOD_SEL6_18		FM(SEL_AVB1_TD3_0)		FM(SEL_AVB1_TD3_1)
-#define MOD_SEL6_17		F_(0, 0)			F_(0, 0)
 #define MOD_SEL6_16		FM(SEL_AVB1_TD2_0)		FM(SEL_AVB1_TD2_1)
-#define MOD_SEL6_15		F_(0, 0)			F_(0, 0)
-#define MOD_SEL6_14		F_(0, 0)			F_(0, 0)
 #define MOD_SEL6_13		FM(SEL_AVB1_TD0_0)		FM(SEL_AVB1_TD0_1)
 #define MOD_SEL6_12		FM(SEL_AVB1_TD1_0)		FM(SEL_AVB1_TD1_1)
-#define MOD_SEL6_11		F_(0, 0)			F_(0, 0)
 #define MOD_SEL6_10		FM(SEL_AVB1_AVTP_PPS_0)		FM(SEL_AVB1_AVTP_PPS_1)
-#define MOD_SEL6_9		F_(0, 0)			F_(0, 0)
-#define MOD_SEL6_8		F_(0, 0)			F_(0, 0)
 #define MOD_SEL6_7		FM(SEL_AVB1_TX_CTL_0)		FM(SEL_AVB1_TX_CTL_1)
 #define MOD_SEL6_6		FM(SEL_AVB1_TXC_0)		FM(SEL_AVB1_TXC_1)
 #define MOD_SEL6_5		FM(SEL_AVB1_AVTP_MATCH_0)	FM(SEL_AVB1_AVTP_MATCH_1)
-#define MOD_SEL6_4		F_(0, 0)			F_(0, 0)
-#define MOD_SEL6_3		F_(0, 0)			F_(0, 0)
 #define MOD_SEL6_2		FM(SEL_AVB1_MDC_0)		FM(SEL_AVB1_MDC_1)
 #define MOD_SEL6_1		FM(SEL_AVB1_MAGIC_0)		FM(SEL_AVB1_MAGIC_1)
-#define MOD_SEL6_0		F_(0, 0)			F_(0, 0)
 
 /* MOD_SEL7 */			/* 0 */				/* 1 */
 #define MOD_SEL7_16		FM(SEL_AVB0_TX_CTL_0)		FM(SEL_AVB0_TX_CTL_1)
 #define MOD_SEL7_15		FM(SEL_AVB0_TXC_0)		FM(SEL_AVB0_TXC_1)
-#define MOD_SEL7_14		F_(0, 0)			F_(0, 0)
 #define MOD_SEL7_13		FM(SEL_AVB0_MDC_0)		FM(SEL_AVB0_MDC_1)
-#define MOD_SEL7_12		F_(0, 0)			F_(0, 0)
 #define MOD_SEL7_11		FM(SEL_AVB0_TD0_0)		FM(SEL_AVB0_TD0_1)
 #define MOD_SEL7_10		FM(SEL_AVB0_MAGIC_0)		FM(SEL_AVB0_MAGIC_1)
-#define MOD_SEL7_9		F_(0, 0)			F_(0, 0)
-#define MOD_SEL7_8		F_(0, 0)			F_(0, 0)
 #define MOD_SEL7_7		FM(SEL_AVB0_TD1_0)		FM(SEL_AVB0_TD1_1)
 #define MOD_SEL7_6		FM(SEL_AVB0_TD2_0)		FM(SEL_AVB0_TD2_1)
-#define MOD_SEL7_5		F_(0, 0)			F_(0, 0)
-#define MOD_SEL7_4		F_(0, 0)			F_(0, 0)
 #define MOD_SEL7_3		FM(SEL_AVB0_TD3_0)		FM(SEL_AVB0_TD3_1)
 #define MOD_SEL7_2		FM(SEL_AVB0_AVTP_MATCH_0)	FM(SEL_AVB0_AVTP_MATCH_1)
-#define MOD_SEL7_1		F_(0, 0)			F_(0, 0)
 #define MOD_SEL7_0		FM(SEL_AVB0_AVTP_PPS_0)		FM(SEL_AVB0_AVTP_PPS_1)
 
 /* MOD_SEL8 */			/* 0 */				/* 1 */
@@ -664,25 +628,25 @@ FM(IP0SR8_31_28)	IP0SR8_31_28
 #define PINMUX_MOD_SELS \
 \
 MOD_SEL4_19		MOD_SEL5_19										\
-MOD_SEL4_18		MOD_SEL5_18		MOD_SEL6_18							\
-MOD_SEL4_17		MOD_SEL5_17		MOD_SEL6_17							\
-MOD_SEL4_16		MOD_SEL5_16		MOD_SEL6_16		MOD_SEL7_16				\
-MOD_SEL4_15		MOD_SEL5_15		MOD_SEL6_15		MOD_SEL7_15				\
-MOD_SEL4_14		MOD_SEL5_14		MOD_SEL6_14		MOD_SEL7_14				\
-MOD_SEL4_13		MOD_SEL5_13		MOD_SEL6_13		MOD_SEL7_13				\
-MOD_SEL4_12		MOD_SEL5_12		MOD_SEL6_12		MOD_SEL7_12				\
-MOD_SEL4_11		MOD_SEL5_11		MOD_SEL6_11		MOD_SEL7_11		MOD_SEL8_11	\
-MOD_SEL4_10		MOD_SEL5_10		MOD_SEL6_10		MOD_SEL7_10		MOD_SEL8_10	\
-MOD_SEL4_9		MOD_SEL5_9		MOD_SEL6_9		MOD_SEL7_9		MOD_SEL8_9	\
-MOD_SEL4_8		MOD_SEL5_8		MOD_SEL6_8		MOD_SEL7_8		MOD_SEL8_8	\
-MOD_SEL4_7		MOD_SEL5_7		MOD_SEL6_7		MOD_SEL7_7		MOD_SEL8_7	\
-MOD_SEL4_6		MOD_SEL5_6		MOD_SEL6_6		MOD_SEL7_6		MOD_SEL8_6	\
-MOD_SEL4_5		MOD_SEL5_5		MOD_SEL6_5		MOD_SEL7_5		MOD_SEL8_5	\
-MOD_SEL4_4		MOD_SEL5_4		MOD_SEL6_4		MOD_SEL7_4		MOD_SEL8_4	\
-MOD_SEL4_3		MOD_SEL5_3		MOD_SEL6_3		MOD_SEL7_3		MOD_SEL8_3	\
+MOD_SEL4_18					MOD_SEL6_18							\
+														\
+			MOD_SEL5_16		MOD_SEL6_16		MOD_SEL7_16				\
+MOD_SEL4_15		MOD_SEL5_15					MOD_SEL7_15				\
+MOD_SEL4_14													\
+						MOD_SEL6_13		MOD_SEL7_13				\
+MOD_SEL4_12		MOD_SEL5_12		MOD_SEL6_12							\
+			MOD_SEL5_11					MOD_SEL7_11		MOD_SEL8_11	\
+						MOD_SEL6_10		MOD_SEL7_10		MOD_SEL8_10	\
+MOD_SEL4_9											MOD_SEL8_9	\
+MOD_SEL4_8		MOD_SEL5_8								MOD_SEL8_8	\
+						MOD_SEL6_7		MOD_SEL7_7		MOD_SEL8_7	\
+			MOD_SEL5_6		MOD_SEL6_6		MOD_SEL7_6		MOD_SEL8_6	\
+MOD_SEL4_5		MOD_SEL5_5		MOD_SEL6_5					MOD_SEL8_5	\
+												MOD_SEL8_4	\
+									MOD_SEL7_3		MOD_SEL8_3	\
 MOD_SEL4_2		MOD_SEL5_2		MOD_SEL6_2		MOD_SEL7_2		MOD_SEL8_2	\
-MOD_SEL4_1		MOD_SEL5_1		MOD_SEL6_1		MOD_SEL7_1		MOD_SEL8_1	\
-MOD_SEL4_0		MOD_SEL5_0		MOD_SEL6_0		MOD_SEL7_0		MOD_SEL8_0
+MOD_SEL4_1					MOD_SEL6_1					MOD_SEL8_1	\
+			MOD_SEL5_0					MOD_SEL7_0		MOD_SEL8_0
 
 enum {
 	PINMUX_RESERVED = 0,
-- 
2.25.1

