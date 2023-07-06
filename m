Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE97974A018
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jul 2023 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbjGFO4t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jul 2023 10:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbjGFO4q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jul 2023 10:56:46 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2074.outbound.protection.outlook.com [40.107.7.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B69F0
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jul 2023 07:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7wLuU/3Al+F8cEMU65boqQZfXDGiUwLFEBFKVoufeRtIr+29gGWYhecuaYQwVNQf5lEeCPKETnTQ9jhwhnQh288GY3GHEcJX6HJ2yWxhakODuapXj1ILxXxPlPNOZmcp0LyXNBzQA7Zo3oY7mpNkyP5IxDanLGn78xPGK3D9ycBoU07QnTu4ch9rheTPRfucsZsusXTL2hqCQEW0sdtnkIZOM47S1qvziV/Y9mfU+QDYqo8rDMxGY6Y5KHbYOKWTtaxjGk80iEfWCZQj6S9yzaT7UJCualC7hJ9sjEiFq1V2DO3MbriwLPP5fk3ALOYyU6e4tOZGLiqodfExmAT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxTiU0KNVbRL2Z/KZodByDsBE1btaFRQ7yx1kso0lcw=;
 b=btdnKv6XBDCv4aVv+xjfalOd1UXklztV4NDiocB0Cd88hivzosiWBfebV+nyta5GhkbYbEB8rrpfQd0NFdczpkOdU2Mgowta1S7/6TTBxB5jZYXn7oV3PpAX8hWpiH4ihq67ahHxXbshTdfthLzJ81i8CtLoDFlx4yU3ZzsGvVu27eqf/PslFzcLN+IK3Dj/9te81drdOIHZlvxJWaD3e77TFle4IMEudU4Lhr10zvEvUt0wtie+4Wu0zf+/r/KNLdz7FkYhT5MuXKUQ7nCH4zZ+dOpuk4ysHbzaRJ+LWc5QJEXT0cqOg1BoPR7opBMos+YC0/2ynLuHTiB635tqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxTiU0KNVbRL2Z/KZodByDsBE1btaFRQ7yx1kso0lcw=;
 b=EDwdzV7nMudLuLRaybvg8QqLIzJeOPtQ+i8s8ohecNt2oI+IHM3YyyoctfKUEGrbU/0NQyORYNtcyOItwmOapo6P3dpix12DqHdydkjMUHVTN3gBoJFGGC675NzWo/yqtDdlnBcOe8GaOV+I0geOsyUd+XbdTaHngOgaATi9mGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS1PR04MB9681.eurprd04.prod.outlook.com (2603:10a6:20b:480::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 14:56:21 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38%7]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 14:56:21 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v3] gpio: mxc: add runtime pm support
