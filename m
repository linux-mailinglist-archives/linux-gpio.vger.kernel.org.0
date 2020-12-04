Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0099E2CF235
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 17:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbgLDQsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 11:48:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728997AbgLDQs3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 11:48:29 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF0BB22B2A;
        Fri,  4 Dec 2020 16:47:48 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1klEFH-00G234-8M; Fri, 04 Dec 2020 16:47:47 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: [PATCH 2/4] USB: serial: ftdi_sio: Report the valid GPIO lines to gpiolib
Date:   Fri,  4 Dec 2020 16:47:37 +0000
Message-Id: <20201204164739.781812-3-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204164739.781812-1-maz@kernel.org>
References: <20201204164739.781812-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, johan@kernel.org, gregkh@linuxfoundation.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since it is pretty common for only some of the CBUS lines to be
valid as GPIO lines, let's report such validity to the rest of
the kernel.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index e0f4c3d9649c..13e575f16bcd 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2002,6 +2002,19 @@ static int ftdi_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
 	return result;
 }
 
+static int ftdi_gpio_init_valid_mask(struct gpio_chip *gc,
+				     unsigned long *valid_mask,
+				     unsigned int ngpios)
+{
+	struct usb_serial_port *port = gpiochip_get_data(gc);
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	unsigned long map = priv->gpio_altfunc;
+
+	bitmap_complement(valid_mask, &map, ngpios);
+
+	return 0;
+}
+
 static int ftdi_read_eeprom(struct usb_serial *serial, void *dst, u16 addr,
 				u16 nbytes)
 {
@@ -2173,6 +2186,7 @@ static int ftdi_gpio_init(struct usb_serial_port *port)
 	priv->gc.get_direction = ftdi_gpio_direction_get;
 	priv->gc.direction_input = ftdi_gpio_direction_input;
 	priv->gc.direction_output = ftdi_gpio_direction_output;
+	priv->gc.init_valid_mask = ftdi_gpio_init_valid_mask;
 	priv->gc.get = ftdi_gpio_get;
 	priv->gc.set = ftdi_gpio_set;
 	priv->gc.get_multiple = ftdi_gpio_get_multiple;
-- 
2.28.0

