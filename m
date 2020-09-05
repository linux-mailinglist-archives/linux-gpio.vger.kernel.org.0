Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E5D25E832
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 15:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgIENwt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 09:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbgIENgi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 09:36:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA54FC061246;
        Sat,  5 Sep 2020 06:36:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 17so6146522pfw.9;
        Sat, 05 Sep 2020 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=Q+ncC/vfXH4gJRPQHByMGcUxhj5JLLS0LZaXWI3Z5gtiSd+XbGNe3NVTvEtQ+4u9lR
         pE1rrHIIfzh0ftBZcRZndur7zFOCQkhuQVhxbbK2sw4GPUfNx1ic0iWBj6W4fY4omnHj
         SYcEEkxCU+2ULqJZOyJ5zssD1WHZiHcFhPLzUF2myeQFRkBtWSyTyfUeEuYwWyfovToJ
         m7Rn368CxGPO+WLtT8trXiX2D6upzb5y9sAIeFZCq9LNybsA3REBbCPedfW78XqwiOm3
         m17R2fYw5ZPTn+MQhAKP13lC7ehD0lRDZIcnHQdmPG1qH2aRV02ipfVMH1u+UXRcneCb
         XJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fedQaMAad6gJKi/QRC5xP0GL2BO40HvVvA1rAXDD1oY=;
        b=XEeidAwtu6mEFRwoY6VZjq6seqBA9C5I9G26U9qq0qjfZk7BD5lU3/p2wABAZyrlLV
         52gueDffU4A5iTCUONHsxutz/GbMhKSPpl15hy7+iqdfdxdrcYLZl09vDOGA5uxbneJR
         nic16DphVv5rseyyk6UypJJVq9s49V1E79/A0R87qs3TBrNnutd7lglWhlqWM4MjbXSI
         VD6tPPDRfZD55z0e/d88Vf7IMjOd2xQYmAPTg3O/wfOkO1EM6L7ea3UX4t9IhoGR/+8W
         KKutuyLI6hRzpIDEHT1RblSxkML1Ml6E4rz3m/mD2q4/kEW7cTRe59rokMn/8SofnhcA
         UIeQ==
X-Gm-Message-State: AOAM531tpCIRVxlLJYjfQ0bCF77t09jkjc8VkBWWNaz54j83U/ox2lbc
        /1iZPOeSKMln6y+tJsOjU7+49w0vcz8=
X-Google-Smtp-Source: ABdhPJziXEvSI+yoDa+shnRccba6eU24XTcpFX2fGkjs8MQOrqt+HlNg2QQve1/ZdhvJ9S8hSklGJg==
X-Received: by 2002:a62:14ca:: with SMTP id 193mr12729280pfu.13.1599312996612;
        Sat, 05 Sep 2020 06:36:36 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id u3sm7556717pjn.29.2020.09.05.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:36:36 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v7 01/20] gpiolib: cdev: desc_to_lineinfo should set info offset
Date:   Sat,  5 Sep 2020 21:35:30 +0800
Message-Id: <20200905133549.24606-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905133549.24606-1-warthog618@gmail.com>
References: <20200905133549.24606-1-warthog618@gmail.com>
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

