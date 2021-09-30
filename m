Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A442E41E4D5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350604AbhI3X2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:36 -0400
Received: from mail-dm6nam12on2066.outbound.protection.outlook.com ([40.107.243.66]:50913
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350131AbhI3X2Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2xTBS+4l/l2I9Dja3jvSfh2/jrhx8hFJ/0oQ8+KTychBw3lR0+fboGjrjbWXKrlF8auqN30W6m3fHxDYLyGpftQJCRY16IetNZ5nMg+Y17pBn7SpQEiDhM3GpdWPsIc97tWlD7GR9Ay9QXeT1gIgW01jwj3khB57WgpQrdUxg5uwb85Er5oZqy9oTPx6t1nkfEVP5lgRaBq7imb82xC9hkGUueAVJXhmPZKxKozrNkqixqdDRaAJAwo/CfinVffGCIdPINZar/1h4HEDT96Ux4/yXvXqZC5pWBH4R0N0OftSPsH47Q3V/Y97db+LBSSu0zAOKIMIOqRB2QN55LsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW6Ng6Cig8SXYdpBz+h4oSpvsP17o/ewAV0GfsLnTGU=;
 b=ZbHFGni6JkUKnBcVYxFcHB8kyAkMPX8aNtpbHGreZgQuI56PYg0AodMsLiaL/iIHh4oU19KRa0eNvLFhYwK259y89Det3HrQ6T5afeUcU+nPqNoc2oJX3hUtc7gaJ7BY7ogULs36GIZu+jGD+bgYF/hqKbVjg51tenSGABw3DGfhbvIXh++QLYU9lVa8kCu/Bd4sa9xAMJ9oLst7zI/Umy7RzygxpQ4YA8viFf099yOtIfOXJkPJxl7DNrb2pgAc2fBfFxfDUhs84j+wRqrogGKtCy2K4+zdfENbEYSRP1CRTDAJdAN9R4IAOTpX2sPqC2RWAbMpXVI05CrQYvKd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW6Ng6Cig8SXYdpBz+h4oSpvsP17o/ewAV0GfsLnTGU=;
 b=YfiZKb7KMw9EO6TXiNLGhgLJtsKBBcV7CZh4HxhJtLE+i8PcFsVsCKliqpIionHBMSkYjjMjeE5fAijprHDeeav3diixOSLHUvFT/O4vNoZ9vsNgDYXEvatupy4f7vs91FmYgB4R2t9wYYJLE2aKvZd2tSleHJZiWQGzgX3KEJdZo7k9JS6HkL20CuaVu+pa2Bx7CFB0V40r2wWppw9hUn7ih1nkZjrPI3luoRzyGSjQ9OfjN9fQqxmYEc61O9dtEp/mV072zzWoCCJeo4bYC1O5Ipt4JIwHx6XlM+L6yhRwrX092raqjenv+3O71uwUfhGH+8SamkFxhDTbZME8vg==
Received: from CO2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:102:1::15)
 by DM5PR12MB2566.namprd12.prod.outlook.com (2603:10b6:4:b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 30 Sep
 2021 23:26:39 +0000
Received: from CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::85) by CO2PR04CA0005.outlook.office365.com
 (2603:10b6:102:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT064.mail.protection.outlook.com (10.13.175.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:38 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 23:26:37 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:37 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 06/11] gpiolib: Add HTE support
Date:   Thu, 30 Sep 2021 16:26:12 -0700
Message-ID: <20210930232617.6396-7-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aab661f5-f48d-4a77-2a6c-08d98469c088
X-MS-TrafficTypeDiagnostic: DM5PR12MB2566:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2566D6F659E8A25C234E30EAAEAA9@DM5PR12MB2566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:178;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw8GYqDH51nuBFiMBzKFChHxOaWbVAg57FyL04A5xuGR3BhPjT1KzK3d1RtfJv6KXNPWXVpn3tvhGma5+nGdgtWld1+OpiX4l40XevF9Y4rgBuI9NIHn1AZapje7kdRYxCkTfLDGj63xsZi674S/XrtPBJudiEcYf7FcOO6gmkycldeVicWBU5yOLQMDfIG2OeUKzbedVjRFmj74Omy7weRDSWxMFyuTAvZ5tmlG5tExbJIE//+4oikjUaLnSlOxSCoWZpuwvI21qPrS4dl3VzrOOtgcpA5jTtVXMAwbdD7zV4TVZWf9rVJM3HOZLtg5fNSPFVA9l49oXwBdsMEuf7mHEDfa5womxwxCf81iPU+1krRkaMzURDo9yXdCAvmcu07cH4IT5Tek3RAzJqQXJz6Y1LyRvCuYX8WP2BjEeA1Hyv7J/orAebombzkfuxHPTRfdf0vULX2eBOSu6brnjCszDicAUweAWEiY5AySjSxkUZ39zCdGmWOesnAP+JZzX97IE84hNsDbC9AFpQXU86rlMlwhdUH8gUeKQg4zvWPJ3CbrpN4FiJ1n7FcTvXDdNU2aAHwt3buamwTh0208k5Mvrh9PsJCKjkpyc9tn9NbfmQl8W1yRNyl1arHWxsOiTUSu5YkaNG50xXeoYzG3JzETiW943ZhmEsgtTcoyj9EHGmfwBO3HNByCC8MjqzJa61DBS+dn8rmDL03AzstRAJ3ZR9ogb9lvvGLLXcG0g1Q7bOZIEXDo+Dfal5lweoYv6UNm2QswVN86xXiaSLsguw==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(2906002)(921005)(1076003)(26005)(8676002)(316002)(5660300002)(47076005)(70206006)(82310400003)(508600001)(8936002)(426003)(4326008)(7416002)(83380400001)(107886003)(6666004)(7696005)(7636003)(186003)(86362001)(336012)(110136005)(36756003)(2616005)(36860700001)(356005)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:38.5108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab661f5-f48d-4a77-2a6c-08d98469c088
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2566
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some GPIO chip can provide hardware timestamp support on its GPIO lines
, in order to support that additional API needs to be added which
can talk to both GPIO chip and HTE (hardware timestamping engine)
subsystem. This patch introduces APIs which gpio consumer can use
to request hardware assisted timestamping. Below is the list of the APIs
that are added in gpiolib subsystem.

- gpiod_req_hw_timestamp_ns - Request HTE on specified GPIO line.
- gpiod_rel_hw_timestamp_ns - Release HTE functionality on GPIO line.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
Changes in v2:
- removed get timestamp and is timestamp enabled APIs

 drivers/gpio/gpiolib.c        | 73 +++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h        | 12 ++++++
 include/linux/gpio/consumer.h | 19 ++++++++-
 include/linux/gpio/driver.h   | 14 +++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d1b9b721218f..781d685cc2de 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1971,6 +1971,10 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 			gc->free(gc, gpio_chip_hwgpio(desc));
 			spin_lock_irqsave(&gpio_lock, flags);
 		}
