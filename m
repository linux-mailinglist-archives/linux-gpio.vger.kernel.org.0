Return-Path: <linux-gpio+bounces-35139-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM6LI58X3mlBmwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35139-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 12:31:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 936213F8B92
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 12:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5EF8302B5A9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 10:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C323D5236;
	Tue, 14 Apr 2026 10:23:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15113D3D1D
	for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162236; cv=none; b=Flo/s2X5ax1kMG1RUdm8Olnoz11Gb2z1Go+LBmJoFiFjh9SnSH6HiyJMJ7Xr+KUw3AjFhGELiH0JZTfSCetr3htadByaSiG0jj44KpcZqjfNjWT0yhsI0Dn+HFGQgF2uLcAlpBNtxd03WjddJbfeldMU9jFYYmGzjAIKyd6e0Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162236; c=relaxed/simple;
	bh=kXxYyFY2N/cEQFJ8qJDkGUJKJ4FyU6QZbTb+jig8aIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rI58n6A4tSAxQYGCTKorA/ITd9pINoaX+SKoUIFUgRJpiksU0yX8vRxhQahksHsqgvsW0ePFh3v8qZIRJ8HRIqwPJeEkHgPCVsFszF/+XafE/Xu8QStbW0YzBMA+AM5tZUChFPKcyi8Ij8HT9NEiZw5NngPRCLuUJ+m+YcUExXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf8fe9c2aso3336473f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Apr 2026 03:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162229; x=1776767029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agEPNcn5UfOsWzLW0MOgaJUmP7o4DXe8RlSLgKzjHg4=;
        b=K4CsPEy9dAlm2wDvuok65qGkEdkJBumSEvQXSRcGUwgHS6ITxuHdBncIyULqd7mPDY
         9okc4ynBBCpnNEFzoLCTjgBRqmhk45n9/cTsQs4cdwQaRJhoqiva0RwpUJNki5b7f86y
         yTWxOyKikfRyft3a+zUnybgCSIDJOFq8Fkz2NZzz4/Q38W3P+ySAWLRQb4s2hL43EGpG
         sRxHZyM4PNdAmntUAZV8bf1ODIEKt/jJ9nsuVM1m6Z5N0E2yW52F3KFAVHHgcRHU96VI
         mo9X2bCiz+ypurZ/JDzHxU0FEEDG0y4njqZQyb/02v9CcdhhhRe2fxkW7bOgP5VI2EFJ
         d5EA==
X-Forwarded-Encrypted: i=1; AFNElJ/lqfK2CGbNVZq7VLAvZATyP8eT/rdzySxNyxskDKORupg6+IcxL9xMb7eKgOGglnpNP9Yi2o7UvSwz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxza7FsF3pKvhOEjGUb00frd1Y+PF8g3/GDE/Qm5UL2YGP/h1ga
	UIdkyG7cZJXYsIDrfgUhZxdK24f34ouSyHlPvfk43rXTZZgKScgoIo7o
X-Gm-Gg: AeBDieuRnYBQV0/njE7Goveshcn/ZNQ/u6I5Xn2ttn+eZRSqvUWQQFD244m5/4h/Qpw
	kifcxtqO90pVPNpVk2YZ8cgC64znOASq+AR1TSrU+qUsgp4xchBeOx+38o1pqQTT2KwiwN5JRe1
	9qCfm7CBjDeawdjZ7Y3qkzAPCN/glPPbNnseqIE2c6KEf2Mggi0vLLzC6xMPvOGrMZaxRf8y88W
	7e+uWulGqKIOUZcCvoLNUjoAk4gcr6jjNBOXIY7E9kkvIX4x8y2ZQ0u5AtoklChUKji7xBJGGmK
	KxtLDnGhYNzSciLhFFcnz4+UeP/w1c74tD9xpmJWBTJxm0a6/Z2bxtywka+CsZSlH9ZH51bLtAq
	uySKqw3N5zCGICqcBujF8dZoGQLx40MiOgRluvOunU9WYDiZMdEfZd+l7vtmiTVaMnWo8fbN5jI
	yC9wXvxYd1umg+1Rf8QeUr/3ErKF+nl/t04ayGf9bdaK+wF3lD33TgJPdEV9psH3vw5sNRvh7Wm
	mXNtrOd2Gaxkp9OnOW3SrlBGY0/M4aQeBJgOmSbFxCdaldhtXuT9Av0+sbIcQ7fCykJWHU=
X-Received: by 2002:a5d:5d83:0:b0:43b:40ef:5d1a with SMTP id ffacd0b85a97d-43d642552e7mr23917731f8f.5.1776162228496;
        Tue, 14 Apr 2026 03:23:48 -0700 (PDT)
