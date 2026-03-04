Return-Path: <linux-gpio+bounces-32443-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P/vC5/yp2mtmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-32443-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:51:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6C1FCEEF
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 09:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79CA9308ECF1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 08:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEDB38836D;
	Wed,  4 Mar 2026 08:49:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6855E37C908;
	Wed,  4 Mar 2026 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614147; cv=none; b=BFFsAYFFP/bI9ZhAS/C+rkKVAyXAbBu7NKxUDYmLLPzzXphdMM9ltiXQpiJI77UszxOsjHIQGAVx8m4AckwVdoHfyv0nphn7HXf3uKzC5RRV/bVSGnxNnsFD4X+DwrKYrIo2PJN6mQt3YIivravRQWNcJVNQoJwUPUgf+ei4oMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614147; c=relaxed/simple;
	bh=NFxZeHhQxkMAZxLAEYMpZEvJwsaMa5hibmH+9+iTugg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6Z9cn0ubrOMSlNQs6apBE7MkebBNyDnwaq6E0R1kgRnOdAzsHcM36dMcqyT+ZE6tSoeOxdYAG+BwOR6+dXsNQJx38HU9Pr0ILQKgXsXLpwThirwukm3x7ZvPEnZoIv1vh2qOgIOZXm8QmE1PdspgXinKgYROL6Roxwh0nQkOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org; spf=none smtp.mailfrom=vimux.org; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: esmtpgz14t1772614116taaf34ea6
X-QQ-Originating-IP: hIugnVOhNtAhoE2XqvC26vgD/LFxxKo7NjOiWolM7A0=
Received: from localhost.localdomain ( [119.167.27.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Mar 2026 16:48:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12975140806639715596
EX-QQ-RecipientCnt: 8
From: Jialu Xu <xujialu@vimux.org>
To: linux-gpio@vger.kernel.org,
	netdev@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	krzk@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Jialu Xu <xujialu@vimux.org>
Subject: [PATCH 1/3] nfc: s3fwrn5: convert to gpio descriptors
Date: Wed,  4 Mar 2026 16:47:02 +0800
Message-ID: <7D8A09EB5A988115+20260304084808.440955-2-xujialu@vimux.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304084808.440955-1-xujialu@vimux.org>
References: <20260304084808.440955-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:vimux.org:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NS64fzUr6Xn9YAU9E0NzRY7rqB0Y61uMCdXblhjMZtzSc/Nqp8ojiayB
	Q1hOnZJy9wAoEP+BKCKebCUMeIU7oogt0TK8CwWoLREf9PWnrgJ0ZfGI3d7Wm6Z4V7piZ/4
	45VPrpEHC11QIp+8bcITShtQATS9oe4RWTC68H1WFUhu8NdFSgF05E2TXYjwjp19qBOvS1Z
	vP/F4nDjLVQjOCx+tfjRMPMxzD14O7yZXKJLFzjYmGUG51xwnqxq/ijSsyexZf6C+bQYb/g
	Qtzhvzv35LOWoFuqLtuRMfEBnSKl5IYlqzSOByUa/9V/DFAEFOlKutqrwaGc1nQiRlREGAS
	Apu8BZOYw8vCiV+vQRPFwqZY8V/geDuBfacBw4Skl3QQ4qt5AksL7hklCNrgBoGxUWRFlao
	dIJRrni5dTEhkWpRJ3V3LFe3CUiUFVoEI+4P8lQwRtNQefu1k4xw+pLuo500kmnb9OMNU8o
	Oy3PgVbrPx9MORjMKQE/DTDs3/0yqbAbsAO/5IuIIW1HNYjAbDfqIyi6DEwQqqkVTA2qHb8
	F00fL/Th50CU8/pDA1BespstlMHMJt1rUNGSIZiyrPlmn+hiB4WJoASoIQMyagJYhsjptwb
	qLlFANajLPDqbTrpEDoPn7wISfaCVqmKepP1XUmVF2H6I6n501zmlyOqDPzpxI3fvILivps
	QMKgvPPBcVP9xGUpH5QKNKAS4+mjT7G3s7vHxT7UICx/xlTi6jYTiHiGJM44PN+7GFeUDAA
	DyANk+elZB5dxCOtuq2M/Gp0wc1UDaovK2FpgLUQgc1ICuiKkZLAXORJtoSNPJHlrurlslh
	7bqoslmPM6/skzoKJ31GB/EGqDjZDcfIH0B6oQU5F7x9BQ1eAXN1FSZB5j3hKzjO5On8S3B
	N0zY9Ud0ExcDAmCgr65+wnGI30u1DlkfYdjDj6WhkmnNpO44vXcXKGFu1d7CBGgFx3yPkyk
	eHdO3RGqvaWZLSypNxcsirXiB5BKSJLxrnBxR1INZLkChaMduIGw2QTZt7n2DGVaQ5ZytOz
	zwGclabUBkDGWtKDTYlzUX38X9jlgpTvtwzlcoYGL15Lid29U4GaeNX43uNup7HCk9EAPF5
	A==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: E2F6C1FCEEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32443-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[vimux.org: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[xujialu@vimux.org,linux-gpio@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,vimux.org:mid,vimux.org:email]
X-Rspamd-Action: no action

Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 drivers/nfc/s3fwrn5/i2c.c        | 55 +++++---------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 11 +++----
 drivers/nfc/s3fwrn5/phy_common.h |  5 +--
 drivers/nfc/s3fwrn5/uart.c       | 45 +++++++-------------------
 4 files changed, 28 insertions(+), 88 deletions(-)

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


