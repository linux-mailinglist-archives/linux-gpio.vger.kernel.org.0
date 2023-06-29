Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23BFE742D60
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 21:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjF2TUo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 15:20:44 -0400
Received: from mail-dbaeur03on2065.outbound.protection.outlook.com ([40.107.104.65]:62528
        "EHLO EUR03-DBA-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231979AbjF2TTq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jun 2023 15:19:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6LZVkxOM5xAEGtiLqg+rIWlrLPvu9O0JTB8bV4WYYLNHVlhDdq2jLjIWhd2neAMO3rIiXLJB5nTmgxra2RZ/sWWLh7/rKbnPRI1eBLDM9urhzGU+r8CG9uBrDuvGvbSU65RpvrhmomKWHQtjSor5q2agiXqQsbSQNptcYUQmuqTpPeIhp8muuyLb768I57/zE+knSOTkmhsqUchnoyW0CIKAs6A0VzlWQOF9Xwr/82Y5o+V6/W1I9kSakr+cIWSWewcBS0nTSUAS7LR3/5Wz8plvRPpOgwBsRlF07t6nyNDFaXrPENa8N9nLrYPWKDzl4S+t9OKACO4Z5IzbGUMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Klq7k9HmBJ4kgVyRdT2pq73RBcNxjSL+wjyeI8Kpj7Q=;
 b=PRO4E1Qtxgs+2GygHM5sKcLFWOoVX7gGhGVewEcFYg3ivEUI5R1m38bHgrieyrEU2IZdiPj4rDTrd3YwvFeOELIMwPdg5A6bBlQIxAWNZsE6TFz/ZylQcACPzyy67qBqAYSVHTB4yXMOX53j5C7dlsl7BFBhe5EiNLHwHOWr87TV7hH7xwx1XGCK0pDKMqTgQV0JI9/webwepMAriKQeYCVTYJK0l8NR3ICmGkANsZLHu+IgjUQFKwkqaQIjhn2pOoOOqNzzw9aQCHAU8cnxbz45zz8fME+ggbdUFz8Azz0GbgFiSWLYeICUK1DP5s3AVVSPYWcbAH9NT3PSF5zsKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Klq7k9HmBJ4kgVyRdT2pq73RBcNxjSL+wjyeI8Kpj7Q=;
 b=jsMkqFPYQt/WwBs+1rCSbGzh8xmG8srJIziucf+Mf1VkminJT74nC4sjVDQ2NIvH0OB0kDZ9eljf7u+KTiK6RKfCGH473C+T/AG/nuzQnV7KtPSWP8/fq1rmI26nqPaeReJpUSFxGSwXhhE4aeFj76izKHChyo0XidE3c1Zy+fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 19:19:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38%7]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 19:19:42 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] gpio: mxc: add runtime pm support
