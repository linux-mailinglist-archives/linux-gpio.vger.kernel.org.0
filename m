Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49972BB1B4
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 18:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728944AbgKTRsW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 12:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgKTRsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 12:48:22 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C8FC0613CF;
        Fri, 20 Nov 2020 09:48:21 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so8583741pfu.1;
        Fri, 20 Nov 2020 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yy8mAP2XRxcUpsdCsTm+KdTXMmpuQJot11SefIetIN0=;
        b=VuHTdBnuHwGkq10ElqUJ8YPGsbNvZ5vJJtt345M1qoUcGa3PYxR4lS7NACyEa+776y
         25Cok+kYcBGNapvo76mDOaCx8R2BhsQd67Zihv5M92ISuwt+n+e197ksp/H9yZz5VV+/
         ADTwNtS4gbRFYkl+arTBx2OS0264zqmjJ2ndkSB/48sDHXwgG4IwXqArceJsjSnxlWxf
         sUjVZ4YMgL5Aw4nKwy3LDKR75YoSGXaAZCzQ/kskAh7Q9IFmzf/ggVl5bZkIqyDkWZ0t
         9aIWKV1ISFUpBCLK2/LFkJgp345efuZZCPzuoptlJ4cPGAB6IPJ6YDMAr0H3vX9kBXfW
         vSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yy8mAP2XRxcUpsdCsTm+KdTXMmpuQJot11SefIetIN0=;
        b=f51oCExfbge1ttSQVFbxJ4bgBWTDEp1Q6zMLftPBdFi2nBHeQ7Ym/ftaPPkSTC6eLR
         XGzeOUGWMwsk4uQSoPwSMN3ExLLiMYhtvUkJ4r/nmwG+loXyqSscaAihaBVCUwECYais
         XK4JEhUHnilo7XBPK2C+rDVyS7BqKuHL3uX015Q6qLBT3q0ILhMcBB1+uKWmYjAJXIax
         IVCdGu84DS0cunv5Bovl47Uzuk1QWSKzN2VDaMrg8m1lvtFTW4PETwvpfpu8uORHd0/H
         OiwxjFdUe7kQ5gyMs6QY1BNyDXAPCrvv3HuBAgN2b/i121+qAUASnaXVy3hs/gXkxWwb
         vAwA==
X-Gm-Message-State: AOAM532iSUBYDy1zE/VWmb4RsYhX5paWK0EriMMeCG2bVZkw/bD61L6c
        oRkmJnjgnIBYdSo0YHYdEoE=
X-Google-Smtp-Source: ABdhPJypIr3JQuMN0qO4OWeuGSIuRkEhb9DiluX5rcaHCu1V7dwikNflgns/SgKwMc7WyNCqdpQDvw==
X-Received: by 2002:a17:90b:38e:: with SMTP id ga14mr10935553pjb.45.1605894501500;
        Fri, 20 Nov 2020 09:48:21 -0800 (PST)
Received: from syed ([2401:4900:2e82:cfda:fc82:287b:3e19:db98])
        by smtp.gmail.com with ESMTPSA id 184sm4533205pfc.28.2020.11.20.09.48.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2020 09:48:20 -0800 (PST)
Date:   Fri, 20 Nov 2020 23:18:05 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] gpio: xilinx: Add extra check to see if sum of widths
 exceed 64
Message-ID: <5581771d86df1abaf33545ccd60caf4db7ad3c5e.1605893643.git.syednwaris@gmail.com>
References: <cover.1605893641.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605893641.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add extra check to see if sum of widths does not exceed 64. If it
exceeds then return -EINVAL alongwith appropriate error message.

Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
---
 drivers/gpio/gpio-xilinx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 05dae086c4d0..a2e92a1cf50b 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -340,6 +340,12 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	chip->gc.base = -1;
 	chip->gc.ngpio = chip->gpio_width[0] + chip->gpio_width[1];
+
+	if (chip->gc.ngpio > 64) {
+		dev_err(&pdev->dev, "invalid configuration: number of GPIO is greater than 64");
+		return -EINVAL;
+	}
+
 	chip->gc.parent = &pdev->dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
-- 
2.29.0

