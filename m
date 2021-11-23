Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACA945AC50
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbhKWTcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:41 -0500
Received: from mail-dm3nam07on2043.outbound.protection.outlook.com ([40.107.95.43]:48896
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237373AbhKWTc3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYdo+fppqN/3ILfWoQH4KzccTt8PDZWuU3a9zso+a3ueET90Eo/ZBStmCae+yuxUImIb8r0h/Q4pUiBFeO+TKEp+bbo7CnYVEwkzhbVhNVzSHfpbvF+lg3uSjPrTYGtRtIp6ZxDk+eU8VOqlm+qdGQH01wwNUjksPPEdTiYrQjFBBDgtcQ6am9HUlxFOi0rEJKigDnHh/yh4OKv+5uy+Q41lLNd/04W1bQi0YCL7aeSBVCqx9bOTWfhYZTVICL9wnq8iRhlXXy0j55+mY1hHONJZvDNs2SEblBnFj1diZndgTOwcWzC8ODpQ+nhHwoa3UC6JVsCLRThwmiD9nr1P2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okD9zOYxnxlUYXRjM8gSxWSaxnNz5TvQNCr9zlsXOOw=;
 b=gFQLpXFGRSCOahM5CvXyBBGiQjRFibV7FEDvhkAl9k3mlhOFBQox985nT5AcdXZzMF0xk4Qj9Fmu3uQPgo7XDJOl+NxBqtgQ9jlDhFWPmWdApBcXGVJd4hLVxzt1+20XuWR2W9417I1Fag6f1Yftg7ZTM8OGxyBFE+T/TYQvq1ldob0AQbVCjL+tgOW0bvWqyCRSHZSqHi9WVi/MB5FlmG7rcHYp8bL8QQXkgzM/tn10GRvmqOAi1BTbJYzpgqHZdYe9Oi42Zm1JzbHWUdUo9ydg5OgxwEXOLFEHVWvppLN1xbpo3qWGq5fDPO7pF8LiB8qP+YqppXaGeYINsOXeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okD9zOYxnxlUYXRjM8gSxWSaxnNz5TvQNCr9zlsXOOw=;
 b=KdkAuShiMEyiQvebIuA/1vWSGYIt2MFtkZD2Jpy4fbssc3A5x70ZK+TdHrmjpzANKZGycPwdUoGA3WSJ9a+zLnPjIvzmLbDE/Zl1GPAdqZwk1i49tmSz5/I8SpIclpaGJpF0JCkcrJJhQ3lapuO57H+BNSK0lScPRnwdjfBjG7tF65F9wd/aGG1lKsBoAclmg2+aPhWXzC7IZluvynFpoDge0PvwOHnp0MeXUdim3cCDUCaglAcVkEEgGYcDhNHSD8WxxWpvcvH2dR+YSyqtVGYKTy7zdSWEBaNPtNuyptP0CWwRaydh+ksMbDxYGc9/3AUOgDy15YGKz89JBw50Tw==
Received: from MW4PR04CA0186.namprd04.prod.outlook.com (2603:10b6:303:86::11)
 by SN6PR12MB4768.namprd12.prod.outlook.com (2603:10b6:805:e8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 19:29:18 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::20) by MW4PR04CA0186.outlook.office365.com
 (2603:10b6:303:86::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:18 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 11:29:16 -0800
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:16 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 05/12] hte: Add Tegra194 IRQ HTE test driver
Date:   Tue, 23 Nov 2021 11:30:32 -0800
Message-ID: <20211123193039.25154-6-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6aaf4b0-e66c-4a3f-5c74-08d9aeb78ae6
X-MS-TrafficTypeDiagnostic: SN6PR12MB4768:
X-Microsoft-Antispam-PRVS: <SN6PR12MB476880FA4179C1072B1721AAAE609@SN6PR12MB4768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3chKX7xYD+NayHH54ssVjwEAt7FaRNYP4giCHwrioP1ws74j5EadVpmNDomSsms5HNaIzLImlS/Dih5/gs8fVL7q0Ks1Le7npFzFd+UqhQzHGFJEjNDeh87SSIYO9ijFew5V0qrNah8fu1bpN/w8ZOz9BmF4Wok4w56Kw/k+rvrskSBYKDWFx7EFYhPXMGw4r3Cg6t8HTtqvKWxLFOwZ/d19pGxoLltxzE1Im0b56GKY0YT7Hw+CJdYph6chN3DjSh3Ggcfcu7HCjGyIAaxUfafep4NGVPDtHuApu7XZMH7jfyCSnH7ov+uJLEdE/SZxxFN0DknM304SgXJtMkRU6qD56QJPWilaem0e/vOaakRfsTgW6VEoUrTSk+Zr173uQLEYzH5ZJQW1BcDRHiYB01fNrpvTb7U/ExKyi9O6lf2qKT1ZUlYDz21j1Sm939FuakjGTxIqbfumlEbx4OAwCWK3xoaa/mD0jE5X6KIIfKhQprWu6uXr96mo4yPJ6QZ8o/8ECpoOvYYoOuR1u2O/vWGulXfvAzoImAOJ1xNQWI1kPwcUm55v19OYxtAw1n+OspgOE2Htluxx+sCSq5Mgi1rnh2MbUSH6bdD2lFcrvcF5sygECwqbj/xO0h0nGwYuBB20aM9Bq/G5vP/ikIWy1U29v5vtMvmGs2R+uE7G5dBU3BoTPjjkToZntWg9VBu4G7ULZNVFLc6cVDStGOYov4FigDvYEDip6wYS4YC72H8ennxZ8jkOJolgwLizXdFjY+bwJeoqpEPsyQfWCkt82g==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(356005)(7636003)(2906002)(6666004)(107886003)(83380400001)(26005)(82310400004)(2616005)(36756003)(47076005)(426003)(7696005)(186003)(7416002)(70586007)(110136005)(86362001)(8676002)(316002)(1076003)(8936002)(921005)(36860700001)(336012)(70206006)(4326008)(5660300002)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:18.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6aaf4b0-e66c-4a3f-5c74-08d9aeb78ae6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4768
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 has IRQ HTE provider which can timestamp IRQ lines in realtime
, this test driver implements consumer side which tests such provider
through HTE subsystem. During its probe, it registers sysfs interface
to easily navigate from userspace as below.

All the files are at /sys/kernel/tegra_hte_irq_test/.

- en_dis - Write only, Value 1 enables HTE line, 0 disables it

Its devicetree detail can be accessed from
Documentation/hte/tegra194-hte.rst.

This driver can be compiled as loadable module and is tested on Jetson
AGX platform using 0x19 IRQ line which belongs to i2c controller
3160000.i2c.

i2cdetect -y 1 from the userspace on this platform should be enough to
generate LIC I2C IRQ. The HTE should be able to generate
timestamps in realtime for each interrupts.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/hte/Kconfig                 |   7 ++
 drivers/hte/Makefile                |   1 +
 drivers/hte/hte-tegra194-irq-test.c | 169 ++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/hte/hte-tegra194-irq-test.c

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index ebd9817651c2..dee8b7a2b980 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -31,4 +31,11 @@ config HTE_TEGRA194
 	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
 	  lines for timestamping in realtime.
 
+config HTE_TEGRA194_IRQ_TEST
+        tristate "NVIDIA Tegra194 HTE LIC IRQ Test"
+        depends on HTE_TEGRA194
+        help
+	  The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
+	  usage for the LIC IRQ hardware timestamp.
+
 endif
diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
index 3ae7c4029991..75b7932c2ffc 100644
--- a/drivers/hte/Makefile
+++ b/drivers/hte/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_HTE)		+= hte.o
 obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
