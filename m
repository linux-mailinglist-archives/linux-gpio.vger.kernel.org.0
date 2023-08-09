Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65E3776224
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Aug 2023 16:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbjHIONl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Aug 2023 10:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjHIONl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 10:13:41 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2078.outbound.protection.outlook.com [40.107.6.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7830E1FD8
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 07:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVSumRyYcPymrhcTl/pntGsDggqFtav4Zwd4aI3Uq6z0Eb4DhG3dkaIrXNharcmZHTk21inxyhOtMYZSOtwpqzlcZe1NJ1uBAWtQ6aKKwcNByOPNrWtA9J0j1T652VoNwcmpeeYYQVWgo1HykHmCaz66Po+1A4wVoDMKHaeGTDoE/Qyo5PM3CiGMPa9KPxTKyfbzqlTQYyAC5770MfJ7isilhyvxesXs9D9jOvejJAuSC3+exOjRA8jvjF8SOqLbWDbz0FEVoYgJqjCLPF99vRNmWbSd5QkZ/zAUbWitHViCaxvP8b64LVuX9pp057dh22zYvcT5m7SSt4TT0T/u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baoGaDBzi0cOLI1fCPGNUzt1jP5mYQGLse0iPerljXs=;
 b=KXyKt6HKbqpRKhx/GLdmcwbgtqxRm84yGoF9tuHghn5RFsviYmD22J5DTOw5IziYOGPgTVCzOTFeY5iyBXpZJjRcRFCVH0j9JXVaUptV/zRpgM0m3VPONFMsVex+ORAf7jCuO2u+KfOZg8DVeNzE57TZ99pCZyJ2A+FCIfQ98LbTgB7oWJWJPWCCvNGKLpkZniZqRtVkzlmD/f952LY+cRwSauoO8pcE0nDK7Pi+DIZxjSl7EYykFyOBjDNHdn+cENDcrLmfZUQ4muIcOyVXWhhZ0RbAWrIqS+Ux1ED0BR9m1gpypyu7EcTBUkq8IXceEpozEvxiQdcWTqHUcmexzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baoGaDBzi0cOLI1fCPGNUzt1jP5mYQGLse0iPerljXs=;
 b=N10lnOZLfF7ExbaEfBDeqI6Q+bSsacGYk3T2SCEq/w62R9kUDTDlLsRQvCTw9gOSBBJCDGBP7Dbbl+ryLT0VZ1KmP8RoHFRyJIfn5LVFDL3fHAm1ls/PbgL+Bz+fTJLJNA1fCm7JaLdsZJj8SRQbr7etz68iznluQvxBaou1kMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 14:13:37 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 14:13:37 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2] gpio: mxc: release the parent IRQ in runtime suspend
