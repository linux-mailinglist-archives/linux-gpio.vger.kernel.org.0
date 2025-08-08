Return-Path: <linux-gpio+bounces-24097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 499DDB1EBC7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 17:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C1FAA0A6F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237112853FA;
	Fri,  8 Aug 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqMjSejV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB418285068;
	Fri,  8 Aug 2025 15:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754666656; cv=none; b=pyWwZF5gmGjqsJkKEGoxvdkDORC+d+yGIQKaJ4N0RTU6U+2RgU+ocwZH6ju7Ct1NrBDaeICpbNU+FQ5FWSyQv+T/akSBy7x4s18ZcrmeNo2vaMxYYNA6APkdzgxE+MXRBuiH9qmf0wRYzbD3dUpPQY4BEeO5/vHoBQ/JzyEPikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754666656; c=relaxed/simple;
	bh=Z6bqzKh73A7mDRbKN2x3ZXyov++aLEtSEolhGHyxyB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ketbXA8LZxzSXfv+ccgel671gY0WrgXS/fBdIGRzc+uImze1u0Kr5FpVf3ra78g5Ly4YiFadKKzjnAACzaJMhVkhvo6almsdAbA5Oy5cK5Me+FfUT6kOEcVSreqZ71iUP3QmQpmLlCwBoxP2zF65eG+j45YZoHlks4N+6rvuBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqMjSejV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A71C4CEED;
	Fri,  8 Aug 2025 15:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666656;
	bh=Z6bqzKh73A7mDRbKN2x3ZXyov++aLEtSEolhGHyxyB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqMjSejVYW8eeHalSrTc8ajJ06Vv7MhVmpcZFMsAHBbomw1S6tEVL+QUj/mWpdaO7
	 AOkYLldb4nraEYkt1dDprFcdXI3eO0o38qOW8v0VgDqgdLoacc7S4A6PL3WGn056Ru
	 an+RTTOCd3HBM1o1QclRT9Imb+JxPyrWWteW/5MeLPsX3GdJz1CWjmRmIwpWoasJkc
	 F+2ThC5HW7Z0HfEPVa4z6M4y2AKo3E9Tae5DT9WczuvVp6coEEmnFsPfscwTDcZV/9
	 p7T6FIDo2raNDaqLgzs+QBJh2hSTmu3DqcolGKhf70Ji3v7QYkwYga9nH8HYqagFCU
	 m5q8GKs1qsTQw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sumanth Gavini <sumanth.gavini@yahoo.com>,
	Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/21] nfc: s3fwrn5: convert to gpio descriptors
Date: Fri,  8 Aug 2025 17:18:02 +0200
Message-Id: <20250808151822.536879-19-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There is no need for this driver to still use the legacy interfaces,
so convert all the legacy calls into their modern equivalents.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/nfc/s3fwrn5/i2c.c        | 42 +++++++++-----------------------
 drivers/nfc/s3fwrn5/phy_common.c | 12 ++++-----
 drivers/nfc/s3fwrn5/phy_common.h |  4 +--
 drivers/nfc/s3fwrn5/uart.c       | 30 ++++++-----------------
 4 files changed, 28 insertions(+), 60 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 110d086cfe5b..411be709b397 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -8,7 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/of_gpio.h>
 #include <linux/of_irq.h>
