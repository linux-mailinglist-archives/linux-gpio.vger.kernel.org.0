Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26FB73A697
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 17:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfFIPKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 11:10:21 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:59515 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbfFIPKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 11:10:21 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x59F9vDP015586;
        Mon, 10 Jun 2019 00:09:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x59F9vDP015586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560092997;
        bh=0eo4lFsztS6xZOJdGXsOvDiKLKz0/o6ftdMYEqEAoTU=;
        h=From:To:Cc:Subject:Date:From;
        b=T04STplsglT9qczTK8mYyn5afdvQA8elzsgrBWchugaCq1BRTj5O9oftLlqEX2tEK
         LVd6LX9soEsS5XHO6aLT07NOJKU2HfzVBdxUBHYQag1kcMg1RmlCbaRLVVKKlup/h+
         a6N2rFgRrnSYR7HXmioJyBVtiUoRPskGHENplK+36+/qu3JMftXIr2CKguvZJuR8Vz
         5lf6QpvHOzuVqrz0m3oTh51sTngXfYwjQ0b5sj4zYHdFjNRybJX2bK5agQkS+eHY6r
         hyiNYSlRDOiFBAdF2kVph0M8/IC6ddigJR5xxnQlzXuDXaI99VhxWSQ98obIxof56M
         4G17wrlIM760g==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: remove unused pin_is_valid()
Date:   Mon, 10 Jun 2019 00:09:53 +0900
Message-Id: <20190609150953.6432-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function was used by pin_request() to pointlessly double-check
the pin validity, and it was the only user ever.

Since commit d2f6a1c6fb0e ("pinctrl: remove double pin validity
check."), no one has ever used it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/core.c          | 23 -----------------------
 include/linux/pinctrl/pinctrl.h | 10 ----------
 2 files changed, 33 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index a64849a9d1b0..aeba6366fb13 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -177,29 +177,6 @@ const char *pin_get_name(struct pinctrl_dev *pctldev, const unsigned pin)
 	return desc->name;
 }
 
-/**
- * pin_is_valid() - check if pin exists on controller
- * @pctldev: the pin control device to check the pin on
- * @pin: pin to check, use the local pin controller index number
- *
- * This tells us whether a certain pin exist on a certain pin controller or
- * not. Pin lists may be sparse, so some pins may not exist.
- */
-bool pin_is_valid(struct pinctrl_dev *pctldev, int pin)
-{
-	struct pin_desc *pindesc;
-
-	if (pin < 0)
-		return false;
-
-	mutex_lock(&pctldev->mutex);
-	pindesc = pin_desc_get(pctldev, pin);
-	mutex_unlock(&pctldev->mutex);
-
-	return pindesc != NULL;
-}
-EXPORT_SYMBOL_GPL(pin_is_valid);
-
 /* Deletes a range of pin descriptors */
 static void pinctrl_free_pindescs(struct pinctrl_dev *pctldev,
 				  const struct pinctrl_pin_desc *pins,
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index e429e5d92dd6..34b10d112be6 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -166,7 +166,6 @@ extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 extern void devm_pinctrl_unregister(struct device *dev,
 				struct pinctrl_dev *pctldev);
 
-extern bool pin_is_valid(struct pinctrl_dev *pctldev, int pin);
 extern void pinctrl_add_gpio_range(struct pinctrl_dev *pctldev,
 				struct pinctrl_gpio_range *range);
 extern void pinctrl_add_gpio_ranges(struct pinctrl_dev *pctldev,
@@ -197,15 +196,6 @@ struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
 extern const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev);
 extern const char *pinctrl_dev_get_devname(struct pinctrl_dev *pctldev);
 extern void *pinctrl_dev_get_drvdata(struct pinctrl_dev *pctldev);
-#else
-
-struct pinctrl_dev;
-
-/* Sufficiently stupid default functions when pinctrl is not in use */
-static inline bool pin_is_valid(struct pinctrl_dev *pctldev, int pin)
-{
-	return pin >= 0;
-}
 
 #endif /* !CONFIG_PINCTRL */
 
-- 
2.17.1