Date:   Wed,  9 Aug 2023 09:13:24 -0500
Message-Id: <20230809141324.400448-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: d640de3d-1ec5-4fbe-00b0-08db98e2d316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTCUtwaQb3V+mdg4SygyBv/p7xFhLinN8hxZbjlzLHz9S120tnJEmIotcGKFWpyJRsHgM6KI1WrdUaMsIitl5w9j3QC2P1nlJFOjI8Itma0Jj9l3dXeJmTBqQeNGXJfHKyn11bm4JhZgFcH064Z+ZO8Soe5hj3eLON+ZSfwNQe4lmI7nfHYWNg10yQDWdAd3UogS51aQYJos6C/SBGV4i0peU6v4bfXAJwZcQMDcEBspmBXYwj0J83Q+z0ccfyqF/wFsjQAQnIQzLw0spSiux2QPBscemFdAzEjd29sILuVYiUVl7zhLSqM/ywnSlepCLkHILKD78wk9jQTxqXNuIxXGUYYUmTAHTh61AIUyw9rWdVYuj7wd15k8KaAQ75xqR8c/T9feBtb7E2zINLFoTkkWgC3t5mTzJ6crVnm6WuOo+eapkbDiA0YefhvNSE1lnMuoBh7+HejLl2hHzBtfVoavijhcte341BO5eGgPNVaMp91JflAvKvGE+GtEPIt1uOklObRqcQeYsbWU6r+aBzcgyks/7UbGlg8ktIjB1IBk487fTuI3asD7oc18BRCnCEkEqgOknwNk3YrE5pfzmGIpGzvutoYnhJlIbrmZsS+cLL3BmIEeYZCyLM53DKQD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(1800799006)(451199021)(186006)(55236004)(6506007)(54906003)(52116002)(26005)(1076003)(478600001)(110136005)(6486002)(6512007)(6666004)(36756003)(83380400001)(2616005)(66556008)(66946007)(4326008)(316002)(5660300002)(8936002)(41300700001)(66476007)(8676002)(2906002)(15650500001)(86362001)(38350700002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cDYXQed6WohqfLIFOdjev7VPOo49+Cm4IDZfI/hDq9Ydsz3Fnr8yTpXGq8WU?=
 =?us-ascii?Q?EVHfAsTfi25yn0ezTm2pAJTH5rokPWOnfxyPAUOoOohHiZAARPNajQFhnegO?=
 =?us-ascii?Q?gFzsICTMo3JJM9CYbm1BHldl91YGTS7cnhg3csdNio9N/DhHuCa1VCK9tpUe?=
 =?us-ascii?Q?+3vnEzqgdVslF9z1Hiv4toGXXxnJV9bYPGs9pin//c+uy6uMjm2n+wBnKnC0?=
 =?us-ascii?Q?GBpr1/Iccc0lpqTk3qOZrlxcXQ7+LRXgNm5svnYRI7N9uAU8k6MJLDFWVgeW?=
 =?us-ascii?Q?k7Ig4fIZeN8oH/aPzqX0oKLIwKqLLwuLVJvNFsFRydE/uQiS+5UhDtCgvOJW?=
 =?us-ascii?Q?cR/Aqy+2loVJuKJlxLhqay2/xQ4scuR2TSnHQyd7aM+BR0YDKDHfWE6KPb9t?=
 =?us-ascii?Q?vqrIlJeLenWxmF+M/KYaZANQxheCTqHYpY6b0KHQd1XPm+fJ8LCuqvJd9MaD?=
 =?us-ascii?Q?QpT+r2p5Up7jmHfbZOIdwCk+GXkBWWFOaAVm5lsE8vNqhK1zje/Crl9R6r3I?=
 =?us-ascii?Q?eywuVQoCVVEz8GIw2NxtA1IVA7cQd3GH+PsDzeasu4c3J9m2XFg7T1zbiX0L?=
 =?us-ascii?Q?VUe5CovmZk+/IxqRyLwr+JvLDz2VU/BFcdRsevn/7MBVhNmO+uDdzhig8U78?=
 =?us-ascii?Q?4i8n8B7TRHg5OWVVINcThjPjrZYTH5jtHbR4B+P6c1T/WvG43R08WKCZkWap?=
 =?us-ascii?Q?NktHWmdparNntiflAn4hwslqAz6LReky+hS1yhnO7vgiinq9RrNwPGhIH2El?=
 =?us-ascii?Q?DtQ9jC2yvV9ftZoiR2j40d0M8VHrLpPfeNcOpECH2u9FjI9X3BWqWybh3QFr?=
 =?us-ascii?Q?LplF/9BJx5OJSE30Hp1ZCDK6UDEswz7hGm+dXPTGc6cvPlwkHye5FIelOLo3?=
 =?us-ascii?Q?uH4Y2AlcHFIVSAN6lRm3GBwhU+URvJ98IxvbKq3ZM7DpArQKaTH5ydk/0J6r?=
 =?us-ascii?Q?wJKaiI8A0U15NYLJSyDRcDjP1G455bcbyjxsNhFHmkb77/REqrOFSYM/cUHz?=
 =?us-ascii?Q?O1xFUZRckNzf0VUHHS2+AiDeN5ht4w26vBHYQ3uEC5eQjaleWIVlULb6E6WA?=
 =?us-ascii?Q?HWoDTir23lzunLD4WSkvMY6op0AOzrMFW+6A9Mid/amP9dxtptfcMpuTtjmD?=
 =?us-ascii?Q?d3hVQb7gPoJUe/25sY6uDEriWSI2sciTzkisply4bYUc0Sho9DLu8PQ6hiiB?=
 =?us-ascii?Q?GBd4ah3WZWNnbpo18+wxAQH1mJm6Ne6OzDq9fZqqU32qTUEBqL3Ezj1AA4xA?=
 =?us-ascii?Q?J37iz/jaZ3cGRTaq/TDe09EM++4Fvu1yDg2TaaneB8VK7w7hkebk1cZ4UGd5?=
 =?us-ascii?Q?R7nXAplTr9wHb7ZFqTs2bUL073TvhZPtS3N1J93R3kNoHTgSCsIq0W7UCsXx?=
 =?us-ascii?Q?5HIebA75GbMnj506XgRM6hCy+zjQLxxhdYfunC+R20o8KORz9oTHhvAQ/RC2?=
 =?us-ascii?Q?1Ww5kUxYGaJ4N5DlXk3djsyNGi1UthgJbpQExH3s1cX04vOCN0wytxJ3vaU8?=
 =?us-ascii?Q?rI1Vgz7ILJLoUCW7l+c7zpL3tWFfWh0O8FZUc/XA+Dzadov9CqPUJCsbX5w5?=
 =?us-ascii?Q?ZK76/vmDdTycYFVb7CqoDGQNxfHMJA0AzVKiWe9l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d640de3d-1ec5-4fbe-00b0-08db98e2d316
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:13:37.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e64Xm5gcD8ldZWtRde2wdOBcnYxKh4dPWQ5zNciYqilZFXdIZB6OZG78LbJowe2QdC7v1Q+u8BX4F63BRwZGSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Release the parent interrupt request during runtime suspend, allowing
the parent interrupt controller to enter runtime suspend if there are
no active users.

This change may not have a visible impact if the parent controller is
the GIC, but it can enable significant power savings for parent IRQ
controllers like IRQSteer inside a subsystem on i.MX8 SoCs. Releasing
the parent IRQ provides an opportunity for the subsystem to enter suspend
states if there are no active users.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Changes in v2:
  - Reorg the codes for better understanding per Andy's comments.

 drivers/gpio/gpio-mxc.c | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 377d3ab8d626..004c6ad7ce52 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -62,6 +62,7 @@ struct mxc_gpio_port {
 	struct clk *clk;
 	int irq;
 	int irq_high;
+	void (*mx_irq_handler)(struct irq_desc *desc);
 	struct irq_domain *domain;
 	struct gpio_chip gc;
 	struct device *dev;
@@ -399,6 +400,24 @@ static void mxc_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pm_runtime_put(chip->parent);
 }

+static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enable)
+{
+	if (enable)
+		irq_set_chained_handler_and_data(port->irq, port->mx_irq_handler, port);
+	else
+		irq_set_chained_handler_and_data(port->irq, NULL, NULL);
+
+	/* setup handler for GPIO 16 to 31 */
+	if (port->irq_high > 0) {
+		if (enable)
+			irq_set_chained_handler_and_data(port->irq_high,
+							 port->mx_irq_handler,
+							 port);
+		else
+			irq_set_chained_handler_and_data(port->irq_high, NULL, NULL);
+	}
+}
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -460,18 +479,12 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		 * the handler is needed only once, but doing it for every port
 		 * is more robust and easier.
 		 */
