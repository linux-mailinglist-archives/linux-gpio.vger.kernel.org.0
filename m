Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108A22CF22F
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 17:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730831AbgLDQs3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 11:48:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:57444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729262AbgLDQs3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Dec 2020 11:48:29 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 712F122AED;
        Fri,  4 Dec 2020 16:47:48 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1klEFG-00G234-Mr; Fri, 04 Dec 2020 16:47:46 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: [PATCH 1/4] gpiolib: cdev: Flag invalid GPIOs as used
Date:   Fri,  4 Dec 2020 16:47:36 +0000
Message-Id: <20201204164739.781812-2-maz@kernel.org>
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

When reporting the state of a GPIO to userspace, we never check
for the actual validity of the line, meaning we report invalid
lines as being usable. A subsequent request will fail though,
which is an inconsistent behaviour from a userspace perspective.

Instead, let's check for the validity of the line and report it
as used if it is invalid. This allows a tool such as gpioinfo
to report something sensible:

gpiochip3 - 4 lines:
	line   0:      unnamed       unused   input  active-high
	line   1:      unnamed       kernel   input  active-high [used]
	line   2:      unnamed       kernel   input  active-high [used]
	line   3:      unnamed       unused   input  active-high

In this example, lines 1 and 2 are invalid, and cannot be used by
userspace.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e9faeaf65d14..a0fcb4ccaa02 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1910,6 +1910,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
 	    test_bit(FLAG_EXPORT, &desc->flags) ||
 	    test_bit(FLAG_SYSFS, &desc->flags) ||
+	    !gpiochip_line_is_valid(gc, info->offset) ||
 	    !ok_for_pinctrl)
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
 
-- 
2.28.0