Date:   Thu, 29 Jun 2023 14:19:03 -0500
Message-Id: <20230629191903.2423243-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::6) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB9565:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b46f04-4020-4f15-a3b1-08db78d5ca87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5E4zxvRRbJ6ISKd6D098y/c4Lvsh+X3qDc1NbhJPBmAEKzQyC63XxOn8ouZsjT44yy+KL6A4sYIwLTa2LxzT6dC3NYBc3i1ZdwBy/lY27TzkZwDQaADVKbPJoXkmwaUxjMNpa3VPPCg9QU/6XH3SFODjGI/8ijN1KOSfkWHnnjooEWhS9ILUxg+YZk2JZHHjfcJT66ozraOlk9RHL7RYb8pTch5u7jS9AeQ9hzCOrM9t4CyV/XXG9LKRD+icPTqBSh8cubII2aizfv5QS6tkS/M7aXvHdXZdlaYPTncO1nWDis61iCXdW1HulK7j3DtSxHog8tswborotYjhP6r7NqBblzm32p59eDO767uypk3BaX3N+m9LB/E6wCU+PVPtWk37drOCE60nIuxeupyXreQeV44ShiGZg0EKb/wOobov0WGglnzw08Flzzm1x77qcXojRaddG+BKNPmubLLla45pIKdIPlgGfRjKMDXFZCMbl+ZODT7vqswErLVRILqzYT0uSkiet8g5qIj90w302eYyCep+NoSi7YRbQ9kwggwBWx9joU/tW78VoH97+Zn01cbFHt/2q1VnrwXAgEToopcMpFQLuu3gboEO92Zyi9ph4ecDUmBqQG39XtqA3K5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(6666004)(6486002)(52116002)(478600001)(66476007)(66556008)(5660300002)(4326008)(8676002)(8936002)(66946007)(2616005)(36756003)(110136005)(54906003)(86362001)(186003)(55236004)(6506007)(26005)(83380400001)(6512007)(1076003)(316002)(41300700001)(2906002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0zpadS7ReZcbrOTrn5oDud7Zz1Qs3pggrqs8PctdfnGK74KtHx6Z8vzFLWG?=
 =?us-ascii?Q?Wjp1kKbsm6lhH4lAKVqi5vyqyxIfDMTImrjGKh8K59o7/jujBDqndyhVfGTw?=
 =?us-ascii?Q?S9/G2u8S4koQP1UN/z6u5IBs5eRsYlHZ4AHHnW1QmNnkpyyz5UKM8/EUdWvp?=
 =?us-ascii?Q?rHTjHY3wOyVICDAGPoRt+smt0dGSJmwflxQU0txdwjlw5QKbLsWRPt+g3V+d?=
 =?us-ascii?Q?S1FW4XBAGHOcy6DbPPRERswGnBaM80Qp7ciNaxx1AHLxRTcFD7jXOBTaImWd?=
 =?us-ascii?Q?5S7zhPAQUHrRn9G9rYcmD9HHw7yQIHuMtyRtQYECJTCQwsDtBqZPJk4uMmym?=
 =?us-ascii?Q?nNgL9KQMMBrnKyODzobxijsvf+wWllpcVRSIX0G6RkHB+x/aOC+DlNHs4uk+?=
 =?us-ascii?Q?7UaQ87VXyrA8rZcKPwbqSEQzWTWfi+t+2nlExdQXPd4BjCT5fprbUZolnkFR?=
 =?us-ascii?Q?jRAb7BhK2IlfqsPPIIH1H6IM1yMiuscn9P+X3ta8aY/lMHcdYbQFAbPFn12S?=
 =?us-ascii?Q?XEhglrFmqql9c/qFZZV0JGF3yf/4SzAPIlE/NLj4XaRU+VbNFlWDnYwO2kLD?=
 =?us-ascii?Q?9WM72mrFBczsEQJPMUF/0T0TS4t8uf6odu2JJlDC5NFOZP8w2Mut2rzaFzLM?=
 =?us-ascii?Q?2FzZvOdTtlE758qzcc975jK7JsutQCfCPk+9ThOSbPgrYFm8brJCQolA5WeW?=
 =?us-ascii?Q?dwUm7z5HU56jDJ8h8mWiJNu0gHyqpKozehvwZGi2LpvGa6QZFPUHCssvSS4L?=
 =?us-ascii?Q?bE3TsjtfxCsYTUhBdgSd5Hq3TIosc7TvPjD4v3g0FQvlYOinRRFzrJIb5U39?=
 =?us-ascii?Q?6F38H3mlX1vuiagKiCb2wdHHDZknJmQtIFW4cjZwP9jT4S5N5VS/fQLXMBGY?=
 =?us-ascii?Q?xq8UR8llxKjI2P5J/YVO5Kdy1zmQkb0ghmqzxSpxixW7hbZg/7A0u0fw2fNY?=
 =?us-ascii?Q?7SG/QA+jlJpqWySEp1/XYCxPFeWMsnoXH6GLJVGVdHWw5oF4CdtNin8HmhVa?=
 =?us-ascii?Q?zKOj5OIOXxVoiTPeK33h/9N9xl7F25FIUSatt/6V1LZPlc6d0o8izDMaPhLL?=
 =?us-ascii?Q?AQiPzJx8xIZl8raSyM+rnS31+z8BJfKkV5jmt5elPIe03P8i3ZWJ8VNTPaIu?=
 =?us-ascii?Q?O2bc68jJ9Ra6uzz8GSGNrlzDvrMp/7FyQR5gNfNNWYnmPdA7AYZlyjb8DvAE?=
 =?us-ascii?Q?JEmGkj6pI2PUkbMyvd3KF53RBcsklTz1B61y4V+v83ITn8WaSBlTtrREhakK?=
 =?us-ascii?Q?KYDvVV3V/fZv6MtA5I5Kl+SkjTlATh5b+R2gibyiDxqiegBKk8ieFNCKiJ8B?=
 =?us-ascii?Q?NFrrV52Tc4lOfmeABNTVpoj2scAoMY03kRhkmb3BQHIUHk2B6i93W0wTqyL4?=
 =?us-ascii?Q?4cBZQMqdDvMGvsTXaLeNes6lRu0ksKRDE4YvP5rv6WlpzDfaT2TF7dUDOjeU?=
 =?us-ascii?Q?oPA6JBZfonSzbdN2/GJRYJhnd4z/6qNSRpaTdP8TEV+FDNT73t92QOJ/L/w3?=
 =?us-ascii?Q?/kADX4JLfsGkp7CkVrhuycUEc795cyRkDWwkTvQKGYJNUGbPz+AhFoHkyJg9?=
 =?us-ascii?Q?4+/BH9yONFac1OpnNBeLktS0WMWU9iv+OBwwoTGY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b46f04-4020-4f15-a3b1-08db78d5ca87
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 19:19:42.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8yJcElxuDkWv8s3yGauKezgOCT0K18Hx6DewpJgV9YjaNLu0F5MHl/c6/74tt209341kPUkJlxeZbpxFAQ9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9565
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds runtime PM support and allow the GPIO controller to enter
into runtime suspend automatically when not in use to save power.
However, it will automatically resume and enable clocks when a
GPIO or IRQ is requested.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 67 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d0cec4b82a3..10387655a903 100644
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
@@ -382,6 +383,24 @@ static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
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
+	ret = pm_runtime_get_sync(chip->parent);
+	return ret < 0 ? ret : 0;
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
@@ -429,6 +448,12 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
 		port->power_off = true;
 
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_get_sync(&pdev->dev);
+	if (err < 0)
+		goto out_pm_dis;
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -459,8 +484,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
-	port->gc.request = gpiochip_generic_request;
-	port->gc.free = gpiochip_generic_free;
+	port->gc.request = mxc_gpio_request;
+	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
@@ -482,6 +507,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}
 
+	irq_domain_set_pm_device(port->domain, &pdev->dev);
+
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
@@ -490,9 +517,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	list_add_tail(&port->node, &mxc_gpio_ports);
 
 	platform_set_drvdata(pdev, port);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 
+out_pm_dis:
+	pm_runtime_disable(&pdev->dev);
+	clk_disable_unprepare(port->clk);
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
@@ -572,6 +603,32 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
 	return ret;
 }
 
+static int __maybe_unused mxc_gpio_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
+
+	mxc_gpio_save_regs(port);
+	clk_disable_unprepare(port->clk);
+
+	return 0;
+}
+
+static int __maybe_unused mxc_gpio_runtime_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct mxc_gpio_port *port = platform_get_drvdata(pdev);
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
@@ -597,14 +654,19 @@ static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)
 
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
@@ -625,6 +687,7 @@ static void mxc_gpio_syscore_resume(void)
 			return;
 		}
 		mxc_gpio_restore_regs(port);
+		clk_disable_unprepare(port->clk);
 	}
 }
 
-- 
2.34.1

