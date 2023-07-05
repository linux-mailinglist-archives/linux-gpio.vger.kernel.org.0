Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDAC674882B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 17:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjGEPhh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jul 2023 11:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjGEPhg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 11:37:36 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2076.outbound.protection.outlook.com [40.107.105.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06C210F5
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 08:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UG8lBvSxyoBdKrgN61VMLjcJQLcjm4CS95q4GvuOk0fkRHLA1RnOERiK31x8JEjOY2EusaKc/wCjT4lQkUkLUoHvWIx7pXfe5rpDGLNddY3QJ5a5vmkLcHgAlv8SfxPmZXzgiUJJ01R5ixCjEA8rh65qEmBNRh3R0gHYlNvs7zJuMiA8xACUDRh2Fr7SbWm6bz7vl5sKFastIj/wwP6oieX2fBZxRUig18HtcafpyFnAHcQOz7jnXxNMaJ5LBtIv81Wjq6mVHyJrPU5xm9pgsJ9QosBxniFlfqU4abArL6fp64P/2DMDTbGLlwthZR3Y+yNNRCbVpmBNNByewYxEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivQvsCgfomFR041TKy7q6XjJSMtcBWkviEN1LJIoqaw=;
 b=AtMwYWMbp4/WFK88mmUkPSm0ny9C9B7Yw7jSg153Nb2mxSXplx5ble91dlMPuqK0RAcNbFqq5pmmNDDg8zdqriVVqyYo7w4zH5um/TVyVNS6Av63ZjKAJMMcPlt/0++htVk1U9Z+YYn8RQ5bp7cxBqFlLxVMOGy7+mdKFrzBhU7tyu2DsD6TpvpAx58c9NvTUqMT9robG7NhvhYiCKns2HlncKJCsvrLUAjyucfFJ99J8LpOg0HFWfpYEeBIPiJW7GsOHtVofl/C8X9k3oFL9erDzeseTQFugpb+S7cdne+MjEJ9evlrkKDj2C2Jo71LWbSTTYHSTxwo1maK2e8B2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivQvsCgfomFR041TKy7q6XjJSMtcBWkviEN1LJIoqaw=;
 b=NvAHHOKk50IXN15SA/DO9bSeBGNCPBL9EWFBp5pYdmrlxSTcCAq87vPQsGHWcJbSeab2hNpsCllcp1J0ACc6F797jcRq8a/lqY3Z9esbpkKhlbpMzHnoisGyvqQf5pDgMAYaUneVk/dy1lsf1eOqrnyAG3uE26xaI8hdKaH9ZTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 15:37:31 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 15:37:31 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2] gpio: mxc: add runtime pm support
