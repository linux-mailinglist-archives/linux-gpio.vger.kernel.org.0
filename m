Return-Path: <linux-gpio+bounces-32471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA7QDVkPqGk8ngAAu9opvQ
	(envelope-from <linux-gpio+bounces-32471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:54:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 832DB1FE956
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B14BF303F04D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 10:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8763A1D10;
	Wed,  4 Mar 2026 10:53:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70873A0B3D;
	Wed,  4 Mar 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621635; cv=none; b=e6osC6EakzYnFtap93TIyo5POjD77dSkGkqA0uO4uBuD9ufo4+LWVAns0PuHErK0CfNLg0emmleu57ekzV/quXFUQj+YB68+XyG8D78OQfvKZ44DjdFf9TJGl+UTD1FgMsgaaXNcz9y+qinJXpgfGOBY9sxnPOPNsXDhiixq7+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621635; c=relaxed/simple;
	bh=mej+Jd60NcwX96dJsQ6I0J0MKqwoHQki+5lc7cwcncc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peMLtl0zznogHhPLzJY6aToHz+ig8s+DxXWk5z40Ire8eVHnQSvS+lcMSs/eEDNpghVyNF/SKpzh8OYsJPPjdgvtLUJKbsQ7f9zWwZnkrxCZKdgtD7ssCiLhvvKCVBcDxrWw+JtZ9G5uZUFkicJpMKeBzlU6jymJyUQL5XGJKvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz13t1772621569t42882ecb
X-QQ-Originating-IP: ElOmFFYXOp/Hf2EkFm5oFyQZ7VI2zAY0qVzB/Fw21OA=
Received: from localhost.localdomain ( [219.147.0.82])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 18:52:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 775489432918910945
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: xujialu@vimux.org
Cc: brgl@kernel.org,
	kees@kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/3] nfc: s3fwrn5: convert to gpio descriptors
Date: Wed,  4 Mar 2026 18:52:13 +0800
Message-ID: <0F63C4FC246814C0+20260304105215.536399-2-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304105215.536399-1-xujialu@vimux.org>
References: <7187C401290C256B+20260304084808.440955-1-xujialu@vimux.org>
 <20260304105215.536399-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OLX7ejGwdBBz1OElv18QWDYJun9ThnTAQhIDrA7a7IY0Np2DJY7GPU04
	HtIHS/SLmhY3fPsuUGjlemCBCEYuKKSd5ijdLL7ThsQrLfH5BLqMbY4ChXYVJ9JoJu57GPc
	McyMa2UBrAmVHozPy++pHlYL6YaFPLxG6GyeaFdYomXz+PKaU9L7R2436qmHe5sbJoCed4O
	KUgugwvfzMfiiTgRXZVJI1t1ppzwWOozEUIDhigm8ACkOQthH6OYMYc1iapmegAR4JS2yx0
	MdCHoA9HUGgJ/f8rr5hfRGKMmzj6au6yA0I5TME1jsZwPibCNzootwAj7ZW0dFfBlIGI9i7
	OCVlYGnP+zRtnCk5zazMCIMTQpoYAfJ8b2b0Mo4AWNNPzlYuTJEos1iF1DRLVGlCqYwgxZC
	quOOknPEuMNSDQWl6nqbLZytcpYRrgCZhKGnqW9RWsdjRTc+7aO3t6w/miWvDC/82A+VqDa
	abAK677/6KAwvUSChdCKa0gppVt1mbxNzHgUodfEvYo1kBOKTtQdnZe1tcy7vzUnkIcJxyM
	1U8rIa32Hvon2ij6bARdGFiNtJkzhs7koQPvjPckV3UX8NZllPCkZzVvmkMHVRamXQhdP2m
	+oUc7tif7mFMFMvnhLorq2zRYgR7fbHh2ZCsFwF63057W3C/Iaekbs2ShAutPjS2Uu+Fyou
	8h8hZaaiSjfVgovj2s5bKQEnEXZpoUwNKLsrlbfxbBJPfRzG8/lKvtMLf3JbxYNa0wn1sDK
	Pk+eoLSDXNckX4rZwhZ2k9h5oyplAtLaMm43jzaZQriniw9pC9vFfpgEaBmOVjEuoOUnumv
	GA65OcjzAi3gJN3npu0a9iBpKOeKerHsxOJ86VbFeZQZ06ezgXsYV47tzHDPkD9VX37lT9h
	I6cfoP02LPARLyJ2JXQivof+QWeuJAcZxadd21ri6//PTwVjM85XHCfJ5aEzqUcoRU4ZcR2
	uBOLVK2J618qjd98pRNW3VLBBBnNQFeasoD8UOV/LJarx3V+e44eU3Yxp01LswDxtB6WE6C
	3iuSGgd8QW1McPfDSqfuVCUouzXNXAYGiWXK7aHNSmdCsjCwVzMfHAMtGRWYo=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 832DB1FE956
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32471-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:mid,vimux.org:email]
X-Rspamd-Action: no action

Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 drivers/gpio/gpiolib-of.c        |  4 +++
 drivers/nfc/s3fwrn5/i2c.c        | 55 +++++---------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 11 +++----
 drivers/nfc/s3fwrn5/phy_common.h |  5 +--
 drivers/nfc/s3fwrn5/uart.c       | 45 +++++++-------------------
 5 files changed, 32 insertions(+), 88 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b78..3bdd9af674474 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -542,6 +542,10 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
 		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
 #endif
