Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDC13B4B30
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhFYXuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:37 -0400
Received: from mail-dm3nam07on2086.outbound.protection.outlook.com ([40.107.95.86]:5633
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230006AbhFYXuf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXFVEv3y6Mogmmz6QNdWTnVNyC85fK6HeZFcWGdmvVHSillaIjN2fmm5kQsPjGBNUgkb8wmex3imD9e+m9uHWIvYPdsBDDCngcvipsyQTH6v9KVngLyldZNWamqzxfV0BdvZFfSqi6xal10nZfyFShoInTlPYOaPuK5wnNQr+MviC3kVSFKxCY9n0B81hsea04HkO7njfkfBSzJnnHsbzLLn9IBPFuyG6IduglF5mEElu5PrTNcOPD/K2Yq/mPQ74unPyA/dXZ+Hznnwcsww5pQOFDWd17H4JuUrA2VHWairKtRsZTyDSllffPItlgWACUfsx/pg72j045kOkGpLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+vTLa3j2mLPzL9LT8PMnb/9OEuqJN/KlHOpKUOcK2U=;
 b=cFUToL6B5eKKkVVK1kf+3lcn+cKHEdzlee9zon7PtyiYVFPvrfFnSXsjj8c7W/xqppZlq8mWkuCZN2vz1Ftn0ACQcVpymnosrmopGOqbJm+xSgRZIzHcZKRysN6l0e19P7/r4rSlHAS93ai7+bVZqhY1j0iuDceAqDgBQwDGnao+k5oqob3BvSf56VWtRmsNIa6x0p/KV/j2HVlDW0OOaHfornXh19VxOoRg+Ol0f0Ip2VnOQdvpMm27iUgmzoYV9exC/VaHvtr1lctmqKvp6kFMXLJPfOlAiOHxaTcUzfnSic3km5GMo2nWjCSax4GtmlNcpiAN991FYdQ6UBLLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+vTLa3j2mLPzL9LT8PMnb/9OEuqJN/KlHOpKUOcK2U=;
 b=UF/Gnzw+jA2eUS8Q2uySUlxdF8jaowu2UNUwBteDpcGWiRIQ0HcPaAOoLXxVyYkgRAR8RLVM2sehwnseogXNboCgiQjtkfOH/s/YjYyMCd7C6rPhfDr6p4+vjVHkCH1Heh77sPJ5qWKMw5lnGYqAzsgVoiVurJTGHDe4pXTJdVOR7GWQ9Dxx7y23HZb5E1tS1enWIDNPzWZ9Gae4i3cn5qlKgNZHcnx5AYHjGOKi2A824qEA4PFNH2LxFcWI2ygfU4gDz4TqV0WJRY5F5H06424logyvteO2Pr2PBggP8jh/Qyv+0b/ifn4KkZq+OvFkABWAtZ22LcuSuuCkWfHTuA==
Received: from BN0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:408:e6::9)
 by MN2PR12MB3037.namprd12.prod.outlook.com (2603:10b6:208:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 23:48:11 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::e1) by BN0PR03CA0004.outlook.office365.com
 (2603:10b6:408:e6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:10 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:09 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:09 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 05/11] hte: Add Tegra194 IRQ HTE test driver
