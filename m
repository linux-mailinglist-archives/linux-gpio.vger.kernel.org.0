Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B53E647EC6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 08:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbiLIHus (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 02:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiLIHup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 02:50:45 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FE14FF9D
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 23:50:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ta2K3NMypWaEna3TDY6tTMvwNrcZHN1YUPGSWHu7xIkXJVetwPDmHcjOQKNnY67BEaO+60AfaUZ4xXzYlUPg56xCEfcpX/rb9F6KrqVI3yw0URh3N321m1LFQmkXgRB0M+F5hi79njL0WZNoGAtuv+4NR5IYJ4qWTx1lYPl+yPvtSW2Zri634HwD9R0FdAtjs2xH0YVdf2t+AaglSOvmi5wgGwt5lDibzIkdJjv6ttAqRBndgMGcejmo8rSETuV/5dRqST1V28FBOA4X4RZIhA3EV2SUPXS94Ce/U1ulNmmCMRSsTbU28ek17E0Zkv7FZtArOdHqVytSuRtOmqYiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ot/ozQWBFy/y7+Dxlw4mxJY7G8yPujl3nrj6HVxzmA=;
 b=kIUUC+yuhSzxgHher4aeMG0WMkXpNCNH0EZcFlddZjsdYLkJ0aNxeDHzGb9SrHC2BAzgv4w3eCvDDZAMgsENe4Jd0g6dNqlRj07iE0VIa3rRiQALn1U2ACVzvcbIrv4AU4ClICEawARSw3nmSlJYzusOoaww1iRl5mnBxO7CdEsJ2l3QuNWmdA/j0iIY4J5SbX0jdvUO/zrhtapDX2c1s4tsw4t15BAypKEmnW23vJ/td4btHW/6ib2uDGB9CuAnVdn4xW+D8kXxyoEhWtVWU0fpOQdepLKGo9l5rYjaSQYnnJIzs6fCivN6FUSrAfVurETa+WRMhcoiwKbZoe3dPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ot/ozQWBFy/y7+Dxlw4mxJY7G8yPujl3nrj6HVxzmA=;
 b=C1b29Vszupl1uGuKJFd8ueHN5Gu68klJdhal78WkUcpNMWotOiwMwDEPT8TbF97cJ0KfwLSiatStHj9wtO9OrE0XrySJ5N6dWao9SstK3af62+RpU0IZCATAjXWMnfX1eY0Ybk5diHSr6bvMbemUgdhcO4MRsoF/AIqTuqOoq7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 DU2PR04MB9099.eurprd04.prod.outlook.com (2603:10a6:10:2f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20; Fri, 9 Dec 2022 07:50:41 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::7479:76ef:8e5:da0b]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::7479:76ef:8e5:da0b%7]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 07:50:41 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     haibo.chen@nxp.com, linux-imx@nxp.com, linux-gpio@vger.kernel.org,
        martyn.welch@collabora.com
