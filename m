Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900D83B4B42
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jun 2021 01:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhFYXuk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 19:50:40 -0400
Received: from mail-bn1nam07on2058.outbound.protection.outlook.com ([40.107.212.58]:16865
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229971AbhFYXuh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Jun 2021 19:50:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzU/IkW9lNFgxeXLMcX7FwGHGjTuo3lQyPHmkCB6u5d+2VbDTjpuCsETMd6RNmUhVp6yXbHlvkMd6hXCNiPufw8eeJzMxI8VQ1elI5M8a4pzT/PUdhoLCGlOZjPFesGC6zWESkvO65yJuNKy7HAU3ecYlX0wNfHvFHiFwxXXObfyr8iVhuimqAq8qFYzoIp+iCjS3mY6/AlniI0GezTbGNDdSS92B4UcpjhBXI7OB1ELKrXq2ttH/i6z/8qZvVlxns8CfJdWtyKXNhmuyNDFtYomfznQU3tBz64KbqHfEiueZt2I2buCDgEu8WOGq7r/97WzFJ+bNzkZuAd1/iO5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPEu3dKxGpeeyXJMksnlDl67cbUDr7aZsEuzBCaFllg=;
 b=PI0TtUo42BVpNtHlslAMz8bMKC7151M6FAS3JWYJRnaNw/qln5p+CvanUcE/YwyhPa2yCyUoqSzWxzhxK4GSiumEuMj6TE/f0jEuF+NRpZGNJgozSD5+zl86YTETPB3bz7d5zgAYrscB1eIoLdVydracaR/1UuHgc6RJAWbdgdmt3ASZHGltZ1fXTfXmvEIPvDqDs6eXAlZf95FmQPnSEIv+tUmbm/BDM3hUsItrQSM0vPX5O9mrpv5y5ZsZKiF/Ftw2qxT68jvMUdPDezrYgh7Rl/Fxnsfh3186i0/+0p/zc3IzItsPdzZQYt6OzknyxU8+WI3QwtJgvMtEfJtSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPEu3dKxGpeeyXJMksnlDl67cbUDr7aZsEuzBCaFllg=;
 b=AEvjDUpcKn+GxwnrC5CzF1USwdsRSKljBNiIpbbmfm7fD52PiB0cqe1RalYgdk1+rAiiJe6vfSQGAq2Y7hT/xTwYpxZaGRvdVKoGf8SrIJH/IdDmnuoH/ibT6eDuqa7+9NP7cm4Japipu5CTOaqpnQSBY28nlB+/MkAl81FBOLObVCtXQW6lgtA7naHloKLwtMnrvfhElzrjJVXMg2bV97rFzmYf9B6OqLkAf672weoGofMlSFJCTQdRdGVjGUAHmypCM6+r4yMrqBmlJTku/aG/r2MVyZyiDwHd9kXM48pazi7TDiVEFj7XJM7X24TXTP3lgW2V4VROpQ9YNIF/TQ==
Received: from BN0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:408:e6::20)
 by SN6PR12MB2736.namprd12.prod.outlook.com (2603:10b6:805:75::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 23:48:12 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::f7) by BN0PR03CA0015.outlook.office365.com
 (2603:10b6:408:e6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:48:11 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 23:48:10 +0000
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Jun 2021 23:48:10 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <dipenp@nvidia.com>, <robh+dt@kernel.org>
Subject: [RFC 06/11] gpiolib: Add HTE support
Date:   Fri, 25 Jun 2021 16:55:27 -0700
Message-ID: <20210625235532.19575-7-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625235532.19575-1-dipenp@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4864560-a76d-4787-a52d-08d93833b161
X-MS-TrafficTypeDiagnostic: SN6PR12MB2736:
X-Microsoft-Antispam-PRVS: <SN6PR12MB273650EF07DED62E3F093B1CAE069@SN6PR12MB2736.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ITXtM7iClBE0OI3rwwy5PSHfz6MxhV+orbUaeFPE2xGYsmAFZkYefE6ZIAbestncym78Qz+omYvxD5kMG9VDT9sqKTqyP923H3fir4FZAbG/P2KOYnqYRqbqnPbL1WptOJo1VoIAms2A/pCKYFsDu9Tnol819+6PRbw2Z3U9HTQAII2pY7cqZfSmX37SDddgOThP9+ZmEQmf5V/WRy7ZVLSoVHAPbWj/7Oy+uLPp2+DM4p5QAcq75mBQAKdNL5UIMhCnJDXuMNt3Yur2B4t6AqgvH0s/bDudcDuJQBw+zC1evZPN1YK9eYKnXwjC1P6gK4SUotNbXtC5OLNA5N5zW4N0go+TICU8r6qA4nwFFNzznBTltcNX7EgNco3oeSmgumNXJMK/7uCQ9a+cHUXgxjomIygeqeqGM6vOdRHZd2uTlJC2lVvMrWyAO4TOqyauHHpjNxMtSJ9VNHz+lZYnEN2crICI41r5SL5u7eiQpJRamqnx5dg21uyRdmUwSOiu0NyBXKKOv1CrI7G72NuG+ZRXwq9wiKRjJWYbSJK2o+1jmofFEanxIWPzx1OHDr3g+Eo7J/yUAPyIjHBCcLF6KzG2URvXlqYszwwYifH9FsCM+lr3PT7A2JpDMELw+ExqiQCERsMFhKnEWEJFIVMWiQMoIXiNbETDJJCKSKzfzB9Q8jP9UcgoTpb4a/70pQLBADHtkhu217QUuWP9chmAXAhcJyVQ4+hBgx8f4Ro7qftKev6CQBdF6xiZjuZeYtcFCPV0LQxbSUsW4F8disKDg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(36840700001)(46966006)(36756003)(26005)(8676002)(7416002)(86362001)(47076005)(186003)(336012)(8936002)(83380400001)(7696005)(426003)(2616005)(110136005)(5660300002)(7636003)(356005)(82740400003)(921005)(316002)(70206006)(1076003)(6666004)(2906002)(70586007)(478600001)(82310400003)(36860700001)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:48:11.8350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4864560-a76d-4787-a52d-08d93833b161
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2736
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some GPIO chip can provide hardware timestamp support on its GPIO lines
, in order to support that additional functions needs to be added which
can talk to both GPIO chip and HTE (hardware timestamping engine)
subsystem. This patch introduces functions which gpio consumer can use
to request hardware assisted timestamping. Below is the list of the APIs
that are added in gpiolib subsystem.

- gpiod_hw_timestamp_control - to enable/disable HTE on specified GPIO
line. This API will return HTE specific descriptor for the specified
GPIO line during the enable call, it will be stored as pointer in the
gpio_desc structure as hw_ts_data.
- gpiod_is_hw_timestamp_enabled - to query if HTE is enabled on
specified GPIO line.
- gpiod_get_hw_timestamp - to retrieve hardware timestamps.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 drivers/gpio/gpiolib.c        | 92 +++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h        | 11 +++++
 include/linux/gpio/consumer.h | 21 +++++++-
 include/linux/gpio/driver.h   | 13 +++++
 4 files changed, 135 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 220a9d8dd4e3..335eaddfde98 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2361,6 +2361,98 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_output);
 
