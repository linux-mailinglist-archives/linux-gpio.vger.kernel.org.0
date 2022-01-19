Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AF7493DFB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jan 2022 17:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355844AbiASQHl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jan 2022 11:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356082AbiASQHk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jan 2022 11:07:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DA4C06173F
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 08:07:40 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d3so11209705lfv.13
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jan 2022 08:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eswjr5Bz87q3EsUt/pv2Kdh92llEv1bESkAKh+3EVxk=;
        b=Sb2vg2NB+/JisRX3kJhYIJb5Fh0ngSUP9AG6DUTYmba56HfzZNt7U9aeGH1nyljvBo
         EGY9uRtf14qJ0jwWX6W34mY21rDYdhbPLco4rmeN9cpXCJJVt0qqphM8lLu+c9lpeNwT
         R7209spplluAwiNIYY7IlPlSTrt0O/mM+h4EnY0dlYnDHO+XO255fE6dOGXXDXALwbDD
         eBZtNKPN+440DgOj1KlJpkePWKzL+WSRxIX5ujBY8/b9nrXXAm/KtzxO6TdsBGLb56Je
         X0tzhJfPgLXgNDfKNb6EOfddDZ+rbG1hT+kq4gKdZ2KuFAmKs601di1Z6wp9dgm62dlp
         v7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eswjr5Bz87q3EsUt/pv2Kdh92llEv1bESkAKh+3EVxk=;
        b=Jfvgvoz7o0E9eUqzAf1cc9He8pUwEuh4kG+AsOhJTD75DYTumM/3LpDc0488nTtAse
         RegpP1QDLLWxB4ejs8UjRGOPK9qJAjE1NHCj7SvDqrNdWZzY2ieuhCMvUuNdxAVKSrb3
         wJZrFZoiZLW3qwQlySQSA79OTrOQityeRnL4d0NxJvM7/wuqWTQb6OcnCEGm5HaKKmr3
         Egq8lPEUhHvbVlrYCUE528k0KT5X1eZi5TtlSJV2+j/qxoF3foOsI/oRspjAX1vjWPCy
         Zb1rjxcCHZm/hE4E4PZkt7zz4oQ9XkYBjB5fgaEdH+6GcQu/wVItJooRGvx6WTRv7eym
         9Ztg==
X-Gm-Message-State: AOAM530uXc+A0AcSneqiy3eBtYJ83hNDcdB0O0ZCokLVbnb3X2nZJhon
        xXqThP1Mcp9cY9D9vTSrWHbzSw==
X-Google-Smtp-Source: ABdhPJxVUOK7kQDfguFieQID5Ft6in9D6xJGPrqJpodfUcX0pTCrZ9g+TkuO3JrpCPxJ3Ns7n1+Ueg==
X-Received: by 2002:a05:6512:3c85:: with SMTP id h5mr26712466lfv.273.1642608458617;
        Wed, 19 Jan 2022 08:07:38 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id a1sm6783ljn.54.2022.01.19.08.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 08:07:37 -0800 (PST)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH/RFC] gpiolib: create irq_domain hierarchy bottom if possible
Date:   Wed, 19 Jan 2022 19:07:15 +0300
Message-Id: <20220119160715.650535-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently, gpiolib creates irq_domain compatible with hierarchical API
only when interrupts provided by gpiochip lay on top of existing
hierarchy. Otherwise, legacy API is used.

With this patch, as soon as
- irq_domain hierarchical API is enabled in the kernel config,
- chip driver does not request preallocated interrupt numbers,
- chip driver does not provide it's own irq_domain_ops,
- chip driver provides fwnode, either explicitly or via it's struct
  device,
irq_domain created by gpiolib will use hierarchical API even without
parent.

This allows other irqchips to lay on top of this irq_domain.
Example target use case is irq_inverter [1].

[1] https://lore.kernel.org/lkml/87fsqbznc2.wl-maz@kernel.org/

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/gpio/gpiolib.c | 99 +++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..db8eee07a8d7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1095,14 +1095,6 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 
 	chip_dbg(gc, "allocate IRQ %d, hwirq %lu\n", irq,  hwirq);
 
-	ret = girq->child_to_parent_hwirq(gc, hwirq, type,
-					  &parent_hwirq, &parent_type);
-	if (ret) {
-		chip_err(gc, "can't look up hwirq %lu\n", hwirq);
-		return ret;
-	}
-	chip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
-
 	/*
 	 * We set handle_bad_irq because the .set_type() should
 	 * always be invoked and set the right type of handler.
@@ -1116,27 +1108,40 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 			    NULL, NULL);
 	irq_set_probe(irq);
 
-	/* This parent only handles asserted level IRQs */
-	parent_arg = girq->populate_parent_alloc_arg(gc, parent_hwirq, parent_type);
-	if (!parent_arg)
-		return -ENOMEM;
-
-	chip_dbg(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
-		  irq, parent_hwirq);
 	irq_set_lockdep_class(irq, gc->irq.lock_key, gc->irq.request_key);
