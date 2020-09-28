Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E23427A4BC
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 02:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgI1A2t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Sep 2020 20:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgI1A2t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Sep 2020 20:28:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F52CC0613CE;
        Sun, 27 Sep 2020 17:28:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so2597328pjb.4;
        Sun, 27 Sep 2020 17:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZdIya96dO2nmyvmHD/Tz+daovDXoyyBwC9BB/0lctoQ=;
        b=Q926ccHhke37xD4BrH8o0RP/iRfY3w6I7kuYYx0OG+94IKGNpvs1V2M7qih89IbFGs
         6vWTh86UX2h2Bd7CQwwzhg0sEaxRoOYgoEg9J2mc0/Z7QM+g62o0tWSlDBxf7bx2t8kF
         PHM4llNT9I6Zkp5q+1XPCSiRFId0495UBJtlSRanEuVP0FBd6ZvgMGKf5ZOGMkzfTk77
         0QzQKWglQGfmrcmbBOtXusRWc3whh/fhBR9qsDz0Lgba8CbRBy276B2mp9s60dP4j5Ky
         3m7YK97Sms72m5EGDiBnTBa7262PDbCOuEVWdlKsX3fWcHgyIFA7Rk5hT+LhifvbVj8N
         ksPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZdIya96dO2nmyvmHD/Tz+daovDXoyyBwC9BB/0lctoQ=;
        b=MFK4xC61E+EUwuLBI+UzNfRc9mk8LumISVIgMAe7CAd/o8wuxODUEtxD5It/4EyOU2
         MS82iCxa98GLIwNylbETtdeccaxHtw9WR8zDeAZHI7tAdEtGwVHDJ4SWk7DvPRTWeRGC
         uFv4uL1M7QG7JC8G4DwUyxhghPCYnW9+uMJmEQFPSUnOJHtLz6+0/7BY6fvQfTcfOIiS
         1cHOnERIjkuI8VJcyYok+gwL+Vi9jgfD9avt3ar5WppxKlwbYC1YOPxJpz0FrwFBjLOe
         W/xyfWTYDXFBaBD12MsAVOvxc8of1/SUNAL2mmDWAmpz3UxYg7UQk5+IyrwLYxQPneq1
         vkhw==
X-Gm-Message-State: AOAM532NMhJTpJtaSTjpC63jNI8cj+DoiiUwhhb5I2VeAngtfsudgkus
        saGzkVh5bw/jarl454VAEubXKOg23A4ZwA==
X-Google-Smtp-Source: ABdhPJxPDrqOMszqBtBrEHhMry22LuXTSbrreS4NQ/4YsEqvbbdcgRXURKYg8K5u5Z2fOuHlij2m/Q==
X-Received: by 2002:a17:90b:30cd:: with SMTP id hi13mr7208071pjb.82.1601252928434;
        Sun, 27 Sep 2020 17:28:48 -0700 (PDT)
Received: from sol.lan (106-69-171-132.dyn.iinet.net.au. [106.69.171.132])
        by smtp.gmail.com with ESMTPSA id o20sm8443783pgh.63.2020.09.27.17.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 17:28:47 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, arnd@arndb.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v10 01/20] gpiolib: cdev: gpio_desc_to_lineinfo() should set info offset
Date:   Mon, 28 Sep 2020 08:27:48 +0800
Message-Id: <20200928002807.12146-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928002807.12146-1-warthog618@gmail.com>
References: <20200928002807.12146-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set the value of the line info offset in gpio_desc_to_lineinfo(), rather
than relying on it being passed in the info.  This makes the function
behave as you would expect from the name - it generates the line info
corresponding to a given GPIO desc.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

There are some instances where this results in the offset being set when
it is already set in the info, but this is clearer especially considering
that, as part of the replacement of strncpy with strscpy and to ensure
kernel stack cannot be leaked to userspace, the info is initially zeroed
in a subsequent patch.

 drivers/gpio/gpiolib-cdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..81ce2020f17b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,8 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	info->line_offset = gpio_chip_hwgpio(desc);
+
 	/*
 	 * This function takes a mutex so we must check this before taking
 	 * the spinlock.
@@ -933,7 +935,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
 	chg.event_type = action;
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
-- 
2.28.0