+#if IS_ENABLED(CONFIG_NFC_S3FWRN5_I2C)
+		{ "en",		"s3fwrn5,en-gpios",	"samsung,s3fwrn5-i2c" },
+		{ "wake",	"s3fwrn5,fw-gpios",	"samsung,s3fwrn5-i2c" },
+#endif
 #if IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
 		{ "reset",	"gpio-reset",	"lantiq,pci-xway" },
diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 110d086cfe5ba..3f508b5fbf06b 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -8,10 +8,8 @@
 
 #include <linux/clk.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
-#include <linux/of_irq.h>
 #include <linux/module.h>
 
 #include <net/nfc/nfc.h>
@@ -146,37 +144,6 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 	return IRQ_HANDLED;
 }
 
-static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
-{
-	struct s3fwrn5_i2c_phy *phy = i2c_get_clientdata(client);
-	struct device_node *np = client->dev.of_node;
-
-	if (!np)
-		return -ENODEV;
-
-	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_en)) {
-		/* Support also deprecated property */
-		phy->common.gpio_en = of_get_named_gpio(np,
-							"s3fwrn5,en-gpios",
-							0);
-		if (!gpio_is_valid(phy->common.gpio_en))
-			return -ENODEV;
-	}
-
-	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
-		/* Support also deprecated property */
-		phy->common.gpio_fw_wake = of_get_named_gpio(np,
-							     "s3fwrn5,fw-gpios",
-							     0);
-		if (!gpio_is_valid(phy->common.gpio_fw_wake))
-			return -ENODEV;
-	}
-
-	return 0;
-}
-
 static int s3fwrn5_i2c_probe(struct i2c_client *client)
 {
 	struct s3fwrn5_i2c_phy *phy;
@@ -193,20 +160,14 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client)
 	phy->i2c_dev = client;
 	i2c_set_clientdata(client, phy);
 
-	ret = s3fwrn5_i2c_parse_dt(client);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_en,
-				    GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
-	if (ret < 0)
-		return ret;
+	phy->common.gpio_en = devm_gpiod_get(&client->dev, "en", GPIOD_OUT_HIGH);
+	if (IS_ERR(phy->common.gpio_en))
+		return PTR_ERR(phy->common.gpio_en);
 
-	ret = devm_gpio_request_one(&phy->i2c_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
-	if (ret < 0)
-		return ret;
+	phy->common.gpio_fw_wake = devm_gpiod_get(&client->dev, "wake",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake))
+		return PTR_ERR(phy->common.gpio_fw_wake);
 
 	/*
 	 * S3FWRN5 depends on a clock input ("XI" pin) to function properly.
diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
index deb2c039f0fd6..39a60e34136c5 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -8,7 +8,6 @@
  * Bongsu Jeon <bongsu.jeon@samsung.com>
  */
 
