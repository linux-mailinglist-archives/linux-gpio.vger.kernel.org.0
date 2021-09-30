Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A7F41E4D8
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350610AbhI3X2h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:37 -0400
Received: from mail-sn1anam02on2049.outbound.protection.outlook.com ([40.107.96.49]:60105
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350124AbhI3X2Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3AH1hJcXWW8H5v46EsVdUSmIdnwswTEHh8Z4gG/+vnVV/Qvnh1AmvLnVcYLvzhyPmpxCFPP0GhPOsBFhiIP+IGHQFuYqQ2SY58xh8VzAMxEmZe/FPnMbig90vzOG2Vqf2inNBZz9O/om8fouXhezBuUKf3mhdDdi+DSOyIu2GH5CQuvoiUaV0IttHymJlDJV93iGqNQv8NENU7usAziMH++n5Otuegs8QLVOHgy0v43skt8eXovtnSUnl5B5ALvCEJz7ZluoViKbouYkzwuaHoG1AdHd9OmkDdAZVQOHpIozBocf9Ma0us01Rxt7TkBwkwio5EiYdkRWUbAe+52JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8ONeYEZwu7oMHAnpono4GUYkjRRIByFNsWyWHGDCZ0=;
 b=U9zXG+luTStH/rDpFY5QU6QwzVr9J8H2da+FochNOLIqkDFido//5UeqsWzYHnAbKV6wNxNXLxK/PRsZCLm0ktjL5/jAf+MmEe/u+eXDYADHqVZzLsLo3OnTJn8aPOWHha9HlXM0QxB2U1WgBW1hyGC6j5LpXXM/Bj+fFm19vypHT89hai83Zj86VMTqXLP7CPpy54AbY55dW2QaH7gSi8DAB8CUNLdV1f9B+cUhRzLI7TnXb946f87XkWzdGRKnEA4L1vBavRtyuKoYc297LXdT/5wWGEO0KhxZ6rnfDJAdb6HXJ0xu7+pJOAunTUOSFdi/0PvCt2jlYOYcjKfG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8ONeYEZwu7oMHAnpono4GUYkjRRIByFNsWyWHGDCZ0=;
 b=Vh5eXhhPeP+jTttCuAO7Ty/1oz8EZTTxK32fwKnMYwF/5nxLA5pAxf7XlrGnXhhx51KiIM028wLkNodGTxWtuY8f4dBM9xIc6b6WCd0MK2LWAlpSyHUM07wHebUvjlK70SDHP3vDu4xkeb+ogPQRdVetE3vGS1+5X1+K73EzqM6PqOlcYloQuw+bOX/oQ1B3y/dMKeORCfA4S2nc6td1OAiS6VOLEXyG0blqaTJh4zwkP6farBYkOpt64FPeiA6JBj+rY8B5nSBpqNTc+UCO0tVhJh+3BBFaP2gmSTO4mifK/lodH+/nIB16cU1o8e1uqIlySYfVfv92J5AyTf948Q==
Received: from DM5PR16CA0031.namprd16.prod.outlook.com (2603:10b6:4:15::17) by
 BYAPR12MB4760.namprd12.prod.outlook.com (2603:10b6:a03:9c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15; Thu, 30 Sep 2021 23:26:38 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::6b) by DM5PR16CA0031.outlook.office365.com
 (2603:10b6:4:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:37 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:37 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:36 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 05/11] hte: Add Tegra194 IRQ HTE test driver
Date:   Thu, 30 Sep 2021 16:26:11 -0700
Message-ID: <20210930232617.6396-6-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d6c5fa-e32b-44a6-0b00-08d98469bffa
X-MS-TrafficTypeDiagnostic: BYAPR12MB4760:
X-Microsoft-Antispam-PRVS: <BYAPR12MB4760A0C57468FB66267F3FE4AEAA9@BYAPR12MB4760.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8GFvzmVeYYYmtECaTM5u6UwakIeu5Hjk9RjrbXOooE30TpusMem+c4GgBrHzVROg5DGtjZqiI1OmBzaomwx2cYVwmzunevyFDMyq4bLNO/EhYOsF/FORKLTiWYxgi5VMGN1q8HVsQOBSJkKUAdjcsTH2rYYkgyCRaho5Dg2x5kv5RNtNwFUOvqzBwKu0XZl9No5CZKl++zdtMtWcChprxjqD3gaCu/DdvUL4/rHpqWhcnJDVQGRnMhR3i2OpgPpefnrmXUfDuBR39aD6ovUptFq+G4Rn1iCU0X5MfeZcxKhT6QfRfyx6kYV5uUOayB05fyAZR7gk/na0DEhvBdmd91D5xUHxWR4hty3xp/CqONFL/aulkGRmqMA+UktI1N5ncb225BSnt+wSo9YN+eXsP8FdGHd7QIHRZnu6K2YFFKP9b464NKAXICwtOG8VuGbZ0GKfrpTL9VckQYpmA2DRDP22ebP/fehV90itm7rUC6YLeGalyPcaja51IXHYoQ3VtDDMAMdp+UJ6N19/tbZ9QJi2CeVWJSca12dpLLMGaN/em9dceD4yfO5KaR8Ju+ndgJUn6OM6wnOMbTSTK2KtFkXl3m961stsebY698Jets5JGG8+cCRBGFslSQQq8B+az/AA44R8DJ2lfVwBEdkNQ9XJGY0i4rHgyIDVjnz8zAL1PNglRRfGm/r2LUFcXfDP2pQaiiWZEvRgXNV+tT8BilxrRxlgplZNeuuRRINto/Lol0vdbWjXVw+G3IJ2efpyRfG3k2At2Wc9lzdWwB6TQ==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(186003)(2616005)(316002)(26005)(7416002)(6666004)(110136005)(356005)(508600001)(7636003)(921005)(5660300002)(426003)(8676002)(47076005)(8936002)(83380400001)(82310400003)(36860700001)(7696005)(1076003)(336012)(2906002)(36756003)(107886003)(70206006)(4326008)(70586007)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:37.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d6c5fa-e32b-44a6-0b00-08d98469bffa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4760
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
index bf375a5a8f8e..eb339526f141 100644
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

