Return-Path: <linux-gpio+bounces-32709-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMUSMqGWq2lyegEAu9opvQ
	(envelope-from <linux-gpio+bounces-32709-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:08:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69488229BDE
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 04:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B5BD304DEAC
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 03:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AD62F6904;
	Sat,  7 Mar 2026 03:07:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A82DCF74;
	Sat,  7 Mar 2026 03:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772852859; cv=none; b=lvLGeHJVEru61Vy54REJIZzlAH1GluMhdqqxNZyAKuAc68LsPcmUev+ewC1y54YKrY0gVmIydhasjD5xVKSc16cwg2qVyxtd52Ck5/j2a4RzLI69mO9b9e5IcsN9F7GJhH/i54beOiz2+z0Tvhzvcj+7+EH1icwvTuD7tDWc4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772852859; c=relaxed/simple;
	bh=Btv+xxaazrgJIrhMAwjFt227LeIEShqqnHUkEQG35JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHqpEP1aqJEI23XjR95/9cVaxS94wC0c3Lv5uLRj8WjYySO5gIAeVhBSv8p55tXQ5fCRN7jVuLUN5cqWB2XbVQSa9PyhQ83Hoo/rQus5nEnH+sAAJJP5q1aYKevrSAxDP/V4zC80z2ootoyUQwQze2hvgywvCZEmqnICfZr8dhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: zesmtpgz7t1772852834t40a2b5cc
X-QQ-Originating-IP: UMyb9GNdQ0f6DaA6fR0ZHjVNR5GoMiEotkK8wzqWW4c=
Received: from localhost.localdomain ( [219.147.0.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 07 Mar 2026 11:07:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5195212610033008869
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
Subject: [PATCH v4 1/3] nfc: s3fwrn5: convert to gpio descriptors
Date: Sat,  7 Mar 2026 11:06:22 +0800
Message-ID: <94FF47746A92BD6B+20260307030623.3495092-2-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
References: <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NCeavPrAbUfiQzCPUo7aupmflA5IUw+U/7bEF1ItYkSDhwkSq8GopAQw
	h6vdF058+QKP/XOkZk9ix8SNLLWMnNZjgOrmrDRk09H2+AwcTiXKEKVGSqSaxtTQdG8FMBf
	Z4Gl5gNj1JWVd19K+yoC2Uvtn1SEypCAG2L1QlegBjpRJ9Vvx6QpTMcdieMj07ubIj7CO7L
	jk7eVAEy6elhVzcKhsrC1LkRBIchCzeUOT75vxst9/Du1rDky+sQs25ZH+KuaO1qjh6REV2
	aKMdWiXC8oOxDZ8AdydUtJW7bCppHFRQaHUMLkhvBxpuddpARFBYAXyN/Emq1N0IPPZmtrf
	5sjMz2Qice3Q6z6Vm+0THiIBuySTHEQV9OA1+1AUsAih9UXos4lhvFQijDsajwsx8AViEOJ
	kRNorHOUncFFk/+QqwOHFsUYfoNFk8phQeNnTXwC+T2aElwylogzqcSDhOCoPJ/sHnw5yqU
	kr706MebxUuUFOBgfgt+GsiH4/EFlW7FNk1jvoM6+rUPe2rUa9H2W+Et8Y1COrC7QjPwVFW
	8E57eO52UZ2Q3kvLsBQ8BOHZ5TcH8UxWJjsLO0KGavi8DQQdv22UDgxhlRKTXBb0sakTo68
	CUDNqMRWgrHxu21EPVpU+rz0Xej/xkilH5Pj6d+VZp6cYrruHkisE6AlE71IyXQZyQOzjud
	SEGT8CWyxOkPgS3DaTo/EMWPPbCGJP64nDmaqIlV1+bXw12szFcm3TABSxFf+2iEUSd+u8M
	zoNTSp/U0VwLxiSbQpe4Y3/Qd23bj1XUezkuuyC5jVS6liA3pSDqgScg0Qf5qgmI0Sl0fVP
	VhLo/QynRwsfWdwxOfmSXerkGZ26ma/RheFCW42a4Ca5GdkROSDBV6O586ixy/NPvYG9okX
	pZYKR/A+8bb+8O6dCn4fG2oWj401qMnJ9bVW7sDZzt96Od8OMVbhmlB9gEAwXkIhZxEKYpe
	0iE2InHbjZunh8BsJrGqvfn4+FwEi4xvPZcS5hygfXlQjZnqbAhsohLD/I5xHJY/rCEI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 69488229BDE
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
	TAGGED_FROM(0.00)[bounces-32709-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.312];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Replace the legacy of_get_named_gpio() / gpio_request_one() /
gpio_set_value() API with the descriptor-based devm_gpiod_get() /
gpiod_set_value() API from <linux/gpio/consumer.h>, removing the
dependency on <linux/of_gpio.h>.

This removes the s3fwrn5_i2c_parse_dt() and s3fwrn82_uart_parse_dt()
functions since devm_gpiod_get() handles both DT lookup and resource
management. The gpio_en and gpio_fw_wake fields in struct phy_common
are changed from int to struct gpio_desc *.

Add rename quirks in gpiolib-of.c for the deprecated "s3fwrn5,en-gpios"
and "s3fwrn5,fw-gpios" properties to maintain backward compatibility
with old device trees.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpiolib-of.c        |  4 +++
 drivers/nfc/s3fwrn5/i2c.c        | 54 +++++---------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 11 +++----
 drivers/nfc/s3fwrn5/phy_common.h |  5 +--
 drivers/nfc/s3fwrn5/uart.c       | 43 ++++++-------------------
 5 files changed, 29 insertions(+), 88 deletions(-)

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
index 110d086cfe5ba..91b8d1445efd4 100644
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
@@ -193,20 +160,13 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client)
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
+	phy->common.gpio_fw_wake = devm_gpiod_get(&client->dev, "wake", GPIOD_OUT_LOW);
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
index 9c09c10c2a464..ccfcee06ee774 100644
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
@@ -140,20 +120,17 @@ static int s3fwrn82_uart_probe(struct serdev_device *serdev)
 
 	serdev_device_set_flow_control(serdev, false);
 
-	ret = s3fwrn82_uart_parse_dt(serdev);
-	if (ret < 0)
-		goto err_serdev;
-
-	ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
-				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
-	if (ret < 0)
+	phy->common.gpio_en = devm_gpiod_get(&serdev->dev, "en", GPIOD_OUT_HIGH);
+	if (IS_ERR(phy->common.gpio_en)) {
+		ret = PTR_ERR(phy->common.gpio_en);
 		goto err_serdev;
+	}
 
-	ret = devm_gpio_request_one(&phy->ser_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
-	if (ret < 0)
+	phy->common.gpio_fw_wake = devm_gpiod_get(&serdev->dev, "wake", GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake)) {
+		ret = PTR_ERR(phy->common.gpio_fw_wake);
 		goto err_serdev;
+	}
 
 	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
 			    &uart_phy_ops);
-- 
2.47.3


