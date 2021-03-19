Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19004341DDB
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 14:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhCSNM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 09:12:26 -0400
Received: from mail-eopbgr50093.outbound.protection.outlook.com ([40.107.5.93]:37955
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230046AbhCSNMP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Mar 2021 09:12:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHgZMHANRuzN5oM/eMd0kpxIkjhReC96l8mH1tQk7Sz1Cy+60tt2TLwqspf1kMNHJcEVxD3HSMj8S8C1eNs91qZcK8O0RhJWEjlT0JP7g2AIUW1vopaAmXj1+1jcDRo5MYAuSKTcbbZGH1z2vXzluQEpi7vGCr/GxkkUiEefe2dxW1A3vx+0iAuyEarBhhwvoy9K8epy3L+MRyQrdpU7kDG8UnK46QTNCjUP0MnTMvHX9bojvhEig8flo/5odcBPWVOVH/YPUST6RjTMzO8bgkA68Pfd1JqPxBabSs17yMpVUD33ucXAO2/ku4ZojoewvzguKmMmQq3prKbeJiJXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF6b5TSmUUXG7v+KNnS/9kyYgihNqOASCZYgkLCb6xk=;
 b=SlDqjHi0VzmQ4Div3W5l1FZYyO9mumGeerUa/G9+YGTtt6OP16cOb6geGMAsUJScka6q1+K4h3k70y3meJDIYFXYwa4YbtY8KnrsjlUjr/5PL+lmOCPgso6lriGjKDmtHC3TPzPV+7u1XNdn0M1LfAfnljAxz5sot/C3lldU3dIKNwzEi2hSdd5Kzi1m1WwWg1iN8HzNeIhbdUGwsVZkXIzv212cJXREXJWJXGaPyFrBo54QWveFexmjR0xDauKDYElh6DK+opXQgacNRQ8yXJ2OBC5yKrJ/J6q37hPBBR4YbAtFqZKZ+88NJGoBAqRe0t+a5Y/lRJDP/t8xPmt8ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=gmail.com smtp.mailfrom=nokia.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=nokia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF6b5TSmUUXG7v+KNnS/9kyYgihNqOASCZYgkLCb6xk=;
 b=K7NiQcOQ/EwFueRDlVep6lorpWX1M8Nqony2+ra13rBnsrFMi28hDD2qo8AbxZrne3r7PMzwBMht4gStX7UnF7ABrchLR0AVztc9efN87mT9JzQJ0jqRAm8Zs2+EBRwRPLgsZmGaHH3aHbVZlvEaFd1LYG/Qd8D/PrNSGyYwFHw=
Received: from MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28) by
 AM0PR07MB5492.eurprd07.prod.outlook.com (2603:10a6:208:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10; Fri, 19 Mar 2021 13:12:13 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::6d) by MR2P264CA0040.outlook.office365.com
 (2603:10a6:500::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 13:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 13:12:12 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 12JDC9dO020060;
        Fri, 19 Mar 2021 13:12:09 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3] gpio: pl061: Support implementations without GPIOINTR line
Date:   Fri, 19 Mar 2021 14:12:05 +0100
Message-Id: <20210319131205.62775-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f41d4217-12f9-4068-ba02-08d8ead89c46
X-MS-TrafficTypeDiagnostic: AM0PR07MB5492:
X-Microsoft-Antispam-PRVS: <AM0PR07MB54920E101C71B01F0530D15188689@AM0PR07MB5492.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G14NCAm/Q3HprSz0CEUsgG40IJ7ffO4s02HwK2kW/U6wOOs/D2Y8tyGv1kgw1z6+JLDcScSJn47o076oAIVbkAoNrI1i0Qxn5t1GexC/N0aqYsq1fa75a9UjsPnAy6vaGQogQfXBqv44UNNO/F6Lt4dUa/wk0ynraFf6scql2vPDJBNvhViK7mNVqY/H6WQH+HaVnKIfv2aS91w8JiU3Fsgc9BQJwdVE6v4H7uPmFnlDG07jGBo4KBNBlfX889zy3lopLKzPw71mQplECoybsq9SucxcdDUQV6H/dnVdhN1INLPRSHisK8kMdtn19nW88xXQykh85BpVbXhr5Kxmz81Nfl5BOWK5uqBtrdPqQqi+0nPKdN75SyE46glcTauRudLY7Eq3qJT0UoV5LP1FTEcrKtELh9GJY9miPBJXeG/EjXZn9fpXorHChXzdmfzOIg+s/yLusGNwO2UoctgqMa4e1El01+kfczuP97LlP+vzhR19n4YSAzxGp6dFX/DWBGmfd72gn7UTum3MxcC7diglpKaNhAmyTmQY13ipjGOjgQA8wP1iFfy1appytWjZtMS0AgoQncKTB4SfiSsIE/CEVzQpWqFsFfMvQUHQqiYLcGp5yrIc+7/xM5mEnJgSziNNYX2pUFsjo3r3oHUtQQsj2zs1iCtnysUXe8W5SnUEuYi60g7IDBBJVvsEQHDV+K0tJCPCf+Ef6xuJBsl+tUSaGWnh5sY5wO8+r7n44W36yl9R9MRVEdn7gT+DX/x84XhFeyx8jSnj3sYq2pgUUg==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(36840700001)(46966006)(36860700001)(6666004)(36756003)(2906002)(2616005)(8676002)(47076005)(54906003)(86362001)(966005)(478600001)(82310400003)(6916009)(70206006)(316002)(26005)(82740400003)(1076003)(70586007)(83380400001)(81166007)(4326008)(356005)(186003)(5660300002)(336012)(8936002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:12:12.7632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41d4217-12f9-4068-ba02-08d8ead89c46
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5492
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

There are several implementations of PL061 which lack GPIOINTR signal in
hardware and only have individual GPIOMIS[7:0] interrupts. Use the
hierarchical interrupt support of the gpiolib in these cases (if at least 8
IRQs are configured for the PL061).

One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, PL061 instances have
8 IRQs defined, but current driver supports only the first one, so only one
pin would work as IRQ trigger.

Link: https://lore.kernel.org/linux-gpio/CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
Changelog:
v3: pl061_populate_parent_fwspec() -> pl061_populate_parent_alloc_arg()
v2: Add pl061_populate_parent_fwspec()

 drivers/gpio/Kconfig      |  1 +
 drivers/gpio/gpio-pl061.c | 97 +++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec..456c0a5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -469,6 +469,7 @@ config GPIO_PL061
 	depends on ARM_AMBA
 	select IRQ_DOMAIN
 	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device
 
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index f1b53dd..5bfb5f6 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/of_irq.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -283,6 +284,69 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
 	return irq_set_irq_wake(pl061->parent_irq, state);
 }
 