-		irq_set_chained_handler(port->irq, mx2_gpio_irq_handler);
-	} else {
-		/* setup one handler for each entry */
-		irq_set_chained_handler_and_data(port->irq,
-						 mx3_gpio_irq_handler, port);
-		if (port->irq_high > 0)
-			/* setup handler for GPIO 16 to 31 */
-			irq_set_chained_handler_and_data(port->irq_high,
-							 mx3_gpio_irq_handler,
-							 port);
-	}
+		port->irq_high = -1;
+		port->mx_irq_handler = mx2_gpio_irq_handler;
+	} else
+		port->mx_irq_handler = mx3_gpio_irq_handler;

+	mxc_update_irq_chained_handler(port, true);
 	err = bgpio_init(&port->gc, &pdev->dev, 4,
 			 port->base + GPIO_PSR,
 			 port->base + GPIO_DR, NULL,
@@ -604,6 +617,7 @@ static int mxc_gpio_runtime_suspend(struct device *dev)

 	mxc_gpio_save_regs(port);
 	clk_disable_unprepare(port->clk);
+	mxc_update_irq_chained_handler(port, false);

 	return 0;
 }
@@ -613,9 +627,12 @@ static int mxc_gpio_runtime_resume(struct device *dev)
 	struct mxc_gpio_port *port = dev_get_drvdata(dev);
 	int ret;

+	mxc_update_irq_chained_handler(port, true);
 	ret = clk_prepare_enable(port->clk);
-	if (ret)
+	if (ret) {
+		mxc_update_irq_chained_handler(port, false);
 		return ret;
+	}

 	mxc_gpio_restore_regs(port);

--
2.34.1

