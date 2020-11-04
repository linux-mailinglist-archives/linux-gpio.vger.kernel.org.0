Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526562A6B60
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 18:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731607AbgKDREx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 12:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729679AbgKDREw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 12:04:52 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CBEC0613D3;
        Wed,  4 Nov 2020 09:04:51 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y16so23782689ljk.1;
        Wed, 04 Nov 2020 09:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/ipN2OHWhaQxheYdOXhTrFFEC6RbsQ7nc8F7dXSQxjM=;
        b=APvuMiLrs0T8g4v1aieiR0rHJlTVC9HNP01vRsacddx8uHEIMuZdXVzVj/gX5fKOL7
         Fi4oYz2YMfcMI8Q1l/nGMRvN6HwVA+c4geJFzjSoi0I8Ebgy3N5y3c5KAf2xg6Q0JGTi
         4BA+2BYDcGttqqZU9fkEZTtjJbk23+eLArZOthzAWCZFPiIZplks5h6BLWdLoOM6K40Z
         7A/IMKiWFsRvz7G2kbPA43qfVI8rRK38NQS5NGLuwqadNquPdg84++UEBzxxuMj1MuXv
         Ysc6v+K8tzXyB0LMVxyt+nBjNGWVg48XY4ivnOEkf1ACv6E6QbbOYzXPpiMR5REUdykZ
         w6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/ipN2OHWhaQxheYdOXhTrFFEC6RbsQ7nc8F7dXSQxjM=;
        b=pFDEJCYJgby3HEW4LExR2fpMu1Jp3AnNcdWOfjg4L1ugUgqghwBwUwGj8cpv+/0oBQ
         tBFzlRbocGf4N2lYTSPxo02I5/88QBCokDSnLTPOLJd3MBn/uLrOeYuR5RKFGsLLO5GP
         uSx3BaZkjcq+gYHtJq7xdpTTDaTe9ZaoIOyCOl9ccYQ2EyFkJ7eo2f4LN+jNHlNRgNlF
         eVk7+CKlFPGcLBUbGbgs8YAGbhWNxXg7r537QgmliqbhxCbIJofB6bDc/Rphs2kCAA7A
         PsYHExY/AuNoCeGEtuhdmTs63Y2fSxN3tpIIS/D6w5wpAigtxGq3yHCuvi9yLk5QgB+i
         ov3A==
X-Gm-Message-State: AOAM530NFHFYmp1Wr12Xoc9MSasiMgndhxStnCbE+ipHy6Hf7yOaN2WY
        jtuE3G3PQlNS9fONS3Y+KOw=
X-Google-Smtp-Source: ABdhPJzcBrlE+dGZLNsmcdhP8mbY+4f9VqWY7qrPPl6y5hePbgpQLyD5x4YF5qx9I3Prai5017DnqQ==
X-Received: by 2002:a05:651c:506:: with SMTP id o6mr10281844ljp.249.1604509490384;
        Wed, 04 Nov 2020 09:04:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id c4sm457931lfh.60.2020.11.04.09.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:04:49 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] gpio: tegra: Use raw_spinlock
Date:   Wed,  4 Nov 2020 20:04:23 +0300
Message-Id: <20201104170423.23436-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104170423.23436-1-digetx@gmail.com>
References: <20201104170423.23436-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use raw_spinlock in order to fix spurious messages about invalid context
when spinlock debugging is enabled. This happens because there is a legit
nested raw_spinlock->spinlock locking usage within IRQ-related code. IRQ
core uses raw spinlock and then Tegra GPIO driver uses a nested spinlock.
The debug code can't recognize and handle this case, hence we need to use
raw spinlock in the GPIO driver.

 [ BUG: Invalid wait context ]
 ...
  (dump_stack) from (__lock_acquire)
  (__lock_acquire) from (lock_acquire)
  (lock_acquire) from (_raw_spin_lock_irqsave)
  (_raw_spin_lock_irqsave) from (tegra_gpio_irq_set_type)
  (tegra_gpio_irq_set_type) from (__irq_set_trigger)
  (__irq_set_trigger) from (__setup_irq)
  (__setup_irq) from (request_threaded_irq)
  (request_threaded_irq) from (devm_request_threaded_irq)
  (devm_request_threaded_irq) from (elants_i2c_probe)
  (elants_i2c_probe) from (i2c_device_probe)
 ...

Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Only lvl_lock is converted to raw_spinlock. The dbc_lock doesn't
      relate to IRQ and doesn't need the conversion.

    - Improved commit message by clarifying that IRQ core uses raw
      spinlock.

    - Added clarifying comment to the code for the lvl_lock.

 drivers/gpio/gpio-tegra.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 98fc78739ebf..e19ebff6018c 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -61,8 +61,16 @@ struct tegra_gpio_info;
 struct tegra_gpio_bank {
 	unsigned int bank;
 	unsigned int irq;
-	spinlock_t lvl_lock[4];
-	spinlock_t dbc_lock[4];	/* Lock for updating debounce count register */
+
+	/*
+	 * IRQ-core code uses raw locking, and thus, nested locking also
+	 * should be raw in order not to trip spinlock debug warnings.
+	 */
+	raw_spinlock_t lvl_lock[4];
+
+	/* Lock for updating debounce count register */
+	spinlock_t dbc_lock[4];
+
 #ifdef CONFIG_PM_SLEEP
 	u32 cnf[4];
 	u32 out[4];
@@ -334,14 +342,14 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&bank->lvl_lock[port], flags);
+	raw_spin_lock_irqsave(&bank->lvl_lock[port], flags);
 
 	val = tegra_gpio_readl(tgi, GPIO_INT_LVL(tgi, gpio));
 	val &= ~(GPIO_INT_LVL_MASK << GPIO_BIT(gpio));
 	val |= lvl_type << GPIO_BIT(gpio);
 	tegra_gpio_writel(tgi, val, GPIO_INT_LVL(tgi, gpio));
 
-	spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
+	raw_spin_unlock_irqrestore(&bank->lvl_lock[port], flags);
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, gpio), gpio, 0);
 	tegra_gpio_enable(tgi, gpio);
@@ -675,7 +683,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 						 tegra_gpio_irq_handler, bank);
 
 		for (j = 0; j < 4; j++) {
-			spin_lock_init(&bank->lvl_lock[j]);
+			raw_spin_lock_init(&bank->lvl_lock[j]);
 			spin_lock_init(&bank->dbc_lock[j]);
 		}
 	}
-- 
2.27.0

