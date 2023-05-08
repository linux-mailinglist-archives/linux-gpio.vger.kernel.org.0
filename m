Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E340C6FB7BC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 21:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbjEHTvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 May 2023 15:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbjEHTug (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 15:50:36 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5817D83
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 12:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5f7MDkmHvXmenb4ysETcLgFTmId4xqYJWCyJzRCak9c5f24sInc638JqvBFTNaqsC1xbkKpfazzHqyCFTe0FDEHg0JTJuQRQnz39jZHG/IgUL6+HZueHf3FQnP1RMMhDL3VHwdam3PSCmIVofmiWL0mhbtqI5Y6ZMo3Qiq0NpvRH3qRNwTUaiXjK16VkKx2+bGmsgYRaq6LSHr3RjMAhefjn4PMaNIOPinAP8aTYIlD0k/OSluM0XGT02aNmJMg22VaTTW5tjcZgqWeO06pytsKRPHbrzEDesxiEHk5+GezJm5rEWuI0/thVaZR8C4WsTWuAg7NIXnIsI4JNsOYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gADqRQXLynLoiir00MNBtgUGCmU8mv044v84hAOYbPE=;
 b=bTKJXngleq2QHoX1L9TQ3kkaa0McXaKu+bgh7ZIJV/Y8vO7Ht+09FpbEAcMmxz5zvME4ba5xDRLg0WYDNzBMYN++vdnc8fHDBL90s8HXeOPNVvCQ+9r9JSybGkVtQZVq7ur4eBAbCs/vddnrXeRFJCnt2E5oiJm2vHyMBq637Ix5IYWhv3O7hJS26KJOlYcQJEA5wV7NWDTNHoFkwwRUupJVGCKkm/5vvCuuVr8LNzQP0t7HCMIgCNNqBzNgrhvJOZ5ijPcn61v1kAigkRYrN1X1jcI6/5NDSWC6dtQEe4QUKHrDam73xcXk9ckQL7jX4DjqbaIITbHXZaZRw9m8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gADqRQXLynLoiir00MNBtgUGCmU8mv044v84hAOYbPE=;
 b=dWlO21RaJ7GgKbs/ddJO4MbYBAfdDJOW5KPuc/t36OYj8KtuEwzojGuRtTbE1foNKMhM6iJtyhh6Vth6q531rfFS3YlIz5U1uavEi2P+nlxfSTn96Vsdqx894VWg81x8UrQS+Sq7KKxsq5Y0ABz2qtfi+CUq8mCe0OtlpsE9dUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM8PR04MB7860.eurprd04.prod.outlook.com (2603:10a6:20b:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 19:46:23 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 19:46:22 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com,
        Fugang Duan <fugang.duan@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional() to avoid error message
Date:   Mon,  8 May 2023 14:45:55 -0500
Message-Id: <20230508194555.1057007-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:a03:167::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM8PR04MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 9991f50d-ceff-46f3-4d0c-08db4ffce6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fQx+5KtTzICfMtqos3LB1DYj7+JIAKuWxc1vs6nooDXfDvA2AZrmm0DJOmbK/FmXn2Zrkr9hmQxAXfQXDT4+Sj2m1akMxgzq+A/oEQhdSW+nwMr7iAql9C0/7/tg+ZBpVthCwgaRZxCojdNQq/IYn6oe2cdfAsVmtq8XRCvYzHX8eR9s3Q1Y4UXC/tp2jDGBMQ6xjUvNgVonDfN9CqwbVPYfA74rIFShiGp0sJy/SI6CCwj4ueJrKZZCR7O8xfgFYoFRAYGFQFYyIP4ST8ejdnacJaqJf5nb4joZ8OaKbdhiMH8gNR4hBvcEcOysyR/CxyTqakWix8pLQK7atMDb31573iS2d4kK11UFKIigW3jz9QKVJN7WH5+TPe1sjY4RZUVwsWEr1TRhm+UH3Y1FFZ6BQJG2B6kbdsTBn8ULQ9qBaAIzUhieSBQ33Qmg/pjZ5bFSF7kyWWs6DqZLoVy14dnPTtiBq+6mQaF4WySeWS1JrAEZ/8n1AIigIJt5FQA+U4xtFK8CelKbSZ9ckQI+giF6H283Xf2PIa8PjTa3gE4FKWMw+h93O7CsF90PEOrLfXw6naZVKFldgTZC+alfLBTq5z3+LgljLY82GNTu7rBILkfgHI6StjB5Nc1NbNvk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(52116002)(66946007)(66556008)(66476007)(4326008)(478600001)(6486002)(6666004)(316002)(110136005)(54906003)(86362001)(36756003)(83380400001)(2616005)(6512007)(6506007)(1076003)(26005)(55236004)(8676002)(8936002)(5660300002)(44832011)(41300700001)(15650500001)(4744005)(2906002)(186003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uC27n6joJCgegsXiahz0L46aI0m2GdutcK3E3RErSZ6Qd6eMjUfD9LEMF5yP?=
 =?us-ascii?Q?LdhR8UrLkAyLDXjzTHXrulu7zdpr7y/hCn182T8xEmcZFRio/NuhQ6xD2ill?=
 =?us-ascii?Q?LDYc7wd/7iEpPwTpu4+lTMADwbC/Kz56QCNVvdL8OdI7SZbX5skuX1IeLIWO?=
 =?us-ascii?Q?QWyER0Vji8m7xmbzrcz1CBvogGgyXlwlRrhJYHxwmPEJNHCo+ec/JdUdQbKr?=
 =?us-ascii?Q?t4A9LvfVGSTkoUMbI/pK/b+H2hyZ68iajOTLkboGX7IPkNJUWZO5krF9IScK?=
 =?us-ascii?Q?g/mw8WU2zKk7vDIeXWSIPA3DQNKSrotPK1FSP115oULJVoZDje308kZHKrOl?=
 =?us-ascii?Q?oKpSdd3HZyc69xvdv9jTsnvyuM9O+6+PH1tyfrJ7OylTx7J4yL5T8Ycu5iNr?=
 =?us-ascii?Q?iL78b5jKrUSfK/B7a2yvdYXLnzhzZXIzkXUyDPO/5v6F7Sfea8xzNWytIRyV?=
 =?us-ascii?Q?Q2o+FRYpLvVAs6D8SuTxfss5PuIvZifaxS6rzHtw9uqMa4JP8YJsPzf4+cgI?=
 =?us-ascii?Q?nykp7Zm/ncrkZfLU9+JgV69YP0BLEvRjZdSWW3kj3LcGpyFKnSErhGEL1I68?=
 =?us-ascii?Q?/K1ojc5LN1fWybFvYA8gv3sNtu0qobK7+QRFX+OvfytivjLSXYhq48F3cbqh?=
 =?us-ascii?Q?Jpj5UEb4iOrkxfRbPLsEDeYcYQFIEPZ/z4owo/QKaSGQNn1Lj3yLK+KKi5uQ?=
 =?us-ascii?Q?HTfZOmNA1mPlJr2ccpjq1Pc1/xNsP0yLIkDiPhIU95Me5l3TG1/z2sjN9mC/?=
 =?us-ascii?Q?1Rl0SL2KVdWKrR6LSiRd2vYSYWpwNiEl7cnhY/RztJ/tOBMqXiptY66WmH32?=
 =?us-ascii?Q?pRl6xHMsjkscxC8hojmf8HwdlKpu4RLVUOaB30Z1HxttDXLfl3D+ZmtYQimv?=
 =?us-ascii?Q?oQLPn6Rp3w+1P/Wgr+zIiPw6xx8uIxvDXGLtHcL5xCXKH/wCWaCucrhfYMyi?=
 =?us-ascii?Q?w/ToSMbV1RDBmKrVHzlssjslbXmI+/91dMgPty107jo5y2K3t/WtDzgfoPRh?=
 =?us-ascii?Q?cL2lYk7RGTaFwJboYdE2RTAW3BgumWfxUNXiVNZdnyUbzW0FYWJYYRUGtlOq?=
 =?us-ascii?Q?/nEC2+kefamOJlmDc7HUlw7uHljfnU9wvWxiFnXX5ihZM7SqHz+qZ3MB4SzV?=
 =?us-ascii?Q?qSzovFptMYu0c9onrurBVE8BxwzBHrp7wM4fh2dRcAsYm7G2jxO8g5lWsXKc?=
 =?us-ascii?Q?z6v0FWUG1LEhj1uahBuTeR9vtQyE0ZhR5DJ8MRpanTD7/kvAWas4v+2qSB/d?=
 =?us-ascii?Q?LsSCWrDwxtAE0nm3M8DSQlm/11fBfgkvw7UnkY5ClfoThEiYYUKMmwDbjwGn?=
 =?us-ascii?Q?FUQTSrjc8p0Cgn443y+erEl96SF0gTANAiDjl3P81FEsp4AG8oO2F0Twe6fK?=
 =?us-ascii?Q?2fku4C/fXWjMrhVOXqPgb6xmM8CvMatUX1Ax9/cVQaL8EcFcN3UAKdxPG13Z?=
 =?us-ascii?Q?6RefTjs/09ipBcFxHuTM8am+MrKUgEamAOsXzeIbiEZMJNyq660do7oOHqGP?=
 =?us-ascii?Q?ScrRmYtnFdvoTbUty0plkaNUFJY613v3A+0r9V88AQKT5us2JByUT2HDYFge?=
 =?us-ascii?Q?uqZRlnPXQ4EOz3vMuBToOk/JbPQA/nn2ltJqDsDz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9991f50d-ceff-46f3-4d0c-08db4ffce6bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 19:46:22.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZYP15LFTkCB/0WTSZoOME3y5FxsOPoH/ssDRXf5LZ2/bCQLhKQ1xzUJ6YTjeX6vf/LJ0hu/uUYL42wOoxUpsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7860
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Use platform_get_irq_optional() to avoid error message for the
optional irq.

Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d0cec4b82a3..aa5a9c25e415 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -406,7 +406,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return irq_count;
 
 	if (irq_count > 1) {
-		port->irq_high = platform_get_irq(pdev, 1);
+		port->irq_high = platform_get_irq_optional(pdev, 1);
 		if (port->irq_high < 0)
 			port->irq_high = 0;
 	}
-- 
2.34.1

