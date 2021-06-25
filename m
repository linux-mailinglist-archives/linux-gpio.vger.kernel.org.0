Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080DF3B4B4C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFYXvD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:51:03 -0400
Received: from mail-bn1nam07on2057.outbound.protection.outlook.com ([40.107.212.57]:29019
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229974AbhFYXum (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx5fyBi8Bj1Ltz1E7pMTSuDJpPuwYTj95q3gH2vHA+uAr9BkQEZvPUYzwjQUzHhzcRvDeyFLyerRF+lifCUhCCB3FbWsQdvS9BL4R9UjiPt15FpmDRDPzsw+b5/0LkMZcB1b5ynlqUcIOLTZ0nqsnYSLxxrbjFr1l4JWYD8czCOSysjkpp6+01syF800NHntcvuMa0xFX+rCvn5X750TdMphGcieScr1hdI0/+OvQK2o6DTthCpJmLMYNbPDeD7ZMX0jOw2NdwMr6DsLYHZztk/JUUpaz14ziLK1r72llMdopKBoG0eC3G2HSzrBTX4nfmY9EtC45OfOBBU6Sa9xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTSwWPWJAJiktjvQkXngoqOZjBJ2lVEdugslJrr8BrI=;
 b=To3naBQ86sSO6KtCnTNlsmCTkBTbdUoilH+GZXxNMrlMQ12VSRve5Bar4L8Fowikq9S3hYq3OB/Atk7dfsCBTsvgP7GSlwrG7OPQ4YNmgqGbzAbykjZqOQG7PLrl/z5yo332xWVYvO7Zkf+j0mg+5HTBhSCQ0pnYlgN2a6iJ61ChUf1IDydnyVk9WIYjyUae8on50cIxmyMpkaERve+sg4bSyvTG7DjBxADif7jZGn2wXu9Rf+dZlFNM1aaYkFp4oZdh2T3wLJGyOBcmZOREfVScN09STjQzCYXQZ2uXqm0DNTNOv2MFdc0HbDstVHTJxP+iFDv0SJJd1CN7iqmPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTSwWPWJAJiktjvQkXngoqOZjBJ2lVEdugslJrr8BrI=;
 b=Jtnoty/dHAMnsFt872Bap+5MThhnZMFdsdGQ9l7SWsHBHFf3IfmQplunVStWm7lvvDiJpCZKVDdKnj3un+JFSg6gNmZHsW4z9CBzXYolqWxG2fyinIbNiqohaHRUjkRtAcbZ0YEMRsDRKDjJwnFLy6DlZ9nAITqeiHwurTpFn2DcsTFjtkwVyFTrS/QO52POVKuwwlDCPuYIgSPN2BIN+aUxWMHRX1DHh8Wkd/Cfh3EgwDeapykPk7S+09y64DOM7Jad8hBCNu8ScGhK03GfpCfkCfGIUT/o4OfONuRRQim4uVgQN/6diEg08X1r0UbYgWy8KcpG9nQdTccimrANxA==
Received: from BN0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:e6::27)
 by BN6PR12MB1220.namprd12.prod.outlook.com (2603:10b6:404:1e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Fri, 25 Jun
 2021 23:48:18 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::f7) by BN0PR03CA0022.outlook.office365.com
 (2603:10b6:408:e6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:17 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:15 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:15 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 10/11] hte: Add tegra GPIO HTE test driver
Date:   Fri, 25 Jun 2021 16:55:31 -0700
Message-ID: <20210625235532.19575-11-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 537fb7cb-ac6b-4c75-fcb1-08d93833b4eb
X-MS-TrafficTypeDiagnostic: BN6PR12MB1220:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1220886DAC1257D19A7446C0AE069@BN6PR12MB1220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+sYZOE5MpWQSce4WUAdjzdDcew+nxXZ8Yraj9RCIbx2XfsoQEWiy4lc6w+gOtTyOIMtDhOyLtKXBXq5dQ2Px8zsC/Edx8KAkpZ71L6/7grZEomyyAq8vMHEWWkfOidriEOQ/Qn83W7ZuCSqx8bqCVHE7LpBUzd66W51jhAdLwlymVQLZHDKiYjCC/5RPnQszBsApntaku5Yo4sKI/FnqBEy/1MYZiyRpg4F/OO+qWy8zBJC1V2NFCeCgUTJ4yvBYxAGBbk1RNPJfuZQS799nHFq8zW9aKdnOnTqqfarWWtcU9jNgD+ckVY1wnYMUAoZqQLxR4gAphyDQvbxdrn6B5PnNddZ2k5O/Kjgvr20sbDqn4rv8Nj81cmL/thnx2asGkRrJLA5OMKyTqyf/P1aphGhHUg21gvfRav6+bTBzuN9fXKRAen5glkx4RGnyEYVzX8qZKifLH7CrlAojSIiS1YS5kh1+J+if3hpbQr9Clmz7BRfL2aj+H0l1uP1U5iHh7PHUqAsVW1Nxi7wncRES/u2J33qD6fU0E3ymS09o9TUTvxzhniAcExfyLww3/2gbTwd3q0IWDZQTmTVHh6EJWLW2xtbDmfpXQ9eEt5iC6wdXW/fwHWOK5+anevmf8Ol8joS2r3uQoaqeCJFIImyLjnYr9L0bHGv7VZzxW8+Vcl3hqz6EKl9h4fod0vPuX7WY3cvmAIbHplZ1x42Krj1b1c281IcyLCTad4Y1wofGxhBbC0cz7Y3AyVzXkd//sFaWbZ4xKk9a+F/RERYz0+Ykg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(8676002)(7416002)(1076003)(70206006)(478600001)(5660300002)(6666004)(7696005)(186003)(110136005)(36860700001)(26005)(7636003)(70586007)(316002)(356005)(47076005)(82740400003)(86362001)(426003)(2906002)(36756003)(82310400003)(2616005)(83380400001)(336012)(921005)(8936002)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:17.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 537fb7cb-ac6b-4c75-fcb1-08d93833b4eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1220
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 GPIO controller and HTE supports AON GPIO lines for realtime
timestamp using hardware means. This in kernel gpio consumer test
driver demonstrates that functionality indirectly using HTE subsytem
through GPIOLIB framework. During probe it also registers sysfs
interface /sys/kernel/tegra_hte_gpio_test/gpio_en_dis. The value 1
enables gpio line for the HTE functionality while the value 0
disables that.

The test driver can be compiled as a module and takes optional
parameters gpio_out and gpio_in of type uint that specifies GPIO
numbers.

This patch also adds compilation support in Kconfig and Makefile.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/hte/Kconfig                  |   8 +
 drivers/hte/Makefile                 |   3 +-
 drivers/hte/hte-tegra194-gpio-test.c | 255 +++++++++++++++++++++++++++
 3 files changed, 265 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hte/hte-tegra194-gpio-test.c

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index c4d335c41254..e62077c1024c 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -38,4 +38,12 @@ config HTE_TEGRA194_IRQ_TEST
           The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
 	  usage for the LIC IRQ hardware timestamp.
 
+config HTE_TEGRA194_GPIO_TEST
+        tristate "NVIDIA Tegra194 HTE GPIO Test"
+        depends on HTE_TEGRA194
+        help
+          The NVIDIA Tegra194 GTE GPIO test driver demonstrates how to use HTE
+	  subsystem indirectly through gpiolib API calls for GPIO line for the
+	  hardware assisted timestamping.
+
 endif
diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
index b1cde6bc939b..3f2f3a3ac4d4 100644
--- a/drivers/hte/Makefile
+++ b/drivers/hte/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_HTE)		+= hte.o
 obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
