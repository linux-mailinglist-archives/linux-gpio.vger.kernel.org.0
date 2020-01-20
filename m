Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B09D1427DC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 11:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgATKHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 05:07:38 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46555 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgATKHi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 05:07:38 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so15295510pgb.13
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2020 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QwVSy/UlBenHYnwE7D59Ph9sGDgV6/MJ0VlCaFhejaA=;
        b=VenjqfgfoUrBSjMaGcA3oRKfSYbtWkih4nqyfu/uyy6/oIw8k/5nIKgquzoiJMYdYT
         ZPESfraMcFQQ3gugum2zfEsMs+ToV9DP7LBR7IeyaU1kYl8OIrb/9bTS1SYSrSYqo5he
         C3az+BeogxEjXv9FQoNoH+NlBIDwQYW62LCW92ugmLC9GFIJRCt17Nsspcs/uSjJjHoc
         fiI4kdXv3hom8BRFbi+Q+1zmNhjj4vGPbUnwgQgyu4yUmIlP7VeBkRiZqQAwrFnrmnes
         EWm/RN1oEgDwOtbAA+Wb5KtiD4lMc0HtVlSO2fWq3gT749fnk0Wip0N+dVpD/xCEZp40
         dIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QwVSy/UlBenHYnwE7D59Ph9sGDgV6/MJ0VlCaFhejaA=;
        b=iErYrtDHcfyF9F++aBvixrSYdEzgHmDuLWZbnOoF5XJ1jbjEQmD2BQAmc7Kd9wb9Zm
         DJ1oRnQ47jUAOLfNO7azHmaEt3Tyw22H3DKtyfbFC2YZJ3p0RxOfnJHtgL7somEHjXip
         AaoIcxYEzWNGrn1uPyhgHOU/I+xURQr9b1LReUowC9RP5DvI6ijQ373R/dbdTnLvSwAU
         AhQX05MXrcD09GL2H59iko923IIP9SSlJg+qD1aH4q0qsFzy0vGHBtUFegQQCeQ8f9Sj
         +/Jq19uqwOtTQY7nLJcB6XZk5xmSw6S2HMTL4SLhYIHqOCBFnWnpsxrb/9l5LlXiSvan
         DwBQ==
X-Gm-Message-State: APjAAAWkzkppshvQ99jVwtkQ9n3MwYAHgAo0s63mZJbWLOcYH8R/wzLf
        OzDRGS+polyUSncye/PVjBq5TBHEe9s=
X-Google-Smtp-Source: APXvYqzpinmuP/2/5rq6vCseDNyvQXgP+tqNIs7HvmbKQVUEekMEvkLQFnbjTJRxEAFYmip4Bx9rmA==
X-Received: by 2002:a63:447:: with SMTP id 68mr61190979pge.364.1579514857959;
        Mon, 20 Jan 2020 02:07:37 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id o184sm36246860pgo.62.2020.01.20.02.07.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 02:07:37 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: Lower verbosity when allocating hierarchy irq
Date:   Mon, 20 Jan 2020 17:56:25 +0800
Message-Id: <20200120095625.25164-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In the current codes, the following 3 lines would be output to
the console for each irq line.
  gpio gpiochip0: (gpio_thunderx): allocate IRQ 10, hwirq 0
  gpio gpiochip0: (gpio_thunderx): found parent hwirq 245784
  gpio gpiochip0: (gpio_thunderx): alloc_irqs_parent for 10 parent hwirq 245784

In general, there are about tens of irq lines for each gpio chip,
and then it would emit so many insignificant log in the boot process.
These infos are more suitable for the dbg purpose. So change these
to the dbg level. With this change, about 200 lines are suppressed
on my Marvell cn96xx board.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e9f168b276ad..66e66c141fe8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2006,7 +2006,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	if (ret)
 		return ret;
 
-	chip_info(gc, "allocate IRQ %d, hwirq %lu\n", irq,  hwirq);
+	chip_dbg(gc, "allocate IRQ %d, hwirq %lu\n", irq,  hwirq);
 
 	ret = girq->child_to_parent_hwirq(gc, hwirq, type,
 					  &parent_hwirq, &parent_type);
@@ -2014,7 +2014,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 		chip_err(gc, "can't look up hwirq %lu\n", hwirq);
 		return ret;
 	}
-	chip_info(gc, "found parent hwirq %u\n", parent_hwirq);
+	chip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
 
 	/*
 	 * We set handle_bad_irq because the .set_type() should
@@ -2034,7 +2034,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	if (!parent_arg)
 		return -ENOMEM;
 
-	chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
+	chip_dbg(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
 		  irq, parent_hwirq);
 	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
 	ret = irq_domain_alloc_irqs_parent(d, irq, 1, parent_arg);
-- 
2.14.4

