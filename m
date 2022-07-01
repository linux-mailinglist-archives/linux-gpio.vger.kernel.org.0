Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340CC562859
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbiGABhG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiGABhE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:37:04 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486D75C948;
        Thu, 30 Jun 2022 18:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfPJsGA+7QUTdTR7fhPnIVi0WMpeLhrVdrce5YxyLDpF96GQ1tKMoxg5qgDYKqB6G2wEDlZ2BK++hPI1dqsNSeHXBlB5R/Ed8aOjaF1vBzITskkk3yePBUPSoj2NIz6vhQ9X2Hhqo7xDPVves4JNlvVmcEovJG5k8YMSdj5JoS5iLN7ZDlLD14+tbudoFajHodhWmM8U8m4nyqf30W6kavjHsUrrHET1iJuM+QWmykTYfdF4d2Y+Sihciy3iehiYqF21FKbP9/pj+/2zlv8+yCA9zNzbl49+RIyczvEaJfX7Ce74KzWm7MDNHc+b8sJJuP9WMZnXqOECR+SJYxlCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgUR7mlZcR1Wom4MwikXJUn+AuCbZZOeIkF9+v0URYQ=;
 b=AfzZYeqOfTlR9rS8RNQt5mlsJlG0isxBfEHpQsGi7+uhJLWS/Z0EGpj4oZ9V/1og/TAKu0bIDUX9tTNL/Qqn3uSFxhCzTj6wE5/9TOEOA2KOaxhLMT+L7DcTjzbCerJaUtUg/iVkzFv4/+ggGu2wgPpi7FZGv3MdX4P2av9GhUV4HySCj41Cm/EseLqom6SG2y1LVfMP0yGPwChFteva280k6NQLsjnU3qu2/XbzIWEZzYZgb84FF1XU8WqqXhDbUIJaH8mmEWPVrroSvqqWxoF8pbroE0uW5x1sizMSEkAVpvJlHaMLKozYebB8Vt8YrEc/0D09QrjH8/WSNoTqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgUR7mlZcR1Wom4MwikXJUn+AuCbZZOeIkF9+v0URYQ=;
 b=DIsQggIAkpXs3WqisoQgCLMtHE9YsRg5mP+tgkBhPp30jn1KHsNzJd/6NiWyRe1DUj0spQ/EY3a8aQSOG1tRuyXtJxTLjoii3fnLjBy94YOY3r3/Gr0sqzXnrLKYeRN3MCVkd2xkNvhnRvhDhDplkPWmvSqNL3QrbOoKhdLOuP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB4567.jpnprd01.prod.outlook.com (2603:1096:604:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 01:37:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:37:00 +0000
Message-ID: <878rpdtxz8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 06/23] pinctrl: renesas: r8a779g0: remove not used NOGP definitions
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
Date:   Fri, 1 Jul 2022 01:36:59 +0000
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de4a19d5-67b6-4df6-ce06-08da5b023133
X-MS-TrafficTypeDiagnostic: OSBPR01MB4567:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fLgpsvQPi5SaDoAnma5yiZrF61Q+vsl6j5iHt0Lhkg+XiaREusK7YhB2MX5L/7Nc1oJh6dN4rf5BNHlATQgMW/jIG3O2qd6lDqsOdCHhrub7enUK7KTbBDc+ZDga2BYIRUHthecbKa16PH1wFpUTFEY0j+41qosHE4iSPN5FkucIRG3TcLvsZCcBGPRUg5Ek+FKfGoGU0667fr4fX9YqH+nqcBUhViNrZZYtSL9N1O7U0xbUBM9VQr/3soUI+sjEb+dhbQNGeIU1xWb/+16xeSZlKuQIrRZNVrJ7N91XBtkbnaCVGa8p2hXbMTFdse0XW27IBkVX/YR7WNBxOo7oh8/R8Zv0xR1xrqlAw9BAqjm9z340bmeTFULVvaBOjwxFSyRSNV+mxhdMsW92x2Mz7JTYvlKjx/2Y9HO7+qfHSke4Gjsv36uIwsDp2e6p57MW+kW0I1n7GD2PLC2KGfj431unvSIgmPrlUSPp7D2gRBSChonNJsYaoSKzXLKswvNpBqqEt+B+QHpgR7UoTFAAaEoNkJ1KqcIfXAvGIx+Npci8lyqhnQC7+sH3ZAvCXmX5N6Lln/YtjNtR5Lbii9jlMEuoacqpcsot7/uQtmyVkp2cPxcY5RGocTw/6B8y+/4v5nbScO8LWWhwzRnb/B8Y6wfnkRSsAaDrcDBT6n43clrdcthGE3G68TNiWiE6I6X3/ibeGLIFY3jUm86m4Gb4BZksoh7+2kzmZ+xw3eTOUfGR+n1G/8JUM4ACNm9PfojknYdaAs1A356KOJna9/vSa5cNCJ2IuV1Z65+PMWKLTA6feiiUZcatxwBOG7bhGPW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(110136005)(54906003)(38100700002)(38350700002)(186003)(2906002)(36756003)(478600001)(83380400001)(6486002)(66476007)(66556008)(8676002)(4326008)(86362001)(41300700001)(52116002)(26005)(2616005)(316002)(8936002)(6512007)(5660300002)(6506007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sikk/CRYMzg4bRO1x4qyw2MkmGj3PELfAI4tV0T3wnmSFZtsO+/YlQlNRNXa?=
 =?us-ascii?Q?XzKqrjAkzfpSEaYHrNkOxQ3eBHZai7sSAlBenDRmaZJ5ruzq2Kq7qH5RKKUh?=
 =?us-ascii?Q?nIoRDT1fEV1j0zD851bzEHRRnb7aqySz9dl4ywh4HvUtQ2KxrBARr9vfu/eK?=
 =?us-ascii?Q?RJeB2MVe4/qtpa5aMi3QKGkO4TYETnToCLFsYRWLPBHB37NA8HLPGezqJPfQ?=
 =?us-ascii?Q?OQpfHpjMr/MfsfF98NMyV1Mb+Q1fMW9j2P5rYLezLEl+SyqiiN+IcPR3CGup?=
 =?us-ascii?Q?uLUtURJLXoBtjP10hkZj8QJv4b02Z48201tJ+DGFk3r4mQsy+dH5WGw+j1+9?=
 =?us-ascii?Q?cTyLFgUMgF74wJTG+KKQ7ZjbzDCr8KFf9JhTeVDLmvhk04ydS/3nGRgQjug5?=
 =?us-ascii?Q?R1RpNNdyMVwAw/2kzlGmKStRU8gmOsOoufMj863jq7+48Rup7hCKiS294zw+?=
 =?us-ascii?Q?vFejT/F8fnHvKN12oUtLXrXv5R717FjtA/+/YA13bG53tdmSTL6vM3gftWT0?=
 =?us-ascii?Q?LCzyOojvtbjPdTjDQzc5k9tYClE+Oi+ye2C9Zj8hUPIaz3ENgLyXY/P1fj+L?=
 =?us-ascii?Q?/qDshSTFCv8+GIJZNYC4CHEo8pkgBxXbjkueYYsW0pEjzZKNiAJTTzYk0Tqs?=
 =?us-ascii?Q?6KA8lAtYPmFPlECTz6lavgg7gJ/V/XfKhzkhOVF8SPa+AD9he392E481ZACY?=
 =?us-ascii?Q?I3GL5bgGrRvjIEjFlTAt9feT6y0AQSIK/vt+dEahJhyYCJX/BcGMBCfFW8fx?=
 =?us-ascii?Q?r9UTXPS5EfS2S6HFlJzCBdPQI6e6uVc+sqWf8av0Eg7fpit7+y+4lrubkanu?=
 =?us-ascii?Q?Qj7rxDiSir7q8Ay8CihkRwCPN3vlcOffSfmfeWl012ICIDve5wxqe7rg12iq?=
 =?us-ascii?Q?gGkzMPc3WNseg5OpNaXLyc9vBcHu3SUjB0Ib/RQU6KaSftVrSZIVLwnoDKnB?=
 =?us-ascii?Q?jVq+cB1ahnxUiQQgx3u8Y0w5sL6p6Ci/6uceQzJO46UQzTk2GranIssm4xWQ?=
 =?us-ascii?Q?NMe9Puj9U2aeYAjUzmcGL0euC+3jzq8/aXQWfYsJaSH4sKUhazBNT+3EVZES?=
 =?us-ascii?Q?3sDLG09dpJ43xqmzr2lOowwbPeWOLtS5ZrWYYQTNXmpSPBMZgyAj+5IJCnf8?=
 =?us-ascii?Q?an0CtOnhc/slC1ZSVUhTDLabt2cXmvtRt8eH5Q/OG/Z8VQR7PdmbBIv2a88f?=
 =?us-ascii?Q?mDOmmuHiRbdDOwV99vGfppHGAGt4sn1LBw1ApLlBkuTNUyxzQXKzRY6x9LT2?=
 =?us-ascii?Q?wxesqCEA8qvD32+sKxeVCO+k5bV58sa4i2GydSHV+jVnN6OAHAeU8+3ljl/d?=
 =?us-ascii?Q?Sd8jb5yGYmykoMjtwOZBz3jmy6mydVruyUq3io6n4l4q6b1w1RzO/FWHLBcc?=
 =?us-ascii?Q?a0TbhP6VVgJMJF8zUa/k5dN/+Zs60AXKcgUsDlqkmevHHZD6a7Ry5oClGEB2?=
 =?us-ascii?Q?fzf2psoqnv2EoCWATG6RJVZas8UNWhYDdjoyxoKGjFFOUWaHADMzlwTNUWSK?=
 =?us-ascii?Q?wCvstfI/5PEQJDqOjjepqiu5gEe276GZTR0k1+GsRORt8/0pHngTo6lprmSu?=
 =?us-ascii?Q?W5yIl0oaYttu8zSgi6bvxRp9U2NcU70g7x7xrLQcN0eM9if1F+9hW3Uqt4Vv?=
 =?us-ascii?Q?BN/vNpNio9XGgYLNipG9YVg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4a19d5-67b6-4df6-ce06-08da5b023133
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:37:00.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg4ZA4NjLtHOVCXcZON3juOxTFlCv+3zVQgUfkGDJsEZwTh4vsTRI3ZZSGjvM42EVml/t+BaIb0Go3ailQmgx7mkezzWbwl0prHgT4vP0ViO9e7Tml1ov8r7+iQ2MC6D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4567
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

Current V4H PFC code has many NOGP definitions. But these are not used,
and it is different from original usage. This patch removes these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index cb1cbe77ca7b..007319df5ed7 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -43,22 +43,6 @@
 	PORT_GP_CFG_21(7,	fn, sfx, CFG_FLAGS),					\
 	PORT_GP_CFG_14(8,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33)
 
-#define CPU_ALL_NOGP(fn)									\
-	PIN_NOGP_CFG(PRESETOUT_N,	"PRESETOUT#",	fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PIN_NOGP_CFG(PRESETOUT0_N,	"PRESETOUT0#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(PRESETOUT1_N,	"PRESETOUT1#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(EXTALR,		"EXTALR",	fn, SH_PFC_PIN_CFG_PULL_UP_DOWN),	\
-	PIN_NOGP_CFG(DCUTRST0_N,	"DCUTRST0#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(DCUTCK0,		"DCUTCK0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTMS0,		"DCUTMS0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTDI0,		"DCUTDI0",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTRST1_N,	"DCUTRST1#",	fn, SH_PFC_PIN_CFG_PULL_DOWN),		\
-	PIN_NOGP_CFG(DCUTCK1,		"DCUTCK1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTMS1,		"DCUTMS1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(DCUTDI1,		"DCUTDI1",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(EVTI_N,		"EVTI#",	fn, SH_PFC_PIN_CFG_PULL_UP),		\
-	PIN_NOGP_CFG(MSYN_N,		"MSYN#",	fn, SH_PFC_PIN_CFG_PULL_UP)
-
 /* GPSR0 */
 #define GPSR0_18	F_(MSIOF2_RXD,		IP2SR0_11_8)
 #define GPSR0_17	F_(MSIOF2_SCK,		IP2SR0_7_4)
@@ -1204,7 +1188,6 @@ static const u16 pinmux_data[] = {
  */
 enum {
 	GP_ASSIGN_LAST(),
-	NOGP_ALL(),
 };
 
 static const struct sh_pfc_pin pinmux_pins[] = {
-- 
2.25.1

