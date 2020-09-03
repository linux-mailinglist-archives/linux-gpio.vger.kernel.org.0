Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706B225BBB4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 09:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgICHab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 03:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgICHa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 03:30:29 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE078C061244;
        Thu,  3 Sep 2020 00:30:28 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so1046173pjb.2;
        Thu, 03 Sep 2020 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yS9ngsBo8+evitAfoXUo9b65Z0HS0w+CYTZyw5kDZqA=;
        b=f6+3JqHNpxIMeNQORitCu39V+PQXybvmtZTHKw4mqS3PEpukUOM1jFg3T4nxC8ByrL
         nZIcxN09viGPTNjPyrIWkq0yoY8Rz9lf16hbmkqIjeWFk4wRJwLzNuAmVaO50i5PV+zr
         364K/Qdd+NtWWmxRx8aPyzrlNsOLJFInIdUTm85ClOYHlULxKllh524UqzRS+KMA0yAv
         WW2LpN/mMG+mvVXJutj/DmdqFjo75Y6mBMPTtzvcbAMQG3b2NHOLoHfPMbdApWshS9P+
         SlV2h2ka9hcN3/RVFIw75taStHLkw/N811NVr/8yvCI/AiqIV6bpM4JcRYBZGjIqv5bn
         8tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yS9ngsBo8+evitAfoXUo9b65Z0HS0w+CYTZyw5kDZqA=;
        b=bYH7LmVuAOF5PnLmEQRElBPnL0XgRbypQFZoOjgMwQagnBcZAoFusWCV99VfyDLIBc
         FVNtTxSSXqIw692TMh1EUZlL4+azlbzZPDMrzBOivmNdTnbxcJobMyo9ReFGx9/raLur
         fRfzL8cREwofzBqR/SMKL9RAVqaVY81mDXhC9Rf3+LcxaslHYuRVrq4FVmmxIS5Mu329
         gS68zYma4x5oXJkLKbvKv3RoxVNPziY9aIvhoms5NpVZDP1xYvc/ur/ddfZfUbVm2c8i
         eEiYS2JDXUbrkblKHcDqVyW9EvZHab16kC/DAylnJDf795Ohs07VRmzKDaQT0WfKH1Pj
         BNwg==
X-Gm-Message-State: AOAM532VFgOD85OdbXvcRTFfZVzodFbJe7obJpjsWlWCGaa5fixQQbQZ
        YhGf5kqxE4kBjQFK7uAl9cg=
X-Google-Smtp-Source: ABdhPJx+HPgCVQxJa9LLxVcz5xWPpzD3thVegekIEKLeDLe+IjBTW+hbhZ17VOyUZaSq7uknaIllJQ==
X-Received: by 2002:a17:90a:9a92:: with SMTP id e18mr1946150pjp.211.1599118228572;
        Thu, 03 Sep 2020 00:30:28 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.6])
        by smtp.gmail.com with ESMTPSA id u63sm1949105pfu.34.2020.09.03.00.30.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 00:30:28 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     linus.walleij@linaro.org, lee.jones@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        dillon min <dillon.minfei@gmail.com>
Subject: [PATCH: V2  1/2] gpio: tc35894: fix up tc35894 interrupt configuration
Date:   Thu,  3 Sep 2020 15:30:21 +0800
Message-Id: <1599118222-18990-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com>
References: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

The offset of regmap is incorrect, j * 8 is move to the
wrong register.

for example:

asume i = 0, j = 1. we want to set KPY5 as interrupt
falling edge mode, regmap[0][1] should be TC3589x_GPIOIBE1 0xcd
but, regmap[i] + j * 8 = TC3589x_GPIOIBE0 + 8 ,point to 0xd4,
this is TC3589x_GPIOIE2 not TC3589x_GPIOIBE1.

Fixes: d88b25be3584 ("gpio: Add TC35892 GPIO driver")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Hi, Bartosz

Just change Fixes tag.

Thanks.
Dillon

 drivers/gpio/gpio-tc3589x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 58b0da9eb76f..ea3f68a28fea 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -212,7 +212,7 @@ static void tc3589x_gpio_irq_sync_unlock(struct irq_data *d)
 				continue;
 
 			tc3589x_gpio->oldregs[i][j] = new;
-			tc3589x_reg_write(tc3589x, regmap[i] + j * 8, new);
+			tc3589x_reg_write(tc3589x, regmap[i] + j, new);
 		}
 	}
 
-- 
2.7.4

