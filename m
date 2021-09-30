Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD341E4ED
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350784AbhI3X2l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:41 -0400
Received: from mail-dm3nam07on2079.outbound.protection.outlook.com ([40.107.95.79]:23292
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350264AbhI3X23 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1+N5ugJRIBFnAX8zS65hiUyqRXihLGxyhli+r4kRyjQjk9rRo23EyitmsFXyYIJI3EXD4PhaoCOYDU9OxRPr0BccQH8+I7W2RF6Cb3CpcvsziQ/j+UAbG3S/zmd0pvBfSlv8ZNtGAFwfK5artq2XhfMWmiR8X7NrmFxX4M6JUv4siUbjxyc2HtVfZa98AuXvsghoHzqc7zwQugBvsLRWbaBE9YMp/wAqGNDR1Ogr+0MLe/7iyyZ/vPG04U16TdTFvlqlEilfCWrlp1Cuy/k0pKSr2xwrd4R/18m2gPur38ugUvRtfpP7L3j6577Gyvs/LkHfJwzvsErqVgRZyo6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcUgAH0f21cbk9JyHznfA+emfZVaMgVs4GjCJRxHvuo=;
 b=bWyf2s3cynaIiPLaBe22N9WbYH78n5ZDGXXIKw2XbBZ0X0Igz/BRDAUXtwHxwex8ApPFIjXg7zaKOU1dRAJJqTAMTGe14wmxHmYg+db5EKIv+tQnaFd218GQSvl47YW0+BSzCXNtcrs2fAowCVTf+kyMRtXJywkDQm+5du3vDdgzYj2+cTW21MFI3P+sNHXcJifqRUwvI9t72rH2FZ5I6jr8ghXw5MQNHkDJjPDUEfMO9GeM1k3KLfL2sHUXsQZv6sVkEkdTmL2gU8xUSZP18D5Am0wjvngf5LyZT1Bop6KrgvAPSqO2zg9EiTXervRVtaWxDgNQSx5J9NFkXORzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcUgAH0f21cbk9JyHznfA+emfZVaMgVs4GjCJRxHvuo=;
 b=ZkZzhw7GMLUcnSE6nLdAV59XXsFC50/1ue0rfdBoaQjRTpNirUF90nvoNqmuZ1HdXLFlcmhgs9SpryzbAPVZPklo2u19TpY39QiML8z07KYAQjsrgo6sI1sLKEj73GEcYxuuIQtG6TSpeJ4czyEK/ACN9RT3eThFzj5XqugoTVkZPVSn6WQ2ry0/cQSZhgRktn/LchYE5RJtAm4NADVYA7L0I+KQa08I6H1KFsLJJ39Hk9Gm2gmJQsP7sDh3e20C64H3FU7E75YFvyVhi4krBLtAGqbMX9KpSFG0QzB+ZpCXlFp6+Xep6ql+HAWjf0EAMtE6kYNSsl1hjkVXBEO8NA==
Received: from BN8PR07CA0014.namprd07.prod.outlook.com (2603:10b6:408:ac::27)
 by DM6PR12MB3994.namprd12.prod.outlook.com (2603:10b6:5:1cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 23:26:43 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::29) by BN8PR07CA0014.outlook.office365.com
 (2603:10b6:408:ac::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:42 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:41 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:40 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:41 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 10/11] hte: Add tegra GPIO HTE test driver
Date:   Thu, 30 Sep 2021 16:26:16 -0700
Message-ID: <20210930232617.6396-11-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33368663-0b32-46ef-20fc-08d98469c329
X-MS-TrafficTypeDiagnostic: DM6PR12MB3994:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3994051E10824FCB5E4D0381AEAA9@DM6PR12MB3994.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bwOi+1lG4G6at+SyEteUrjJj0sud3SafVynMbdubUhjx0haDaurf+2wTecQu+GTj/hHQUuCKRnCj4mpPjVawGZdZmgFWuIq/x05+zNgzewmw+JR6tAzgotCss540sajqHGaLuozCvYsi6mHxwFKanL6FKiIqzPPGpX06yExKTFYOSdnEYSijjdhq6GQONSzRTN0/8ROkrXEQ1DxJRWd5jnCSwl0kYxRKpZnArCDZYWnQYNHsOgcQjjtj0cjJ+aUrETFmEptppqVNNIfkR6EXiUP+TROOqP11R3pTZmFO1N170ojzC/w7t/68W6kYcTYh+OTyg//l0QEVPbhyGopIaPe5E242SRlM4/InCns/RbRSLvdBk9W1sJQDvm90t1u93u5DFwVd008bIbFFqlajKpczbdtVo8l91u0yhxLBHsuf3sJB2bEqs52KHdDSXh0xG9Xd00jgYaSYd6zMYtPack5Zh2huzZ0etToe0gl9tBVnPSbueQOnBY0XaHsem7owfpKOFs/w/LGRv2MHEhcWyIK0RX0XtDwU+s3g/TbPwXkoB8Ov/TjxV0UVk3d1eMNWnrqfOjFHvpVB6ciVVEf9l+y3wjYur02uRsx7z1pt5IxAWC0fN/XhQ1wGjdNNNuhgJ86xh/didg7rUlHIwAwFkKOR56FiYwwS4UjgMF5TTH7NcTl1TzkLVRJriJh9K+Dk8qborH1pHwMOzBLNoX4XBgcBskxrwY6OCJRKAWzAmNPDljWMR07vnUrYedm50BZL4+YxOxtEmoUiU8vLL8ltSQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(336012)(316002)(921005)(70586007)(8676002)(4326008)(107886003)(2616005)(70206006)(426003)(8936002)(36756003)(508600001)(82310400003)(356005)(110136005)(186003)(7696005)(2906002)(83380400001)(36860700001)(47076005)(5660300002)(86362001)(26005)(7636003)(7416002)(1076003)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:42.8601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33368663-0b32-46ef-20fc-08d98469c329
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3994
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
 drivers/hte/Kconfig                  |   9 +
 drivers/hte/Makefile                 |   1 +
 drivers/hte/hte-tegra194-gpio-test.c | 252 +++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 drivers/hte/hte-tegra194-gpio-test.c

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index eb339526f141..57c97034d187 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -38,4 +38,13 @@ config HTE_TEGRA194_IRQ_TEST
 	  The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
 	  usage for the LIC IRQ hardware timestamp.
 
+config HTE_TEGRA194_GPIO_TEST
+        tristate "NVIDIA Tegra194 HTE GPIO Test"
+        depends on HTE_TEGRA194
+        help
+	  The NVIDIA Tegra194 GTE GPIO test driver demonstrates how to use HTE
+	  subsystem indirectly through gpiolib API calls for GPIO line for the
+	  hardware assisted timestamping.
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

