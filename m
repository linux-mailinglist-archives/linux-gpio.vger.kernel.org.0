Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4826F340DE3
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Mar 2021 20:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhCRTLM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Mar 2021 15:11:12 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com ([40.107.20.125]:61697
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232719AbhCRTKw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Mar 2021 15:10:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZdg/T1bkM3HtlRUbpk4TMHpfxivypI7lFoueNFIsg6nz1ejZuOLyFDJozCuEOu0UbzXSdr4RpgeJrTJAYLP58t1YfJexU2NKbGDthXgPXnk9TLrbFtANqMkGVtFb2cqJ6mLxt0Ac+DH6ooUerYD6NOWTRzc+UyDOLGgwZgasPZdbRszkU7bcTsdIXOAsEucniiWxk9JFEc2rOTqvXgyZ8t9OrFxOGQKlCopZ7qGhv7mKY557/H24LWv7tu9lv5QbwG2JZLNaq+0wcQWngppkYIYulaPq9/Ff02rfdmjScR10CKOoD6aE+iL3mYa4gZABPl21xKFxMRzeLWuDePXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPQNA9LKxzOcI9j4jxaL+0JpZGs5iUwJANWh3DMongc=;
 b=ELOek8cu5UZYHBk7xMFnFyk7Q/TvooF+ZzroFg69WLyC9wK8uu7QOokq+jqdKr+R+/GO2n4cI9EiVsFK3oMbpvj06bKW+b3hLsmFZvSRC+UH6I50ayUq1ST9wFAckOeGGULerfzbDj0/9FYPO4WxdWA34s0jR6+W3DFv6fqkQMHSL26EvUdy8lI8qIXIHTuBtxUQuRaDtkXpOJzz10d4Cuzo5/4DYS6yLsrY6s6a7uCVn5WZVSd7myDU7DkA2rxLcxyiwJ4KinXt11amdKL8qFDdTIONzh1jUTnHvGKSRn3Uzcg/FeNAWBDEVno0ymANdVtNGbRjuMU/5nfylDjueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=nokia.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=nokia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPQNA9LKxzOcI9j4jxaL+0JpZGs5iUwJANWh3DMongc=;
 b=c2vn/5FaZai9NPDLlfBy/EWnLC94oc1aWzOZL5uz2giBAAUJweyruHnC7z9JEfxLUpUo2ZlUYaIf/cb4wmyA9TFjXatcpia4LaFasRQAMRYUzNv/Kla0J60BCwOwJwCGv54vR/mIHm6S/ohPwH/zvCeqPQc8fJMFWiWFkOlRIFk=
Received: from DB6PR0201CA0028.eurprd02.prod.outlook.com (2603:10a6:4:3f::38)
 by AM0PR07MB4739.eurprd07.prod.outlook.com (2603:10a6:208:72::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10; Thu, 18 Mar
 2021 19:10:50 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::5a) by DB6PR0201CA0028.outlook.office365.com
 (2603:10a6:4:3f::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 19:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.17)
 smtp.mailfrom=nokia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.17; helo=fihe3nok0735.emea.nsn-net.net;
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.17) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 19:10:50 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0735.emea.nsn-net.net (GMO) with ESMTP id 12IJAhbX002267;
        Thu, 18 Mar 2021 19:10:44 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] gpio: pl061: Support implementations without GPIOINTR line
