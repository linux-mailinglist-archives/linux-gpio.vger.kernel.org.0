Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86851346C44
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhCWWU4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbhCWWTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:19:14 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018F2C061764;
        Tue, 23 Mar 2021 15:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
        :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=BH8l4rhqM3j+tO6C1MABX7MjnINoZWw3fSlsoKWejbk=; b=CKCciv/I0u+Qfnd5B1gRD0tTiW
        TIpbeMTbmRB3cySGrns8wOsyxr5bd4CffbtAc69cJZONuueAlFSzz6USI8syCBPltEd0jZr8uwYvu
        zDdghVKxUqvJYqOX3/+wU+2pCqioS4dg3rUAzd7jljOpf1kD/c5OWGt0FbGf8W/NcXmbgWmJ+MyZo
        OSHQOXSeq6iWKdMLs9hkIhhLHH+6C/+pkLAQ1NRXuSY+ZmIe9iWqPzD+ppAQM/ZQn9bFKpanZQO6N
        eIrQlN4XWqEXamYdCRb70VO/l078T7uFcybq+y+4sTWkTjCadsNbmZoPQYvdBfd+kr4TzwV8zuGei
        2z3X+EvQ==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOpMi-00Fq9a-KZ; Tue, 23 Mar 2021 22:19:09 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] linux/gpio/driver.h: some edits for clarity
Date:   Tue, 23 Mar 2021 15:19:05 -0700
Message-Id: <20210323221905.19529-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix a few typos and some punctuation.
Also, change CONFIG_OF to CONFIG_OF_GPIO in one comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
---
 include/linux/gpio/driver.h |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20210323.orig/include/linux/gpio/driver.h
+++ linux-next-20210323/include/linux/gpio/driver.h
@@ -227,7 +227,7 @@ struct gpio_irq_chip {
 	/**
 	 * @valid_mask:
 	 *
-	 * If not %NULL holds bitmask of GPIOs which are valid to be included
+	 * If not %NULL, holds bitmask of GPIOs which are valid to be included
 	 * in IRQ domain of the chip.
 	 */
 	unsigned long *valid_mask;
@@ -346,7 +346,7 @@ struct gpio_irq_chip {
  *	output.
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
- * they can all be accessed through a common programing interface.
+ * they can all be accessed through a common programming interface.
  * Example sources would be SOC controllers, FPGAs, multifunction
  * chips, dedicated GPIO expanders, and so on.
  *
@@ -435,15 +435,15 @@ struct gpio_chip {
 	/**
 	 * @valid_mask:
 	 *
-	 * If not %NULL holds bitmask of GPIOs which are valid to be used
+	 * If not %NULL, holds bitmask of GPIOs which are valid to be used
 	 * from the chip.
 	 */
 	unsigned long *valid_mask;
 
 #if defined(CONFIG_OF_GPIO)
 	/*
-	 * If CONFIG_OF is enabled, then all GPIO controllers described in the
-	 * device tree automatically may have an OF translation
+	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
+	 * the device tree automatically may have an OF translation
 	 */
 
 	/**
@@ -508,7 +508,7 @@ extern int gpiochip_add_data_with_key(st
  * for GPIOs will fail rudely.
  *
  * gpiochip_add_data() must only be called after gpiolib initialization,
- * ie after core_initcall().
+ * i.e. after core_initcall().
  *
  * If gc->base is negative, this requests dynamic assignment of
  * a range of valid GPIOs.
