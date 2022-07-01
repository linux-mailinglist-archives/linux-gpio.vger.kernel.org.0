Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5653A562852
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiGABgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGABgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:36:08 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6F75C942;
        Thu, 30 Jun 2022 18:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUeZ3z06WmkvrmTCdvxzN2BM86Upu2c2TmewGAfHx5n1XsbggEAD1zBZjrOFQvHVFXPu6E4XWv54zYUt56G42/i2NKusFBLlTvEdZBXUgB5ZPsdY6NcGLOnF5C0pW3WAWh4FpGsZR6yXVCJu8MUg3ositr+/7CUJaBYiVWhoyhApNTzY7ySKft5pKtRsJE+/qasd4k+j70dW4xbocmRXhjnwPDBrFxbzgMG3vdlMDsRveNoc17RJIpCdkF6jIQ/gHzaGJMxfhwDeXjtpNa6UsfmVEDF8M7t+25MgXhf5TLFjk4+13OUTXKR4usBVhYjAP3GR16X7zFEedsp437G2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gDgZitjomYv+GaoSanKNXQ9YClgzIAblqwCGuyqe0o=;
 b=X7eiXizVG5rJwn3J4L/wSY5WtakADmPOXjoF53x86ac8qJ1n+JY/J5QM1fMhrYzgK9UASC3R8D2q/AUyr/0UWUm7YVjFiSIP5BDYhzCPbkzfBdhhXs9YKN/cqIqb3bCyZ33OYjGAeLs5VolCK31hXWgIwb12TVh+q6voB7aKY9H1hz4ABO94TqKpBNy8H/0TDRpLkfly172BYFks3kjoL5NY9qp2b+/D5Ro29YOjvb2hBc5PNz0FeoPABwRLAugWP/gkQMskFQdE3EN2AwS38Z1dz3xZFoswAyxKDklwVsr9oG1Nt8kN03E5cPzHD7hLSEvacujm5lh4Ai+osq5tEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gDgZitjomYv+GaoSanKNXQ9YClgzIAblqwCGuyqe0o=;
 b=oadc7WbHXV6cNLQUstC6d2QYq9+0LguJqpwzYgmC6UFyOOpMp/Zh425lN+2oXzt1aK65DgLc+mhxoaaAqK9bQFzi6qStUgXx5Lqj8GcXsLhOSKfNXvYQmOiM1UqjspaSj07w1I6V0jB70EmvxnP2cfQLyEfbg0Rqv9ZtNI/ICI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7362.jpnprd01.prod.outlook.com (2603:1096:400:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 01:36:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:36:04 +0000
Message-ID: <87edz5ty0r.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 02/23] pinctrl: renesas: Add PORT_GP_CFG_13 macros
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
Date:   Fri, 1 Jul 2022 01:36:04 +0000
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4908b9b2-29c6-47a8-ff4d-08da5b021023
X-MS-TrafficTypeDiagnostic: TYCPR01MB7362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll6GRZ20ZKSQBI4sHL+w7xhLesdlOXcX5U4aYohY1IBQ7V+8PlpBcc6lWeJv5VzTt/K/lj4sSO2qaNsiya4IDGTsGcPcVjXSp3OvBvFBwpsx709pre6VfK5L6qVA8miFsZb8Lse3iNxp4dnOng1vsSTMFGWtWKYrLQBjpUOg4q2C2I5D9PhSEsxklpQus8wsJTtDgKSI7ln7Q/Fs+3hXGsDWE+SIyLE4gTvlB4KfG7zKMcDP6CMcWYzQgigCKWKWJTh/wKBZ6eHCd5vh5J++oHS7yUTNaijuhgtJtS54gSkDX7/Dw802pxy8d64yCUjqdDxeioO8+Gzzto8jXM8IS0Q+4aWz2Ux5RgD0farAGhO/EJN16yaP6l/A8Ik/sTguRFijmJMDSEVeDp136gAu+wX2+FSddq4m/QU0ZFXi/n4PPNRWAIGtoTHDdiqLqqXSFIegdVjTYzHyETvWD9Xw0m0wJ1nFOo1jrpa5X5wYYsU2SlwIcYrzOQKIpSHQBnfU9BwqlJ2QNK+MvNnURWTWj2tlYRRH2P0n9Rk+tVVLU7OU23XQpQkIKDauIChpHBmO1E2hNgsiRFy31tnhKi7j9wxwFzcFMA+5xhA7fbk2xM3iV3PW00vq16Mhq81IHy23mK7cvr6b5mxaiLHTHyfxpF22a3THOEUs7vTeWh7J9ms8LHVVXy72fuml/iSR7S1fSFrJe7lV0fdGcnBDiXtO6tcEm4209dMdGUKx41nw6U8W0sB/hsaaRtRG+xFNGd37M0Mgymy7qKk80eEH46fOg8+KFa1CPq+3lw1sFDic3137TkmUY4zs4ejEzQGxwp+M
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(6512007)(86362001)(54906003)(316002)(26005)(110136005)(5660300002)(41300700001)(52116002)(6506007)(66946007)(38100700002)(38350700002)(4326008)(8676002)(66556008)(66476007)(6486002)(478600001)(2906002)(2616005)(186003)(83380400001)(36756003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l1I+K96zXrbSxHuYoVoI+YOCNbbHBu45KPAMkj+7iJQSlgM5PliO8b0646YQ?=
 =?us-ascii?Q?1tlD3Hc7uk2IUAh7DYQ6CmWcsbO2KSu2oLYX1GD36n1THTM9nzge/izOyEq/?=
 =?us-ascii?Q?xONWM63E+CfXKs1nffRratHPpSsmOvezW+YAPcuKUAKCVFN9MvVuiYnxF8Gb?=
 =?us-ascii?Q?cfnTk/CPa4oLcwKewTaBPAeB9GUwIs+YM4ba9KSGOsJNzZ76Hkuw4bIweKSN?=
 =?us-ascii?Q?aL3Yc59leJP0E3sAdyL9+74yXMGJ56/z45LM7GKe2nUB0Py+MTxzzwEUmHNv?=
 =?us-ascii?Q?SgUfa0mGVvxkODNiwDjvAsItXD7TTCCCZzGDR9LyGVQJTC3b0c9sP54C6Amo?=
 =?us-ascii?Q?c9pBbO9upfl0xC8/UXppESrGFA9CutyB1Ho3akB6XnK8SVbqIW4hnp7pKQMt?=
 =?us-ascii?Q?rfBjxu9QXJUlgx54rHJn1SvIh2sESIwU6ASo8bv4X+Iem/gty5zRhdikPZ4J?=
 =?us-ascii?Q?WCadKa1I+I7tdjLi8QZD1gau16eD6jXjzby94XTkIEFyvFYFrDZsx08I9hGk?=
 =?us-ascii?Q?DN1VwBetpx/zCaG7pG4n2mK0aYqZevdI5VrslOyvc0ZBHsIC8DkqU3Bg4l8k?=
 =?us-ascii?Q?xnUYGL4eWElkSB0bke2sSt7YgGka+mK1QfoM8gMhDv3+Bq+hFny5czNLzEuz?=
 =?us-ascii?Q?JPcIFa5D3Ja95v/mqHWWEnRfWSWQoYz4kkMRoRfGFFPxXeBNzV0dsbI/WXyU?=
 =?us-ascii?Q?rpZdY4xeZfsowPoIGONDeKYeudDIp8sbhKnoQieAZcnE/7A2r4FpTDzsBCG/?=
 =?us-ascii?Q?QXBKw76Du9pmU4YIr0mkilanffp6Xext+CTDIEdJdpQ+9Qql+tDvlNz13gSJ?=
 =?us-ascii?Q?oyBbl3VHBMCbrfdArzMo92OqwaxUgG2ZWoTGnU8w0YVp8P/YA+3UvdQK9Bua?=
 =?us-ascii?Q?Tu0wmHSTdhhRBGrUnOw9DoFQkf2SCgcZ+faTTbde3p1iUITc9okSphPzP1S4?=
 =?us-ascii?Q?yvRIJfJ9q1zNj0sLz27RSeQ56Vy4X2eXFBDNVvoj3M4fgNhABAJ20OtBJL5u?=
 =?us-ascii?Q?ZS8lIeI1seOLtpunHp/RwHIHTchZKVV0V0SFPl9Y6e2CfbgmLcqCKO6EKAk8?=
 =?us-ascii?Q?ZAaP7gbzPmbRHyHTkWY7hQ5JraXEdVaa3gYEbQMTGbAdo2c+VKzydBtzt9ok?=
 =?us-ascii?Q?A/jIcAFUJ536/EVRs/asRJqxuN5koxiFuUlK5UqAZoygyEyQ6R4vTb+z3ULL?=
 =?us-ascii?Q?WgXHLu9aESI56Gm9u2vowBK6Nnx/5EugzSFncARC+tjwLy3NUzNR5CIpkFGn?=
 =?us-ascii?Q?5KlL+Rn70YHnyHiWaySSvtFwsenfq5l62GwpbUG3hDGQB4wx37psaXFyHXw0?=
 =?us-ascii?Q?kSaHYwJiOYTgGD1i3uGtt9KS/jjWmHlNhcdfRrEuWJdEEt34VkoksVGX0pzX?=
 =?us-ascii?Q?xyTkp1eOP5HRg5TN0854fmbqgGprUZpZlRsa/9S8GF+o3TEcYFwbVnXrBcRk?=
 =?us-ascii?Q?zm0Qbaja8sdrwhBbT4bx83Rpx99mlx+HyIjpt2UwbA92QGJZt0I67XBo5gNl?=
 =?us-ascii?Q?r9tsU9ogYA/QEAT0/1fPLAD1q5AswC5vhGw+jArUP7NdhbMHfPzucCIBmEh0?=
 =?us-ascii?Q?DgF4WOgONbU7cSur0a7V40OE4pwd90iKYlt5jR5y9SnKTszpixsj0kB3ieAx?=
 =?us-ascii?Q?mHjtVsV5vWH9LNXpOCSI1tw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4908b9b2-29c6-47a8-ff4d-08da5b021023
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:36:04.6401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9QDlgmodIeUrzqFwAYR6gPy1d05IoIrrShi+2paYLS9Sy29Msy1412ujrlgIdchwL7YaUrhqkXHdTVKougaUz4CHouGMMZKitV7OysyB4uJ2e2U2WJijT0t+mbi/91b
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

Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
to be used by the r8a779g0 subdriver.

Based on a larger patch in the BSP by LUU HOAI.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 12bc279f5733..bd0ae9d7005a 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -492,9 +492,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_13(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_12(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 12, fn, sfx, cfg)
+#define PORT_GP_13(bank, fn, sfx)	PORT_GP_CFG_13(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_14(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_13(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 13, fn, sfx, cfg)
 #define PORT_GP_14(bank, fn, sfx)	PORT_GP_CFG_14(bank, fn, sfx, 0)
 
-- 
2.25.1

