Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656CA1C0527
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 20:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgD3Str (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 14:49:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:33224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbgD3Stq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 14:49:46 -0400
Received: from localhost.localdomain (unknown [157.46.61.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC87F2082E;
        Thu, 30 Apr 2020 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588272585;
        bh=Z6DECa7N8G4+bwjZsfqnOxuuzgQZyt8hmyoOawef5xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FpLxQ6NR39VtsF7sVE7koAHKegDdLo317LgxLx6dQHfz5lvwHPrTqQ3So9NUuLaSE
         76TfWZBSHsdO4MfDUu0PZNOgir/Fy/OxSwocrA00jYrJlUEx5Oez0kDqcmPGu/9rLz
         8S75MG8mWvu65KDHrBoipBMLFdVybMw6KUbstnaA=
From:   mani@kernel.org
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, Manivannan Sadhasivam <mani@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/2] usb: serial: xr_serial: Add gpiochip support
Date:   Fri,  1 May 2020 00:19:24 +0530
Message-Id: <20200430184924.31690-3-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430184924.31690-1-mani@kernel.org>
References: <20200430184924.31690-1-mani@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Manivannan Sadhasivam <mani@kernel.org>

Add gpiochip support for Maxlinear/Exar USB to serial converter
for controlling the available gpios.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 199 ++++++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index fdb9ddf8bd95..255a30540b52 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
  */
 
+#include <linux/gpio/driver.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -32,6 +33,11 @@ struct xr_uart_regs {
 };
 
 struct xr_port_private {
+#ifdef CONFIG_GPIOLIB
+	struct gpio_chip gc;
+	bool gpio_registered;
+	u8 gpio_altfunc;
+#endif
 	const struct xr_uart_regs *regs;
 };
 
@@ -562,6 +568,196 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
 		   state);
 }
 
+#ifdef CONFIG_GPIOLIB
+
+static int xr_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	/* Check if the requested GPIO is occupied */
+	if (port_priv->gpio_altfunc & BIT(offset))
+		return -ENODEV;
+
+	return 0;
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
+	xr_gpio_set(gc, gpio, val);
+
+	return 0;
+}
+
+static int xr21v141x_gpio_init(struct usb_serial_port *port)
+{
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret;
+	u8 gpio_mode;
+
+	port_priv->gc.ngpio = 6;
+
+	ret = xr_get_reg(port, XR21V141X_UART_REG_BLOCK,
+			 port_priv->regs->gpio_mode, &gpio_mode);
+	if (ret)
+		return ret;
+
+	/* Mark all pins which are not in GPIO mode */
+	if (gpio_mode & UART_MODE_RTS_CTS)
+		port_priv->gpio_altfunc |= (BIT(4) | BIT(5));
+	else if (gpio_mode & UART_MODE_DTR_DSR)
+		port_priv->gpio_altfunc |= (BIT(2) | BIT(3));
+	else if (gpio_mode & UART_MODE_RS485)
+		port_priv->gpio_altfunc |= BIT(5);
+	else if (gpio_mode & UART_MODE_RS485_ADDR)
+		port_priv->gpio_altfunc |= BIT(5);
+	else
+		port_priv->gpio_altfunc = 0; /* All GPIOs are available */
+
+	return ret;
+}
+
+static int xr_gpio_init(struct usb_serial_port *port)
+{
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	int ret = 0;
+	u16 pid;
+
+	/* Don't register gpiochip for interface 0 */
+	if (port->minor == 0)
+		return ret;
+
+	pid = le16_to_cpu(serial->dev->descriptor.idProduct);
+
+	ret = xr21v141x_gpio_init(port);
+	if (ret < 0)
+		return ret;
+
+	port_priv->gc.label = devm_kasprintf(&port->dev, GFP_KERNEL, "XR%04x",
+					     pid);
+	port_priv->gc.request = xr_gpio_request;
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
+	/* Nothing to do */
+}
+
+#endif
+
 static int xr_port_probe(struct usb_serial_port *port)
 {
 	struct xr_port_private *port_priv;
@@ -575,13 +771,14 @@ static int xr_port_probe(struct usb_serial_port *port)
 
 	usb_set_serial_port_data(port, port_priv);
 
-	return 0;
+	return xr_gpio_init(port);
 }
 
 static int xr_port_remove(struct usb_serial_port *port)
 {
 	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
 
+	xr_gpio_remove(port);
 	kfree(port_priv);
 
 	return 0;
-- 
2.17.1