Subject: [PATCH 1/2] gpio: pca953x: avoid to use uninitialized value pinctrl
Date:   Fri,  9 Dec 2022 15:50:39 +0800
Message-Id: <20221209075040.2141042-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|DU2PR04MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: b84114b2-37f1-4f11-b112-08dad9ba0637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAdjcBurRTgGLj/4DT3534qSxSU5CZdTB3oOjufrUe9wtbnZz5GajWQxK0jZocpoo8Z0t9dGRSkd7fRMRM/BoOYN6zt/bUv5SItXbeFWXP8E97Db/cz+X0z6DxWxKnP6r1kvfR0t4E524Wo80WlNV6cTaJsUUc8TqNsfNsZgt4sDXOXnVAIbbd+GFQ8gH3y/Tm8ABYTiIfKDARkZD4HAZXcjZwjNEmT59RXmk/CyXTcfuD90/cdB91JqQ57GuTfXpJFQC6pCqaPVjPkvIJIjp+QtTLOxuYL5sWaaud9dqfXfyQKfkWQl0Tb8atZkNIsd3xNnLb9nHOoAXrEFQ8CXmc5YjwXL2pYbj2OY/ciLmeLoAbrH7Icg7sIYaFNSJjJ2FPeg03sNy+WPIfaDs7rc9kvjPfiU/kpp23DDztGFuDaQrlgjIQSUbZY5mG0d1lm1nRoCAvkwI/BBzTU2AQTMaW6Eey5b1gbv2FXTyIfC2Dzbl06pTYxznsWxyqR4Q369W1eqBPbdhf+x8/7KSukQX1IANPjklIVuXgcIxz6QzFP0o0x6zs7cVX+IoWspth+VpnKJd9rH6dX/JK9h7Q3Er1gQXqVnahcq33HWSrbuCzW0fWxfsh2EWOjKk2WA/0T0YsWX/TziqD5hYcwp6IQmJgbAr5fCLJ4CD4af5lFe+VwBPOfkbgXZn1xMaDQ2gNx6VMJDzBv3Im5aq7jd0KZYdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(2906002)(4744005)(38350700002)(8936002)(38100700002)(86362001)(83380400001)(4326008)(66476007)(36756003)(5660300002)(52116002)(66946007)(2616005)(1076003)(186003)(41300700001)(66556008)(6506007)(6512007)(316002)(9686003)(8676002)(478600001)(6486002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L5thJ0OpaWNGhbR2vlxxk3vEz2xzBJJe8yvc3dt7XSX1p/r5pwScY6b1emMD?=
 =?us-ascii?Q?Rq++VEATIqDSlsIReT6ffuHuiWE7HPYEAq73KoG2HOSSD2l1XLyOtXoCVf2n?=
 =?us-ascii?Q?Kc3Iqrq+yJFvEGns861/DGab0TQ8WH/dyfmRO5alu54LyV9g2s1JyBSvAsmy?=
 =?us-ascii?Q?NOgNr7myWDiiTVB35klQsIaEqGFeQ/pHE+yjWkBG0OVc1inIjldnh8/PZjpV?=
 =?us-ascii?Q?DMwMFQ79PFR1167uh+gYiMVEGFiMbtkHhzmELmJ+4qVU1EOwgqhsX0tAFGfZ?=
 =?us-ascii?Q?id4X5bA3tqL3CWVfm/UzFdjFLAMqXC/OdHIfSAGTymsFipUlCmI93svZurpP?=
 =?us-ascii?Q?pOmimgHNJSoXm1lwHjz1ITNdNcuwiDnIoyBLyQXng9kxPQf/KoVT6zc3szBw?=
 =?us-ascii?Q?zHy5CN9/nAp66V/7uEjZBjJyPQtc8NUrylZ9ZnipHQlNSOyzlsBq9Ztscr6K?=
 =?us-ascii?Q?k7Lmc/qTbx3/CVsmoGqKqrPBYgsw6RrRQgMrdmCMpcFZCPT+BVyct56pNRDK?=
 =?us-ascii?Q?SScqZQAe03114cvzYs4xV72voIL/KCNvHGxRUOh2wWKY4dIBUdcbRsTTKeKT?=
 =?us-ascii?Q?cecATk0lttHQB1o6CfRoQ/wJuBhsoGr4IS/mk0mC8w8/dMLGZEg60y3giQ3u?=
 =?us-ascii?Q?NAtTLEs3gM+OFXEKAMCLd7hRgDcAwo/OuNcygl/5H5UGWcY3GwPFtLmHQAKW?=
 =?us-ascii?Q?P21LgX31iZJ4AeBFGNY2HKMnXJTLffR+evNk+yYFpryiWf4dZMcPoWnbApSb?=
 =?us-ascii?Q?hINmrcF4OOkahKsskVeLFpiLMFFKbPzBclSD5iWScte0xlSQI1cY4/J4MM6x?=
 =?us-ascii?Q?rwwfzxOSuUxUJnA030Wggi7sEXQIyPLmDgYNFFQlL3i+y84+GEnFs2fzWGO3?=
 =?us-ascii?Q?vpgpasGYD7mdr0+Ntix8kbjtW0Chlwyh3yoCm0WC/vIjmeiMNRdNYvVtOQfU?=
 =?us-ascii?Q?U0Lcn+b5sxEoVzfK+dAml7AYgeBU42sKg3oVR203yzzR0fgp3IVHJkv4d4ch?=
 =?us-ascii?Q?q7AVp4K6eVrD+Z3SnsYZUPK8JF1sb2L0eqEbPkkXv811HP6RTeMKuCg7qaIm?=
 =?us-ascii?Q?+Ox5ZNmaJr1juoZA/Ua4GOyqIU4WhuGKjzlN/9mQmuoLjPZ/ozoQolZySogy?=
 =?us-ascii?Q?DNXDzleVVhKJWaOIbgW5IPETtjqcQzDiOe5uFXixTuOi+Qmi74n9kV96YgFm?=
 =?us-ascii?Q?7kDPMRxYKvktJu5HOU/dWRa6mKQlAmbj84nhRcokpjYjRabmHqPk4EqNmLAI?=
 =?us-ascii?Q?Y9D+YGEakEkUVkkOtkHU/vc9LFMBFK2DRVJ8FgaGR3Cb/iN8ZYJ6tJcHBC3I?=
 =?us-ascii?Q?5NOrm+tBZXDImsCoH9JLa5apdVt8pF0OmVss8Kx3LzIdBTr3EPI/5R6/hnUc?=
 =?us-ascii?Q?Xo5fmcdzrSd3xBCXOTaQ/QujUZ7K4xwlfS9cpjys5vlAYeHg0rn5dqCYigdc?=
 =?us-ascii?Q?7G/Vgfip0oEVlCUNo3GJqorr5gbvq6hRlj6aXk1mG/MCmVqCjuDNktlnFs2N?=
 =?us-ascii?Q?MjBgA+LSZuONoqV9js9Hs5WJDD3xXy7H2kcAkWLCLvSHikt5vVNs/HJXhmTm?=
 =?us-ascii?Q?cHX+tOtpNkAK2IzUeU6L0NbUFryccawBw2RtftHk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84114b2-37f1-4f11-b112-08dad9ba0637
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 07:50:41.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7WBtuoo+Wgu02cngeCxMGQ/RaRHrT2ffJjIwuZ6YBs4Wzp+1tmjbUlgDoUuJCBW859uCVoBzOepaFpScjmsYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9099
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

There is a variable pinctrl declared without initializer. And then
has the case (switch operation chose the default case) to directly
use this uninitialized value, this is not a safe behavior. So here
initialize the pinctrl as 0 to avoid this issue.
This is reported by Coverity.

Fixes: 13c5d4ce8060 ("gpio: pca953x: Add support for PCAL6534")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a59d61cd44b2..c3dd5ceab421 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -453,7 +453,7 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off)
 static u8 pcal6534_recalc_addr(struct pca953x_chip *chip, int reg, int off)
 {
 	int addr;
-	int pinctrl;
+	int pinctrl = 0;
 
 	addr = (reg & PCAL_GPIO_MASK) * NBANK(chip);
 
-- 
2.34.1