+		spin_unlock_irqrestore(&gpio_lock, flags);
+		gpiod_rel_hw_timestamp_ns(desc);
+		spin_lock_irqsave(&gpio_lock, flags);
+
 		kfree_const(desc->label);
 		desc_set_label(desc, NULL);
 		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
@@ -2383,6 +2387,75 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
+/**
+ * gpiod_req_hw_timestamp_ns - Enable the hardware assisted timestamp in
+ * nano second.
+ *
+ * @desc: GPIO to enable
+ * @cb:	Callback, will be called when HTE pushes timestamp data.
+ * @tcb: Threaeded callback, it gets called from kernel thread context and when
+ * cb returns with HTE_RUN_THREADED_CB return value.
+ * @data: Client data, will be sent back with tcb and cb.
+ *
+ * Certain GPIO chip can rely on hardware assisted timestamp engines which can
+ * record timestamp at the occurance of the configured events
+ * i.e. rising/falling on specified GPIO lines. This is helper API to enable hw
+ * assisted timestamp in nano second.
+ *
+ * Return 0 in case of success, else an error code.
+ */
+int gpiod_req_hw_timestamp_ns(struct gpio_desc *desc, hte_ts_cb_t cb,
+			      hte_ts_threaded_cb_t tcb, void *data)
+{
+	struct gpio_chip *gc;
+	int ret = 0;
+
+	VALIDATE_DESC(desc);
+	gc = desc->gdev->chip;
+
+	if (!gc->req_hw_timestamp) {
+		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
+		return -ENOTSUPP;
+	}
+
+	ret = gc->req_hw_timestamp(gc, gpio_chip_hwgpio(desc), cb, tcb,
+				   &desc->hdesc, data);
+	if (ret)
+		gpiod_warn(desc, "%s: hw ts request failed\n", __func__);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_req_hw_timestamp_ns);
+
+/**
+ * gpiod_rel_hw_timestamp_ns - Release and disable the hardware assisted
+ * timestamp.
+ *
+ * @desc: GPIO to disable
+ *
+ * Return 0 in case of success, else an error code.
+ */
+int gpiod_rel_hw_timestamp_ns(struct gpio_desc *desc)
+{
+	struct gpio_chip *gc;
+	int ret = 0;
+
+	VALIDATE_DESC(desc);
+	gc = desc->gdev->chip;
+
+	if (!gc->rel_hw_timestamp) {
+		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
+		return -ENOTSUPP;
+	}
+
+	ret = gc->rel_hw_timestamp(gc, gpio_chip_hwgpio(desc), &desc->hdesc);
+	if (ret)
+		gpiod_warn(desc, "%s: hw ts release failed\n", __func__);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_rel_hw_timestamp_ns);
+
 /**
  * gpiod_set_config - sets @config for a GPIO
  * @desc: descriptor of the GPIO for which to set the configuration
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 30bc3f80f83e..f634b9de3756 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/cdev.h>
+#include <linux/hte.h>
 
 #define GPIOCHIP_NAME	"gpiochip"
 
@@ -117,6 +118,7 @@ struct gpio_desc {
 #define FLAG_EDGE_RISING     16	/* GPIO CDEV detects rising edge events */
 #define FLAG_EDGE_FALLING    17	/* GPIO CDEV detects falling edge events */
 #define FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
