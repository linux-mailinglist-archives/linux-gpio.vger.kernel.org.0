Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A95F2443AF
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgHNDDZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNDDZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:03:25 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30076C061757;
        Thu, 13 Aug 2020 20:03:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f5so3535234plr.9;
        Thu, 13 Aug 2020 20:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7KLfIVMRwqpdC47NwuYFPGVwE5g0uXxr3Mm7EIshdF4=;
        b=XGIbA/8K9NTQaOueUYCKV8UkHhRRSZR91/IkYRMh5jiuvYuHA3yQK5/gfLjAPtn8iv
         C4nk0l52EE03npbsCcb++oZJcODW97Zpu3hrDRumyoQcPx8QF5W6HBRl1V+X2HK0Rk3Y
         YRvofG5uNysBGozU2Gwn1yykJ25p/fdme7dq3d2+mdqFLSQnhmnmNq+YQ0zRH94d+juw
         tl5M0dRB2fqlKWIEKguabnlHgxVa8+qXfa9q4J1NqEvRtcRxkXjd2Xm+VxgX+I6202ve
         2nyBXsZh5b9iv1mSDxo2u8TMZ/6Dj1ro+rc3hTdSflfI9LCLDw/zYkw9jWpJjcZQ58If
         ucrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7KLfIVMRwqpdC47NwuYFPGVwE5g0uXxr3Mm7EIshdF4=;
        b=FVJXqplufl77TwQWlz+n6XCxhtznkT3egWCedxBZlLUoRx3zD2gaLop4K6Kr2Rm/e6
         bp+30j+QT80cZkgdz3/nrrJFd+gdMXnu5cNInkrFRg1S+RmNp/ckId/egeJtaNaSHcWM
         ESbKcjchyKXEmDVq431Cw647c4I/+Y3eFyhuY8WUMHMAQ6AgCtWdmiuQrwqV5YR2nStQ
         N8YGG8rIyVtEQDiNZ28gvwGkDFbhywdbeYgIasY3y2URdFOBAsvCpwOnU3B88sWW7AAN
         p6JmxIpUpSi9ojngSFbs2J8NsoeETdmJV1Wv7uWJVjAg3mRLkuQMOIDdB7puz793/hVI
         /9fg==
X-Gm-Message-State: AOAM533rJ7qsclNwXPI+oVbIBXFbR6Tx0xO/HTUzy1bB/U+MxpP7EuO2
        W4LqC94O532OTgsegyvnr3vrmQCS
X-Google-Smtp-Source: ABdhPJwxAiJr9pBa5wp8QnZGMAkjK8Qnswfi0F6zKM5pJLv/04Jna5dwKD/dQIqs9bUTmyKvm+K1Sg==
X-Received: by 2002:a17:90a:b88c:: with SMTP id o12mr551819pjr.187.1597374204406;
        Thu, 13 Aug 2020 20:03:24 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:03:23 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 01/20] gpiolib: cdev: desc_to_lineinfo should set info offset
Date:   Fri, 14 Aug 2020 11:02:38 +0800
Message-Id: <20200814030257.135463-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set the value of the line info offset in desc_to_lineinfo, rather than
relying on it being passed in the info.  This makes the function behave
as you would expect from the name - it generates the line info
corresponding to a given GPIO desc.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

There are some instances where this results in the offset being set when
it is already set in the info, but I think this is clearer especially
considering that, as part of the replacement of strncpy with strscpy and
to to ensure kernel stack cannot be leaked to userspace, the info is
zeroed in a subsequent patch.

 drivers/gpio/gpiolib-cdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e6c9b78adfc2..e95e3eab9867 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	bool ok_for_pinctrl;
 	unsigned long flags;
 
+	info->line_offset = gpio_chip_hwgpio(desc);
 	/*
 	 * This function takes a mutex so we must check this before taking
 	 * the spinlock.
@@ -933,7 +934,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 		return NOTIFY_DONE;
 
 	memset(&chg, 0, sizeof(chg));
-	chg.info.line_offset = gpio_chip_hwgpio(desc);
 	chg.event_type = action;
 	chg.timestamp = ktime_get_ns();
 	gpio_desc_to_lineinfo(desc, &chg.info);
-- 
2.28.0