+obj-$(CONFIG_HTE_TEGRA194_IRQ_TEST) += hte-tegra194-irq-test.o
 
diff --git a/drivers/hte/hte-tegra194-irq-test.c b/drivers/hte/hte-tegra194-irq-test.c
new file mode 100644
index 000000000000..e43991321172
--- /dev/null
+++ b/drivers/hte/hte-tegra194-irq-test.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 NVIDIA Corporation
+ *
+ * Author: Dipen Patel <dipenp@nvidia.com>
+ */
+
+#include <linux/version.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/interrupt.h>
+#include <linux/hte.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+
+/*
+ * Tegra194 On chip HTE (hardware timestamping engine) also known as GTE
+ * (generic timestamping engine) can monitor LIC (Legacy interrupt controller)
+ * IRQ lines for the event and timestamp accordingly in realtime. Follow
+ * technical reference manual for the IRQ numbers and descriptions.
+ *
+ * This sample HTE IRQ test driver demonstrating HTE API usage by enabling
+ * lic irq line in HTE to monitor and timestamp.
+ */
+
+static struct tegra_hte_test {
+	struct hte_ts_desc desc;
+	struct kobject *kobj;
+	struct device *pdev;
+} hte;
+
+static hte_return_t process_hw_ts(struct hte_ts_data *ts, void *p)
+{
+	char *edge;
+	(void)p;
+
+	if (!ts)
+		return HTE_CB_ERROR;
+
+	switch (ts->dir) {
+	case HTE_FALLING_EDGE_TS:
+		edge = "falling";
+		break;
+	case HTE_RISING_EDGE_TS:
+		edge = "rising";
+		break;
+	default:
+		edge = "unknown";
+		break;
+	}
+
+	dev_info(hte.pdev, "IRQ HW timestamp(%llu): %llu, edge: %s\n",
+		 ts->seq, ts->tsc, edge);
+
+	return HTE_CB_HANDLED;
+}
+
+/*
+ * Sysfs attribute to request/release HTE IRQ line.
+ */
+static ssize_t store_en_dis(struct kobject *kobj,
+			    struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	int ret = count;
+	unsigned long val = 0;
+	struct hte_clk_info ci;
+	(void)kobj;
+	(void)attr;
+
+	if (kstrtoul(buf, 10, &val) < 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (val == 1) {
+		ret = devm_of_hte_request_ts(hte.pdev, &hte.desc,
+					     process_hw_ts, NULL, NULL);
+		if (ret)
+			goto error;
+
+		hte_get_clk_src_info(&hte.desc, &ci);
+		dev_info(hte.pdev, "clk rate:%llu, clk type: %d\n",
+			 ci.hz, ci.type);
+	} else if (val == 0) {
+		ret = hte_release_ts(&hte.desc);
+		if (ret)
+			goto error;
+	}
+
+	ret = count;
+
+error:
+	return ret;
+}
+
+struct kobj_attribute en_dis_attr =
+		__ATTR(en_dis, 0220, NULL, store_en_dis);
+
+static struct attribute *attrs[] = {
+	&en_dis_attr.attr,
+	NULL,
+};
+
+static struct attribute_group tegra_hte_test_attr_group = {
+	.attrs = attrs,
+};
+
+static int tegra_hte_test_sysfs_create(void)
+{
+	int ret;
+
+	/* Creates /sys/kernel/tegra_hte_irq_test */
+	hte.kobj = kobject_create_and_add("tegra_hte_irq_test", kernel_kobj);
+	if (!hte.kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(hte.kobj, &tegra_hte_test_attr_group);
+	if (ret)
+		kobject_put(hte.kobj);
+
+	return ret;
+}
+
+static const struct of_device_id tegra_hte_irq_test_of_match[] = {
+	{ .compatible = "nvidia,tegra194-hte-irq-test"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_hte_irq_test_of_match);
+
+static int tegra_hte_test_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	dev_set_drvdata(&pdev->dev, &hte);
+	hte.pdev = &pdev->dev;
+
+	ret = tegra_hte_test_sysfs_create();
+	if (ret != 0) {
+		dev_err(hte.pdev, "sysfs creation failed\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static int tegra_hte_test_remove(struct platform_device *pdev)
+{
+	(void)pdev;
+
+	kobject_put(hte.kobj);
+
+	return 0;
+}
+
+static struct platform_driver tegra_hte_irq_test_driver = {
+	.probe = tegra_hte_test_probe,
+	.remove = tegra_hte_test_remove,
+	.driver = {
+		.name = "tegra_hte_irq_test",
+		.of_match_table = tegra_hte_irq_test_of_match,
+	},
+};
+module_platform_driver(tegra_hte_irq_test_driver);
+
+MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

