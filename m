Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEDD13D767
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 11:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgAPKB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 05:01:57 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35057 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730518AbgAPKBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jan 2020 05:01:23 -0500
Received: by mail-pf1-f194.google.com with SMTP id i23so9987952pfo.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jan 2020 02:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=w38YpiVMecFRcMjnk+D1XqhxUgiIiJbDMpdeVpVEDZc=;
        b=HTgu4ltMdofbmGG75MD52dOdjx2Ez2VmQzR0pQ0L1Xb39DsU0oAeXHF1gCgLqdzer3
         xNSdUBlI5Dm8pWBZ0JKzCKOKz537JQy23iad6gGbM2bU4LIfp+jtUWon4YHgYfMFblVx
         lx2wG1nH3gpQWDwMfxkVDwKgaBAyEZP5TQdrsuI3KTL/bSryvDDxtQX9wQwl4Uxt+EQY
         aal0NDwP/6MIjrDG9bFajVp67YISQAXiSo4PSnhi9wd+tNKcUJBIZycCXVc1XRdYjVQx
         w8hsK4fYeBYBgK7QbC0WCAfJwoaphpI40wj0cY6qngvwbzlnQJAmrIJF+/zGcQEe4sV1
         nT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w38YpiVMecFRcMjnk+D1XqhxUgiIiJbDMpdeVpVEDZc=;
        b=paPS6+kyzs2xRSCvCirJGzjsrf9stkBNQCpEOpMfEP2sl76glMyrsN2HZJHPgGrphe
         5U2D5d1P9TNkhz5jd0KAbrETyZInQiUblgzYVHycSFqS2l9sb/MDvmXbT7gP3zA/HAm9
         bIe3qrali8qzMqjKPh5LfLZQ+2krrAcrLmodYrmqzFwfL5J/I9H+TYQQc/jlRdRdvIzV
         jQ50Nlw3GXaE5sFF2X62PXXt+a+6j7ODJ6p9e3C4ZpgcFpjVyZ96YzYoTFkEWmPeRTev
         BVNGkD7ed5kgK8z8rBpP0O8kE7DAh9uqfR3+R/R7SKt9zpDPtC8FRLay+432jd4yYBuP
         yJYQ==
X-Gm-Message-State: APjAAAUQvkIbwIl5/szhXQBY9qD+x7jBzScU5BKdaP/kKBABzL92Y1W1
        71fhtLC1MMa1wSWKmrCYxzbXq306H34=
X-Google-Smtp-Source: APXvYqxqkdIKYNykTxDzfgdsPY6BlgoSBSx/AHeHh20gIfM6A7F3PBnwKIdt+GdEkIuyCiWkzpK1Gw==
X-Received: by 2002:a62:2a49:: with SMTP id q70mr35214346pfq.170.1579168882819;
        Thu, 16 Jan 2020 02:01:22 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id s22sm2882791pji.30.2020.01.16.02.01.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 02:01:22 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: Fix the no return statement warning for gpiochip_populate_parent_fwspec_twocell/fourcell()
Date:   Thu, 16 Jan 2020 17:50:03 +0800
Message-Id: <20200116095003.30324-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In commit 242587616710 ("gpiolib: Add support for the irqdomain which
doesn't use irq_fwspec as arg") we have changed the return type of
gpiochip_populate_parent_fwspec_twocell/fourcell() from void to void *,
but forgot to add a return statement for these two dummy functions.
Add "return NULL" to fix the build warnings.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ea6e615ad7fc..18350f274905 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -549,12 +549,14 @@ static inline void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *ch
 						    unsigned int parent_hwirq,
 						    unsigned int parent_type)
 {
+	return NULL;
 }
 
 static inline void *gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
 						     unsigned int parent_hwirq,
 						     unsigned int parent_type)
 {
+	return NULL;
 }
 
 #endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
-- 
2.14.4

