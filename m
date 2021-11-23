Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400A145AC6A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 20:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240163AbhKWTcx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 14:32:53 -0500
Received: from mail-dm6nam08on2069.outbound.protection.outlook.com ([40.107.102.69]:60128
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238543AbhKWTcc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 14:32:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfQkLRVqsN63yq7QT/23Z7untckfQTes8zhoz6HkUSCMSke4Oe7XLX197LGnytR4S0PnfeXqGFVd94Fr+6Sa7xgMFShBg77kM6ufQpe0zA6vSNLY+Shr5XAB2/aTDEq/i5ZUMfZuHhQnVjLUtzBAh0LU53jp5lAAE/PEX8yJIxv2nd3woDrxWNu8uSIW0ZW/7yWDZNY7KREAfJT83Q/vMwbxe58THeps/S+9mufh09Fzer24iywWTyBoBw3L52cDKZXW+66AWlTXrL6Katj1BermR2vVUXLcrakftC9OP5CcUEQQYUj5jHw1GSKuuY61GzRu9f0voxbLvNFExLC8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmZeW63iQ/Ri69p78OVoK4YgkT3m/Z2gnrECgQYB1E8=;
 b=T9U+ZPwqGvF9e8WwvMqU1gnlCSUEPj6ZGJFL8o8LHFRrYPHFa/3Yp85Kch1y3buBzMlXsN1z6/f2QDAY/aFXwDw01mE7WP4ky9TOkzRxk+Rh7XiP5dn71jq6rae7P7NKZXD/eK29qyPbuqjM5NkPXnRgSB3ZQHlkcwSkky/V3qtRFHDYdIZJQD8JbfWd6yT3M5NRZs410gOlTUwsEc6y1VcpcxIZDeZKAAedlH3ap9eW9lPtJ5Yqht8HLSycGMCCwIDZfSSsCUyfhM3zoLNzQ48yTp9rJGU7NF9lj02jm/6PTwL+hQo9lpzrE9ecNjm+cqXSHnaIYq8UhnMStRkwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmZeW63iQ/Ri69p78OVoK4YgkT3m/Z2gnrECgQYB1E8=;
 b=jrg4iUqzfrsKQNnqnhhAootZ5tGNOINOoU744/yw9fqGgK+po38Yg1XiUnf3CJoI9lWFwUeBRFFGnYKnRwojxAhLaM6MDPEqnixflcpZY5OdPLPKNMcODP0G7zDcIOeM1efrywkUnQDdbomK4Flxe0SnhDE/AKLW7kTF+4EaW/Xp8m9d596ku3sVOobPM+txVDNM4sSAkQJpubebpS82W4MOGqaA65pAJ3Hg2Z/SP43+9Q71mCvpxZ/LCXpH7Wg31iSomNYDhf4rqzus6Uc+fOT3zETN0JUVknVqPyW9YmMFwLxCBwa8WCasFoNA0nFCvD7XK23L8+ct9X/QhqCe1A==
Received: from MW4PR04CA0181.namprd04.prod.outlook.com (2603:10b6:303:86::6)
 by BN8PR12MB2980.namprd12.prod.outlook.com (2603:10b6:408:62::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Tue, 23 Nov
 2021 19:29:19 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::1b) by MW4PR04CA0181.outlook.office365.com
 (2603:10b6:303:86::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 19:29:19 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 11:29:17 -0800
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 19:29:17 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v3 06/12] gpiolib: Add HTE support
Date:   Tue, 23 Nov 2021 11:30:33 -0800
Message-ID: <20211123193039.25154-7-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123193039.25154-1-dipenp@nvidia.com>
References: <20211123193039.25154-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9c05aa4-d41a-4936-7549-08d9aeb78b6f
X-MS-TrafficTypeDiagnostic: BN8PR12MB2980:
X-Microsoft-Antispam-PRVS: <BN8PR12MB29806C873479FCCF9B10D807AE609@BN8PR12MB2980.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:178;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgje7mZh85owY2yn1DsuCZjRMsi+go3uuFHa1McNUgxEqEtiHzwmn3RJeY/MX+zQ3fWKe6cxmbFbbrBCbWDcOz5okhg5E1X5oC4M9utOOgNan8dds3qB7vSq+kZ4p06s1eT0rQ1rtipDfDCOJi3pot6QWIlMt0io5UeNo1dnmvSN3Hf5zr+h/27vtaqYuEr5ZFuYWC3tcN9pu+/yoirp7QvoajK7bNnmWDa4CMlqQ3N+CdV/dwlRwN9PdzRXjIvzuipoygTt4QwSYMmi6uQ3KhOjIG1BraNPBjYmE09vQWs955LYSqdTXUyv85moXxpq3AywEHbdXSo7znG5luVI1UisDA24sRFzSo95LBftGwjM6oGygPQDmKGl+868lUI/zkVcSDdORogZzNJTxfNlcnvJC43jRbicwDCV8R5dkTQc+c2niRatF0QyUdVF+epghZQoJDmershnhVGhSpGYmRnJRb+/mix1jhA2rhZEg4qleBLS/Qls75c44Q8jAF2cxYN7X71EsHTuEXWROeTaB+dhESCwOoJL4Vn2IgrsAlSw+9pozfOwPuJql4OuMsOstLDzOSoHyq1pK+v9VLNdT88OA4pOrN8qibjZQCZZZAjc233jEB7+7QohIFhYJqIRrsU2wStqAeuJOY5L88y6Lm1nVguuXlxMmdq4IBTLrF9wQinJ1GufYa3dm/j5ve3mEem1eNR8BHV7ZFXxywxg4BL/R73EcHM/YLuLh2TRO1aZZjaAkh09X6mWzutuX7/jC01owrZmeezohaxLiXsjVQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400004)(36756003)(921005)(83380400001)(86362001)(8936002)(4326008)(2616005)(70586007)(356005)(26005)(186003)(47076005)(7696005)(36860700001)(70206006)(7636003)(7416002)(2906002)(426003)(316002)(8676002)(110136005)(107886003)(336012)(6666004)(5660300002)(508600001)(1076003)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 19:29:19.0052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c05aa4-d41a-4936-7549-08d9aeb78b6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2980
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
---
Changes in v2:
- removed get timestamp and is timestamp enabled APIs

 drivers/gpio/gpiolib.c        | 73 +++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h        | 12 ++++++
 include/linux/gpio/consumer.h | 19 ++++++++-
 include/linux/gpio/driver.h   | 14 +++++++
 4 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..46cba75c80e8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1976,6 +1976,10 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
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
@@ -2388,6 +2392,75 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
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
index 3ad67b4a72be..680867e66fb6 100644
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
+					    hte_ts_threaded_cb_t tcb,
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
index a673a359e20b..fda5500ea60a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -10,6 +10,7 @@
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/hte.h> /* For hardware timestamping */
 
 struct gpio_desc;
 struct of_phandle_args;
@@ -319,6 +320,10 @@ struct gpio_irq_chip {
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
@@ -414,6 +419,15 @@ struct gpio_chip {
 
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