Date:   Fri, 25 Jun 2021 16:55:26 -0700
Message-ID: <20210625235532.19575-6-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a72ce9f-675c-4695-538d-08d93833b0d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3037:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3037352E5735C415D1BD55C7AE069@MN2PR12MB3037.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: namCGCHJp0peKU9rlZ42PSaUdMNLewSk8sJpqCIqxiJYWQjt4AEGDY0EP+w9Ofutc0QbUVPIOWC0A6kA+LJAbt2t+rdjkXu26T/PywA30UEbgrpAdz4t+Rj0ga6yDQPg9joyRRcPhQ1VZ/3FOmT4iax+ZyUoAhlraI5grjuCklsZ252cXxy+XkMvbVhUfP/FvdT6nk/AtPjLi7WQyKC8cs2BpWTHRylK13a1hIfdKMwN8IAztRSimWggxVe9hg2q1xp9Icwj3eewldkiSSJk5dLIGe0SKqHNmV4Os0jtuKzewXKXmG8G623T6UagBU2+5OgYZhayqWvN52emR81QekYPHOcl7Z2W4krMPFM+7hK6JPYZ7+OAfxvj1KH6V3aUw1+Vj2M+zF9ro+Yz726Xq4Bq9xFGAs+yp9W0R/g1Z3okuXXGV2Mh1STQL9Tq2hdYBv1InTJ8FiUW5kztpgpwKsoTa14S7EkXYcTbz8olMCGjGqMl+AIZ9aImel+UqHN7VDxI8w2mvTdwX3G/H7kH4U/wna7XBpUkSEBmrKActp79OTfXExQ6NcDpvbxbie2T3TbQ147OWLCps72kyqRD86MM8NAgIGmQ3oGNPFPdvsZgN8+3GONTFbxaBR+AmXx+P8rbgUo23jeFumG/g1xCe9CkpPXnYbax2+xzPszLMbveUMu5PD/Erh5lXUH31zh++ClV5jM3d6DrtACjExplF2uGUae5qrCapel41dA7Q9J0EvPJ/SiiXkRNBA8ynWy54CI15MOdqGetrVe0tknmYA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(46966006)(70586007)(47076005)(86362001)(1076003)(186003)(6666004)(36860700001)(26005)(478600001)(2616005)(356005)(70206006)(8936002)(5660300002)(336012)(426003)(36756003)(7416002)(7636003)(2906002)(30864003)(921005)(8676002)(316002)(7696005)(82740400003)(83380400001)(82310400003)(110136005)(2101003)(83996005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:10.9276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a72ce9f-675c-4695-538d-08d93833b0d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3037
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tegra194 has IRQ HTE provider which can timestamp IRQ lines in realtime
, this test driver implements consumer side which tests such provider
through HTE subsystem. During its probe, it registers sysfs interface
to easily navigate from userspace as below.

All the files are at /sys/kernel/tegra_hte_irq_test/.

- en_dis - Write only, Value 1 enables HTE line, 0 disables it
- buf_len - Write/Read, sets/gets per line buffer length
- watermark - Write/Read, sets/gets software threshold/watermark

Its devicetree detail can be accessed from
Documentation/hte/tegra194-hte.rst.

This driver can be compiled as loadable module and is tested on Jetson
AGX platform using 0x19 IRQ line which belongs to one of the
i2c controller 3160000.i2c.

i2cdetect -y 1 from the userspace on this platform should be enough to
generate this IRQ at such point HTE should be able to generate
timestamps for this test consumer driver.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/hte/Kconfig                 |   7 +
 drivers/hte/Makefile                |   3 +-
 drivers/hte/hte-tegra194-irq-test.c | 400 ++++++++++++++++++++++++++++
 3 files changed, 409 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hte/hte-tegra194-irq-test.c

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index f7b01fcc7190..c4d335c41254 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -31,4 +31,11 @@ config HTE_TEGRA194
 	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
 	  lines for timestamping in realtime.
 
+config HTE_TEGRA194_IRQ_TEST
+        tristate "NVIDIA Tegra194 HTE LIC IRQ Test"
+        depends on HTE_TEGRA194
+        help
+          The NVIDIA Tegra194 GTE IRQ test driver demonstrates HTE subsystem
+	  usage for the LIC IRQ hardware timestamp.
+
 endif
diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
index 52f978cfc913..b1cde6bc939b 100644
--- a/drivers/hte/Makefile
+++ b/drivers/hte/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_HTE)		+= hte.o
-obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
\ No newline at end of file
+obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
+obj-$(CONFIG_HTE_TEGRA194_IRQ_TEST) += hte-tegra194-irq-test.o
\ No newline at end of file
diff --git a/drivers/hte/hte-tegra194-irq-test.c b/drivers/hte/hte-tegra194-irq-test.c
new file mode 100644
index 000000000000..c51eaeb3d1ea
--- /dev/null
+++ b/drivers/hte/hte-tegra194-irq-test.c
@@ -0,0 +1,400 @@
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
+/*
+ * Used to increase line buffer length to this power in case of the dropped
+ * timestamps.
+ */
+static unsigned int len_pow = 2;
+module_param(len_pow, uint, 0660);
+
+static struct tegra_hte_test {
+	size_t buf_len;
+	bool update_buf_len;
+	struct hte_ts_desc *desc;
+	struct work_struct ev_work;
+	struct kobject *kobj;
+	struct device *pdev;
+} hte;
+
+static void hte_callback(enum hte_notify n)
+{
+	if (n == HTE_TS_AVAIL) {
+		hte.update_buf_len = false;
+	} else if (n == HTE_TS_DROPPED) {
+		dev_info(hte.pdev, "Timestamp dropped\n");
+		hte.update_buf_len = true;
+	} else {
+		dev_dbg(hte.pdev, "Wrong notify value (%d)\n", n);
+		return;
+	}
+	schedule_work(&hte.ev_work);
+}
+
+static void tegra_hte_irq_get_ts(void)
+{
+	int ret, i;
+	size_t avail;
+	struct hte_ts_data *el;
+
+	avail = hte_available_ts(hte.desc);
+
+	/*
+	 * Workqueue only got scheduled from the hte_callback, it is highly
+	 * unlikely that there is no timestamp to retrieve.
+	 */
+	if (unlikely(!avail)) {
+		dev_dbg(hte.pdev, "timestamp not available\n");
+		goto error;
+	}
+
+	el = kzalloc(avail * sizeof(*el), GFP_KERNEL);
+	if (!el) {
+		dev_dbg(hte.pdev, "Can not allocate %lu bytes memory\n",
+			avail * sizeof(*el));
+		/*
+		 * We have two options here:
+		 * 1. Release the line as system is running low memory.
+		 * 2. Run an loop to retrieve an element till its drained.
+		 *
+		 * We will use 1st option.
+		 */
+		goto error;
+	}
+
+	ret = hte_retrieve_ts_ns_wait(hte.desc, el, avail);
+	if (ret < 0) {
+		dev_dbg(hte.pdev,
+			"Something went wrong retrieving timestamp data\n");
+		kfree(el);
+		goto error;
+	}
+
+	for (i = 0; i < avail; i++) {
+		dev_info(hte.pdev, "IRQ HW timestamp(%llu): %llu, edge: %s\n",
+			 el[i].seq, el[i].tsc,
+			 (el[i].dir == 1) ? "rising" : "falling");
+	}
+
+	kfree(el);
+
+	return;
+
+error:
+	hte_release_ts(hte.desc);
+}
+
+static void hte_ts_work(struct work_struct *data)
+{
+	size_t temp;
+	int ret;
+	(void) data;
+
+	if (hte.update_buf_len) {
+		ret = hte_disable_ts(hte.desc);
+		if (ret) {
+			dev_err(hte.pdev, "Not able to disable line\n");
+			goto error;
+		}
+
+		temp = hte.buf_len * len_pow;
+		ret = hte_set_buf_len(hte.desc, temp);
+		if (ret) {
+			dev_err(hte.pdev, "Not able to set new buf len (%lu)\n",
+				temp);
+			goto error;
+		}
+
+		hte.buf_len = hte_get_buf_len(hte.desc);
+		if (unlikely(hte.buf_len != temp)) {
+			dev_err(hte.pdev, "New length is (%lu) != (%lu)\n",
+				hte.buf_len, temp);
+			goto error;
+		}
+
+		dev_dbg(hte.pdev, "New buffer length (%lu)\n", hte.buf_len);
+		hte.update_buf_len = false;
+		ret = hte_enable_ts(hte.desc);
+		if (ret) {
+			dev_err(hte.pdev, "failed to enable line\n");
+			goto error;
+		}
+
+		return;
+	}
+
+	tegra_hte_irq_get_ts();
+
+	return;
+
+error:
+	hte_release_ts(hte.desc);
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
+
+	if (kstrtoul(buf, 10, &val) < 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (val == 1) {
+		if (hte.desc) {
+			ret = -EEXIST;
+			goto error;
+		}
+
+		hte.desc = devm_of_hte_request_ts(hte.pdev, "hte-lic",
+						  hte_callback);
+		if (IS_ERR(hte.desc)) {
+			ret = PTR_ERR(hte.desc);
+			hte.desc = NULL;
+			goto error;
+		}
+
+		hte_get_clk_src_info(hte.desc, &ci);
+		dev_info(hte.pdev, "clk rate:%llu, clk type: %d\n",
+			 ci.hz, ci.type);
+
+		hte.buf_len = hte_get_buf_len(hte.desc);
+		if (hte.buf_len < 0) {
+			ret = hte.buf_len;
+			hte_release_ts(hte.desc);
+			hte.desc = NULL;
+			goto error;
+		}
+	} else if (val == 0) {
+		if (!hte.desc) {
+			ret = -EINVAL;
+			goto error;
+		}
+		/*
+		 * Ideally, you never need to call this API, simply removing
+		 * this module should be enough, it is being called here just
+		 * for demonstration.
+		 */
+		ret = devm_hte_release_ts(hte.pdev, hte.desc);
+		if (ret)
+			goto error;
+
+		hte.desc = NULL;
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
+/*
+ * Sysfs attribute to set/get watermark.
+ */
+static ssize_t store_watermark(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       const char *buf, size_t count)
+{
+	int ret = count;
+	size_t val = 0;
+
+	if (kstrtoul(buf, 10, &val) < 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (hte.desc) {
+		ret = hte_set_buf_watermark(hte.desc, val);
+		if (ret < 0)
+			goto error;
+	} else {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	ret = count;
+
+error:
+	return ret;
+}
+
+static ssize_t show_watermark(struct kobject *kobj,
+			      struct kobj_attribute *attr,
+			      char *buf)
+{
+	size_t ret;
+
+	if (hte.desc) {
+		ret = hte_get_buf_watermark(hte.desc);
+		if (!ret)
+			goto error;
+	} else {
+		goto error;
+	}
+
+	return scnprintf(buf, PAGE_SIZE, "%lu\n", ret);
+
+error:
+	return -EINVAL;
+}
+
+struct kobj_attribute watermark_attr =
+		__ATTR(watermark, 0660, show_watermark, store_watermark);
+
+/*
+ * Sysfs attribute to set/get buffer.
+ */
+static ssize_t store_buf_len(struct kobject *kobj,
+			     struct kobj_attribute *attr,
+			     const char *buf, size_t count)
+{
+	int ret = count;
+	size_t val = 0;
+
+	if (kstrtoul(buf, 10, &val) < 0) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	if (hte.desc) {
+		ret = hte_set_buf_len(hte.desc, val);
+		if (ret < 0)
+			goto error;
+	} else {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	ret = count;
+
+error:
+	return ret;
+}
+
+static ssize_t show_buf_len(struct kobject *kobj,
+			    struct kobj_attribute *attr,
+			    char *buf)
+{
+	size_t ret;
+
+	if (hte.desc) {
+		ret = hte_get_buf_len(hte.desc);
+		if (!ret)
+			goto error;
+	} else {
+		goto error;
+	}
+
+	return scnprintf(buf, PAGE_SIZE, "%lu\n", ret);
+
+error:
+	return -EINVAL;
+}
+
+struct kobj_attribute buf_len_attr =
+		__ATTR(buf_len, 0660, show_buf_len, store_buf_len);
+
+static struct attribute *attrs[] = {
+	&en_dis_attr.attr,
+	&watermark_attr.attr,
+	&buf_len_attr.attr,
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
+	INIT_WORK(&hte.ev_work, hte_ts_work);
+
+	return 0;
+}
+
+static int tegra_hte_test_remove(struct platform_device *pdev)
+{
+	cancel_work_sync(&hte.ev_work);
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

