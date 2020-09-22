Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344632738A1
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 04:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgIVCeS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 22:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729379AbgIVCeS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2020 22:34:18 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11629C061755;
        Mon, 21 Sep 2020 19:34:18 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f2so10707622pgd.3;
        Mon, 21 Sep 2020 19:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZdIya96dO2nmyvmHD/Tz+daovDXoyyBwC9BB/0lctoQ=;
        b=iLYEIsm9e7RE1SBTuyl95EviBFp5YDWdqt5SDpfr4qiIWtNpwPv08cMV8eXmLVvCfY
         I2pP9IFXlIotbynXwM94ucClnFuwH+OxWjn80+Bn1cOcbfbCMY9+MljMp7EQrtfbyDAa
         ln9BSNU5ptDR70BnBqbGB4AB2n4zDTtLYg4RFA0fFysnIS2iPoCXJS8v4GhNl8zi95oF
         Yq4INvh0VdM81pZHEUObQq98g8kcC4GOBBn4MmQ1aPSgOMxYwN86NaQcWgCvm72e0d2k
         xj0DEriavJ0J89YAjv30O6AOY4jqtNbAGZHFidlDvBY6RlGGCb8gnSCUlUe+/FcoqekU
         Hh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZdIya96dO2nmyvmHD/Tz+daovDXoyyBwC9BB/0lctoQ=;
        b=Eu86F4uyL13Yx/nXAUjSVDGSG2VAnemVJuFZWhacMy8TG8s72odVYUPMRTtdYDTHgp
         F4j1loNs+AUzCEpq8YYgo3OE2yipIcqVj8X2MjilYoPNCpDxkrzTiI7FIVL6nudHcWYJ
         xiDcXLftbzaRq0GNIN3VFnHl2bEMFjN4WJVha8RptXeZZG/kRTxB9jRaqKxutOXv1FWt
         DqKX9X3ZSICnU53dbrsq6UphgULgUL4DJ/u+Hzg35GwSKqjBSpwOp2jEqLx86GboO2bJ
         IuTZDpiO0qSkFTjmIdoCQNxzABnbx+u9q63ApjRzXgbG0CpEi8WoNZ4b8Ei5WSvfSlTn
         cVmQ==
X-Gm-Message-State: AOAM531nKpcCANYcsVJqpKxaqScnkz19thfqpbQrejkVT/UhWMM1ZcCx
        fu0em7EB/A4MCpdfk8yBa7zmjaBfzBhg+A==
X-Google-Smtp-Source: ABdhPJxBe0kOwVwei4qMxgEso/TJrrBY+ag65ApwQVMfTaBIbtZGhjGI8Z73NtTPyoH7ZzQBy5IwMA==
X-Received: by 2002:a17:902:830a:b029:d2:2a15:54d0 with SMTP id bd10-20020a170902830ab02900d22a1554d0mr2563985plb.23.1600742057181;
        Mon, 21 Sep 2020 19:34:17 -0700 (PDT)
Received: from sol.lan (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id j19sm13321390pfi.51.2020.09.21.19.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 19:34:16 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com
Cc:     arnd@arndb.de, Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v9 01/20] gpiolib: cdev: gpio_desc_to_lineinfo() should set info offset
Date:   Tue, 22 Sep 2020 10:31:32 +0800
Message-Id: <20200922023151.387447-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922023151.387447-1-warthog618@gmail.com>
References: <20200922023151.387447-1-warthog618@gmail.com>
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

