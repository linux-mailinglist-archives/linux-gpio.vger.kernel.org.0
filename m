Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED27562861
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbiGABip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiGABin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:38:43 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719111CFE7;
        Thu, 30 Jun 2022 18:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igZl00p66EbnmqOKhakRClySXAIH4OYEn8yq7zTVcmXxsDklRXQcjMs43NBbDELGDzVw9GHT0ET/4Fxi+8sH83vvIBEoiPY7lhdjEAOoC8uZ0HOjVmf0Hg9aJmrXzh6qC+ivY29mfp+74nLBe1zognnCUH31stiLjFhtDkvtXIjE46n1FAixp188DbcR/RMXGzNwEuSybt5rz/DVuvfMjt6wWo31SNIpUrbIFCrXvTKSZz+gPg/VjLi5w2h6ODsPs9T8z3wDXNBUaW0PnJxMrJqJ6xMxVuwoXZLiDD0337DMy89kMyHF0zxyrn7ih/hNcD5AvWhD6G/hJR6vgKBhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBnQzw2Tahu8pI9gOPgfpJPWiZkUEqdr61H2/CqXJLo=;
 b=U8gg/GaKzc55NjZ46rldo5LAHis3XpgDZPm0SxIK3glMg0MCT18uJkw+W5Cm7zz4EvHMO0840xHN9rHtTwwHiJJdt1OLXOrfsM9kImvMvrlaLAVq2qDjf2eUs29o0sxMwYi5KpELTt/fZV9R4TQ3cnU7ilexBhE4qYiU5Fy7WPQpG0XAbebsW1+rcmmROiziJepX8K4fb4Hgoj/FH+xjr1VQRKUuuojpzhRIr9//Lb2LtLbMZZWIJfbwKxE9KsO0HNFTULLygDbEQdeP3Xix7bwD51uzRKEBhe+AiUv6HIJZOf+j2YoMiEOzH0BuFkTS+edI/krlNLn8BYgLiV93Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBnQzw2Tahu8pI9gOPgfpJPWiZkUEqdr61H2/CqXJLo=;
 b=XURCBDYjwu4gCr/TTkq0WFm68gXVDuAQF7EoLNU7YP8cI+kntxkZ8j2b2aSc7QjSBfzGpf+HkUvFLcJ49tvqR4ITVJwtW67Ltkrxsqy3XiZrA7eEM7ZTTjIIGw9qcWt5DnpPruGAdktNAjqEO3F97vWAbljdFVKsegwiSLA5ZxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:38:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:38:40 +0000
