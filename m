Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134D249550E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jan 2022 20:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347197AbiATTtx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jan 2022 14:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232634AbiATTtx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jan 2022 14:49:53 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3334C061574
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jan 2022 11:49:52 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id v123so14288566wme.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jan 2022 11:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzCGvXpwHuicYeGKMLmwfGYPPw4Z9MXOtEikUmUk69o=;
        b=axalH3zhT0ygm76Vm+mJ7lkf6UqIp+ohhWF1MGHvwgA68STduWb8DquxwJTh3Rytb+
         6DjbxNt3iNErou/OHi03i0vI2eFTwrLKIbVtrRSnJEuJ1Vzm7nFJ0J0VwI6fIuwGHOHl
         QPugwo+RB2aJMSs7nW+6K5wFbKMu5fQr7kSKw2VE4H0qZjoEw62aRJdZ8Li4RZVNMoR/
         qeu/MBxenZ3x2d81ZQYzi1xec4CXRAvxvUtn6NB6cXqom6g5+e7Po1lSuxnQgqkBmzTk
         uq+Vy1EMs38F2OVNzzFz5GzVKx7F1GK6/DHobk7d0OiyGnunyW4BuzmVRSzljZrQrdiX
         FBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rzCGvXpwHuicYeGKMLmwfGYPPw4Z9MXOtEikUmUk69o=;
        b=YJBQdfkgWmDpyijnXH0UGr0o0jZwoxRcP7vCy2aaw/yYw2QBuWT7Zeos6D9d26+Y4e
         SO6MZbgQRSe6YwCuFDx2kS9GBK1yNqoLFmEOtKIdvErOYLb+8QUltR/zMg049WGhmVX3
         XIzwRntMf81YugL1owHXeXt8aFN0jHfs8eUBaF/qWoS90TL4tl6h50jyx9LF1LVxLwKn
         jA3Cmk2HKRVJOpxXOVMiMxFufy3/e/pKwhE1qb/rtaxUi2GzO7rmNCMQUTuE8VyDyvLG
         +BfzlZmc29VGlDY2ouhonQ9V2Kzk5FF+aSqAGR7hjxbOClOSnmRYRrhMbsTSRqQ52sv5
         8OvQ==
X-Gm-Message-State: AOAM533FHsWOmFViBl7r/25A55g/8HBfMW2b3P+rMHi9/Inllo+woNJn
        r7vcP+rfXSoMkclcuHuauk139A==
X-Google-Smtp-Source: ABdhPJxVQbofZU7qUiSN6PecqPcdfiRQ1BqT1Z+QhccWrurZzH43wTpC+dmyWFgQgX0B3oT1mwh/Og==
X-Received: by 2002:a5d:6d49:: with SMTP id k9mr609850wri.530.1642708191353;
        Thu, 20 Jan 2022 11:49:51 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id h127sm10220160wmh.27.2022.01.20.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 11:49:51 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpio: sim: check the label length when setting up device properties
Date:   Thu, 20 Jan 2022 20:49:48 +0100
Message-Id: <20220120194948.1138813-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If the user-space sets the chip label to an empty string - we should
check the length and assign the default name or otherwise line hogs
will not be properly attached.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 838bbfed11d3..04b137eca8da 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -816,7 +816,7 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 
 	properties[prop_idx++] = PROPERTY_ENTRY_U32("ngpios", bank->num_lines);
 
-	if (bank->label)
+	if (bank->label && (strlen(bank->label) > 0))
 		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
 							       bank->label);
 
-- 
2.30.1