+#define FLAG_EVENT_CLOCK_HARDWARE	19 /* GPIO CDEV reports hardware timestamps in events */
 
 	/* Connection label */
 	const char		*label;
@@ -129,6 +131,16 @@ struct gpio_desc {
 	/* debounce period in microseconds */
 	unsigned int		debounce_period_us;
 #endif
+	/*
+	 * Hardware timestamp engine related internal data structure.
+	 * This gets filled out when the consumer calls
+	 * gpiod_req_hw_timestamp_ns to enable hardware timestamping on the
+	 * specified GPIO line. The API calls into HTE subsystem which
+	 * initializes appropriate field of the hdesc. The hdesc will be later
+	 * used with gpiod_rel_hw_timestamp to release hw timestamp
+	 * functionality.
+	 */
+	struct hte_ts_desc hdesc;
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 97a28ad3393b..e6f17083ca0a 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -6,6 +6,7 @@
 #include <linux/bug.h>
 #include <linux/compiler_types.h>
 #include <linux/err.h>
+#include <linux/hte.h>
 
 struct device;
 
@@ -112,6 +113,9 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
+int gpiod_req_hw_timestamp_ns(struct gpio_desc *desc, hte_ts_cb_t cb,
+			      hte_ts_threaded_cb_t tcb, void *data);
+int gpiod_rel_hw_timestamp_ns(struct gpio_desc *desc);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -353,8 +357,19 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
-
-
+static inline int gpiod_req_hw_timestamp_ns(struct gpio_desc *desc,
+					    hte_ts_cb_t cb,
+					    hte_ts_threaded tcb,
+					    void *data)
+{
+	WARN_ON(desc);
+	return -ENOSYS;
+}
+static inline int gpiod_rel_hw_timestamp_ns(struct gpio_desc *desc)
+{
+	WARN_ON(desc);
+	return -ENOSYS;
+}
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a0f9901dcae6..5dc6c941dbe0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -10,6 +10,7 @@
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/hte.h> /* For hardware timestamping */
 
 struct gpio_desc;
 struct of_phandle_args;
@@ -304,6 +305,10 @@ struct gpio_irq_chip {
  * @add_pin_ranges: optional routine to initialize pin ranges, to be used when
  *	requires special mapping of the pins that provides GPIO functionality.
  *	It is called after adding GPIO chip and before adding IRQ chip.
+ * @req_hw_timestamp: Dependent on GPIO chip, an optional routine to
+ *	enable hardware assisted timestamp.
+ * @rel_hw_timestamp: Dependent on GPIO chip, an optional routine to
+ *	disable/release hardware assisted timestamp.
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
@@ -399,6 +404,15 @@ struct gpio_chip {
 
 	int			(*add_pin_ranges)(struct gpio_chip *gc);
 
+	int			(*req_hw_timestamp)(struct gpio_chip *gc,
+						    unsigned int offset,
+						    hte_ts_cb_t cb,
+						    hte_ts_threaded_cb_t tcb,
+						    struct hte_ts_desc *hdesc,
+						    void *data);
+	int			(*rel_hw_timestamp)(struct gpio_chip *chip,
+						    unsigned int offset,
+						    struct hte_ts_desc *hdesc);
 	int			base;
 	u16			ngpio;
 	u16			offset;
-- 
2.17.1

