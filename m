Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDA445AC7A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbhKWTdY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:33:24 -0500
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com ([40.107.94.71]:30208
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239811AbhKWTcg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5qC1vIcxOIzmPkxpi9q9IEZafwyDyBIDL91wjF90diDyiS6WY1F8FA8JfLqbnOvNIk1+G//ba1MEMsKaTTn7m1PCFB25gIBWtIVLO8kJB/U9qbtBHYDVGjajj73ESquNz9OVwiMBWP6gI+CXD9crhEDbDmcVr9gvGN678LaNwYzQu8q4lYTL3kTCLLd5HOd6V7z/Jv9iPSHSN92UKxC9r5uT+DWE0xS4h4xsJ4Z9dFM4U2GVkJPDxcgAFteVojiVEd3iU5WgZ/szq2jEoPgetz3lwmw1egdS9lhKWB2yfJPsHCrpFEsFMJtRtFi827YY41+6MgsMfaFtf3juHum4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQtOpeXODXK28GWLKVQPSwvzBz364Qcu6kkQ3+PP6nQ=;
 b=OoBIXYjkGbE28DEAcQWFNFNg3330+mcdgwJ5FQBHrRsTFz2Uv3XQ2WUvBl5Ws0+OIlEB31vjmOXK+ayS37/qXzCaNbLWTrNF5H4KPXycyzZuy8+dSpB8ANnBCghba3t1BYToJPsgNc0/Wi3DAS9YCGC7XZsGkRHPPUsOVFoYkWcGq8+0dzyYJ4hRav7h4IcMyQB5AgfR8ZtIhp1X9WypiSFj6eTSI7EfdKWakBE0s0ih3p6ConcXTQCZFoP5TtUUNMelVEYBTwkHK+FVVtUO2EM6QdgoKnb8n7FRlU3hDi5S4h9prVlu3syvvDU8f5wPtxnZ7kAPj4dSTMOmNbAyWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQtOpeXODXK28GWLKVQPSwvzBz364Qcu6kkQ3+PP6nQ=;
 b=AXYmFWjGfFbSzLYO2PmTgY5Zu3Uh3PZ4MGsn6ZzULkoT2l1xWA11M0QDCO9ckjzCnCDAKn3AgG2zPB/ojG1YW37iwUjDzzmpH04JLy/OtG03kg2zNbWmL+CLixaUikzfq4fGxJ5ffBVpvlGQRnOZDgps5dG2zniq0hLaPWwmrlLRjDFxUg80AmdloHYeNhcDhPgD6mCBsuVUmItyTqzt+2HJf3JC62z36wOCeoTbLUJO9y4HVxyFJZPWM5qvPb0nZtC6SUNzKkV8bmCU8aZSDYVj1DB3cgCTRYXe77YerGHJ8yZwHEVrYCENzh/koqhu4OQe+DKanGX01Rh6TH4fWg==
Received: from MWHPR10CA0013.namprd10.prod.outlook.com (2603:10b6:301::23) by
 DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19; Tue, 23 Nov 2021 19:29:23 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:0:cafe::6a) by MWHPR10CA0013.outlook.office365.com
 (2603:10b6:301::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:23 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:22 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 19:29:22 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:22 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 11/12] hte: Add tegra GPIO HTE test driver
