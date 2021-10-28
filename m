Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CA443DD62
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 11:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhJ1JDd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ1JDc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:03:32 -0400
X-Greylist: delayed 495 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Oct 2021 02:01:06 PDT
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFB4C061570
        for <linux-gpio@vger.kernel.org>; Thu, 28 Oct 2021 02:01:06 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafe:c901:6c18:8b05:4bd4:d9c2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 78306268674;
        Thu, 28 Oct 2021 10:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1635411168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=hiwxHg5HZkfTrQPDIrsSS8SkMUR1Gsq+D6s2Da6jeec=;
        b=qcSFipv3DUToMW9k49ZvIuwKjaIvBrk1lVke4mlMKsHRC+wZY897MkauHgdu5bJaTBBhe8
        9RKrpLOnC6T+UkW+PA4EtHCJ5caCuVzKGuLYuDCc6DtpW+oCKeArtl/BVqHQAoIBSjicYN
        L04YzYEYLcURwqW5SBflgtCscxpzeifzFOATk9p3rXHMFvC4pB77ZAIugHtMJmqxonx6aM
        7ebi/BWuYuSTlHhKHgSShLByewXBUaMd5Gv+xB2/m1wQ9LzdUo6xScz8eKdC6W1K2lcJCw
        3fhcVeQSsFNDrwhp6+BZqTE5zGUvhTUPKaF35hQPZrzv4U4K0pF5wGC6cjxj6Q==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH] gpio: realtek-otto: fix GPIO line IRQ offset
Date:   Thu, 28 Oct 2021 10:52:43 +0200
Message-Id: <20211028085243.34360-1-sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irqchip uses one domain for all GPIO lines, so the line offset
should be determined w.r.t. the first line of the first port, not the
first line of the triggered port.

Fixes: 0d82fb1127fb ("gpio: Add Realtek Otto GPIO support")
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/gpio/gpio-realtek-otto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index eeeb39bc171d..bd75401b549d 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -205,7 +205,7 @@ static void realtek_gpio_irq_handler(struct irq_desc *desc)
 		status = realtek_gpio_read_isr(ctrl, lines_done / 8);
 		port_pin_count = min(gc->ngpio - lines_done, 8U);
 		for_each_set_bit(offset, &status, port_pin_count)
-			generic_handle_domain_irq(gc->irq.domain, offset);
+			generic_handle_domain_irq(gc->irq.domain, offset + lines_done);
 	}
 
 	chained_irq_exit(irq_chip, desc);
-- 
2.31.1

