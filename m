Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDAF66996F0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 15:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjBPOQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 09:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjBPOQf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 09:16:35 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E2248E13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 06:16:02 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso4288660wms.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 06:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHKzG8cIzUJ9myM1y/sRXdNYOKLlG72/XSqg8hiPzrk=;
        b=EVjVA7YMZHaFiNYnlJoUWGMytzMYXIm7RXAlNjSIpWz+U/QvgPJwVcXp4Qp/X0uKXJ
         aGGnxlBIZZo7cdpIe7nUcd6bjAEP7ppTulsIALxLn3I9vJsW6Zz7OUaOQ06kifl66anT
         MBYfDtditslrqNGrC0zBF5e7i29xsBkF5O8egKnjOIdOnj6/X2wrGAs4sqfGKqVU3Yur
         l08WOY80/F9G1non1mgY03KRfDNRqhmEuDAZe1OiVx7o/YiGdgAXQ7OaULvxI1OhbwGl
         ENYqqV+axebshLrScF2VXH6WagxZKWHo5kwL6ZPEOllv4l7HvsblrBfxAGd1JmFVN5XX
         SMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHKzG8cIzUJ9myM1y/sRXdNYOKLlG72/XSqg8hiPzrk=;
        b=QwU5M0Ucu3LBf0bXcNGMinMzDeg9TczmZT/0B1KKsp9alhJ04duAN4BDY3ocBSws/e
         8548sEp7eVjiKCEQl1gIUz/EZDslCUf8BSQuux+Oje3LzZtgF8O/lrh/ES0BWUCxe4MT
         o9d8IZNrxPc/1imVjPQ1gKLsO3brm/vM4oHznO9IDwFvMjfEEUqKBaG3IRB8Qaj9wW2e
         hXh+xfTq/vXkvMZrBS7KedkBkTN3QhlMmqwTp8a3/uFBRIv46vlJw95YLHGr6Rbip6re
         NPKstI1rKwp2Z5A8LUfTUu7xUmwucCW+PrSOmjC26zLFxnXaf5XMqy/UIevbupBXzAOi
         tJKQ==
X-Gm-Message-State: AO0yUKWck5oEs8IbFK72IobCZxeRi4pqyA4hNZzCmt7KGY8uNATwxFcg
        jDklePkPCQ7KpD0CDXaa64f3fw==
X-Google-Smtp-Source: AK7set92kihlU6qNKa1VjqOLHo/pjktcTIUySDqK3GhCSdQYVUcOMF1rOj3dhVhA9RgV6sA1fXv5LQ==
X-Received: by 2002:a05:600c:4d92:b0:3e2:dba:7155 with SMTP id v18-20020a05600c4d9200b003e20dba7155mr2017884wmp.20.1676556960676;
        Thu, 16 Feb 2023 06:16:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id ay1-20020a05600c1e0100b003e1fee8baacsm5471478wmb.25.2023.02.16.06.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:15:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Subject: [PATCH] gpio: sim: fix a memory leak
Date:   Thu, 16 Feb 2023 15:15:55 +0100
Message-Id: <20230216141555.116219-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix an inverted logic bug in gpio_sim_remove_hogs() that leads to GPIO
hog structures never being freed.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Reported-by: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 60514bc5454f..9e3893b19e4f 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -736,7 +736,7 @@ static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
 
 	gpiod_remove_hogs(dev->hogs);
 
-	for (hog = dev->hogs; !hog->chip_label; hog++) {
+	for (hog = dev->hogs; hog->chip_label; hog++) {
 		kfree(hog->chip_label);
 		kfree(hog->line_name);
 	}
-- 
2.37.2

