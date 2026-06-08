Return-Path: <linux-gpio+bounces-38082-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xQR3N+2HJmrxYAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38082-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:14:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB465476F
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="W+P/s/xX";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38082-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38082-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6826308CDEA
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A414F3B440F;
	Mon,  8 Jun 2026 08:57:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1633BE154;
	Mon,  8 Jun 2026 08:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909059; cv=none; b=mwCwmiGruLuuDRRtfr9GoGF1v2Y4BzEmKZv5Kz/FEn3Gznb8XYmMnmvLFh8KBzPGNl/6r/RHWGP9vH6lqKdqnyVYZB7xJ+rY+TzglRZGZMVC1SCzcPDCVeUG/LdoUjLB3T7iRGQWUZ0MdkAJH/H5MBMP41kkZNbbG4WG7NjcluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909059; c=relaxed/simple;
	bh=kLrzzxUb7Kiq+kyax2kyh90MCoyVOtb1Y+7dKQjuKxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IIItuiUtUjsKik0pGo2L2oD86BAEdyV/oR1ArEcyHdSbIgg8BxM7s32YSUlXMcorP5N8Ejw8aAH8BGWbjxrP2mE2N4lTo/gpUdNbG/wj01w63oUPRc63Dv4uOopWH2G1hvdwIxEzQ2VMCjsXQeGXscvqsm3yXsyw+azGxF2jYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+P/s/xX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805821F00893;
	Mon,  8 Jun 2026 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909057;
	bh=3TVcuwQxISZoGZ5PaenSL7IuOioMxPNB63r7oCdyWT0=;
	h=From:Date:Subject:To:Cc;
	b=W+P/s/xXK9f8DI344rdpXbQnkpZkIUbmg/GBMFY9TkOuoWyvkszKH0+C92cZ7tTDT
	 iqG7Iq++yZRGgimQyGr+I6YCq/R9B119w9381CLsM79NKLoMXtfO95JKMTGMuvAKTm
	 /BHM1jc8RPzEJFJN0m6nUUdu0A43OC6bkuAyjgSdNK1pRSq9GW6xl735tiUi5BvxTK
	 Mqj5Hi65ifGdq24Tm6frPahi1wyaxWOd3sqfnzydRdWGVyvVSXH6trbD6q2uhwTS9L
	 GuFsM7HAgvHfKAkTKJ3SDENKiqFcpGw0gLCccOGRJGRKcpYAYkKxbuEeHzdXmFOJwY
	 8dLwNtO8BfmGg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 08 Jun 2026 10:57:34 +0200
Subject: [PATCH v2] mfd: si476x: Modernize GPIO handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSw7CIBSF4a00dyyGRwVx5D5MB025tDcqGDCkp
 mHvYscO/5Ocb4OMiTDDpdsgYaFMMbSQhw6mZQwzMnKtQXKpuZKGPb1jmXqjV+Z8b7n21ghpoR1
 eCT2tO3YbWi+U3zF9druI3/qXKYIJZpW052lUJ6fd9Y4p4OMY0wxDrfUL9D6xz6UAAAA=
X-Change-ID: 20260327-mfd-si476x-df4906f97129
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.smirnov@gmail.com,m:lee@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:andrewsmirnov@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38082-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8FB465476F

The SI476X driver depends on the legacy GPIO API. As it only
really use a single GPIO for reset, and this can be easily converted
to use a GPIO descriptor, modernize the driver.

The "reset" GPIO is obtained from a device property, such as a
device tree ("reset-gpios", which is standard, but this hardware has
no DT bindings as of now) or a software node for static platforms.

Out-of-tree users can easily adopt to providing a GPIO descriptor
this way.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Rebase on v7.1-rc1
- Link to v1: https://lore.kernel.org/r/20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org
---
 drivers/mfd/Kconfig                 |  1 -
 drivers/mfd/si476x-cmd.c            |  1 -
 drivers/mfd/si476x-i2c.c            | 46 +++++++++++++------------------------
 include/linux/mfd/si476x-core.h     |  5 ++--
 include/linux/mfd/si476x-platform.h |  2 --
 5 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..a5fd07366d8c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1468,7 +1468,6 @@ config MFD_SEC_I2C
 config MFD_SI476X_CORE
 	tristate "Silicon Laboratories 4761/64/68 AM/FM radio."
 	depends on I2C
-	depends on GPIOLIB_LEGACY
 	select MFD_CORE
 	select REGMAP_I2C
 	help
diff --git a/drivers/mfd/si476x-cmd.c b/drivers/mfd/si476x-cmd.c
index 3bb2decfebd3..58e9bea7e90a 100644
--- a/drivers/mfd/si476x-cmd.c
+++ b/drivers/mfd/si476x-cmd.c
@@ -15,7 +15,6 @@
 #include <linux/atomic.h>
 #include <linux/i2c.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
 #include <linux/videodev2.h>
 
 #include <linux/mfd/si476x-core.h>
diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 899c0b5ea3aa..d9ef1776a703 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/i2c.h>
 #include <linux/err.h>
@@ -130,8 +130,8 @@ int si476x_core_start(struct si476x_core *core, bool soft)
 	int err;
 
 	if (!soft) {
-		if (gpio_is_valid(core->gpio_reset))
-			gpio_set_value_cansleep(core->gpio_reset, 1);
+		if (core->reset)
+			gpiod_set_value_cansleep(core->reset, 0);
 
 		if (client->irq)
 			enable_irq(client->irq);
@@ -197,8 +197,8 @@ int si476x_core_start(struct si476x_core *core, bool soft)
 	else
 		cancel_delayed_work_sync(&core->status_monitor);
 
-	if (gpio_is_valid(core->gpio_reset))
-		gpio_set_value_cansleep(core->gpio_reset, 0);
+	if (core->reset)
+		gpiod_set_value_cansleep(core->reset, 1);
 
 	return err;
 }
