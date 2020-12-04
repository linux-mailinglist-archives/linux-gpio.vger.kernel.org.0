Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E0B2CF233
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 17:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730908AbgLDQsb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 11:48:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:57492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729262AbgLDQsa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 11:48:30 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB68422AAF;
        Fri,  4 Dec 2020 16:47:49 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1klEFH-00G234-PO; Fri, 04 Dec 2020 16:47:48 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
Date:   Fri,  4 Dec 2020 16:47:38 +0000
Message-Id: <20201204164739.781812-4-maz@kernel.org>
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

The validity of the ftdi CBUS GPIO is pretty hidden so far,
and finding out *why* some GPIOs don't work is sometimes
hard to identify. So let's help the user by displaying the
map of the CBUS pins that are valid for a GPIO.

Also, tell the user about the magic ftx-prog tool that can
make GPIOs appear: https://github.com/richardeoin/ftx-prog

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 13e575f16bcd..b9d3b33891fc 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -2012,6 +2012,15 @@ static int ftdi_gpio_init_valid_mask(struct gpio_chip *gc,
 
 	bitmap_complement(valid_mask, &map, ngpios);
 
+	if (bitmap_empty(valid_mask, ngpios))
+		dev_warn(&port->dev, "No usable GPIO\n");
+	else
+		dev_info(&port->dev, "Enabling CBUS%*pbl for GPIO\n",
+			 ngpios, valid_mask);
+
+	if (!bitmap_full(valid_mask, ngpios))
+		dev_warn_once(&port->dev, "Consider using a tool such as ftx-prog to enable GPIOs if required\n");
+
 	return 0;
 }
 
-- 
2.28.0

