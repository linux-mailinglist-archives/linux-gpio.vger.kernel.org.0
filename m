Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A351F0CCA
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2020 18:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgFGQIe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jun 2020 12:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFGQIc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Jun 2020 12:08:32 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE89C08C5C3
        for <linux-gpio@vger.kernel.org>; Sun,  7 Jun 2020 09:08:31 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b5so7403556pfp.9
        for <linux-gpio@vger.kernel.org>; Sun, 07 Jun 2020 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=85AbGi9fTcBRS9rJ1LbFriCr652B+ElOdhlmIsvw78I=;
        b=mV1tCEjtK2WfwbkjMn+O9/leokFKWa4AZ3IgcLqJqduK/fMmC9hS7wX/Hr+J8ts3H7
         xSmUBhnn4oAKxx7G3iCx8WYCr6o1Fq3Hv3S9EC+MGpG1xz6gS1BENk5k0K9gZu039+Mk
         YgyLG5hrPFC6fECDn3rv/9qDgBnW+bdvpRv/j9QlybA/OU9bzAkLUfBmr4Q39pYs0nB+
         Gl0v8ZajwaKcoidO/Cu2q58A+jJPdH3humlPnhJcDCTiYiu7nIGgFqdocBRTzLAGUQNt
         ZypWJpVocWAXS9n7xtH3YKdcU/KPAmTpvWTS6PYUtD4Ty16l1XZ4QYqPVO2O9B+aTb+r
         kG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=85AbGi9fTcBRS9rJ1LbFriCr652B+ElOdhlmIsvw78I=;
        b=do6++F5YMzsvjdKQ7/nVD8NYvqKDn7eXMHV0/6JXUofOZEvruAJMetyXZb7HfPtDgp
         LItJzoHC/acy4QBPB6gDRE8cIoben9ONsvB8QToNEvD3Hi7OZF5sWxK0G8mlsI9nO+4r
         6K3wws6AWcrLGBdD256sM+S6tBtNbWYIPnehoQpnXaWM4352uNTe8l9vIiMz4Ty4VeMJ
         rp86B65cBotaLI2PVQ/Vai02P9+3799SZ8Zg++7ZnulbSr0OMkq2M4oevpmEaO7/KcRI
         Fyk2cZrc12mzTX21z/Xx+VzRMIg/zcDF9M3uwMDmzCfV0AqITEK57FZgWbd7ZNABqj2G
         NQBA==
X-Gm-Message-State: AOAM532lKnQTfHzcb39k1vWUaorCHdk/tIGqRpHSrZIABRtSkf2fHZR1
        uqPckAOs38cwrAMplUebTIki
X-Google-Smtp-Source: ABdhPJyoJrIzaCh/9XI3Un7SpZfUxgSnOl2+Hf6dHRKZYYKl7kZ2V3dTHDUBCiQFvoYlmJPgSURAaw==
X-Received: by 2002:a63:5a66:: with SMTP id k38mr16840647pgm.240.1591546110573;
        Sun, 07 Jun 2020 09:08:30 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e9a:8b0a:3d5e:1902:f17d:d125])
        by smtp.gmail.com with ESMTPSA id r202sm4739449pfr.185.2020.06.07.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:08:30 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip support
Date:   Sun,  7 Jun 2020 21:38:08 +0530
Message-Id: <20200607160809.20192-3-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607160809.20192-1-mani@kernel.org>
References: <20200607160809.20192-1-mani@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpiochip support for Maxlinear/Exar USB to serial converter
for controlling the available gpios.

Inspired from cp210x usb to serial converter driver.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 209 ++++++++++++++++++++++++++++++++-
 1 file changed, 208 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index bb7df79cc129..2240fbc9ea7f 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -10,6 +10,7 @@
  * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
  */
 
+#include <linux/gpio/driver.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -17,6 +18,18 @@
 #include <linux/usb.h>
 #include <linux/usb/serial.h>
 
+#ifdef CONFIG_GPIOLIB
+enum gpio_pins {
+	GPIO_RI = 0,
+	GPIO_CD,
+	GPIO_DSR,
+	GPIO_DTR,
+	GPIO_CTS,
+	GPIO_RTS,
+	GPIO_MAX,
+};
+#endif
+
 static void xr_set_termios(struct tty_struct *tty,
 			   struct usb_serial_port *port,
 			   struct ktermios *old_termios);
@@ -39,6 +52,11 @@ struct xr_uart_regs {
 };
 
 struct xr_port_private {
+#ifdef CONFIG_GPIOLIB
+	struct gpio_chip gc;
+	bool gpio_registered;
+	enum gpio_pins pin_status[GPIO_MAX];
+#endif
 	const struct xr_uart_regs *regs;
 	bool port_open;
 };
