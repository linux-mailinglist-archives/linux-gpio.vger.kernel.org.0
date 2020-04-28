Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37071BCCCF
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 21:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729326AbgD1T5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 15:57:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729191AbgD1T5L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 15:57:11 -0400
Received: from localhost.localdomain (unknown [157.51.86.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 017DE2176D;
        Tue, 28 Apr 2020 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588103830;
        bh=H3AromAI/bQt3gTc63FAWPy8ELDG96hA1qpnAEphN1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YUNKhggf9k8N5dx75bDkryc5gmgxNBrgFHMcd+o/7pD1sPpTv0RBID6UHXJoY+xB+
         sQMYFCzsLZk3bM57SUFMMBJLBa2+TRTJmkrdqvgPYRcLxH5sFt9UD3pi5WiCYYLsBF
         kwDKmOAcbpMrjiOILvQ0FWvFLFtMfr0TOZRx3AYs=
From:   mani@kernel.org
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, Manivannan Sadhasivam <mani@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
Date:   Wed, 29 Apr 2020 01:26:51 +0530
Message-Id: <20200428195651.6793-3-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428195651.6793-1-mani@kernel.org>
References: <20200428195651.6793-1-mani@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Manivannan Sadhasivam <mani@kernel.org>

Add gpiochip support for Maxlinear/Exar USB to serial converter
for controlling the available gpios.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 186 ++++++++++++++++++++++++++++++++-
 drivers/usb/serial/xr_serial.h |   7 ++
 2 files changed, 192 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index ea4a0b167d3f..d86fd40839f8 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -476,6 +476,189 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
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
+	u16 gpio_status;
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
+	u16 gpio_dir;
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
+	u16 gpio_dir;
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
+	u16 gpio_dir;
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
+	u16 gpio_mode;
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
+	int ret = 0;
+
+	if (port_priv->idProduct == XR21V141X_ID)
+		ret = xr21v141x_gpio_init(port);
+
+	if (ret < 0)
+		return ret;
+
+	port_priv->gc.label = "xr_gpios";
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
 	struct usb_serial *serial = port->serial;
@@ -495,13 +678,14 @@ static int xr_port_probe(struct usb_serial_port *port)
 
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
diff --git a/drivers/usb/serial/xr_serial.h b/drivers/usb/serial/xr_serial.h
index d2977ef847a0..079098cf553a 100644
--- a/drivers/usb/serial/xr_serial.h
+++ b/drivers/usb/serial/xr_serial.h
@@ -3,6 +3,8 @@
 #ifndef __LINUX_USB_SERIAL_XR_SERIAL_H
 #define __LINUX_USB_SERIAL_XR_SERIAL_H
 
+#include <linux/gpio/driver.h>
+
 struct xr_uart_regs {
 	u8 enable;
 	u8 format;
@@ -21,6 +23,11 @@ struct xr_uart_regs {
 };
 
 struct xr_port_private {
+#ifdef CONFIG_GPIOLIB
+	struct gpio_chip gc;
+	bool gpio_registered;
+	u8 gpio_altfunc;
+#endif
 	const struct xr_uart_regs *regs;
 	u16 idProduct;
 	u8 reg_width;
-- 
2.17.1