+static int pl061_child_to_parent_hwirq(struct gpio_chip *gc, unsigned int child,
+				       unsigned int child_type,
+				       unsigned int *parent,
+				       unsigned int *parent_type)
+{
+	struct amba_device *adev = to_amba_device(gc->parent);
+	unsigned int irq = adev->irq[child];
+	struct irq_data *d = irq_get_irq_data(irq);
+
+	if (!d)
+		return -EINVAL;
+
+	*parent_type = irqd_get_trigger_type(d);
+	*parent = irqd_to_hwirq(d);
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static void *pl061_populate_parent_alloc_arg(struct gpio_chip *gc,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type)
+{
+	struct device_node *dn = to_of_node(gc->irq.fwnode);
+	struct of_phandle_args pha;
+	struct irq_fwspec *fwspec;
+	int i;
+
+	if (WARN_ON(!dn))
+		return NULL;
+
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	/*
+	 * This brute-force here is because of the fact PL061 is often paired
+	 * with GIC-v3, which has 3-cell IRQ specifier (SPI/PPI selection), and
+	 * unexpected range shifts in hwirq mapping (SPI IRQs are shifted by
+	 * 32). So this is about reversing of gic_irq_domain_translate().
+	 */
+	for (i = 0; i < PL061_GPIO_NR; i++) {
+		unsigned int p, pt;
+
+		if (pl061_child_to_parent_hwirq(gc, i, parent_type, &p, &pt))
+			continue;
+		if (p == parent_hwirq)
+			break;
+	}
+	if (WARN_ON(i == PL061_GPIO_NR))
+		return NULL;
+
+	if (WARN_ON(of_irq_parse_one(dn, i, &pha)))
+		return NULL;
+
+	fwspec->fwnode = gc->irq.parent_domain->fwnode;
+	fwspec->param_count = pha.args_count;
+	for (i = 0; i < pha.args_count; i++)
+		fwspec->param[i] = pha.args[i];
+
+	return fwspec;
+}
+#endif
+
 static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
@@ -330,16 +394,35 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
 	girq = &pl061->gc.irq;
 	girq->chip = &pl061->irq_chip;
-	girq->parent_handler = pl061_irq_handler;
-	girq->num_parents = 1;
-	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
-				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
-	girq->parents[0] = irq;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 
+	/*
+	 * There are some PL061 implementations which lack GPIOINTR in hardware
+	 * and only have individual GPIOMIS[7:0] signals. We distinguish them by
+	 * the number of IRQs assigned to the AMBA device.
+	 */
+	if (adev->irq[PL061_GPIO_NR - 1]) {
+		girq->fwnode = dev->fwnode;
+		girq->parent_domain =
+			irq_get_irq_data(adev->irq[PL061_GPIO_NR - 1])->domain;
+		girq->child_to_parent_hwirq = pl061_child_to_parent_hwirq;
+#ifdef CONFIG_OF
+		girq->populate_parent_alloc_arg =
+			pl061_populate_parent_alloc_arg;
+#endif
+	} else {
+		WARN_ON(adev->irq[1]);
+
+		girq->parent_handler = pl061_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = irq;
+	}
+
 	ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
 	if (ret)
 		return ret;
-- 
2.10.2

