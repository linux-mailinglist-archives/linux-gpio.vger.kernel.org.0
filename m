Return-Path: <linux-gpio+bounces-34236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNULB3FCxmlRIAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:40:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E134341230
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 09:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 033253019B94
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 08:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353E63D75A0;
	Fri, 27 Mar 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLTdRMVi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81436AB46;
	Fri, 27 Mar 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600650; cv=none; b=XYn4GLWozgFG4jJOlXjeMH0ozmDsTWDHq8jvqmMBRhbAeNgq1f7aqHDRaW/nRD47mf+CorkqJXMN3qZCvDrDJw8qTdEK4YXD8MqVItY+fmykne3OlihJ/huN3JyuKty+KYYijjndKozVQISC37GV2QoQzdBWka2I4aQlBd8VGY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600650; c=relaxed/simple;
	bh=+q1h5VFKKhJ4c0aTw+A6nTVOqEg9nRgPaKOLLg5nCaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M+zeDxddLt0FdoF3t3AH3605AesvBHsRzx5nRw1RWL8+aCDmpGmfqgOF/A5HQODR+2Z5mS9x9KFEAXGecM5Ued0drCqm53lulHBfhU9tEkfMuPzSnoXOPcADaj/UquHaDheQoicebR0/D6kQeybahOwD3v0r4U44c7u8RKhmoHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLTdRMVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE6FC19423;
	Fri, 27 Mar 2026 08:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774600649;
	bh=+q1h5VFKKhJ4c0aTw+A6nTVOqEg9nRgPaKOLLg5nCaw=;
	h=From:Date:Subject:To:Cc:From;
	b=YLTdRMViHSz9atckiNzi9FMwyPQaMzyi9ds4l/wRZ+V4me1XS+q46oN80X1NRADud
	 RwCvWmT0AgZ2bDUU2UjtJhQ8QMZqgWqhUnYhrDkqyDIshnqiMABrrGm2QQqdYuhVDQ
	 kf+1afebxVM9WIlrmOhR/tEFpdXbsyEYj7PneY+NAmD5BYno4U5jDkYQMHIQyv/SsD
	 ORo6744st5Kh5xewMTh7W8P8p5iUuEsXkWftlLAgCXeoJTTguxy/sE95S0m0CAA/zG
	 UN80U4hL2XbFyWTNXmmv5hsfLEcw1L4EERdL8vLdiDeCrm9SmkueJUWAEPluB8UMGJ
	 hdXJktBK7twQg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 09:37:26 +0100
Subject: [PATCH] mfd: si476x: Modernize GPIO handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-mfd-si476x-v1-1-93298ca35d6d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNz3dy0FN3iTBNzswrdlDQTSwOzNEtzQyNLJaCGgqLUtMwKsGHRsbW
 1ACDYsw5cAAAA
X-Change-ID: 20260327-mfd-si476x-df4906f97129
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34236-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E134341230
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index dd95c37ca134..e31c4433670a 100644
--- a/include/linux/mfd/si476x-core.h
+++ b/include/linux/mfd/si476x-core.h
@@ -14,6 +14,7 @@
 
 #include <linux/kfifo.h>
 #include <linux/atomic.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/mutex.h>
@@ -103,7 +104,7 @@ enum si476x_power_state {
  * @state: Current power state of the device.
  * @supplues: Structure containing handles to all power supplies used
  * by the device (NULL ones are ignored).
- * @gpio_reset: GPIO pin connectet to the RSTB pin of the chip.
+ * @reset: GPIO connected to the RSTB pin of the chip.
  * @pinmux: Chip's configurable pins configuration.
  * @diversity_mode: Chips role when functioning in diversity mode.
  * @status_monitor: Polling worker used in polling use case scenarion
@@ -139,7 +140,7 @@ struct si476x_core {
 
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
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-mfd-si476x-df4906f97129

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