-obj-$(CONFIG_HTE_TEGRA194_IRQ_TEST) += hte-tegra194-irq-test.o
\ No newline at end of file
+obj-$(CONFIG_HTE_TEGRA194_IRQ_TEST) += hte-tegra194-irq-test.o
+obj-$(CONFIG_HTE_TEGRA194_GPIO_TEST) += hte-tegra194-gpio-test.o
diff --git a/drivers/hte/hte-tegra194-gpio-test.c b/drivers/hte/hte-tegra194-gpio-test.c
new file mode 100644
index 000000000000..b2e66d5c8700
--- /dev/null
+++ b/drivers/hte/hte-tegra194-gpio-test.c
@@ -0,0 +1,255 @@
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
+#include <linux/gpio.h>
+#include <linux/timer.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+
+/*
+ * Tegra194 On chip HTE (hardware timestamping engine) also known as GTE
+ * (generic timestamping engine) can monitor subset of GPIO lines for the event
+ * and timestamp accordingly.
+ *
+ * This sample HTE GPIO test driver demonstrates HTE API usage indirectly
+ * through GPIOLIB framework. It enables hardware timestamp on gpio_in line.
+ *
+ * Note: gpio_out and gpio_in need to be shorted externally in order for this
+ * test driver to work for the GPIO monitoring. This test driver has been
+ * tested on Jetson AGX platform by shorting pin 32 and 16 on 40 pin header.
+ */
+
+static unsigned int gpio_in = 322;
+module_param(gpio_in, uint, 0660);
+
+static unsigned int gpio_out = 321;
+module_param(gpio_out, uint, 0660);
+
+static struct tegra_hte_test {
+	bool is_ts_en;
+	int gpio_in_irq;
+	struct gpio_desc *gpio_in;
+	struct gpio_desc *gpio_out;
+	struct timer_list timer;
+	struct work_struct ev_work;
+	struct kobject *kobj;
+} hte;
+
+static void hte_print_ts(struct work_struct *data)
+{
+	(void) data;
+	/*
+	 * We are called from workqueue, it is ok to block in case ts is not
+	 * yet available.
+	 */
+	pr_info("GPIO HW Timestamp: %llu\n",
+		gpiod_get_hw_timestamp(hte.gpio_in, true));
+}
+
+/*
+ * Sysfs attribute to request/release HTE gpio line
+ */
+static ssize_t store_gpio_en_dis(struct kobject *kobj,
+				 struct kobj_attribute *attr,
+				 const char *buf, size_t count)
+{
+	int ret = count;
+	unsigned long val = 0;
+
+	if (kstrtoul(buf, 10, &val) < 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (val == 1) {
+		if (hte.is_ts_en) {
+			ret = -EEXIST;
+			goto error;
+		}
+
+		ret = gpiod_hw_timestamp_control(hte.gpio_in, true);
+		if (ret)
+			goto error;
+
+		hte.is_ts_en = true;
+	} else if (val == 0) {
+		if (!hte.is_ts_en) {
+			ret = -EINVAL;
+			goto error;
+		}
+		ret = gpiod_hw_timestamp_control(hte.gpio_in, false);
+		if (ret)
+			goto error;
+
+		hte.is_ts_en = false;
+	}
+
+	ret = count;
+
+error:
+	return ret;
+}
+
+struct kobj_attribute gpio_en_dis_attr =
+		__ATTR(gpio_en_dis, 0220, NULL, store_gpio_en_dis);
+
+static struct attribute *attrs[] = {
+	&gpio_en_dis_attr.attr,
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
+	/* Creates /sys/kernel/tegra_hte_gpio_test */
+	hte.kobj = kobject_create_and_add("tegra_hte_gpio_test", kernel_kobj);
+	if (!hte.kobj)
+		return -ENOMEM;
+
+	ret = sysfs_create_group(hte.kobj, &tegra_hte_test_attr_group);
+	if (ret)
+		kobject_put(hte.kobj);
+	return ret;
+}
+
+static void gpio_timer_cb(struct timer_list *t)
+{
+	gpiod_set_value(hte.gpio_out, !gpiod_get_value(hte.gpio_out));
+	mod_timer(&hte.timer, jiffies + msecs_to_jiffies(8000));
+}
+
+static irqreturn_t tegra_hte_test_gpio_isr(int irq, void *data)
+{
+	struct tegra_hte_test *hte = data;
+	u64 ts;
+
+	ts = gpiod_get_hw_timestamp(hte->gpio_in, false);
+	if (!ts)
+		schedule_work(&hte->ev_work);
+	else
+		pr_info("GPIO HW timestamp(ISR): %llu", ts);
+
+	return IRQ_HANDLED;
+}
+
+static int __init tegra_hte_gpio_test_init(void)
+{
+	int ret = 0;
+
+	ret = gpio_request(gpio_out, "gte_test_gpio_out");
+	if (ret) {
+                pr_err("failed request gpio out\n");
+                return -EINVAL;
+        }
+
+	ret = gpio_request(gpio_in, "gte_test_gpio_in");
+	if (ret) {
+                pr_err("failed request gpio in\n");
+		ret = -EINVAL;
+		goto free_gpio_out;
+        }
+
+	hte.gpio_out = gpio_to_desc(gpio_out);
+	if (!hte.gpio_out) {
+		pr_err("failed convert gpio out to desc\n");
+		ret = -EINVAL;
+		goto free_gpio_in;
+	}
+
+	hte.gpio_in = gpio_to_desc(gpio_in);
+	if (!hte.gpio_in) {
+		pr_err("failed convert gpio in to desc\n");
+		ret = -EINVAL;
+		goto free_gpio_in;
+	}
+
+	ret = gpiod_direction_output(hte.gpio_out, 0);
+	if (ret) {
+		pr_err("failed to set output\n");
+		ret = -EINVAL;
+		goto free_gpio_in;
+	}
+
+	ret = gpiod_direction_input(hte.gpio_in);
+	if (ret) {
+		pr_err("failed to set input\n");
+		ret = -EINVAL;
+		goto free_gpio_in;
+	}
+
+	/* IRQ setup */
+	ret = gpiod_to_irq(hte.gpio_in);
+	if (ret < 0) {
+		pr_err("failed to map GPIO to IRQ: %d\n", ret);
+		ret = -ENXIO;
+		goto free_gpio_in;
+	}
+
+	hte.gpio_in_irq = ret;
+
+	ret = request_irq(ret, tegra_hte_test_gpio_isr,
+			  IRQF_TRIGGER_RISING,
+			  "tegra_hte_gpio_test_isr", &hte);
+	if (ret) {
+		pr_err("failed to acquire IRQ\n");
+		ret = -ENXIO;
+		goto free_irq;
+	}
+
+	ret = tegra_hte_test_sysfs_create();
+	if (ret != 0) {
+		pr_err("sysfs creation failed\n");
+		ret = -ENXIO;
+		goto free_irq;
+	}
+
+	timer_setup(&hte.timer, gpio_timer_cb, 0);
+
+	INIT_WORK(&hte.ev_work, hte_print_ts);
+	mod_timer(&hte.timer, jiffies + msecs_to_jiffies(5000));
+
+	return 0;
+
+free_irq:
+	free_irq(hte.gpio_in_irq, &hte);
+free_gpio_in:
+	gpio_free(gpio_in);
+free_gpio_out:
+	gpio_free(gpio_out);
+
+	return ret;
+}
+
+static void __exit tegra_hte_gpio_test_exit(void)
+{
+	int ret;
+
+	cancel_work_sync(&hte.ev_work);
+	free_irq(hte.gpio_in_irq, &hte);
+	gpio_free(gpio_in);
+	gpio_free(gpio_out);
+	ret = gpiod_hw_timestamp_control(hte.gpio_in, false);
+	if (ret)
+		pr_err("failed to disable hw control\n");
+	kobject_put(hte.kobj);
+	del_timer(&hte.timer);
+}
+
+module_init(tegra_hte_gpio_test_init);
+module_exit(tegra_hte_gpio_test_exit);
+MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

