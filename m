Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBFB51FDAFE
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2020 03:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgFRBJj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 21:09:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728242AbgFRBJi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 21:09:38 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CB44221F3;
        Thu, 18 Jun 2020 01:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592442577;
        bh=vdJFMv8yHEs/2MvMI6fAtqmj1XRhq7UnKx2s5j72/GI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LbbIBaTAV+bQqBD2bGuraCJ3gif1jTUSvx9qYDD1bnBzwn8fflr7aCvdhTEW7T9LO
         tryOs9jcZeuIIfgb6gQs16owuBtQc/MjRB1rsSk3sr2XRw7qTPfqSvRUpkrPWMz5F/
         nrmsfBBzLd8ics6/ENaZ4R0fZa3ilYUo0nk+doYY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 070/388] gpio: dwapb: Call acpi_gpiochip_free_interrupts() on GPIO chip de-registration
Date:   Wed, 17 Jun 2020 21:02:47 -0400
Message-Id: <20200618010805.600873-70-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 494a94e38dcf62543a32a4424d646ff80b4b28bd ]

Add missed acpi_gpiochip_free_interrupts() call when unregistering ports.

While at it, drop extra check to call acpi_gpiochip_request_interrupts().
There is no need to have an additional check to call
acpi_gpiochip_request_interrupts(). Even without any interrupts available
the registered ACPI Event handlers can be useful for debugging purposes.

Fixes: e6cb3486f5a1 ("gpio: dwapb: add gpio-signaled acpi event support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20200519131233.59032-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-dwapb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 92e127e74813..02cf4c43a4c4 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -533,26 +533,33 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		dwapb_configure_irqs(gpio, port, pp);
 
 	err = gpiochip_add_data(&port->gc, port);
-	if (err)
+	if (err) {
 		dev_err(gpio->dev, "failed to register gpiochip for port%d\n",
 			port->idx);
-	else
-		port->is_registered = true;
+		return err;
+	}
 
 	/* Add GPIO-signaled ACPI event support */
-	if (pp->has_irq)
-		acpi_gpiochip_request_interrupts(&port->gc);
+	acpi_gpiochip_request_interrupts(&port->gc);
 
-	return err;
+	port->is_registered = true;
+
+	return 0;
 }
 
 static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
 {
 	unsigned int m;
 
-	for (m = 0; m < gpio->nr_ports; ++m)
-		if (gpio->ports[m].is_registered)
-			gpiochip_remove(&gpio->ports[m].gc);
+	for (m = 0; m < gpio->nr_ports; ++m) {
+		struct dwapb_gpio_port *port = &gpio->ports[m];
+
+		if (!port->is_registered)
+			continue;
+
+		acpi_gpiochip_free_interrupts(&port->gc);
+		gpiochip_remove(&port->gc);
+	}
 }
 
 static struct dwapb_platform_data *
-- 
2.25.1

