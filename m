Return-Path: <linux-gpio+bounces-15085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EACA21666
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 03:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 813C83A7C08
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2025 02:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5C81885A1;
	Wed, 29 Jan 2025 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Ycylsr08"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946FF17BBF;
	Wed, 29 Jan 2025 02:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738116060; cv=none; b=p9XfU/gfKPXsJtAn+8ISbB62ODrMdrZiuJNj5QO2nXXLLGzJx71cv4flv/V/M8zYGKA8L3vhazygiimuE/znl3G5+gCkPgqQzsc4WjpkB8OR0zIgwzm6eda/19m/SIRXSwkLFOOqz1bTAUDq38JjgvbSIEszIyRDjNpPdgM2ZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738116060; c=relaxed/simple;
	bh=RaqBulTZOLeegNE8RE5X8LkjAfK6V+c1XKWQ745Mg0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+kvcgvdA0/93+w2Avi4wgPoI1S84h77sicvAHa+gZK0c0fZyUiiAkrBx+OyCWO860QC4fN4G++VDRBV0jhohXBFyUDMTvUzsDwHSeZzY9gcYscEodMddS7Xwi+4CHYL0fK/vaWJ2ym2GrTN151IslS7z4NBazqGIV5jXqc3ZYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Ycylsr08; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=2FG6+j1guCeOhnzvG6QMzHA1GAyZ494fEzLUuhtnjX0=; b=Ycylsr08kdMRTqH5
	37c8Bl2cK3LKEItDOViQ7XESsbPOATeTHMc+Rvp0m3FgWgDp9I+ZlpvDPCTuAaVzEQ7vkoJTArGwQ
	omzPCYESpwqtgtZYnv2idw2egbJH6eT6RpfNMns0l3KhfKHaBUjoQKenlrreSl6fnhKvIOBRYY0mF
	VLV7ZKLty1mqveLSLJjOpcLdlRy+mHBwAK1M/n5Wb/WJ5p7GH8hyt41y7+ak+aQ5SPbGLX5nTQRsN
	nMgTPz1e9yDtlZd7wxxqb7A+lJ1cvOM6tekT8Frr3woTZzLZU1u7VDsKwej5J4nfkgpOPCgGg2jyo
	NC4/0hhuxFkXenRcUg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tcxNp-00CZe9-0r;
	Wed, 29 Jan 2025 02:00:49 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: corbet@lwn.net,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] serial: mctrl_gpio: Remove unused mctrl_gpio_free
Date: Wed, 29 Jan 2025 02:00:48 +0000
Message-ID: <20250129020048.245529-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mctrl_gpio_free() was added in 2014 by
commit 84130aace839 ("tty/serial: Add GPIOLIB helpers for controlling
modem lines")

It does have a comment saying:
  '- * Normally, this function will not be called, as the GPIOs will
   - * be disposed of by the resource management code.'

indeed, it doesn't seem to have been used since it was added.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 Documentation/driver-api/serial/driver.rst |  2 +-
 drivers/tty/serial/serial_mctrl_gpio.c     | 28 +---------------------
 drivers/tty/serial/serial_mctrl_gpio.h     | 16 ++-----------
 3 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/Documentation/driver-api/serial/driver.rst b/Documentation/driver-api/serial/driver.rst
index 84b43061c11b..df353211fc6b 100644
--- a/Documentation/driver-api/serial/driver.rst
+++ b/Documentation/driver-api/serial/driver.rst
@@ -101,6 +101,6 @@ Modem control lines via GPIO
 Some helpers are provided in order to set/get modem control lines via GPIO.
 
 .. kernel-doc:: drivers/tty/serial/serial_mctrl_gpio.c
-   :identifiers: mctrl_gpio_init mctrl_gpio_free mctrl_gpio_to_gpiod
+   :identifiers: mctrl_gpio_init mctrl_gpio_to_gpiod
            mctrl_gpio_set mctrl_gpio_get mctrl_gpio_enable_ms
            mctrl_gpio_disable_ms
diff --git a/drivers/tty/serial/serial_mctrl_gpio.c b/drivers/tty/serial/serial_mctrl_gpio.c
index 8855688a5b6c..85c172ad1de9 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -217,7 +217,7 @@ static irqreturn_t mctrl_gpio_irq_handle(int irq, void *context)
  *
  * This will get the {cts,rts,...}-gpios from device tree if they are present
  * and request them, set direction etc, and return an allocated structure.
- * `devm_*` functions are used, so there's no need to call mctrl_gpio_free().
+ * `devm_*` functions are used, so there's no need to explicitly free.
  * As this sets up the irq handling, make sure to not handle changes to the
  * gpio input lines in your driver, too.
  */
@@ -267,32 +267,6 @@ struct mctrl_gpios *mctrl_gpio_init(struct uart_port *port, unsigned int idx)
 }
 EXPORT_SYMBOL_GPL(mctrl_gpio_init);
 