-	ret = irq_domain_alloc_irqs_parent(d, irq, 1, parent_arg);
-	/*
-	 * If the parent irqdomain is msi, the interrupts have already
-	 * been allocated, so the EEXIST is good.
-	 */
-	if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
-		ret = 0;
-	if (ret)
-		chip_err(gc,
-			 "failed to allocate parent hwirq %d for hwirq %lu\n",
-			 parent_hwirq, hwirq);
 
-	kfree(parent_arg);
+	if (d->parent) {
+		ret = girq->child_to_parent_hwirq(gc, hwirq, type,
+						  &parent_hwirq, &parent_type);
+		if (ret) {
+			chip_err(gc, "can't look up hwirq %lu\n", hwirq);
+			return ret;
+		}
+		chip_dbg(gc, "found parent hwirq %u\n", parent_hwirq);
+
+		/* This parent only handles asserted level IRQs */
+		parent_arg = girq->populate_parent_alloc_arg(gc, parent_hwirq,
+							     parent_type);
+		if (!parent_arg)
+			return -ENOMEM;
+
+		chip_dbg(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
+			  irq, parent_hwirq);
+		ret = irq_domain_alloc_irqs_parent(d, irq, 1, parent_arg);
+		/*
+		 * If the parent irqdomain is msi, the interrupts have already
+		 * been allocated, so the EEXIST is good.
+		 */
+		if (irq_domain_is_msi(d->parent) && (ret == -EEXIST))
+			ret = 0;
+		if (ret)
+			chip_err(gc,
+				 "failed to allocate parent hwirq %d for hwirq %lu\n",
+				 parent_hwirq, hwirq);
+
+		kfree(parent_arg);
+	}
+
 	return ret;
 }
 
@@ -1164,8 +1169,8 @@ static void gpiochip_hierarchy_setup_domain_ops(struct irq_domain_ops *ops)
 
 static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
 {
-	if (!gc->irq.child_to_parent_hwirq ||
-	    !gc->irq.fwnode) {
+	if (gc->irq.parent_domain &&
+	    (!gc->irq.child_to_parent_hwirq || !gc->irq.fwnode)) {
 		chip_err(gc, "missing irqdomain vital data\n");
 		return -EINVAL;
 	}
@@ -1179,25 +1184,41 @@ static int gpiochip_hierarchy_add_domain(struct gpio_chip *gc)
 
 	gpiochip_hierarchy_setup_domain_ops(&gc->irq.child_irq_domain_ops);
 
-	gc->irq.domain = irq_domain_create_hierarchy(
-		gc->irq.parent_domain,
-		0,
-		gc->ngpio,
-		gc->irq.fwnode,
-		&gc->irq.child_irq_domain_ops,
-		gc);
+	if (gc->irq.parent_domain) {
+		gc->irq.domain = irq_domain_create_hierarchy(
+			gc->irq.parent_domain,
+			0,
+			gc->ngpio,
+			gc->irq.fwnode,
+			&gc->irq.child_irq_domain_ops,
+			gc);
+
+		if (gc->irq.domain)
+			gpiochip_set_hierarchical_irqchip(gc, gc->irq.chip);
+	} else {
+		gc->irq.domain = irq_domain_create_linear(
+			gc->irq.fwnode ?: dev_fwnode(&gc->gpiodev->dev),
+			gc->ngpio,
+			&gc->irq.child_irq_domain_ops,
+			gc);
+	}
 
 	if (!gc->irq.domain)
 		return -ENOMEM;
 
-	gpiochip_set_hierarchical_irqchip(gc, gc->irq.chip);
-
 	return 0;
 }
 
 static bool gpiochip_hierarchy_is_hierarchical(struct gpio_chip *gc)
 {
-	return !!gc->irq.parent_domain;
+	if (gc->irq.parent_domain)
+		return true;	/* will add to existing hierarchy */
+
+	if (!gc->irq.first && !gc->irq.domain_ops &&
+	    (gc->irq.fwnode || dev_fwnode(&gc->gpiodev->dev)))
+		return true;	/* will create hierarchy bottom */
+
+	return false;
 }
 
 void *gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,
-- 
2.30.2

