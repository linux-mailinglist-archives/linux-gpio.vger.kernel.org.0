Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A17587B3B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 13:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236706AbiHBLCt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 2 Aug 2022 07:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbiHBLCp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 07:02:45 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 26A1E46D84
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 04:02:42 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2106.outbound.protection.outlook.com [104.47.22.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-nzNAB157NrWfrGFQNkUXqA-2; Tue, 02 Aug 2022 13:02:37 +0200
X-MC-Unique: nzNAB157NrWfrGFQNkUXqA-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GV0P278MB0638.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:41::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.6; Tue, 2 Aug 2022 11:02:35 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3510:6f55:f14a:380f%7]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 11:02:35 +0000
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Date:   Tue,  2 Aug 2022 13:02:32 +0200
Message-ID: <20220802110232.130758-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MR1P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::32) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca12640d-b519-4d6e-f918-08da747681a0
X-MS-TrafficTypeDiagnostic: GV0P278MB0638:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: JkMZylmlUEYzyPyi4t2i+V9T8jLI5f+T5iaAL1mgI845OaE1Wehw9+4mrdEbqDZI0UkuYK0K05Dda9T8q5lfMrlkcDmU9YJb9OUhEIknEdnPfN7AqsJPgpv6laLR7A6MWzr5Y3Z6s5cpzeFNBCYIOXB+zZQfFvIKt8lLAS+UwtkOXyePRbn75+eg43yTjTS+ur5R9jygheklsN6fHT1JvJ5wMnVo/41lY9arRtqiPg9JlH/u3D5shJWbcDqBmgE3hwvQu3DgQpXOPYVxYTLhg4Kso3vt7FmDf+KfjQERgK8944r+YsRbxdpXnBz5NqX2ue+EPFwWOOLPSNlttJj0ZFTAGOB0yheVRjPUe2etT+DxH/qTR3HliitChNnnaYHXzvkC+lPItoLRDqrcIS7eUV2MKaAFixObkmZ9lUPQhZDlU9YROCcd/0o9sLl7fNcfMrNynZl2KqvulU8AuvLZBLFnHhnwQR6/S+RMLl1b+me1yoAOtTZCRFsoNyBibTw5MJMNqDQVdQ7qeYGErmKv/y/N8ogf3kpBZnKLRQ3zD3jtumkRKJP7G5D1JyGT25RlgFQFaSZd36yeVGnaM+IzBWIEy+QfpQasW8Dnk+dMODXblBC931VnQ97xfh5p9U+mtG0je79nmoaEUvCdvQJhACaSan9JRfw7cNCpjIV+sqVwxbWToVA1x2VAirxoMq6nCcV7mnC4B4xsH4gpO52CAyiC8ZAtC7++fCSGf2PI0ELXSapLkuJO7QkcjDX4GJEeESzE8WpHm9pW9TVnGzGlORAY9vgHARoRXnVGkD0u5dJUINltw3Dr+iR2CVEKZ1lZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66476007)(6486002)(66946007)(54906003)(66556008)(41300700001)(316002)(83380400001)(478600001)(2906002)(4326008)(8676002)(8936002)(6666004)(36756003)(26005)(6512007)(1076003)(6506007)(86362001)(186003)(5660300002)(44832011)(38350700002)(52116002)(38100700002)(2616005)(32563001);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JTgJIeOdLsIhc15aoj8CIT+fbHZupeatjKL+EwuL5dzwAXVkT8R+qWGf9OVN?=
 =?us-ascii?Q?KhOmxD1U9muUw7XLa0Z9nrcaPVdwhrSE2yHxrEAx4DLarCt10Q9Bnr1y9szv?=
 =?us-ascii?Q?MSU3xCW/rnmDcCXfpdkYC5bVwbjNjrET47d/nV6UXCmlVgr12dY6icvqf2sX?=
 =?us-ascii?Q?vIZYxGhlBBspxpPEX8W34naaQzUILH0XgifpAH0CWqoK8g2l4rcyrKuUwH62?=
 =?us-ascii?Q?qDnnJs1GCD0uGeAVygv5egR4ew5bzb9MZPCNhriyMxxrzNRlL0S9fZyInxq0?=
 =?us-ascii?Q?rWOMVcrKS0ZLh5d3xC6dxpC4E2DW13ZJwM3ivGWN+UCaDLgrD7XUwca2wpeV?=
 =?us-ascii?Q?STXDGFlkQgX3lUvrXVHfloarZTiT4BNVMB3LVmBoJnRg21PBzA/Tm5fHk8yv?=
 =?us-ascii?Q?i1nrFx293HPRXcT1f8NIKNiIKjqiA1283EfBZJrQ1B1zscdgRi6I27ksgCCB?=
 =?us-ascii?Q?0Cj4+aIZBnTJ92QVIQHHj1hwk61UQ/+HuNR9P7uSvLI5UDXfTV68S/CS+cHx?=
 =?us-ascii?Q?mICxfBXtDDijOS7sORpA2ciVufeS5/dpPZMXNe3J8KxnpjJF9FhJitZ/d0zj?=
 =?us-ascii?Q?W1mAoFw9C99TmLOHtswwaywbvukCsaLuG9yJ4FFfImLPGkJFds9+I9QpxHUo?=
 =?us-ascii?Q?gbn82gZmkpnLWPWeyElib4BCEUrIqxfekILDl19Fya5S4Utd+FJmF1q9r/ZL?=
 =?us-ascii?Q?x04Y6OxJmOYFY2x4ZuEGkWozlhji07c7i4yIPUcJmJKS6IRN/GyF1k+63EIN?=
 =?us-ascii?Q?VCb7BlW4awTcluTLVqbrSZTr0kFjVlln2PLUm3QxvkngNxShZ0q8aUXa04Gx?=
 =?us-ascii?Q?nr5F/bxTxIYCJpDfWRNydBe9hDr/P0NrdWVTwBQVNam53+UQnfyHjotO0Hko?=
 =?us-ascii?Q?D/S26P5y1afPTipxF2ETkKEVhRhh9Cn6lu6JqouPIaCVXuDApunmzuA5LzWj?=
 =?us-ascii?Q?QgFqq15Gu1UK/tj1/5WSLcyGLYwd5IxUJxKR8zQII8PsOMrs2ogYrYSePxqX?=
 =?us-ascii?Q?B1hKL4hiB0m4DyCIpGXD+A7y/AOhQPkj6sHEXMeqTUnCWZGMckOdmhj25OhE?=
 =?us-ascii?Q?K/oaccRcefYj8TKluGjf2LVcXtt0yUuwdvOhKbLNURnuvVnulCP4VwoRTqT4?=
 =?us-ascii?Q?69ccNxuiwRGC/5K7z7ogUD6TJbFH01Ntizi8FNvSeFRL1nl8dCqqbyJAGsvL?=
 =?us-ascii?Q?kRozjUpTBqpmaxAivnJo3cm+tS1K5M/ilIn76fik680PG2F4raYMLMfRsykl?=
 =?us-ascii?Q?AOkpPs3Xh4UZnFyUutXoWW3TZbtMOmlEhJxZjaRu4rPG+Lccr8CuFhElHeeo?=
 =?us-ascii?Q?8G4oZNCiaUC6laq/lJK6GJ0WXu2j3t5g+xgjpy+/hmzjF6Eezg5WLIRKjEP3?=
 =?us-ascii?Q?wXy3Q0wRqLX8yNd4ibkni8uSZ9DIOSQar0VMlxAW6Pd5SmGrAmvE3jCm+0ic?=
 =?us-ascii?Q?rmLJuHs2B7fJQAz0Ns3EAD90kHJSZG1zNcXKQNij19YxBzmkEiqkVrqfEo0X?=
 =?us-ascii?Q?5NDGR16luBoCzwf5xqA7YLxqlblhopKrY6EIX35z8sNH/qds/joTQunGH4Gs?=
 =?us-ascii?Q?QsoeWUTdDs3XmFjdGd45jeqdMo5WmV76LR4tAPyP0cWSNQoxuGxO1pirW6Pb?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca12640d-b519-4d6e-f918-08da747681a0
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:02:35.6744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xn7hGz3hiFyYsp2pcAmQUt+bZoynaVm9QKiCvt3PXkKWqmYoMv/V+/jD0b0ZYDzde8ZDB4xlzeGlrr47oeUwgcZJWxXfKg5mlF51gPCkOVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0638
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=WINDOWS-1252
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change PINCTRL_IMX8M* dependency from just ARCH_MXC to SOC_IMX8M,
likewise is done for other PINCTRL_IMX* kconfig. This avoid polluting
the config when SOC_IMX8M is not enabled.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
A similar change would be needed for drivers/clk/imx/Kconfig,
in addition to that the other pinctrl are selected by the SOC
(config SOC_IMX7D -> select PINCTRL_IMX7D), while this is not true for
IMX8M and these options.

Not sure what should we do exactly, therefore the RFC tag, I stumbled on this while
slimming down the imx_v6_v7_defconfig for my own needs, and after disabling SOC_IMX8M
all these options were still enabled.
---

 drivers/pinctrl/freescale/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index d96b1130efd3..365fcff8e470 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -119,28 +119,28 @@ config PINCTRL_IMX7ULP
 
 config PINCTRL_IMX8MM
 	tristate "IMX8MM pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mm pinctrl driver
 
 config PINCTRL_IMX8MN
 	tristate "IMX8MN pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mn pinctrl driver
 
 config PINCTRL_IMX8MP
 	tristate "IMX8MP pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mp pinctrl driver
 
 config PINCTRL_IMX8MQ
 	tristate "IMX8MQ pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
-- 
2.25.1

