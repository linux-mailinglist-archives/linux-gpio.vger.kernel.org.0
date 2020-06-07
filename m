Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170231F0CEE
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jun 2020 18:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgFGQYT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Jun 2020 12:24:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:49672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgFGQYS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 7 Jun 2020 12:24:18 -0400
Received: from localhost.localdomain (unknown [157.51.228.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7DFBC2073B;
        Sun,  7 Jun 2020 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591547057;
        bh=VwTciOsPdwIznP882bNkgfO9ZutZE/C70sq9o+aR3Os=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=w6kcexPMNJ1A58fGblJMwqTr0e+m7nSP6m42prtENfvNNuhAzn2IArGNx80Jq9JM+
         +yhPqflQeowkOroGMQ9mrzlUMyqDj1beRjql/mnHwU+JGruMIwhhOLt8u2vqr59Vlz
         TTqrLy7ioAX0VxmJkBeHIpg/AOwdKmj36U7B4k4g=
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-gpio@vger.kernel.org
Subject: [RESEND PATCH v4 2/3] usb: serial: xr_serial: Add gpiochip support
Date:   Sun,  7 Jun 2020 21:53:49 +0530
Message-Id: <20200607162350.21297-3-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607162350.21297-1-mani@kernel.org>
References: <20200607162350.21297-1-mani@kernel.org>
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

