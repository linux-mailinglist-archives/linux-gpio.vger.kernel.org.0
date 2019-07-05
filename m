Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E57F260333
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 11:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbfGEJie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 05:38:34 -0400
Received: from mail.vivotek.com ([60.248.39.150]:57218 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727506AbfGEJie (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jul 2019 05:38:34 -0400
X-Greylist: delayed 462 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Jul 2019 05:38:33 EDT
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.22/8.16.0.22) with SMTP id x659SCfH015165;
        Fri, 5 Jul 2019 17:30:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=dkim;
 bh=2KaC+3HJMJrzgfZPSWLrMHYp5NlQD1jIP6KCA5l1j4k=;
 b=MJA5M0X5SbZ8w3EK6kIpRFJbhbqPmgXsudaZJpiP/w7YN7dWurUCaZXIKaFcqJsTsE3a
 q7oNu5vcFlOOykIxtLjvXIIYkgMptDoIyNB6WKbZQeu4nDYcUvS0CbjUwxCH0x2z6RMW
 hmrjgJGnl+U7ekp2GeH/4BIfocVmJ2JVDG4= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 2tj3w0g0a1-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 05 Jul 2019 17:30:41 +0800
Received: from localhost.localdomain (192.168.17.134) by CAS01.vivotek.tw
 (192.168.0.58) with Microsoft SMTP Server (TLS) id 14.3.319.2; Fri, 5 Jul
 2019 17:30:40 +0800
From:   Michael Wu <michael.wu@vatics.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <mvp.kutali@gmail.com>
Subject: [PATCH] gpiolib: fix incorrect IRQ requesting of an active-low lineevent
Date:   Fri, 5 Jul 2019 17:30:31 +0800
Message-ID: <20190705093031.18182-1-michael.wu@vatics.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.17.134]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-05_04:,,
 signatures=0
X-Proofpoint-Spam-Reason: safe
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When a pin is active-low, logical trigger edge should be inverted
to match the same interrupt opportunity.

For example, a button pushed trigger falling edge in ACTIVE_HIGH
case; in ACTIVE_LOW case, the button pushed trigger rising edge.
For user space the IRQ requesting doesn't need to do any
modification except to configuring GPIOHANDLE_REQUEST_ACTIVE_LOW.

Signed-off-by: Michael Wu <michael.wu@vatics.com>
---
 drivers/gpio/gpiolib.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e013d417a936..b98466a05091 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -956,9 +956,11 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	}
 
 	if (eflags & GPIOEVENT_REQUEST_RISING_EDGE)
-		irqflags |= IRQF_TRIGGER_RISING;
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
 	if (eflags & GPIOEVENT_REQUEST_FALLING_EDGE)
-		irqflags |= IRQF_TRIGGER_FALLING;
+		irqflags |= test_bit(FLAG_ACTIVE_LOW, &desc->flags) ?
+			IRQ_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
 	irqflags |= IRQF_ONESHOT;
 
 	INIT_KFIFO(le->events);
-- 
2.17.1