Message-ID: <8735fltxwg.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 10/23] pinctrl: renesas: r8a779g0: tidyup POC1 voltage
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
Date:   Fri, 1 Jul 2022 01:38:40 +0000
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dedbefc5-6b3f-49da-6e04-08da5b026cfc
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjaQ9IHe/af6EFL2XLv6Ox5y1s9GrM0TceB3chno5toZZ4pnTqoGKQSCFaMkg71S3C71h23UD8UQUOyaK8yOa8SUXwWpJgIhqfmatMazURbzWlS7hayQNXt0t0hliNqnTOYbmXVQ2GsLl9CPT9Xov2JW2iG2p7WQ8al4JuGtbQla+AJKSgfXESqENMmEzmhIkfPbjn1rFf/gSLILf15kJNUWfsSoyty2uhgLMFhQ1STQScfXXMFjdMw0PNZegNfd9e5ZiVI/jfexQK+snusLcRPpeeDBv6GSP5wOQxtTL5r/xqtZVL0lMlZ3Vb8xw82PjoVo58qjD24yeEJVYIBUiwccdSmN4mTlaS6gLGdrpqJZuFatoc/w+OjUHDZn+ogY8TbLSXu5gDmEjjYIfFPWPaY+L0O7t+TQzBjRApiB+doLJZKSw8PfYGR2IXEnxMZ2BqwsauIMrvnx0t3wG3RguKD8/y15mrfuBnPALBVx4vM5yAiZFptpAEGl22bdfzE+UdmrAX42aS6/3Mn8GgsFsJDckKIxSQ+TJCPVWV2PyWya7i1GwSqoG5j9PSSsjuktUvH0IvGoAoJCxtrhz/AfvlPvXpXY+vl+00iMMK91G5xNVeWN0W1p2QnbDp6cFXlq1/6p5Vrw1s4tNvWMUD+103GqqoTkgpb8twDlRSCjYJjuM60JdMs4s4UX3DR3CSjxv7ui6ccF4lpalW7bGtbsfr3G3JU2onRugan5F+Ll/fRtDJebfKRaaAmeJcahQ+EAyr/TeC/jkQHv1k8dZjNxYlGJ96wVirb90mSC9YbSEaui0CmqMnRB/6vEoT8M/2pT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJViaohwj6HdjAVAKvAWZPARWUR0MZhCKkeeYv/z2alyUvmzaWvRSpUvCKlk?=
 =?us-ascii?Q?jn0Wrz3PsFJzAht4TGAnvoofS1LjYu5FH4w2W5p7J0tetnWYK/KGAL//Pedq?=
 =?us-ascii?Q?Yvn/d1h6O+kCaimqGR2jpk5XQGWR1ryqfH0BgKv9Qu5vnOtM8rLJafxmfPk8?=
 =?us-ascii?Q?0GCPewrXz2EFax6OErE4zDIQFrcRNtykSJgDXzX7s7Knur5RyFDbvqSWBhn+?=
 =?us-ascii?Q?22zF3dcTc6m1ZQbJrB7Iahlz0GToW22NLY5418KbFT30HQVgqezLkjaC5cco?=
 =?us-ascii?Q?6pf1BgSy8v5SbYjmgK7DgS8OIkPpdxPrx9Q7uNDpqfHvLUMP9jMuMLumiikR?=
 =?us-ascii?Q?wEVi/JUOqpXxx08W9vij5KJyY6Q3zc/+srtDuI6MfZYOPzt0pto9QNKtHwnz?=
 =?us-ascii?Q?IqB4UC8oemCZKoikhXDOsQh+Ok6HSaX5BG7bB7/0O37ABCWDLexe8vYqNBL7?=
 =?us-ascii?Q?x94wNLUbN2Q9hU+F/IvVocY+GBNyylMMJ0wdpKx1DcyGdAX5G4/oSTcKL4pb?=
 =?us-ascii?Q?OFwR7gPImHI99GwN9BOCdO/eVj0mrDD/19hmY7H7HHVxOfqiqoEOvFQNt9nG?=
 =?us-ascii?Q?1f13R7WOGpnN7M4qJPGX88s5j6jw9EmuHOEe169SaJWR0pgRtUFXq9TmZf2B?=
 =?us-ascii?Q?3M0mF+MnH4OxFQFResfJNJa4IdaRbgLc0iT1aU2iYMJhzbnAsTO1/3kdQd/8?=
 =?us-ascii?Q?omxpNJgUCmUNRcn4dCOpLlRJYh7ff/XcUEcsfTvhGqpivZmIynaOZ7Sp3PlW?=
 =?us-ascii?Q?d2t/2wlnOu88148imgDrCr486Vi05mSf6cAjie4qxhcy8CfGXd57vxOPDx+/?=
 =?us-ascii?Q?nTyG4w09SJxarrGewkaNwrTf9ziWKj2XPotHHeyhOejNMxluOUqZ0LqyiybI?=
 =?us-ascii?Q?SS11/EP/ak+XAwl9xjmGnF8uXMiInWekUeet1FYQ/cUpeSPZP5cFOKqi1zRc?=
 =?us-ascii?Q?/VWATK/Fu2Lliy+qJU8zb0q79gPSHhf8BhWpDGm+Lrr1wcn9TNG4+SoYcG1U?=
 =?us-ascii?Q?VgFZi8ZdwXj3v/Cqp5p73ICnWFbD90i97fvslqgRUdu7VU7JrT7B+GlybdUt?=
 =?us-ascii?Q?xf0hFyPwvzZQTxkXRLVVYo6N3/6mBfqwla8yKFpVlhp4Iv3Hws9Q9u6tOVIH?=
 =?us-ascii?Q?UHbly+hdW9Y8RXYpH3pWNfk/3rzfhRIEe56fKA5EFmLvK8JiVhWluXGf4JIh?=
 =?us-ascii?Q?74zMNoU+YTmIilYgRDV40HLem4GURhPKCZmqN+DruFWtbsNl9khtHsOMsje1?=
 =?us-ascii?Q?YWzlnhgp/lFrT6o5J/2qSPFI7wDRsovvnVWWPE7x+V6xrjHdSOq6AcyAMmYj?=
 =?us-ascii?Q?MrnH6RsEVh+gUyDQVTFWanauV/OuGnlLtevVOQxqs6SYPXkadNt+rGUrprIg?=
 =?us-ascii?Q?kl3S6mSeAp6sDX/BdqvuEUDPQWa4tKn9xGOFwcv1n3x9xriETe64xiOqS5vo?=
 =?us-ascii?Q?A48SBk2+LEQTBIHQFBDslEiDDtNTdLRN3BpFxNCxR6v4XCZ+VDTkArQWuhXP?=
 =?us-ascii?Q?VdoSgRVWfrV3h98aNZyy33dIJRo7BzDApk/OiJGAmuXejG8nE5dL4YY5awyA?=
 =?us-ascii?Q?pthX8mp6BWxlw1eV/QQGaFjeWlIHft8qOg8b4Z1gFFtc+JJaFB+JP4jQ/ebA?=
 =?us-ascii?Q?XDmUhBgI1LFpxVPEykwGMsQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dedbefc5-6b3f-49da-6e04-08da5b026cfc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:38:40.5390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLHfJ2l20pX6+7EFxVpNEXTixcggvB3/t676aqR3Y0NkXJURMQoH6ZwbzBlaqpfu+RrFy1OzLKJ9sy7ntACA9AsP1MxAHOxR1FVWub9+7pSSHqI+zBg1ThrZXRBquB7x
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

