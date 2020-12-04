Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92F02CF239
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 17:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730949AbgLDQsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 11:48:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730873AbgLDQsb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 11:48:31 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9005B22B2D;
        Fri,  4 Dec 2020 16:47:50 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1klEFI-00G234-U3; Fri, 04 Dec 2020 16:47:49 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: [PATCH 4/4] USB: serial: ftdi_sio: Drop GPIO line checking dead code
Date:   Fri,  4 Dec 2020 16:47:39 +0000
Message-Id: <20201204164739.781812-5-maz@kernel.org>
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

Now that the code code can track the validity of GPIO pins,
there is no need to check whether the line is valid.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/usb/serial/ftdi_sio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index b9d3b33891fc..2c8a0b9aac92 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1841,9 +1841,6 @@ static int ftdi_gpio_request(struct gpio_chip *gc, unsigned int offset)
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
 	int result;
 
-	if (priv->gpio_altfunc & BIT(offset))
-		return -ENODEV;
-
 	mutex_lock(&priv->gpio_lock);
 	if (!priv->gpio_used) {
 		/* Set default pin states, as we cannot get them from device */
-- 
2.28.0

