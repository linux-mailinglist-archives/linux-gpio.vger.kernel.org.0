Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5F10181D9A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 17:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730055AbgCKQR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 12:17:57 -0400
Received: from lists.gateworks.com ([108.161.130.12]:39867 "EHLO
        lists.gateworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730162AbgCKQR5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 12:17:57 -0400
X-Greylist: delayed 2040 seconds by postgrey-1.27 at vger.kernel.org; Wed, 11 Mar 2020 12:17:57 EDT
Received: from 68-189-91-139.static.snlo.ca.charter.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by lists.gateworks.com with esmtp (Exim 4.82)
        (envelope-from <tharvey@gateworks.com>)
        id 1jC3Xn-0008Ub-Ga; Wed, 11 Mar 2020 15:45:15 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Robert Richter <rrichter@marvell.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH] gpio: thunderx: fix irq_request_resources
Date:   Wed, 11 Mar 2020 08:43:53 -0700
Message-Id: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If there are no parent resources do not call irq_chip_request_resources_parent
at all as this will return an error.

This resolves a regression where devices using a thunderx gpio as an interrupt
would fail probing.

Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 drivers/gpio/gpio-thunderx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 4627704..f84b9b1 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -366,15 +366,18 @@ static int thunderx_gpio_irq_request_resources(struct irq_data *data)
 {
 	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 	struct thunderx_gpio *txgpio = txline->txgpio;
+	struct irq_data *parent_data = data->parent_data;
 	int r;
 
 	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
 	if (r)
 		return r;
 
-	r = irq_chip_request_resources_parent(data);
-	if (r)
-		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
+	if (parent_data && parent_data->chip->irq_request_resources) {
+		r = irq_chip_request_resources_parent(data);
+		if (r)
+			gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
+	}
 
 	return r;
 }
-- 
2.7.4