According to Rev.0.51 datasheet 004_R-CarV4H_pin_function.xlsx,
GP1_23 - GP1_28 are 1.8/3.3V. But it aren't on Table 7.28.
According to HW team, there are no bit assign.
This patch follows HW team's comment.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index 70ca971bbf36..281bca886307 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -17,7 +17,14 @@
 
 #define CPU_ALL_GP(fn, sfx)								\
 	PORT_GP_CFG_19(0,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
-	PORT_GP_CFG_29(1,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_23(1,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
+	PORT_GP_CFG_1(1, 23,	fn, sfx, CFG_FLAGS),					\
+	PORT_GP_CFG_1(1, 24,	fn, sfx, CFG_FLAGS),					\
+	PORT_GP_CFG_1(1, 25,	fn, sfx, CFG_FLAGS),					\
+	PORT_GP_CFG_1(1, 26,	fn, sfx, CFG_FLAGS),					\
+	PORT_GP_CFG_1(1, 27,	fn, sfx, CFG_FLAGS),					\
+	PORT_GP_CFG_1(1, 28,	fn, sfx, CFG_FLAGS),					\
+	PORT_GP_CFG_1(1, 29,	fn, sfx, CFG_FLAGS),					\
 	PORT_GP_CFG_20(2,	fn, sfx, CFG_FLAGS),					\
 	PORT_GP_CFG_13(3,	fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_18_33),	\
 	PORT_GP_CFG_1(3, 13,	fn, sfx, CFG_FLAGS),					\
@@ -3650,7 +3657,7 @@ static int r8a779g0_pin_to_pocctrl(unsigned int pin, u32 *pocctrl)
 		return bit;
 
 	*pocctrl = pinmux_ioctrl_regs[POC1].reg;
-	if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 28))
+	if (pin >= RCAR_GP_PIN(1, 0) && pin <= RCAR_GP_PIN(1, 22))
 		return bit;
 
 	*pocctrl = pinmux_ioctrl_regs[POC3].reg;
-- 
2.25.1