Date:   Thu, 18 Mar 2021 20:10:40 +0100
Message-Id: <20210318191040.48575-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 701218ce-eb49-478a-0c43-08d8ea418b32
X-MS-TrafficTypeDiagnostic: AM0PR07MB4739:
X-Microsoft-Antispam-PRVS: <AM0PR07MB4739A43F2D431B1CD6C860D288699@AM0PR07MB4739.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FmsCP3srjuRoqXg2Fq4MRVYlDtN3Ur/dLI+EmDFgis9engBZ33GucZZFzmNOLVwjBlVPjXu45TSD/b5ouiISisBRfTOKBqZ90EOLQlJ9kTJUbB/o1OERwEcdiiQz3ll3XxTvoT5KO7m/3+/+yrjwaHPJczyhARigTehxd/O/yLDWTzWpzov7C687epXnaZvFq8JP2+VDYD7AU8/T5wD6Iqx2sh8qkaAhoGvCCf+Vxal6HVMwBhz9YeZo67bIS3qsRI0FZo2G9vQ3Q5C7/WPDW+Ia6f4jiHfSAlM2oEcbYQlSC3n6ZdVBbTRRvIBhNbh3tn0BultoJqgW75ZDCrIB93CbmzZ4O0ZSf/zcG4V3PpPylgSbHNTYbMzKBEtcxV/CTmsdtyaUthL/0933RfCr/odClWELBelITU1WY45m0zC+ha8kOZKh/M5wToim+d+IMo1S4Wwd43wLL4AFIesXE8rBWdpdoIST87RAdL9VYnawUqT5jC2uk8ehhCtTuLUxHNscoIVdtPmbfT7lsk+XQlQx7MZEeXU7g87Ge8p+qdXm9abkWB57UmexywlQjKXK7nHM0WXkuVAAwnTGqVS/b/CLSuxCjo5LMllvtMkcPxpI7+UDoDXUj6OJUybUHN+H7FuNOm4q+G50Cm4/PHcais5Mk7mGhLGYS3nmsXZj8K+RjP6x+vUgZI6zY8VqsJGSCahV3Y1OydvN34TCH0BYxTaBbrhITSdbxviBRrtTbUEr8QYRhfFsQcs1t0lac47l5D+gQle5SjzNLlpTgydQBw==
X-Forefront-Antispam-Report: CIP:131.228.2.17;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0735.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(46966006)(8936002)(47076005)(6666004)(4326008)(356005)(336012)(2616005)(36756003)(966005)(70206006)(6916009)(86362001)(5660300002)(36860700001)(1076003)(8676002)(186003)(82740400003)(316002)(81166007)(83380400001)(2906002)(70586007)(478600001)(54906003)(26005)(82310400003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 19:10:50.1049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 701218ce-eb49-478a-0c43-08d8ea418b32
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.17];Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4739
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
v2: Add pl061_populate_parent_fwspec()

 drivers/gpio/Kconfig      |  1 +
 drivers/gpio/gpio-pl061.c | 91 +++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 7 deletions(-)

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
index f1b53dd..e95714a 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/of_irq.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -283,6 +284,64 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
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
+void pl061_populate_parent_fwspec(struct gpio_chip *gc,
+				  struct irq_fwspec *fwspec,
+				  unsigned int parent_hwirq,
+				  unsigned int parent_type)
+{
+	struct device_node *dn = to_of_node(gc->irq.fwnode);
+	struct of_phandle_args pha;
+	int i;
+
+	fwspec->param_count = 0;
+
+	if (WARN_ON(!dn))
+		return;
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
+		return;
+
+	if (WARN_ON(of_irq_parse_one(dn, i, &pha)))
+		return;
+
+	fwspec->param_count = pha.args_count;
+	for (i = 0; i < pha.args_count; i++)
+		fwspec->param[i] = pha.args[i];
+}
+#endif
+
 static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
@@ -330,16 +389,34 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
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
+	if (!adev->irq[PL061_GPIO_NR - 1]) {
+		WARN_ON(adev->irq[1]);
+
+		girq->parent_handler = pl061_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = irq;
+	} else {
+		girq->fwnode = dev->fwnode;
+		girq->parent_domain =
+			irq_get_irq_data(adev->irq[PL061_GPIO_NR - 1])->domain;
+		girq->child_to_parent_hwirq = pl061_child_to_parent_hwirq;
+#ifdef CONFIG_OF
+		girq->populate_parent_fwspec = pl061_populate_parent_fwspec;
+#endif
+	}
+
 	ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
 	if (ret)
 		return ret;
-- 
2.10.2

