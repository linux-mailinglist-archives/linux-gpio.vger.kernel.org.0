Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136D42A6906
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 17:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgKDQFG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 11:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgKDQFF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 11:05:05 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BD3C0613D3;
        Wed,  4 Nov 2020 08:05:05 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w65so17656555pfd.3;
        Wed, 04 Nov 2020 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=17bQwt1/CHFr+rvttXZHNZmk0KRRHS1qTXGwZaU+GuE=;
        b=jQLzuRcorFq38M86xnwJ0sx65rplVegCppZ21q5jDIXtZXyvqamY1i/bABFWvr9V45
         co2ZzLPxrCcOyrY+ylw69kogOmnVwEezVJ9P8EfUZHZE4uZVKggM05Wa4JAWxV7satZJ
         ho31I4Zb727Ux61j29PnF0kigy8w7AHRPFVSKsq3cbVdk2vqYpIpE9HgRb/iL5MSyBsy
         upkx/pJdmftNNUqlsrZLLwLQYYNXrPRooTs02xfYzAbAW5QTv8U1hpj7W+44NxIj67sq
         Tf+1CRfhY/Wj0nW6w0G4tkPHLjId+GAfY34uE2sXu39Ngd/XRqwqgTy4uqsFGMYvgcfp
         PtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=17bQwt1/CHFr+rvttXZHNZmk0KRRHS1qTXGwZaU+GuE=;
        b=kqqtCLaPi/AELlI0bDIKeNwiBzBsatlMRTUmvYwUpa09dUdTExLvkUv9+STQLBwxgA
         cz3iquwyoJhO1cJji08cRYIS1W+/wbBGQQZmT7xcCMHQweef8M/c/OXrk9swYqv3xgJ8
         8a8iZQzCZF0J6FYcnkKpox4FvG28U+vfC/NMOONN86qbRkSmMQzxhk4xt88YXLIKgyYY
         MkJjeXVKdcShqh5SArGdVHs/aCUBMfedTw5LA6O0KkoqqH5KHb9hWy9vb+qwz8wOTeM5
         Sdb79TEgtlRkmHIbJJmk3lrwvd1cj23tOdjkQO9oQ6fWQnZpH2I6Gld0pco8ZgwlfZ6q
         uwNw==
X-Gm-Message-State: AOAM530UMYtOTsfNZnPWnpe52+vbnpS4GWx5CgK7KZjpYAZYIx2RMxXK
        7waZ7zP5RluqoM7mESez1oxp7wLjw9QhYQ==
X-Google-Smtp-Source: ABdhPJwke5QuZfBeeGsOFxKGASksaNFwpOIRsjtVfECYs0lUdMk5e9Ad+rWyBotQWI5sM8I77xOYZg==
X-Received: by 2002:a17:90b:391:: with SMTP id ga17mr5151361pjb.54.1604505905154;
        Wed, 04 Nov 2020 08:05:05 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id e9sm2944030pgi.5.2020.11.04.08.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:05:04 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        1887190@bugs.launchpad.net,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] pinctrl: amd: remove debounce filter setting in irq type setting
Date:   Thu,  5 Nov 2020 00:03:44 +0800
Message-Id: <20201104160344.4929-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104160344.4929-1-coiby.xu@gmail.com>
References: <20201104160344.4929-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Debounce filter setting should be independent from irq type setting
because according to the ACPI specs, there are separate arguments for
specifying debounce timeout and irq type in GpioIo and GpioInt.

This will fix broken touchpads for Lenovo Legion-5 AMD gaming laptops
including 15ARH05 (R7000) and R7000P whose BIOS set the debounce timeout
to 124.8ms which led to kernel receiving only ~7 HID reports per second.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: 1887190@bugs.launchpad.net
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
Message-Id: <CAHp75VcwiGREBUJ0A06EEw-SyabqYsp+dqs2DpSrhaY-2GVdAA@mail.gmail.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 524d55546b61..5a1d518b563e 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -468,7 +468,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;

@@ -476,7 +475,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;

@@ -484,7 +482,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_edge_irq);
 		break;

@@ -492,8 +489,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
-		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
-		pin_reg |= DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_level_irq);
 		break;

@@ -501,8 +496,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
 		pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
 		pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
-		pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
-		pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
 		irq_set_handler_locked(d, handle_level_irq);
 		break;

--
2.28.0

