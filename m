Return-Path: <linux-gpio+bounces-32473-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HEWHJgTqGnUngAAu9opvQ
	(envelope-from <linux-gpio+bounces-32473-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 12:12:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C51FEC56
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 12:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DB1C317BE2F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 11:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FE139FCA3;
	Wed,  4 Mar 2026 11:08:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F6371D02;
	Wed,  4 Mar 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622488; cv=none; b=hJ8lxsXDP2Fp/UhddW5ljFKqfXRogzmPn04Z2hJqxLHP8vUZrMW4xftJSJDEXR8R/ugtlCWFqq+hDPjgRbvw23E32yK5m+cdBmPqX+Sp2ylGI+bdlHI77uInI5qKd3RNNfMDy5WdHRSxh9495GrwOU3CLOaRDG2hEeb/hnIcPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622488; c=relaxed/simple;
	bh=WEHh9zjvjGqN8Yuxxy6+/8dLl1UNXuYrDbU8ahN0HfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8BpaHqZ0izmCt8H/DCihimv5E8S5X9Xo3vBUoYmJQWDOtZ/BwwydaeS+eaWyPr/daplNPRr141VDw/LTNNv2fW47FwOxUTM3W93qCcTy4OM9kZyw9dVbC3fauKRPBG6kTOfFn92z96P10Mgnr7NhXjfOcosr8EQ7uNZ3YE3jbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz3t1772622471t047521a1
X-QQ-Originating-IP: KDuq9/1zr7V0KeqUhUY2NZ9mVljaT6FuPwYAadcNXKA=
Received: from localhost.localdomain ( [39.65.248.64])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 19:07:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3064715555804836238
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
Subject: [PATCH v2 1/3] nfc: s3fwrn5: convert to gpio descriptors
Date: Wed,  4 Mar 2026 19:07:38 +0800
Message-ID: <815AD68AB84E0ECD+20260304110740.548318-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
References: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OCEllDxgdh9VkWLJuFOVucdUQ742jopLH6Ow3N8nuBobvb7kn6nEkR1M
	E9zj2RW0CZGYaeX8vAw9+tfXNQxml71ZGsZtA2yG9yISO/XDtkDMbUQxZhw8EuoOz2h/mTF
	Rpo5rhNP8b0+e2NvUwyOKY4PG7IzabZrfdchOkV/wCia4SJ5PxQx80BJ0JoTGsyuDuo88yn
	x3iV9MPz7AGYVU8yH9yQHf1yfw3276iFXl8Lg8Kuwr7O68BawOq0OC6OULwIcz71xM8BvDC
	+C9iA2zOnCz6Tz8IzTnL6VaZ7kAWULGTFd8bIEef9Ly9OucdJAdl1dM6ZbU4MeMEgo8lc+3
	jfJllVqAXhkIfYhk3j6x7vwCW6DC4mt0mYawV80OjJkiZ1iz0nCWnkK8hFaU9gBI+KAGAJn
	e35hwZPGivdGitAQVPC5UdB/cgA7vKeo/ehdNMubSeCEoOG7oZNk8YYjc9pGrQmgxrvVssQ
	RuWCVO7SeQXsBV7FFtvulgfNd329vsA6jLbro8bevZmz0LjZ+bn8tG538YIoI57soM4+CgX
	1FZlo/MbI5euDnCVZiO6XQw9pw/wcsIbXaf91ZORjgCHuSZwIA9hR3QqlRijPdK6d5vOaKN
	xABXMz5P3R6bS3qByHDi4blaYuPHcHubkG9uU9CI/XWmyoSFaTFnZsuYYmHyF2tTQ6bdKWm
	VNS/l4hnxx2SaWikSRRevf/AmOcrxrn8iPKpTNDSsXOOL33acFFhD8sO8QRKr1b/Q2ttDEE
	Q1xNOV4WGGg969Mfh9XV1pW5XIBoRM3eFH4PRX5GnvQd4TC8j0gZc/wAy5cFhSeKCqhrxnO
	nhaCdG/2Ob7OutYAB2vrpvY7GhferwRFfcAGKinPVDE/uGbD9+INwT2gd+Cre3Lbi90aCwx
	8xdDWeSURsfpUQflADDYQCA8V9xIWH8hzAkWc166LH2UhbNC5QJ0K2SjtUxKB2P3SKlGAbA
	BddjNkJDr5b1e1SZkU0BoVhwVYmRn0C2o6lUDo2zViul6so/TCrFIzobzAGFIamuEJaf4Ry
	VJt8E8zQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 194C51FEC56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32473-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,vimux.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.
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