+/**
+ * gpiod_hw_timestamp_control - set the hardware assisted timestamp control.
+ * @desc:	GPIO to set
+ * @enable:	Set true to enable the hardware timestamp, false otherwise.
+ *
+ * Certain GPIO chip can rely on hardware assisted timestamp engines which can
+ * record timestamp at the occurance of the configured events on selected GPIO
+ * lines. This is helper API to control such engine.
+ *
+ * Return 0 in case of success, else an error code.
+ */
+int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable)
+{
+	struct gpio_chip	*gc;
+	int			ret = 0;
+
+	VALIDATE_DESC(desc);
+	gc = desc->gdev->chip;
+
+	if (!gc->timestamp_control) {
+		gpiod_warn(desc,
+			   "%s: Hardware assisted ts not supported\n",
+			   __func__);
+		return -ENOTSUPP;
+	}
+
+	ret = gc->timestamp_control(gc, gpio_chip_hwgpio(desc),
+				    &desc->hdesc, enable);
+
+	if (ret) {
+		gpiod_warn(desc,
+			   "%s: ts control operation failed\n", __func__);
+		return ret;
+	}
+
+	if (!enable)
+		desc->hdesc = NULL;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gpiod_hw_timestamp_control);
+
+/**
+ * gpiod_is_hw_timestamp_enabled - check if hardware assisted timestamp is
+ * enabled.
+ * @desc:	GPIO to check
+ *
+ * Return true in case of success, false otherwise.
+ */
+bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc)
+{
+	if (!desc)
+		return false;
+
+	return (desc->hdesc) ? true : false;
+}
+EXPORT_SYMBOL_GPL(gpiod_is_hw_timestamp_enabled);
+
+/**
+ * gpiod_get_hw_timestamp - Get hardware timestamp in nano seconds.
+ * @desc:	GPIO to get the timestamp.
+ * @block:	Set true to block until data is available.
+ *
+ * Return non-zero on success, else 0.
+ */
+u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block)
+{
+	struct gpio_chip	*gc;
+	int			ret = 0;
+	u64 ts;
+
+	VALIDATE_DESC(desc);
+	gc = desc->gdev->chip;
+
+	if (!gc->get_hw_timestamp) {
+		gpiod_warn(desc,
+			   "%s: Hardware assisted ts not supported\n",
+			   __func__);
+		return -ENOTSUPP;
+	}
+
+	ret = gc->get_hw_timestamp(gc, block, desc->hdesc, &ts);
+	if (ret) {
+		gpiod_warn(desc,
+			   "%s: get timestamp operation failed\n", __func__);
+		return 0;
+	}
+
+	return ts;
+}
+EXPORT_SYMBOL_GPL(gpiod_get_hw_timestamp);
+
 /**
  * gpiod_set_config - sets @config for a GPIO
  * @desc: descriptor of the GPIO for which to set the configuration
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 30bc3f80f83e..5393e1d90f61 100644
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
@@ -129,6 +131,15 @@ struct gpio_desc {
 	/* debounce period in microseconds */
 	unsigned int		debounce_period_us;
 #endif