Date:   Thu,  6 Jul 2023 09:56:11 -0500
Message-Id: <20230706145611.2660657-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS1PR04MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ace7d8-7cf8-4cf6-f8ab-08db7e312900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6qtwXcGtATs7QCvJ4PLciBqtTJhueaH42i4eVFV4tYgtrb0n21G8wWSdRvSD4f4+l1t6z/hIKn97wNzP1QjUlK4vKPByid4ELc7/LerTOg0VP1GzIzJfe4jECJJphJF9Q5zabdaHka0vk88/+ehioW3XNpIbj+VOrMPBzJC/ttZsLrgAQlZOyYHFL6QJUJ/ouHjGKVd+oSW+mbElLzMgyMvUaa+DCXJbTR0nmMxnOHSRc5tQewGWxwjEvmIJ2z7ocpxtm64ZH4g5NAWERhevl/6erxreNG8LUaawOIiJ4CAPqhLt2QS9L/CNUB4Lild0GEGJySRnMngn6UE58nowmEzG0VrVAcivVSrzciBSpvHQkbTBohvoA2Nn/1Tx67Urzm59OhZcChTRyA84Z7ckt7q6+QXyydJZrEJ+lAjaHzdPQGbbjoZ+9BWTwemrshAJPMSbqoRbe4KH3hoAIbXJNr9Uut+5yDbzyxuP8cpnyvr8bQqLQI0YMJx3Q7d5YI9EYJOAXt6EpbyEmFv1mZ80ySc4gSSpP63MofrfmGqqjjBjyy0fhOMMcQYBIdpHfuNXRLHebhC8XmcSQ6KhcbQ+Q67TWzoTqEj8cMGcLj53ZjW0G/glT8sQoLjFr1B/nIC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199021)(2906002)(44832011)(8676002)(6486002)(2616005)(86362001)(66556008)(8936002)(5660300002)(110136005)(26005)(6666004)(55236004)(1076003)(478600001)(6512007)(52116002)(186003)(38100700002)(38350700002)(6506007)(83380400001)(66946007)(4326008)(316002)(36756003)(66476007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x1ACzVtdcdbcySVA2/XU5rv5aZZGj9/sWshtAC8fuw/wbAKjgDAIwZglOfyO?=
 =?us-ascii?Q?exCdVsKfHA8X0gXK6woTRzJc2Vtn82+JJBoPROPh+wCE0Ls8wg3D8OTwj/xX?=
 =?us-ascii?Q?Il9pHMvfiBBtTG+QxTzZItuRz5JDpG1mgNt7nCDnnupT8kRUO1whKB7u2K4c?=
 =?us-ascii?Q?KX3seeGO9XWvMmSGLTTjQmjjJ06vVQREZfPsEd8xP4XXIWpEiynj1FMf4Mzn?=
 =?us-ascii?Q?r0lgLVRgNUW1ZnJ41UTqazhvHx0lcCvIeGgr/dlq4mkcIW4hgeS/5Ls7CvR1?=
 =?us-ascii?Q?Qv3rv1K1MV27YFtLptwtWejDsX/37pq3JK2fAoy89b6hBhBWFwkQIDd8QZhN?=
 =?us-ascii?Q?RnNqyEoHbJB/e5JXWjwUu3lcmuLGLvSIr48rTEuwbwMimclxFXfhe49NFxn2?=
 =?us-ascii?Q?+QwAvuUlOTh50VP9j6oKIIFQoi4Qv2lY1RBd1pianqfK0crd8/g67duQ4ei5?=
 =?us-ascii?Q?G8ypQKkM+TVZQyKEQORp/T4fWUeKWCmMBNIyQMKrpUmHD2c1vIxl3VBRPyoB?=
 =?us-ascii?Q?tKKJjgihmyaeOyCeh+CKhWuvYnAXIhrO8Tq0ARjd2mxSVJOP2o0eTqPLXmmM?=
 =?us-ascii?Q?yPzHQZGeEMSXmhWLgwLe83elE6ctdHNpMw5YzgZ22C1y7uprYm9fk6FMR68z?=
 =?us-ascii?Q?5n7P2AmyTYUdBATvGwbMSqEOExbPC00Ii/VP0tElgRU4UTfNEDOa3W1XJD62?=
 =?us-ascii?Q?eTd1qtIEJdRWdNSTAbTYo8zaHRSCbYkO8TqCBx+V5PrS+m5stUnPd/7KApXo?=
 =?us-ascii?Q?132bw0JWvmaQkjRZhSOGlqdKabZUBDtwVJfdH7xD+w0ZnLEiGb9sBKWO5Jfk?=
 =?us-ascii?Q?piblJ0tRKcb6sYo88cDNg1qNzBmA4rFqLz3+lu4QMv6Peowi10K+OZCdOeQh?=
 =?us-ascii?Q?M9iXvwA6oBHb6DkHtKeutnCOkhODT/jlTzrTBTMJvT6Jo6pBFlx6w/BNWf0l?=
 =?us-ascii?Q?OqiD00KINHxsBStB8ICDr1ykd4HTpx8v0O6EvUH1dLFqYlM+GOd2yMihBK9B?=
 =?us-ascii?Q?NXueRY87bf0NHxFYz7jcCLUfqdwxy4wVk/2GJ5j/7WoEmUtSelMwu/1STZmu?=
 =?us-ascii?Q?W5gyA0jTFhvwSfvDRNVg/+gKh3jecvl3yNYjtYtDYVNCNy5vlQXBWlC4RYyp?=
 =?us-ascii?Q?c8eL5VO2EgJ2C9N15ecrKjAjmC9QH4RsITdBv59N6S1hC72oDZfZIOlEwyCO?=
 =?us-ascii?Q?zS+VD8Wt1FQBoqbCuzm4+5AKr9XI0AnctbOiNxuNOlpZwjg77OtxciVVWhBw?=
 =?us-ascii?Q?w6O7OS3mK41wJK0HB+A72SQNWM/91t4Csts28eqCZKF7/QhaieVFK8P2W7Or?=
 =?us-ascii?Q?O7zuXhftmj6cLVDskYFOhIXRndjKNqzqiYvmAFPN4oJZzLRnWzTfwhkqaE5K?=
 =?us-ascii?Q?/ammkVUG6c/zNPrvtt5YLtbV88Vdpe7zxZ7MO69iLdt4SZp323D2KyDsMMFi?=
 =?us-ascii?Q?VtoeFUomN0lw/Q/Udol94nWBrh6rfocSyozcym1x9q7cLC6h9oXh9MV08taj?=
 =?us-ascii?Q?L8fMjonno9twYeDP0kv8SQZJW/e9g00jf5KpNa3lIPzQz1qC2DbrGmvLgaQN?=
 =?us-ascii?Q?4EdR6thgV1AM+mkuiDvqv44yaiowfol+LhKvEf3z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ace7d8-7cf8-4cf6-f8ab-08db7e312900
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 14:56:21.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95gHNdKtEeuf/hJ/NhkeM/TS4re8eCuxtgHfyvcZY353jQVLaHnAd/puViDdocjRo6cELdylVP9Tw7IqS2OFAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9681
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add runtime PM support and allow the GPIO controller to enter
into runtime suspend automatically when not in use to save power.
However, it will automatically resume and enable clocks when a
GPIO or IRQ is requested.

While putting the GPIO module itself into power saving mode may not
have an obvious impact on current dissipation, the function is necessary
because the GPIO module disables its clock when idle. This enables the
system an opportunity to power off the parent subsystem, and this conserves
more power. The typical i.MX8 SoC features up to 8 GPIO controllers, but
most of the controllers often remain unused.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
v3:
  - Improved the error handling logic in the probe() function. Thanks a
    lot to AndyS for reviewing and pointing out the issue.

v2:
  - improved the patch comments
  - using pm_runtime_resume_and_get to avoid reference count disbalance
    when errors
  - removed the __maybe_unused identifier

 drivers/gpio/gpio-mxc.c | 61 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d0cec4b82a3..a9fb6bd9aa6f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -17,6 +17,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
@@ -382,6 +383,23 @@ static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 	return irq_find_mapping(port->domain, offset);
 }