-/**
- * mctrl_gpio_free - explicitly free uart gpios
- * @dev: uart port's device
- * @gpios: gpios structure to be freed
- *
- * This will free the requested gpios in mctrl_gpio_init(). As `devm_*`
- * functions are used, there's generally no need to call this function.
- */
-void mctrl_gpio_free(struct device *dev, struct mctrl_gpios *gpios)
-{
-	enum mctrl_gpio_idx i;
-
-	if (gpios == NULL)
-		return;
-
-	for (i = 0; i < UART_GPIO_MAX; i++) {
-		if (gpios->irq[i])
-			devm_free_irq(gpios->port->dev, gpios->irq[i], gpios);
-
-		if (gpios->gpio[i])
-			devm_gpiod_put(dev, gpios->gpio[i]);
-	}
-	devm_kfree(dev, gpios);
-}
-EXPORT_SYMBOL_GPL(mctrl_gpio_free);
-
 /**
  * mctrl_gpio_enable_ms - enable irqs and handling of changes to the ms lines
  * @gpios: gpios to enable
diff --git a/drivers/tty/serial/serial_mctrl_gpio.h b/drivers/tty/serial/serial_mctrl_gpio.h
index fc76910fb105..ec4170084766 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.h
+++ b/drivers/tty/serial/serial_mctrl_gpio.h
@@ -59,7 +59,7 @@ struct gpio_desc *mctrl_gpio_to_gpiod(struct mctrl_gpios *gpios,
 /*
  * Request and set direction of modem control line GPIOs and set up irq
  * handling.
- * devm_* functions are used, so there's no need to call mctrl_gpio_free().
+ * devm_* functions are used, so there's no need to explicitly free.
  * Returns a pointer to the allocated mctrl structure if ok, -ENOMEM on
  * allocation error.
  */
@@ -67,20 +67,13 @@ struct mctrl_gpios *mctrl_gpio_init(struct uart_port *port, unsigned int idx);
 
 /*
  * Request and set direction of modem control line GPIOs.
- * devm_* functions are used, so there's no need to call mctrl_gpio_free().
+ * devm_* functions are used, so there's no need to explicitly free.
  * Returns a pointer to the allocated mctrl structure if ok, -ENOMEM on
  * allocation error.
  */
 struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev,
 					   unsigned int idx);
 
-/*
- * Free the mctrl_gpios structure.
- * Normally, this function will not be called, as the GPIOs will
- * be disposed of by the resource management code.
- */
-void mctrl_gpio_free(struct device *dev, struct mctrl_gpios *gpios);
-
 /*
  * Enable gpio interrupts to report status line changes.
  */
@@ -139,11 +132,6 @@ struct mctrl_gpios *mctrl_gpio_init_noauto(struct device *dev, unsigned int idx)
 	return NULL;
 }
 
-static inline
-void mctrl_gpio_free(struct device *dev, struct mctrl_gpios *gpios)
-{
-}
-
 static inline void mctrl_gpio_enable_ms(struct mctrl_gpios *gpios)
 {
 }
-- 
2.48.1