Date:   Tue, 23 Nov 2021 11:30:38 -0800
Message-ID: <20211123193039.25154-12-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f77b0188-b06e-4898-acf0-08d9aeb78e05
X-MS-TrafficTypeDiagnostic: DM4PR12MB5391:
X-Microsoft-Antispam-PRVS: <DM4PR12MB53918A4EE6584E02B510F4C1AE609@DM4PR12MB5391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frQyREbMFt5xAe8MeeISDx80NvNTllQO4WHwAlU2KUZduxRKjbuPI1awjXEdBhUPq7spUlubxBx2MUd9S+x/ozxVCeGBuQ3eW2EFR843cyiC44XYczefPcD9gZt8i+ytlMCVn0ATaA0E26ZArng0v/Q6PBI52vWHZiHWY9NwVDR4PxdVFzIseWcT9Br17iY8b47o+KvN6P6lzPG0RtbqC4m2KmX0rWnbLE2gTOdOu7bQRiMK3s8VhBGlTEbiHk5fX+346biqqMluirqwT/iu5k6714D5TqF8tiNgTNRg3zXZ9Oq+pcpfmcPMK2ybMGhWoO/Yjlrdyumt39GJTPOgUje3Oma+pRRs5jB+MdVCnWW8VtfwIDS2BDVK2NuVvx0tLT/aFmYprcxdPEw4uA3FHRtLzpjd2Ei+ZOEv8Y9x2WwTs6JVwBVsdQDMc5JWtaOv8poGSsBf5Jw4JVP3DZUnm2spLPkGZw1nEfF5uzGHD/uBIEqfovqEt9i9JcaCNotGU7Njmkj2VekCyZr+bka/uykRJutCvQfM4fcKx9PlyDfZt3D3Q0pKZh3VFnC/yDc3CAq1agOTOGaHTHSap7/1egoZDMJ2U+A8xNfGMjQYW4cVeGCyCx+Oh+jgz0Yk3KOCU4+dZkVoAa388M+dk+ZIRv60Nc1DDVxQGeNR3BtemrRNgtc3dggJayi8DotOs7316WQE46uSLGudK0XiS2HGSgsKsV3cEOfLX77mIQqDcDv9prLwtWwDliHo94u4dd1DWSOnd1WhypOkmkLYuX3CuA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(2906002)(7696005)(5660300002)(7636003)(8936002)(26005)(2616005)(6666004)(7416002)(36860700001)(336012)(426003)(110136005)(508600001)(356005)(47076005)(316002)(86362001)(921005)(70206006)(186003)(107886003)(70586007)(1076003)(82310400004)(36756003)(4326008)(83380400001)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:23.3551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77b0188-b06e-4898-acf0-08d9aeb78e05
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
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
Changes in v3:
- Addressed grammatical errors.

 drivers/hte/Kconfig                  |   9 +
 drivers/hte/Makefile                 |   1 +
 drivers/hte/hte-tegra194-gpio-test.c | 252 +++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 drivers/hte/hte-tegra194-gpio-test.c

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index dee8b7a2b980..f20f38ae172b 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -38,4 +38,13 @@ config HTE_TEGRA194_IRQ_TEST
 	  The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
 	  usage for the LIC IRQ hardware timestamp.
 
+config HTE_TEGRA194_GPIO_TEST
+        tristate "NVIDIA Tegra194 HTE GPIO Test"
+        depends on HTE_TEGRA194
+        help
+	  The NVIDIA Tegra194 GTE GPIO test driver demonstrates how to use the HTE
+	  subsystem indirectly through gpiolib API calls for GPIO lines for the
+	  hardware-assisted timestamping.
+
 endif
+
diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
index 75b7932c2ffc..1d12f3a36709 100644
--- a/drivers/hte/Makefile
+++ b/drivers/hte/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_HTE)		+= hte.o
 obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
 obj-$(CONFIG_HTE_TEGRA194_IRQ_TEST) += hte-tegra194-irq-test.o
+obj-$(CONFIG_HTE_TEGRA194_GPIO_TEST) += hte-tegra194-gpio-test.o
 
diff --git a/drivers/hte/hte-tegra194-gpio-test.c b/drivers/hte/hte-tegra194-gpio-test.c
new file mode 100644
index 000000000000..418f7df7b1b8
--- /dev/null
+++ b/drivers/hte/hte-tegra194-gpio-test.c
@@ -0,0 +1,252 @@
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
+ * Also the gpio_in is configured to be a rising edge interrupt.
+ *
+ * Note: gpio_out and gpio_in need to be shorted externally in order for this
+ * test driver to work for the GPIO monitoring. The test driver has been
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
+	struct kobject *kobj;
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
+	if (ts->dir >= HTE_DIR_NOSUPP)
+		edge = "rising";
+
+	pr_info("GPIO HW timestamp(%llu): %llu, edge: %s\n", ts->seq, ts->tsc,
+		(ts->dir < HTE_DIR_NOSUPP) ? ((ts->dir == HTE_FALLING_EDGE_TS) ?
+					      "falling" : "rising") : edge);
+
+	return HTE_CB_HANDLED;
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
+	(void)kobj;
+	(void)attr;
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
+		ret = gpiod_req_hw_timestamp_ns(hte.gpio_in, process_hw_ts,
+						NULL, NULL);
+		if (ret)
+			goto error;
+
+		hte.is_ts_en = true;
+	} else if (val == 0) {
+		if (!hte.is_ts_en) {
+			ret = -EINVAL;
+			goto error;
+		}
+		ret = gpiod_rel_hw_timestamp_ns(hte.gpio_in);
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
+	(void)t;
+
+	gpiod_set_value(hte.gpio_out, !gpiod_get_value(hte.gpio_out));
+	mod_timer(&hte.timer, jiffies + msecs_to_jiffies(8000));
+}
+
+static irqreturn_t tegra_hte_test_gpio_isr(int irq, void *data)
+{
+	(void)irq;
+	(void)data;
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
+		pr_err("failed request gpio out\n");
+		return -EINVAL;
+	}
+
+	ret = gpio_request(gpio_in, "gte_test_gpio_in");
+	if (ret) {
+		pr_err("failed request gpio in\n");
+		ret = -EINVAL;
+		goto free_gpio_out;
+	}
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
+	free_irq(hte.gpio_in_irq, &hte);
+	gpio_free(gpio_in);
+	gpio_free(gpio_out);
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

