Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3AE262D07
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 12:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIIK11 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 06:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbgIIK1N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 06:27:13 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B21C061755;
        Wed,  9 Sep 2020 03:27:13 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t14so1734448pgl.10;
        Wed, 09 Sep 2020 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=DcHYReloxkV2xs8T+TKrE/RgMmiSMWGhRwUASr7/E1GnaGIpUrZL7y1XNZBOf6Bx8g
         Zj3HWIqEZzq/cImhflpe5MxkO6RqBcwhC+j8W8Ssd6A0ulQyVGVnu8HGgP9q1lWB6W4Y
         MoXfSZfrpA1QE73Pz28hjGJSpsYPrp/GfkpM/bGslSlv8Kym3BxZa3ekkiGXehBhWQMd
         SNZm8YYrnkhSm+AjOIletQjg7XKGRnUZtzm81D0216CAcVygu3VJr6ov6uG72IB4xOFj
         yHfp3YYnZn/eWqsrieRBRRr1vV2v84rQsRdqCk+J1UPzIwmlRHYqG/TIvYko7VGmgWnD
         5FlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=AdrJtaKhQWbYwWZSwcqXtUwlg0H22WW+n1Ko4+xRNIG8FtYfpCHGE++zm/qHjq7TUN
         v9ZH6zOSogXlspLHhd4G7QfCOnfhErgqfXetY9kN33ftMRoVEtL/Ucd7/CLiEJNIp8Vk
         FQWE6wk+WQXeGa8+HB67dYu2P3BV6qV1VcwrE1LgpMyw4MFU5Mw62m5/4KLQhjmKG8dy
         9xG6O3a6vVvVQFqk4REw0LVQUD4MTDwwmcQznZLGhyyN95uPR5w3iTSVYIlcD9k2o9Y7
         aJzxVWCmGTO6pWYzHEVPq/zj4D2CiJzdEtssPRPvB53CwikzpGjmtgeJVz7QqkOHN+Z9
         Yvug==
X-Gm-Message-State: AOAM533ElZ3xqX1MJ33BYou8Y0NGjbtnFS3Ayj676PKrJ0e3CTo2Gpm8
        XOALSihtA946epuyeiGJ9VW1rJzSXBg=
X-Google-Smtp-Source: ABdhPJwZgkLRMxlumYfALQAaqitA/DgfZ9LQoLmZXw+oG7nxGhLwKUH8NoOgBt8Z4mRGhrr09hMvcQ==
X-Received: by 2002:a63:3483:: with SMTP id b125mr144980pga.24.1599647232617;
        Wed, 09 Sep 2020 03:27:12 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id c7sm2338168pfj.100.2020.09.09.03.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:27:12 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v8 01/20] gpiolib: cdev: desc_to_lineinfo should set info offset
Date:   Wed,  9 Sep 2020 18:26:21 +0800
Message-Id: <20200909102640.1657622-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909102640.1657622-1-warthog618@gmail.com>
References: <20200909102640.1657622-1-warthog618@gmail.com>
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
it is already set in the info, but this is clearer especially considering
that, as part of the replacement of strncpy with strscpy and to ensure
kernel stack cannot be leaked to userspace, the info is initially zeroed
in a subsequent patch.

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