+	/*
+	 * Hardware timestamp engine related internal data structure.
+	 * This gets set when the consumer calls gpiod_hw_timestamp_control to enable
+	 * hardware timestamping on the specified GPIO line. The API calls into HTE
+	 * subsystem, in turns HTE subsystem return the HTE descriptor for the GPIO
+	 * line. The hdesc will be later used with gpiod_is_hw_timestamp_enabled
+	 * and gpiod_get_hw_timestamp API calls.
+	 */
+	struct hte_ts_desc *hdesc;
 };
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index c73b25bc9213..476ee04de7d0 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -112,6 +112,9 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
+int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable);
+bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc);
+u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -353,8 +356,22 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
-
-
+static inline int gpiod_hw_timestamp_control(struct gpio_desc *desc,
+					     bool enable)
+{
+	WARN_ON(desc);
+	return -ENOSYS;
+}
+static inline bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc)
+{
+	WARN_ON(desc);
+	return false;
+}
+static inline u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block)
+{
+	WARN_ON(desc);
+	return 0;
+}
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 3a268781fcec..f343e8f54b08 100644
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
+ * @timestamp_control: Dependent on GPIO chip, an optional routine to
+ * 	enable/disable hardware assisted timestamp.
+ * @get_hw_timestamp: Retrieves hardware timestamp. The consumer can specify
+ * 	block parameter if it wishes to block till timestamp is available. 
  * @base: identifies the first GPIO number handled by this chip;
  *	or, if negative during registration, requests dynamic ID allocation.
  *	DEPRECATION: providing anything non-negative and nailing the base
@@ -396,6 +401,14 @@ struct gpio_chip {
 
 	int			(*add_pin_ranges)(struct gpio_chip *gc);
 
+	int			(*timestamp_control)(struct gpio_chip *gc,
+						     unsigned int offset,
+						     struct hte_ts_desc **hdesc,
+						     bool enable);
+	int			(*get_hw_timestamp)(struct gpio_chip *gc,
+						    bool block,
+						    struct hte_ts_desc *hdesc,
+						    u64 *ts);
 	int			base;
 	u16			ngpio;
 	const char		*const *names;
-- 
2.17.1

