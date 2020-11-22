Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FAF2BC768
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Nov 2020 18:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgKVRIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Nov 2020 12:08:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:58148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727880AbgKVRIs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 22 Nov 2020 12:08:48 -0500
Received: from localhost.localdomain (unknown [157.51.147.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7421620760;
        Sun, 22 Nov 2020 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606064927;
        bh=sY6XCTyoayQ3O/bgSrJ2zQyRPi+Vj7Pz2Oloy0KApY4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p27ljxDtOEhQRki1ZcfXJtE2VxIJxuTiNLorvIZXMyWh8raSJKIXUd+Y9PeIuyqiS
         ggGlFzd9h0QjRunYLR2SxBYhffVzG1TUxq24zOGZAB8nZM7NQF42vLGtY60XeLBsg8
         xya9XfDj/eGkMhjA/p9/Kvc2BQj8VWDm3iUyTBrE=
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, angelo.dureghello@timesys.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Date:   Sun, 22 Nov 2020 22:38:21 +0530
Message-Id: <20201122170822.21715-3-mani@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201122170822.21715-1-mani@kernel.org>
References: <20201122170822.21715-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpiochip support for Maxlinear/Exar USB to serial converter
for controlling the available gpios.

Inspired from cp210x usb to serial converter driver.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 267 ++++++++++++++++++++++++++++++++-
 1 file changed, 261 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index e166916554d6..ca63527a5310 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -9,6 +9,7 @@
  * Copyright (c) 2020 Manivannan Sadhasivam <mani@kernel.org>
  */
 
+#include <linux/gpio/driver.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -16,6 +17,28 @@
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
+struct xr_port_private {
+#ifdef CONFIG_GPIOLIB
+	struct gpio_chip gc;
+	bool gpio_registered;
+	enum gpio_pins pin_status[GPIO_MAX];
+#endif
+	struct mutex gpio_lock;	/* protects GPIO state */
+	bool port_open;
+};
+
 struct xr_txrx_clk_mask {
 	u16 tx;
 	u16 rx0;
@@ -106,6 +129,8 @@ struct xr_txrx_clk_mask {
 #define XR21V141X_REG_GPIO_CLR		0x1e
 #define XR21V141X_REG_GPIO_STATUS	0x1f
 
+static int xr_cts_rts_check(struct xr_port_private *port_priv);
+
 static int xr_set_reg(struct usb_serial_port *port, u8 block, u8 reg,
 		      u8 val)
 {
@@ -309,6 +334,7 @@ static int xr_uart_disable(struct usb_serial_port *port)
 static void xr_set_flow_mode(struct tty_struct *tty,
 			     struct usb_serial_port *port)
 {
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
 	unsigned int cflag = tty->termios.c_cflag;
 	int ret;
 	u8 flow, gpio_mode;
@@ -318,6 +344,17 @@ static void xr_set_flow_mode(struct tty_struct *tty,
 		return;
 
 	if (cflag & CRTSCTS) {
+		/*
+		 * Check if the CTS/RTS pins are occupied by GPIOLIB. If yes,
+		 * then use no flow control.
+		 */
+		if (xr_cts_rts_check(port_priv)) {
+			dev_dbg(&port->dev,
+				"CTS/RTS pins are occupied, so disabling flow control\n");
+			flow = XR21V141X_UART_FLOW_MODE_NONE;
+			goto exit;
+		}
+
 		dev_dbg(&port->dev, "Enabling hardware flow ctrl\n");
 
 		/*
@@ -341,6 +378,7 @@ static void xr_set_flow_mode(struct tty_struct *tty,
 		flow = XR21V141X_UART_FLOW_MODE_NONE;
 	}
 
+exit:
 	/*
 	 * As per the datasheet, UART needs to be disabled while writing to
 	 * FLOW_CONTROL register.
@@ -355,18 +393,22 @@ static void xr_set_flow_mode(struct tty_struct *tty,
 static int xr_tiocmset_port(struct usb_serial_port *port,
 			    unsigned int set, unsigned int clear)
 {
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
 	u8 gpio_set = 0;
 	u8 gpio_clr = 0;
 	int ret = 0;
 
-	/* Modem control pins are active low, so set & clr are swapped */
-	if (set & TIOCM_RTS)
+	/*
+	 * Modem control pins are active low, so set & clr are swapped. And
+	 * ignore the pins that are occupied by GPIOLIB.
+	 */
+	if ((set & TIOCM_RTS) && !(port_priv->pin_status[GPIO_RTS]))
 		gpio_clr |= XR21V141X_UART_MODE_RTS;
-	if (set & TIOCM_DTR)
+	if ((set & TIOCM_DTR) && !(port_priv->pin_status[GPIO_DTR]))
 		gpio_clr |= XR21V141X_UART_MODE_DTR;
-	if (clear & TIOCM_RTS)
+	if ((clear & TIOCM_RTS) && !(port_priv->pin_status[GPIO_RTS]))
 		gpio_set |= XR21V141X_UART_MODE_RTS;
-	if (clear & TIOCM_DTR)
+	if ((clear & TIOCM_DTR) && !(port_priv->pin_status[GPIO_DTR]))
 		gpio_set |= XR21V141X_UART_MODE_DTR;
 
 	/* Writing '0' to gpio_{set/clr} bits has no effect, so no need to do */
@@ -464,6 +506,7 @@ static void xr_set_termios(struct tty_struct *tty,
 
 static int xr_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
 	int ret;
 
 	ret = xr_uart_enable(port);
@@ -482,13 +525,23 @@ static int xr_open(struct tty_struct *tty, struct usb_serial_port *port)
 		return ret;
 	}
 
+	mutex_lock(&port_priv->gpio_lock);
+	port_priv->port_open = true;
+	mutex_unlock(&port_priv->gpio_lock);
+
 	return 0;
 }
 
 static void xr_close(struct usb_serial_port *port)
 {
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
 	usb_serial_generic_close(port);
 
+	mutex_lock(&port_priv->gpio_lock);
+	port_priv->port_open = false;
+	mutex_unlock(&port_priv->gpio_lock);
+
 	xr_uart_disable(port);
 }
 
@@ -553,13 +606,215 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
 	xr_set_reg_uart(port, XR21V141X_REG_TX_BREAK, state);
 }
 
-static int xr_port_probe(struct usb_serial_port *port)
+#ifdef CONFIG_GPIOLIB
+
+static int xr_cts_rts_check(struct xr_port_private *port_priv)
 {
+	if (port_priv->pin_status[GPIO_RTS] || port_priv->pin_status[GPIO_CTS])
+		return -EBUSY;
+
 	return 0;
 }
 
+static int xr_gpio_request(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+	int ret = 0;
+
+	mutex_lock(&port_priv->gpio_lock);
+	/*
+	 * Do not proceed if the port is open. This is done to avoid changing
+	 * the GPIO configuration used by the serial driver.
+	 */
+	if (port_priv->port_open) {
+		ret = -EBUSY;
+		goto err_out;
+	}
+
+	/* Mark the GPIO pin as busy */
+	port_priv->pin_status[offset] = true;
+
+err_out:
+	mutex_unlock(&port_priv->gpio_lock);
+
+	return ret;
+}
+
+static void xr_gpio_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	mutex_lock(&port_priv->gpio_lock);
+	/*
+	 * Do not proceed if the port is open. This is done to avoid toggling
+	 * of pins suddenly when the serial port is in use.
+	 */
+	if (port_priv->port_open)
+		goto err_out;
+
+	/* Mark the GPIO pin as free */
+	port_priv->pin_status[offset] = false;
+
+err_out:
+	mutex_unlock(&port_priv->gpio_lock);
+}
+
+static int xr_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	u8 gpio_status;
+	int ret;
+
+	ret = xr_get_reg_uart(port, XR21V141X_REG_GPIO_STATUS, &gpio_status);
+	if (ret)
+		return ret;
+
+	return !!(gpio_status & BIT(gpio));
+}
+
+static void xr_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+
+	if (val)
+		xr_set_reg_uart(port, XR21V141X_REG_GPIO_SET, BIT(gpio));
+	else
+		xr_set_reg_uart(port, XR21V141X_REG_GPIO_CLR, BIT(gpio));
+}
+
+static int xr_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	u8 gpio_dir;
+	int ret;
+
+	ret = xr_get_reg_uart(port, XR21V141X_REG_GPIO_DIR, &gpio_dir);
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
+	u8 gpio_dir;
+	int ret;
+
+	ret = xr_get_reg_uart(port, XR21V141X_REG_GPIO_DIR, &gpio_dir);
+	if (ret)
+		return ret;
+
+	gpio_dir &= ~BIT(gpio);
+
+	return xr_set_reg_uart(port, XR21V141X_REG_GPIO_DIR, gpio_dir);
+}
+
+static int xr_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
+				    int val)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	u8 gpio_dir;
+	int ret;
+
+	xr_gpio_set(gc, gpio, val);
+
+	ret = xr_get_reg_uart(port, XR21V141X_REG_GPIO_DIR, &gpio_dir);
+	if (ret)
+		return ret;
+
+	gpio_dir |= BIT(gpio);
+
+	ret = xr_set_reg_uart(port, XR21V141X_REG_GPIO_DIR, gpio_dir);
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
+static int xr_cts_rts_check(struct xr_port_private *port_priv)
+{
+	return 0;
+}
+
+#endif
+
+static int xr_port_probe(struct usb_serial_port *port)
+{
+	struct xr_port_private *port_priv;
+	int ret;
+
+	port_priv = kzalloc(sizeof(*port_priv), GFP_KERNEL);
+	if (!port_priv)
+		return -ENOMEM;
+
+	usb_set_serial_port_data(port, port_priv);
+	mutex_init(&port_priv->gpio_lock);
+
+	ret = xr_gpio_init(port);
+	if (ret)
+		kfree(port_priv);
+
+	return ret;
+}
+
 static int xr_port_remove(struct usb_serial_port *port)
 {
+	struct xr_port_private *port_priv = usb_get_serial_port_data(port);
+
+	xr_gpio_remove(port);
+	kfree(port_priv);
+
 	return 0;
 }
 
-- 
2.25.1

