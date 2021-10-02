Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBC041FD0D
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 18:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbhJBQWF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Oct 2021 12:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbhJBQWE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Oct 2021 12:22:04 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AEAC0613EC
        for <linux-gpio@vger.kernel.org>; Sat,  2 Oct 2021 09:20:18 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y5so8311760pll.3
        for <linux-gpio@vger.kernel.org>; Sat, 02 Oct 2021 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4rLuo2ykiHXggmeHqYRj08h89CMbpW00i+4hL2kTmc=;
        b=Zt5xeF9HzCVGHVXKypIC1N9e6gFdZxQjTDO05pMhNdfZxoVI515qfvoqGJqgKyZn9u
         pP3Dp5b9dCrR0pPPcfA+cVU3qeG9Z6n4JbpR7CGLbbdq0IWKDui8Y61h1v7TCSkc0Tiv
         fZUHPUzps+vfU6jN/YV0rwjE1i3IMgZS8zzSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4rLuo2ykiHXggmeHqYRj08h89CMbpW00i+4hL2kTmc=;
        b=jM4Af9ugEQYZpHJZrGImwlCTegoOZdo5N1vcIepafyjY2HdJ+pdDhM5pvrA9yhgRzG
         a1CXd3c+E/zwfMt1k5IfKkEPDTr0/4s801QtB8SzmTyMlOvN6E8VCW4D3nlJ0IzofPdx
         +r6g8ysOtRz2914zsyt7JEceFi2U1M4T2orWT0dcMhjq2SIISLWZPyYGlRUNSRBnGEIX
         3RFB2b7cCVO2htGC30yGbHtiBX0WnqTTvQKVxzeyMruOxC8/bE0bN1l9S8UmNtHYnlXW
         hDwyTnfw9PkOK4q7NkbndEr8A4R8628a+yFNff20fdc6MMKyJ0B7ZOFY3zEuK6SV6PXG
         vh0A==
X-Gm-Message-State: AOAM533oPioof1PWumOtGLy05qSDjJne4LIuNOOJQuh57vdQtdH4ZGlO
        mLRgS68GkRL+hbGKDklNk1ieMWcbHdvTCg==
X-Google-Smtp-Source: ABdhPJzRoDmBHnGFqBTldPEU7mvie17JJefDNDPsAGw6oqPncVA8o03SuuO6+KqT5JsacYzh5eyBUw==
X-Received: by 2002:a17:90a:19d2:: with SMTP id 18mr20095582pjj.27.1633191618169;
        Sat, 02 Oct 2021 09:20:18 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id nr14sm5223729pjb.24.2021.10.02.09.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 09:20:17 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, maz@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH] gpiolib: Move setting the flow handler and don't set it at all if there is a parent domain
Date:   Sun,  3 Oct 2021 01:20:00 +0900
Message-Id: <20211002162000.3708238-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Calling irq_domain_set_info() before irq_domain_alloc_irqs_parent()
can cause a null pointer dereference as the parent domain isn't
ready yet.

Move irq_domain_set_info() to after irq_domain_alloc_irqs_parent().
A side effect of this is that irq_domain_set_info() will now overwrite
the flow handler from the parent domain. So if there is a parent
domain do not set the flow handler anymore.

This allows gpio-msc313.c to level it's irq domain on top of the
new irq controller in later SigmaStar SoCs without crashing.

Link: https://lore.kernel.org/linux-arm-kernel/20210914100415.1549208-1-daniel@0x0f.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpio/gpiolib.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d1b9b721218f..993eeced6b4f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1103,19 +1103,6 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 	}
 	chip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
 
-	/*
-	 * We set handle_bad_irq because the .set_type() should
-	 * always be invoked and set the right type of handler.
-	 */
-	irq_domain_set_info(d,
-			    irq,
-			    hwirq,
-			    gc->irq.chip,
-			    gc,
-			    girq->handler,
-			    NULL, NULL);
-	irq_set_probe(irq);
-
 	/* This parent only handles asserted level IRQs */
 	parent_arg = girq->populate_parent_alloc_arg(gc, parent_hwirq, parent_type);
 	if (!parent_arg)
@@ -1137,6 +1124,27 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 			 parent_hwirq, hwirq);
 
 	kfree(parent_arg);
+
+	if (!ret) {
+		/* If there is a parent domain leave the flow handler alone */
+		if (d->parent)
+			irq_domain_set_hwirq_and_chip(d,
+						      irq,
+						      hwirq,
+						      gc->irq.chip,
+						      gc);
+		/* Otherwise set the flow handler supplied by the gpio driver */
+		else
+			irq_domain_set_info(d,
+					    irq,
+					    hwirq,
+					    gc->irq.chip,
+					    gc,
+					    girq->handler,
+					    NULL, NULL);
+		irq_set_probe(irq);
+	}
+
 	return ret;
 }
 
-- 
2.33.0

