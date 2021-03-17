Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC3F33F4D8
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhCQQAA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 12:00:00 -0400
Received: from mail-eopbgr40106.outbound.protection.outlook.com ([40.107.4.106]:1795
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232031AbhCQP7t (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Mar 2021 11:59:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbzhuQPxCP1M8hBLS4BIGRHL+JBchvoTzqIdhbHg5+N46oCjlomy6KtaFceTMKrKQ06BqD4j+5MeAupVvdgI36/RY3J5NlGZ0/Tw7VjGhtTChxKiJIEw4Vl058S4q2Sxc1/YEWO4eMLrFxA7zIzFDJFuv83aWSZ8CF0ZGkDDMKxxjN6kcDPCLSQjixcVArD1Mo8GPxv5UjmD/Bur38IYpn4wD1CeBSQBL0yInPbivzuchqvRfshbsdlAX5+p7R6sJvO4Q56AECh2PwOe3AWm1TeOms3KwZbrnZPbG7g5p3BOX8bUvOtTqC2RT7kBKVoE/dfDyOL0UJ7PMUQg91QDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4QkgTT+YoXuLnl3ujgVCE9utNOgpVzfH8kQkXDG/LI=;
 b=U2UmV9JZ41QtJ+dr8VCIf7r/NqEvEvLQuXpHxCLe7w/4Jn+D+dpBWtvFDjkvaipT5XDUIxy1BCWuKi21VY6+EUyvx54MHFwq+LQwQLipwb+geL+C+bfWet8BWU6IudhKvOclPRya2kh5w8umrnVKqDtYoYEyoAAda87A77+XXsb4ilH+q6LrufMmroYkgO6w3Hy7cN03qidVtrLkniOMVWfLaMZynn37C82kHwNhsRJgU4ssmni8YPCQpnasy87aGML8ozeJJi1AIvXqvr0nyG8qgFR7OB62WhTeqPzGZyWxH0GBFa9+5HFB0RM2bL51YkdXeOaIRd9ficQrAleCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4QkgTT+YoXuLnl3ujgVCE9utNOgpVzfH8kQkXDG/LI=;
 b=qpGmjDU4BsEidvb3GwbgpYADHZtMdQqzKR5kR1yaWyx4yMjn5pj2wUqTO8uGI86gZHJUBt47aN8UQdPINGnKwf/tnN/CXeSMRUkL3P0E2TQlSqGJa+1xR5fPf+hkzvBiY1O/UzSzQpva4sPFBGf5Aw/rDFMe/pKZApX9DnCwWJ4=
Received: from DB7PR05CA0037.eurprd05.prod.outlook.com (2603:10a6:10:2e::14)
 by AM7PR07MB6328.eurprd07.prod.outlook.com (2603:10a6:20b:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.13; Wed, 17 Mar
 2021 15:59:31 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::28) by DB7PR05CA0037.outlook.office365.com
 (2603:10a6:10:2e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 15:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 17 Mar 2021 15:59:31 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net [10.151.74.146])
        by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 12HFxRUS016614;
        Wed, 17 Mar 2021 15:59:29 GMT
From:   Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To:     linux-gpio@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: pl061: Support implementations without GPIOINTR line
Date:   Wed, 17 Mar 2021 16:59:18 +0100
Message-Id: <20210317155919.41450-2-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad334787-3866-4264-7d01-08d8e95da6fb
X-MS-TrafficTypeDiagnostic: AM7PR07MB6328:
X-Microsoft-Antispam-PRVS: <AM7PR07MB6328DC09938C69D3D8476DC6886A9@AM7PR07MB6328.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koWhWXOp988YefkuMkfB3wB3A7QUW2qHaJkqm+DTvo/k8pf6CUOxriYwo22h5o5VBEcUD2xZEx/Sao85qeH4J1qLQvJYLxcAe7IlsEmvZhcj/D8FK9AUx3WYNEm56dUCAizXeBfFD7Vt19rOsAq1NNHUjgZGk9rDUyMJYWgy935GQqVocLrfgVqj4luVDqulz9a/qXc69MKezip0cKO1n9IvXs91ouw4Kg6xC5K8qD+GcJQXZM1VZ8HVug1nzuBaguPI7kYdtRa18QLkjgTB/ODAvy8HvxMUB/l2RXb7PTmKt8P9Bery2lXgHsXY7Jjy/WObzfa6Wqx/Wj3GIHIOn52aW+ndItbHL4Nd+SyLvq/uhWTtjJ8/PFM58jnN0pR7bol3Chqxlyk+6Xl/dsir0Mxf3TSGcxqWPgGVQcm/zd10DR1OiNMb663DXYrlR+uSCIg6GUT59DqJ8q6tdtERFA7mCldJPpWO3zSNynGblf4vVajwOYdT30ls9A6L3r/DsSKwShmXVSffZ3qEI1ya4FINF4cYsktz+x4XgHm5HE7vmAdIf1Sww+LQueWGRvXSBccQuAQDfQ/Za/IIDAoReCCixcS+v+uCcjA8YrMwShxoNeEjKODQACnnHnUj4GRlyN0TEbW4YqTjMlAyY+IpD4DYTx6WJyU59mCDhiu+tmQaafacLYKIhxD4G1krNYnFzfMmIkQkLXOpV/Sq+9bvb1tDIkqR0qsb6NsIhFt0IMPlpv5ZJra5XubRIUq7C7ZQ7KRHToEWWVtOten6kbVweA==
X-Forefront-Antispam-Report: CIP:131.228.2.8;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(8936002)(86362001)(70586007)(6916009)(5660300002)(2906002)(83380400001)(81166007)(36756003)(70206006)(54906003)(2616005)(26005)(316002)(356005)(186003)(336012)(82310400003)(4326008)(1076003)(6666004)(82740400003)(478600001)(36860700001)(966005)(8676002)(47076005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:59:31.4715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad334787-3866-4264-7d01-08d8e95da6fb
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.8];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6328
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
 drivers/gpio/Kconfig      |  1 +
 drivers/gpio/gpio-pl061.c | 46 +++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b8013cf..6601758 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -426,6 +426,7 @@ config GPIO_PL061
 	depends on ARM_AMBA
 	select IRQ_DOMAIN
 	select GPIOLIB_IRQCHIP
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device
 
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 3439120..3c70386 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -282,6 +282,23 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
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
 static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
@@ -332,16 +349,31 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 
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
+	}
+
 	ret = devm_gpiochip_add_data(dev, &pl061->gc, pl061);
 	if (ret)
 		return ret;
-- 
2.4.6