+static int mxc_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	int ret;
+
+	ret = gpiochip_generic_request(chip, offset);
+	if (ret)
+		return ret;
+
+	return pm_runtime_resume_and_get(chip->parent);
+}
+
+static void mxc_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	gpiochip_generic_free(chip, offset);
+	pm_runtime_put(chip->parent);
+}
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -429,6 +447,10 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
 		port->power_off = true;

+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -459,8 +481,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;

-	port->gc.request = gpiochip_generic_request;
-	port->gc.free = gpiochip_generic_free;
+	port->gc.request = mxc_gpio_request;
+	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
@@ -482,6 +504,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}

+	irq_domain_set_pm_device(port->domain, &pdev->dev);
+
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
@@ -490,12 +514,15 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	list_add_tail(&port->node, &mxc_gpio_ports);

 	platform_set_drvdata(pdev, port);
+	pm_runtime_put_autosuspend(&pdev->dev);

 	return 0;

 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	clk_disable_unprepare(port->clk);
 	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
 	return err;
@@ -572,6 +599,30 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	return ret;
 }

+static int mxc_gpio_runtime_suspend(struct device *dev)
+{
+	struct mxc_gpio_port *port = dev_get_drvdata(dev);
+
+	mxc_gpio_save_regs(port);
+	clk_disable_unprepare(port->clk);
+
+	return 0;
+}
+
+static int mxc_gpio_runtime_resume(struct device *dev)
+{
+	struct mxc_gpio_port *port = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(port->clk);
+	if (ret)
+		return ret;
+
+	mxc_gpio_restore_regs(port);
+
+	return 0;
+}
+
 static int __maybe_unused mxc_gpio_noirq_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -597,14 +648,19 @@ static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)

 static const struct dev_pm_ops mxc_gpio_dev_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mxc_gpio_noirq_suspend, mxc_gpio_noirq_resume)
+	SET_RUNTIME_PM_OPS(mxc_gpio_runtime_suspend, mxc_gpio_runtime_resume, NULL)
 };

 static int mxc_gpio_syscore_suspend(void)
 {
 	struct mxc_gpio_port *port;
+	int ret;

 	/* walk through all ports */
 	list_for_each_entry(port, &mxc_gpio_ports, node) {
+		ret = clk_prepare_enable(port->clk);
+		if (ret)
+			return ret;
 		mxc_gpio_save_regs(port);
 		clk_disable_unprepare(port->clk);
 	}
@@ -625,6 +681,7 @@ static void mxc_gpio_syscore_resume(void)
 			return;
 		}
 		mxc_gpio_restore_regs(port);
+		clk_disable_unprepare(port->clk);
 	}
 }

--
2.34.1