@@ -149,29 +149,22 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
 static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
 {
 	struct s3fwrn5_i2c_phy *phy = i2c_get_clientdata(client);
-	struct device_node *np = client->dev.of_node;
+	struct device *dev = &client->dev;
 
-	if (!np)
-		return -ENODEV;
-
-	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_en)) {
+	phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
+	if (IS_ERR(phy->common.gpio_en)) {
 		/* Support also deprecated property */
-		phy->common.gpio_en = of_get_named_gpio(np,
-							"s3fwrn5,en-gpios",
-							0);
-		if (!gpio_is_valid(phy->common.gpio_en))
-			return -ENODEV;
+		phy->common.gpio_en = devm_gpiod_get(dev, "s3fwrn5,en", GPIOD_OUT_HIGH);
+		if (IS_ERR(phy->common.gpio_en))
+			return PTR_ERR(phy->common.gpio_en);
 	}
 
-	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
+	phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake)) {
 		/* Support also deprecated property */
-		phy->common.gpio_fw_wake = of_get_named_gpio(np,
-							     "s3fwrn5,fw-gpios",
-							     0);
-		if (!gpio_is_valid(phy->common.gpio_fw_wake))
-			return -ENODEV;
+		phy->common.gpio_fw_wake = devm_gpiod_get(dev, "s3fwrn5,fw", GPIOD_OUT_LOW);
+		if (IS_ERR(phy->common.gpio_fw_wake))
+			return PTR_ERR(phy->common.gpio_en);
 	}
 
 	return 0;
@@ -197,17 +190,6 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_en,
-				    GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
-	if (ret < 0)
-		return ret;
-
-	ret = devm_gpio_request_one(&phy->i2c_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
-	if (ret < 0)
-		return ret;
-
 	/*
 	 * S3FWRN5 depends on a clock input ("XI" pin) to function properly.
 	 * Depending on the hardware configuration this could be an always-on
diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
index deb2c039f0fd..e802b4e609c8 100644
--- a/drivers/nfc/s3fwrn5/phy_common.c
+++ b/drivers/nfc/s3fwrn5/phy_common.c
@@ -8,7 +8,7 @@
  * Bongsu Jeon <bongsu.jeon@samsung.com>
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 
@@ -19,7 +19,7 @@ void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
 	struct phy_common *phy = phy_id;
 
 	mutex_lock(&phy->mutex);
-	gpio_set_value(phy->gpio_fw_wake, wake);
+	gpiod_set_value(phy->gpio_fw_wake, wake);
 	if (wake)
 		msleep(S3FWRN5_EN_WAIT_TIME);
 	mutex_unlock(&phy->mutex);
@@ -33,14 +33,14 @@ bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode)
 
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
index 9cef25436bf9..5451f46f7e27 100644
--- a/drivers/nfc/s3fwrn5/phy_common.h
+++ b/drivers/nfc/s3fwrn5/phy_common.h
@@ -21,8 +21,8 @@
 struct phy_common {
 	struct nci_dev *ndev;
 
-	int gpio_en;
-	int gpio_fw_wake;
+	struct gpio_desc *gpio_en;
+	struct gpio_desc *gpio_fw_wake;
 
 	struct mutex mutex;
 
diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
index 9c09c10c2a46..39e3a64c4f4c 100644
--- a/drivers/nfc/s3fwrn5/uart.c
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -15,7 +15,7 @@
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/serdev.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of_gpio.h>
 
 #include "phy_common.h"
@@ -91,18 +91,15 @@ MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
 static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
 {
 	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
-	struct device_node *np = serdev->dev.of_node;
+	struct device *dev = &serdev->dev;
 
-	if (!np)
-		return -ENODEV;
+	phy->common.gpio_en = devm_gpiod_get(dev, "en", GPIOD_OUT_HIGH);
+	if (IS_ERR(phy->common.gpio_en))
+		return PTR_ERR(phy->common.gpio_en);
 
-	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_en))
-		return -ENODEV;
-
-	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
-	if (!gpio_is_valid(phy->common.gpio_fw_wake))
-		return -ENODEV;
+	phy->common.gpio_fw_wake = devm_gpiod_get(dev, "wake", GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake))
+		return PTR_ERR(phy->common.gpio_fw_wake);
 
 	return 0;
 }
@@ -144,17 +141,6 @@ static int s3fwrn82_uart_probe(struct serdev_device *serdev)
 	if (ret < 0)
 		goto err_serdev;
 
-	ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
-				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
-	if (ret < 0)
-		goto err_serdev;
-
-	ret = devm_gpio_request_one(&phy->ser_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
-	if (ret < 0)
-		goto err_serdev;
-
 	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
 			    &uart_phy_ops);
 	if (ret < 0)
-- 
2.39.5


