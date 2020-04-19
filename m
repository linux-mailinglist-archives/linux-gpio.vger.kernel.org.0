Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5041F1AFC11
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Apr 2020 18:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgDSQit (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Apr 2020 12:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725793AbgDSQis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 19 Apr 2020 12:38:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F03C061A0C;
        Sun, 19 Apr 2020 09:38:48 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w65so3727998pfc.12;
        Sun, 19 Apr 2020 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MxRnre2TGJoBqRkcaKyaSPFLdXb03GRebHRCx/K9LB4=;
        b=oaqTeG9JDQfKNVnHaapynwdylZHqO9r3VxEj9N6HQj3ukwiSrs+qgaqQ2oaHee8Mln
         gSPIiPQDT1rD0IPLxPaNBSztuDTNexc4CBO85J4vhBZ4bz2qaNkarcTpnT4vzOg9GFD0
         j0U4KHXxj2cqb0wC5dNq5N+S8/X4nFhx5ObNaiYMbTL9AHT44fFnYqpPUKCwgRdzVceV
         mMM2V/RTrfqNmsdG45M7CvG4ub+maCYW37AxWQMuUDA4IE4Sy2YtVcKy7D6XtgydB0fa
         U0e8geYJyudPfce3owIZep3EnU996oHTNvGeRkIL3E/qOeIZlrGhyKFPjwAGvUqtAqr4
         Wq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MxRnre2TGJoBqRkcaKyaSPFLdXb03GRebHRCx/K9LB4=;
        b=ODNDm0lEqYTS/o+JhQsIYdTeINlS76ETFZeqRHQ585jhW9NtIijYM+wV7zvPRzrSja
         nT8weHvCcVTwc3fAkmNywkxZVgd/2O5ENok4b9kRndeHhbbxJ8zroaesflJz0kyDNHjb
         /97JSlQEl4It1a9RE7ZP+wIaqV/YeNuNm0QxzYIv0+44HMW5EI84Cjy/cnBUEdmfESbV
         Rb/pGGeouYT4946ttIp5bVrba+ZPJRx601Q5OgaQ2ZwXb65CMEWAloN9FHHemoyRyysZ
         gIHN8iQHRxoS5NUoJTNP/pZ1oEkf5xWWQBXnuQviyR4sG3WQhQJXtvUrswsd9Igq4bkI
         tNVw==
X-Gm-Message-State: AGi0PuaX2XFh8vdgy/pksZuPX+/LQH/HOBsJhNe+bRHCnvdGWT6f7qwh
        3h5o7t3IswTcn+DPUD9eNezKeIJH
X-Google-Smtp-Source: APiQypK8TY9x0fZ8kox4VD1WuHzR2UWzumPYpn6nhnAmKjKIEGKKZ5SyKg8w2UT6Gn5lLWGsArZ+Wg==
X-Received: by 2002:a63:ff49:: with SMTP id s9mr12971814pgk.46.1587314328022;
        Sun, 19 Apr 2020 09:38:48 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id z63sm24836070pfb.20.2020.04.19.09.38.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 09:38:47 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1] gpio: fix several typos
Date:   Mon, 20 Apr 2020 00:38:16 +0800
Message-Id: <20200419163816.19856-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use codespell to fix lots of typos over frontends.

CC: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/gpio/gpio-ftgpio010.c | 2 +-
 drivers/gpio/gpio-mm-lantiq.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index fbddb1662428..4031164780f7 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -193,7 +193,7 @@ static int ftgpio_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	if (val == deb_div) {
 		/*
 		 * The debounce timer happens to already be set to the
-		 * desireable value, what a coincidence! We can just enable
+		 * desirable value, what a coincidence! We can just enable
 		 * debounce on this GPIO line and return. This happens more
 		 * often than you think, for example when all GPIO keys
 		 * on a system are requesting the same debounce interval.
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index f460d71b0c92..538e31fe8903 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -36,7 +36,7 @@ struct ltq_mm {
  * @chip:     Pointer to our private data structure.
  *
  * Write the shadow value to the EBU to set the gpios. We need to set the
- * global EBU lock to make sure that PCI/MTD dont break.
+ * global EBU lock to make sure that PCI/MTD don't break.
  */
 static void ltq_mm_apply(struct ltq_mm *chip)
 {
-- 
2.25.0