@@ -390,6 +408,13 @@ static void xr_set_flow_mode(struct tty_struct *tty,
 	 */
 	gpio_mode &= ~UART_MODE_GPIO_MASK;
 	if (cflag & CRTSCTS) {
+#ifdef CONFIG_GPIOLIB
+		/* Check if the CTS/RTS pins are occupied */
+		if (port_priv->pin_status[GPIO_RTS] ||
+		    port_priv->pin_status[GPIO_CTS])
+			return;
+#endif
+
 		dev_dbg(&port->dev, "Enabling hardware flow ctrl\n");
 		flow = UART_FLOW_MODE_HW;
 		gpio_mode |= UART_MODE_RTS_CTS;
@@ -497,6 +522,17 @@ static int xr_tiocmset_port(struct usb_serial_port *port,
 	u8 gpio_set = 0;
 	u8 gpio_clr = 0;
 
+#ifdef CONFIG_GPIOLIB
+	/* Check if the RTS/DTR pins are occupied */
+	if (set & TIOCM_RTS || clear & TIOCM_RTS)
+		if (port_priv->pin_status[GPIO_RTS])
+			return -EBUSY;
+
+	if (set & TIOCM_DTR || clear & TIOCM_DTR)
+		if (port_priv->pin_status[GPIO_DTR])
+			return -EBUSY;
+#endif
+
 	/* Modem control pins are active low, so set & clr are swapped */
 	if (set & TIOCM_RTS)
 		gpio_clr |= UART_MODE_RTS;
@@ -589,9 +625,175 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
 		   state);
 }
 
+#ifdef CONFIG_GPIOLIB
+
+static int xr_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	/*
+	 * Do not proceed if the port is open. This is done to avoid changing
+	 * the GPIO configuration used by the serial driver.
+	 */
+	if (port_priv->port_open)
+		return -EBUSY;
+
+	/* Mark the GPIO pin as busy */
+	port_priv->pin_status[offset] = true;
+
+	return 0;
+}
+
+static void xr_gpio_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	/* Mark the GPIO pin as free */
+	port_priv->pin_status[offset] = false;
+}
+
+static int xr_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+	u8 gpio_status;
+
+	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
+			 port_priv->regs->gpio_status, &gpio_status);
+	if (ret)
+		return ret;
+
+	return !!(gpio_status & BIT(gpio));
+}
+
+static void xr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	if (val)
+		xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
+			   port_priv->regs->gpio_set, BIT(gpio));
+	else
+		xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
+			   port_priv->regs->gpio_clr, BIT(gpio));
+}
+
+static int xr_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+	u8 gpio_dir;
+
+	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
+			 port_priv->regs->gpio_dir, &gpio_dir);
+	if (ret)
+		return ret;
+
+	/* Logic 0 = input and Logic 1 = output */
+	return !(gpio_dir & BIT(gpio));
+}
+
+static int xr_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+	u8 gpio_dir;
+
+	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
+			 port_priv->regs->gpio_dir, &gpio_dir);
+	if (ret)
+		return ret;
+
+	gpio_dir &= ~BIT(gpio);
+
+	return xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
+			  port_priv->regs->gpio_dir, gpio_dir);
+}
+
+static int xr_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
+				    int val)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+	u8 gpio_dir;
+
+	xr_gpio_set(gc, gpio, val);
+
+	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
+			 port_priv->regs->gpio_dir, &gpio_dir);
+	if (ret)
+		return ret;
+
+	gpio_dir |= BIT(gpio);
+
+	ret = xr_set_reg(port, XR21V141X_UART_REG_BLOCK,
+			 port_priv->regs->gpio_dir, gpio_dir);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int xr_gpio_init(struct usb_serial_port *port)
+{
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret = 0;
+
+	port_priv->gc.ngpio = 6;
+	port_priv->gc.label = "xr_gpios";
+	port_priv->gc.request = xr_gpio_request;
+	port_priv->gc.free = xr_gpio_free;
+	port_priv->gc.get_direction = xr_gpio_direction_get;
+	port_priv->gc.direction_input = xr_gpio_direction_input;
+	port_priv->gc.direction_output = xr_gpio_direction_output;
+	port_priv->gc.get = xr_gpio_get;
+	port_priv->gc.set = xr_gpio_set;
+	port_priv->gc.owner = THIS_MODULE;
+	port_priv->gc.parent = &port->dev;
+	port_priv->gc.base = -1;
+	port_priv->gc.can_sleep = true;
+
+	ret = gpiochip_add_data(&port_priv->gc, port);
+	if (!ret)
+		port_priv->gpio_registered = true;
+
+	return ret;
+}
+
+static void xr_gpio_remove(struct usb_serial_port *port)
+{
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	if (port_priv->gpio_registered) {
+		gpiochip_remove(&port_priv->gc);
+		port_priv->gpio_registered = false;
+	}
+}
+
+#else
+
+static int xr_gpio_init(struct usb_serial_port *port)
+{
+	return 0;
+}
+
+static void xr_gpio_remove(struct usb_serial_port *port)
+{
+}
+
+#endif
+
 static int xr_port_probe(struct usb_serial_port *port)
 {
 	struct xr_port_private *port_priv;
+	int ret;
 
 	port_priv = kzalloc(sizeof(*port_priv), GFP_KERNEL);
 	if (!port_priv)
@@ -602,13 +804,18 @@ static int xr_port_probe(struct usb_serial_port *port)
 
 	usb_set_serial_port_data(port, port_priv);
 
-	return 0;
+	ret = xr_gpio_init(port);
+	if (ret)
+		kfree(port_priv);
+
+	return ret;
 }
 
 static int xr_port_remove(struct usb_serial_port *port)
 {
 	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
 
+	xr_gpio_remove(port);
 	kfree(port_priv);
 
 	return 0;
-- 
2.17.1