Date:   Wed,  5 Jul 2023 10:37:13 -0500
Message-Id: <20230705153713.2511647-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AS8PR04MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f541d9c-2067-43ed-ec61-08db7d6dbf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vZoakd6Q34fBf0IDXWRNVMVuizQSUUP+wWLRG1kuQIg1/1zwHsuNZWGhS/usCd+M4JjvRBZrDIWwA9d3TWPfa5b05EMcMnSN3K5Qwi+2v4Rsel5qTlklVUKUTPa99f9KeQB62mJl8dERhVDLaqW5qVY5QXdCpefMw0vJ/6Yh1ftA4E4jrdZFQqVS5LwnvLs2zfENDj+AYBKErYmx2P0mZ8CaJAWoyyQpIKMRgebAp9e3DFmTQeK8bTYk+PrC3A7nEwfVaqmOLf7cc3TnL26pMyabbB8UurQESK82/kLkbkbAV73K1NXY9dpizYHNMED3U9tCJb6m6hRUYRAQfRjixKPV4gjMssipN+FEAeVjrAnmNTbcv8o/2//FQS8CXg5d96pzryX1STRGMHlXKZbazHLKM7G62qSnlL3EcS05miOqJm0t66hNPDyL9aTh3nhyxmFcFw0Ru6StwOTMx3gNvEMZ845Tdiq9tr6+ozYLqjcg9/IaWZBWsRLBiA4QKgawS9wWKQ976r3Y4ge8ak4S/YebH8QMqyl6tdYZqplyiMX5ucBpRSO2GG7RcN/O5LfeF7hWBfPj3PRF1TcWEwAGVHusJWSCN4oWe/2pewGB/2ZX43aoSCJbJ5ueCPKn5Yz+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(316002)(41300700001)(6512007)(6486002)(52116002)(26005)(55236004)(83380400001)(186003)(2616005)(1076003)(6506007)(478600001)(110136005)(38350700002)(6666004)(38100700002)(44832011)(66556008)(66946007)(66476007)(4326008)(5660300002)(2906002)(86362001)(36756003)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IFm6Vzm+rybM4QsLkpWNEePrebJID7/FCWCvwnkgCqlqJibd1fsrxt3Htd8k?=
 =?us-ascii?Q?bujLRfUpFhP/HIgheLjeqqx0IY3LPfVFLr+dOGe+nNT8DP1N/b8am/DDrmyh?=
 =?us-ascii?Q?bvOUYZJktSxSD5CmH3rpTbRHcqPR1h8LHb5GkJG+VcD6HIXVnZdkbqZqxmOI?=
 =?us-ascii?Q?y9B+I73FsM9ZBCjsBbKMeXHoJmD5rGb0949/u2R04z/mmfIVX4NvEi246WLE?=
 =?us-ascii?Q?BhpKb74wVqKxYu2uG/wtvBQw6TfU3q93kJvf4Tf2vlJ1RuquYqcaYbnKFAI8?=
 =?us-ascii?Q?uYsZb5sTJQDdHGtEtRFonywb/iC/2lmo2/o5J6QJt7BhLgPFdO0DafaW/HMn?=
 =?us-ascii?Q?jM2cDOgweTYgqFpF82l5XEpox8UeO4s32JPbFiQVlrlIxsUodfL2+IozgV5O?=
 =?us-ascii?Q?FIiT1iSynPykoh11WnNd1uYqgL4UDuQVIV4eKZuFA8Kcy3a4v5od9Jmb4Sgo?=
 =?us-ascii?Q?4GwgLdMHSZCmldUdIUDgd8YfTtPGSlvZWrv68GdXL3bCeayx/7uVjIuYIGPz?=
 =?us-ascii?Q?dg7RweQnr+CZ56aejrMNd3DukdVQ6r5F2sPYH1+KWBseJLPD9EW2Pu2DHMyM?=
 =?us-ascii?Q?3elzwwbYi2Q+yuRo/MsudUrEozd7Fzybo4SVD1JZc8Z0jB0Ia9d+gyfjuvvM?=
 =?us-ascii?Q?morhDEmDEnqncAsP3lxaZm6OsAabcxD4Ulo5Q9nrhKuU51turrkEfomjRnSq?=
 =?us-ascii?Q?ZVoRIEx/LczRlcglQqEMUYRuQ64s4WZDnhvWfNmvKbQQ71tl+UI+fwHrf20X?=
 =?us-ascii?Q?Ujw0Hv+s1KRmZjVmjNkc0HMSFIX+FZR0RFMI2mcmRYF36IFgID+WycLIxdqi?=
 =?us-ascii?Q?6UF9p3DZv141Fysn4Pq+9/C6V/6EWEX/0ekNRU+/CxVpCwhaY6l5ezu+2SAf?=
 =?us-ascii?Q?hiMFiOIsQG+f1W7cxDdvNYFunsMjaNP2YK/boG1IuAwJq6hVSIDGFav2FeRl?=
 =?us-ascii?Q?mAHUMvLVZWEE1Q61wdTPerxaTWkel6pavzbxFN2E8ZXaLZ6Fq9shAEA5FZRH?=
 =?us-ascii?Q?5GbdeIdtEUEsNqJ3W7/8mlMrUXhhi2iVdqWe2SzLZOnVKo0C8u81sZExKV0c?=
 =?us-ascii?Q?gZOnTd0fNVJd4EnV+R3md10NnoQcCDKt7ccO1qOmTwhA0F5HuaeLVfB6V4HT?=
 =?us-ascii?Q?fr2dfBMMKWCvdZrtW2L3v242d4g+zK98epGt2ECDMwt5hUcb1uDVY8rN6IRs?=
 =?us-ascii?Q?dh2a/jwB/cpHqwUKGsG/8BLgafnWZSs+gmsh7iu8IfMm6AoKYq5rKK/QEZ1J?=
 =?us-ascii?Q?cMuV2KG/BF3ePBr8B6OXlnz2dpBoSeZOlFk4sO+8uthTgQOh4XKKD4+PAmE0?=
 =?us-ascii?Q?8oQ42bCyXZGefgAE8volmUkjXsath8L4442R/DIUog4NkW5QX1sPD3wb0ODc?=
 =?us-ascii?Q?3OHpXF+QF3FeIGndsenjps0XHRjQDXFWp/cKXzchznki+2rMinoxMZouLiH3?=
 =?us-ascii?Q?RXBDl8FMmXIk6jvLen5arwuoXHr5l8xY4uxIJjl4gFESbFAItOrpu8pKKpC5?=
 =?us-ascii?Q?raA06lCQOeekJlnAvggaVVkU2MYgs3PXi/1IkEtDbBzbJBjCVssuE6wh0lB3?=
 =?us-ascii?Q?6eOSj4CZNN8HOb62k0IZzWZ/JmQT6REEAxkFkCc8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f541d9c-2067-43ed-ec61-08db7d6dbf1f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 15:37:31.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hI3OH+SSDHnP6jHWv8SWbc0Da+ofMMxYkfB2teb6fhsjkjbYPqtP5LEnkmNHmNV5Q0/EsZwLA7loTf7vH6ytBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adds runtime PM support and allow the GPIO controller to enter
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
v2:
  - improved the patch comments
  - using pm_runtime_resume_and_get to avoid reference count disbalance
    when errors
  - removed the __maybe_unused identifier

 drivers/gpio/gpio-mxc.c | 64 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d0cec4b82a3..db9947342975 100644
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
@@ -429,6 +447,12 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
 		port->power_off = true;

+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err < 0)
+		goto out_pm_dis;
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -459,8 +483,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;

-	port->gc.request = gpiochip_generic_request;
-	port->gc.free = gpiochip_generic_free;
+	port->gc.request = mxc_gpio_request;
+	port->gc.free = mxc_gpio_free;
 	port->gc.to_irq = mxc_gpio_to_irq;
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
@@ -482,6 +506,8 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		goto out_bgio;
 	}

+	irq_domain_set_pm_device(port->domain, &pdev->dev);
+
 	/* gpio-mxc can be a generic irq chip */
 	err = mxc_gpio_init_gc(port, irq_base);
 	if (err < 0)
@@ -490,9 +516,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
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
@@ -572,6 +602,30 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool enable)
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
@@ -597,14 +651,19 @@ static int __maybe_unused mxc_gpio_noirq_resume(struct device *dev)

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
@@ -625,6 +684,7 @@ static void mxc_gpio_syscore_resume(void)
 			return;
 		}
 		mxc_gpio_restore_regs(port);
+		clk_disable_unprepare(port->clk);
 	}
 }

--
2.34.1