Received: from localhost.localdomain (host-79-18-131-221.retail.telecomitalia.it. [79.18.131.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d750f0ca9sm21461453f8f.37.2026.04.14.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:23:48 -0700 (PDT)
From: deep@crimson.net.eu.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	netdev@vger.kernel.org,
	linux-nfc@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] nfc: s3fwrn5: switch to GPIO descriptor API
Date: Tue, 14 Apr 2026 12:22:57 +0200
Message-ID: <20260414102257.365421-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[crimson.net.eu.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35139-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deep@crimson.net.eu.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 936213F8B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

I am working on cleaning up some legacy GPIO usage in the NFC subsystem.
This patch converts the s3fwrn5 driver to use the modern descriptor based
GPIO API instead of the old integer based one.

Specifically:
- I changed the gpio_en and gpio_fw_wake types to struct gpio_desc.
- Replaced the manual DT parsing with devm_gpiod_get() in the probe
functions.
- Updated the calls in phy_common.c to use gpiod_set_value().

This also allowed me to remove the s3fwrn5_i2c_parse_dt and
s3fwrn82_uart_parse_dt functions as they are no longer needed with the
new API.

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
I have verified that this patch builds successfully with "make M=drivers/nfc/s3fwrn5"
"scripts/checkpatch.pl" with no errors or warnings.
This is very complicated stuff, but I am learning a lot by doing these cleanup works.
I really hope I can contribute as much as possible to this environment, little by little.
---
 drivers/nfc/s3fwrn5/i2c.c        | 58 ++++++--------------------------
 drivers/nfc/s3fwrn5/phy_common.c | 12 +++----
 drivers/nfc/s3fwrn5/phy_common.h |  5 +--
 drivers/nfc/s3fwrn5/uart.c       | 43 ++++++-----------------
 4 files changed, 31 insertions(+), 87 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
index 110d086cfe5b..a629fbcd3237 100644
--- a/drivers/nfc/s3fwrn5/i2c.c
+++ b/drivers/nfc/s3fwrn5/i2c.c
@@ -8,9 +8,8 @@
 
 #include <linux/clk.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/module.h>
 
@@ -146,37 +145,6 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
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
@@ -193,21 +161,17 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client)
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
-
-	ret = devm_gpio_request_one(&phy->i2c_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
-	if (ret < 0)
-		return ret;
+	phy->common.gpio_en = devm_gpiod_get(&client->dev, "en", GPIOD_OUT_HIGH);
+	if (IS_ERR(phy->common.gpio_en)) {
+		return dev_err_probe(&client->dev, PTR_ERR(phy->common.gpio_en),
+				"Failed to get EN gpio\n");
+	}
 
+	phy->common.gpio_fw_wake = devm_gpiod_get(&client->dev, "wake", GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake)) {
+		return dev_err_probe(&client->dev, PTR_ERR(phy->common.gpio_fw_wake),
+			     "Failed to get WAKE gpio\n");
+	}
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
index 9cef25436bf9..10210a8fd755 100644
--- a/drivers/nfc/s3fwrn5/phy_common.h
+++ b/drivers/nfc/s3fwrn5/phy_common.h
@@ -13,6 +13,7 @@
 
 #include <linux/mutex.h>
 #include <net/nfc/nci_core.h>
+#include <linux/gpio/consumer.h>
 
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
index 4ee481bd7e96..5a7c7741a881 100644
--- a/drivers/nfc/s3fwrn5/uart.c
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -15,8 +15,7 @@
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/serdev.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "phy_common.h"
 
@@ -92,25 +91,6 @@ static const struct of_device_id s3fwrn82_uart_of_match[] = {
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
@@ -144,20 +124,19 @@ static int s3fwrn82_uart_probe(struct serdev_device *serdev)
 
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
+		ret = dev_err_probe(&serdev->dev, PTR_ERR(phy->common.gpio_en),
+			     "failed to get en gpio\n");
 		goto err_serdev;
+	}
 
-	ret = devm_gpio_request_one(&phy->ser_dev->dev,
-				    phy->common.gpio_fw_wake,
-				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
-	if (ret < 0)
+	phy->common.gpio_fw_wake = devm_gpiod_get(&serdev->dev, "wake", GPIOD_OUT_LOW);
+	if (IS_ERR(phy->common.gpio_fw_wake)) {
+		ret = dev_err_probe(&serdev->dev, PTR_ERR(phy->common.gpio_fw_wake),
+			     "failed to get wake gpio\n");
 		goto err_serdev;
+	}
 
 	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
 			    &uart_phy_ops);
-- 
2.43.0