-#include <linux/gpio.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 
@@ -19,7 +18,7 @@ void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
 	struct phy_common *phy = phy_id;
 
 	mutex_lock(&phy->mutex);
-	gpio_set_value(phy->gpio_fw_wake, wake);
+	gpiod_set_value(phy->gpio_fw_wake, wake);
 	if (wake)
 		msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
@@ -33,14 +32,14 @@ bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode)
 
 	phy->mode = mode;
 
-	gpio_set_value(phy->gpio_en, 1);
-	gpio_set_value(phy->gpio_fw_wake, 0);
+	gpiod_set_value(phy->gpio_en, 1);
+	gpiod_set_value(phy->gpio_fw_wake, 0);
 	if (mode == S3FWRN5_MODE_FW)
-		gpio_set_value(phy->gpio_fw_wake, 1);
+		gpiod_set_value(phy->gpio_fw_wake, 1);
 
 	if (mode != S3FWRN5_MODE_COLD) {
 		msleep(S3FWRN5_EN_WAIT_TIME);
-		gpio_set_value(phy->gpio_en, 0);
+		gpiod_set_value(phy->gpio_en, 0);
 		msleep(S3FWRN5_EN_WAIT_TIME);
 	}
 
diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/phy_common.h
index 9cef25436bf90..871bec53dd0a9 100644
--- a/drivers/nfc/s3fwrn5/phy_common.h
+++ b/drivers/nfc/s3fwrn5/phy_common.h
@@ -12,6 +12,7 @@
 #define __NFC_S3FWRN5_PHY_COMMON_H
 
 #include <linux/mutex.h>
+#include <linux/gpio/consumer.h>
 #include <net/nfc/nci_core.h>
 
 #include "s3fwrn5.h"
@@ -21,8 +22,8 @@
 struct phy_common {
 	struct nci_dev *ndev;
 
-	int gpio_en;
-	int gpio_fw_wake;
+	struct gpio_desc *gpio_en;
+	struct gpio_desc *gpio_fw_wake;
 
 	struct mutex mutex;
 
diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
index 9c09c10c2a464..5977a6b58f6fb 100644
--- a/drivers/nfc/s3fwrn5/uart.c
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -10,13 +10,12 @@
 
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/nfc.h>
 #include <linux/netdevice.h>
-#include <linux/of.h>
 #include <linux/serdev.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "phy_common.h"
 
@@ -88,25 +87,6 @@ static const struct of_device_id s3fwrn82_uart_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
 
-static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
-{
-	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
-	struct device_node *np = serdev->dev.of_node;
-
-	if (!np)
-		return -ENODEV;
-
-	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_en))
-		return -ENODEV;
-
-	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_fw_wake))
-		return -ENODEV;
-
-	return 0;
-}
-
 static int s3fwrn82_uart_probe(struct serdev_device *serdev)
 {
 	struct s3fwrn82_uart_phy *phy;
@@ -140,20 +120,19 @@ static int s3fwrn82_uart_probe(struct serdev_device *serdev)
 
 	serdev_device_set_flow_control(serdev, false);
 
-	ret = s3fwrn82_uart_parse_dt(serdev);
-	if (ret < 0)
-		goto err_serdev;
-
-	ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
-				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
-	if (ret < 0)
+	phy->common.gpio_en = devm_gpiod_get(&serdev->dev, "en",
+					      GPIOD_OUT_HIGH);
+	if (IS_ERR(phy->common.gpio_en)) {
+		ret = PTR_ERR(phy->common.gpio_en);
 		goto err_serdev;
+	}
 
-	ret = devm_gpio_request_one(&phy->ser_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
-	if (ret < 0)
+	phy->common.gpio_fw_wake = devm_gpiod_get(&serdev->dev, "wake",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake)) {
+		ret = PTR_ERR(phy->common.gpio_fw_wake);
 		goto err_serdev;
+	}
 
 	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
 			    &uart_phy_ops);
-- 
2.47.3