@@ -243,8 +243,8 @@ int si476x_core_stop(struct si476x_core *core, bool soft)
 		cancel_delayed_work_sync(&core->status_monitor);
 
 	if (!soft) {
-		if (gpio_is_valid(core->gpio_reset))
-			gpio_set_value_cansleep(core->gpio_reset, 0);
+		if (core->reset)
+			gpiod_set_value_cansleep(core->reset, 1);
 	}
 	return err;
 }
@@ -712,24 +712,18 @@ static int si476x_core_probe(struct i2c_client *client)
 	atomic_set(&core->is_alive, 0);
 	core->power_state = SI476X_POWER_DOWN;
 
+	core->reset = devm_gpiod_get_optional(&client->dev, "reset",
+					      GPIOD_OUT_HIGH);
+	if (IS_ERR(core->reset))
+		return dev_err_probe(&client->dev, PTR_ERR(core->reset),
+				     "error getting reset GPIO\n");
+	gpiod_set_consumer_name(core->reset, "si476x reset");
+
 	pdata = dev_get_platdata(&client->dev);
 	if (pdata) {
 		memcpy(&core->power_up_parameters,
 		       &pdata->power_up_parameters,
 		       sizeof(core->power_up_parameters));
-
-		core->gpio_reset = -1;
-		if (gpio_is_valid(pdata->gpio_reset)) {
-			rval = gpio_request(pdata->gpio_reset, "si476x reset");
-			if (rval) {
-				dev_err(&client->dev,
-					"Failed to request gpio: %d\n", rval);
-				return rval;
-			}
-			core->gpio_reset = pdata->gpio_reset;
-			gpio_direction_output(core->gpio_reset, 0);
-		}
-
 		core->diversity_mode = pdata->diversity_mode;
 		memcpy(&core->pinmux, &pdata->pinmux,
 		       sizeof(struct si476x_pinmux));
@@ -748,7 +742,7 @@ static int si476x_core_probe(struct i2c_client *client)
 				       core->supplies);
 	if (rval) {
 		dev_err(&client->dev, "Failed to get all of the regulators\n");
-		goto free_gpio;
+		return rval;
 	}
 
 	mutex_init(&core->cmd_lock);
@@ -761,7 +755,7 @@ static int si476x_core_probe(struct i2c_client *client)
 			   GFP_KERNEL);
 	if (rval) {
 		dev_err(&client->dev, "Could not allocate the FIFO\n");
-		goto free_gpio;
+		return rval;
 	}
 	mutex_init(&core->rds_drainer_status_lock);
 	init_waitqueue_head(&core->rds_read_queue);
@@ -827,11 +821,6 @@ static int si476x_core_probe(struct i2c_client *client)
 
 free_kfifo:
 	kfifo_free(&core->rds_fifo);
-
-free_gpio:
-	if (gpio_is_valid(core->gpio_reset))
-		gpio_free(core->gpio_reset);
-
 	return rval;
 }
 
@@ -848,9 +837,6 @@ static void si476x_core_remove(struct i2c_client *client)
 		cancel_delayed_work_sync(&core->status_monitor);
 
 	kfifo_free(&core->rds_fifo);
-
-	if (gpio_is_valid(core->gpio_reset))
-		gpio_free(core->gpio_reset);
 }
 
 
diff --git a/include/linux/mfd/si476x-core.h b/include/linux/mfd/si476x-core.h
index e913b2cdf77d..d9e3a322134c 100644
--- a/include/linux/mfd/si476x-core.h
+++ b/include/linux/mfd/si476x-core.h
@@ -14,6 +14,7 @@
 
 #include <linux/kfifo.h>
 #include <linux/atomic.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/mutex.h>
@@ -104,7 +105,7 @@ enum si476x_power_state {
  * @power_state: Current power state of the device.
  * @supplies: Structure containing handles to all power supplies used
  * by the device (NULL ones are ignored).
- * @gpio_reset: GPIO pin connectet to the RSTB pin of the chip.
+ * @reset: GPIO connected to the RSTB pin of the chip.
  * @pinmux: Chip's configurable pins configuration.
  * @diversity_mode: Chips role when functioning in diversity mode.
  * @is_alive: Chip is initialized and active.
@@ -142,7 +143,7 @@ struct si476x_core {
 
 	struct regulator_bulk_data supplies[4];
 
-	int gpio_reset;
+	struct gpio_desc *reset;
 
 	struct si476x_pinmux pinmux;
 	enum si476x_phase_diversity_mode diversity_mode;
diff --git a/include/linux/mfd/si476x-platform.h b/include/linux/mfd/si476x-platform.h
index cb99e16ca947..f9e1f6b27277 100644
--- a/include/linux/mfd/si476x-platform.h
+++ b/include/linux/mfd/si476x-platform.h
@@ -246,8 +246,6 @@ enum si476x_phase_diversity_mode {
  * Platform dependent definition
  */
 struct si476x_platform_data {
-	int gpio_reset; /* < 0 if not used */
-
 	struct si476x_power_up_args power_up_parameters;
 	enum si476x_phase_diversity_mode diversity_mode;
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260327-mfd-si476x-df4906f97129

Best regards,
--  
Linus Walleij <linusw@kernel.org>


